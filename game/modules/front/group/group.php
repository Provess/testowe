<?php


namespace IPS\game\modules\front\group;

/* To prevent PHP errors (extending class does not exist) revealing path */
if ( !defined( '\IPS\SUITE_UNIQUE_KEY' ) )
{
	header( ( isset( $_SERVER['SERVER_PROTOCOL'] ) ? $_SERVER['SERVER_PROTOCOL'] : 'HTTP/1.0' ) . ' 403 Forbidden' );
	exit;
}

/**
 * character
 */
class _group extends \IPS\Dispatcher\Controller
{
	/**
	 * Execute
	 *
	 * @return	void
	 */
	public function execute()
	{
		parent::execute();
	}

	/**
	 * Manage
	 *
	 * @return	void
	 */
	protected function manage()
	{
		/* Only logged in members */
		if ( !\IPS\Member::loggedIn()->member_id )
		{
			\IPS\Output::i()->error( 'no_module_permission_guest', '2C122/1', 403, '' );
		}

		$member_id = \IPS\Member::loggedIn()->member_id;
		
		/* Sprawdzanie czy jest zmienna w linku */
		if( isset( \IPS\Request::i()->group_id ) )
		{
			$group_id = \IPS\Request::i()->group_id;
			$char_id = \IPS\Request::i()->char_id;
			if(!$char_id || !$group_id)
			{
				\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
			}

			/* Uprawnienia osoby przeglądającej */

			$permissions = \IPS\Db::i()->select( 'permissions', 'rp_ranks', array( 'group_id = ? AND player_uid = ? AND gid = ?', $group_id, $char_id, $member_id));
			$permissions = $permissions->join( 'rp_groups_members', 'rp_ranks.uid = rp_groups_members.rank_uid', 'RIGHT' );
			$permissions = $permissions->join( 'ipb_characters', 'rp_groups_members.player_uid = ipb_characters.id', 'INNER' );

			foreach( $permissions as $columnA => $columnB )
			{
				$perm = $columnB;
				if(isset($columnA))
				{
					$access = true;
				}
			}
			
			if( !$access )
			{
				\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
			}
			else
			{
				/* Work out output */
				$tab = \IPS\Request::i()->tab ?: 'dashboard';
				if ( method_exists( $this, "_{$tab}" ) )
				{
					$output = call_user_func( array( $this, "_{$tab}" ), $group_id, $perm);
				}
				/* Display */
				if( !\IPS\Request::i()->isAjax() )
				{
					\IPS\Output::i()->title = \IPS\Member::loggedIn()->language()->addToStack('module__game_group');
					\IPS\Output::i()->output = \IPS\Theme::i()->getTemplate('group')->skeletonGroups($tab, $output, $char_id, $group_id);
				}
				else
				{
					\IPS\Output::i()->title = \IPS\Member::loggedIn()->language()->addToStack('module__game_group');
					\IPS\Output::i()->output = $output;
				}
			}
		}
		
	}

	protected function _dashboard( $group_id, $perm )
	{
		$groupData = \IPS\game\Group::fetchGroupData($group_id);

		$select = \IPS\Db::i()->select( '`date`, `income`', 'rp_groups_income', array( 'group_id = ?', $group_id ), 'date ASC', '7' );
		foreach($select as $row)
		{
			$income[] = $row;
		}
		return \IPS\Theme::i()->getTemplate('group')->dashboard( $groupData, $perm, $income );
	}

	protected function _vehicles( $group_id, $perm )
	{
		$groupDataCars = \IPS\game\Group::fetchGroupDataCars($group_id);
		return \IPS\Theme::i()->getTemplate('group')->vehicles( $groupDataCars, $perm );
	}

	protected function _doors( $group_id, $perm )
	{
		$groupDataDoors = \IPS\game\Group::fetchGroupDataDoors($group_id);
		return \IPS\Theme::i()->getTemplate('group')->doors( $groupDataDoors, $perm );
	}

	protected function _magazine( $group_id, $perm )
	{
		$groupDataMagazine = \IPS\game\Group::fetchGroupDataMagazine($group_id);
		$char_id = \IPS\Request::i()->char_id;
		if(isset(\IPS\Request::i()->price))
		{
			$prices = \IPS\Request::i()->price;
			foreach($prices as $magazine_id => $price)
			{
				\IPS\Db::i()->update( 'rp_magazine', array( 'price' => $price ), array( 'uid = ? AND groupid = ?', $magazine_id, $group_id ) );
			}
			\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=group&tab=magazine&char_id=".$char_id."&group_id=".$group_id, 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Pomyślnie zapisano ceny magazynowe.') );
		}
		return \IPS\Theme::i()->getTemplate('group')->magazine( $groupDataMagazine, $perm );
	}

	protected function _employees( $group_id, $perm )
	{
		$groupDataWorkers = \IPS\game\Group::fetchGroupDataWorkeres($group_id);
		$groupDataRanks = \IPS\game\Group::fetchGroupDataRanks($group_id);
		$char = \IPS\Request::i()->char_id;

		if(isset(\IPS\Request::i()->rankMember))
		{
			$rankMember = \IPS\Request::i()->rankMember;
			foreach($rankMember as $key => $value)
			{
				\IPS\Db::i()->update( 'rp_groups_members', array( 'rank_uid' => $value ), array( 'player_uid = ? AND group_id = ?', $key, $group_id ) );
			}
			\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=group&tab=employees&char_id=".$char."&group_id=".$group_id, 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Pomyślnie zapisano zmiany.') );
		}

		if(isset(\IPS\Request::i()->delete))
		{
			if($perm & 1)
			{
				$deleteChar = \IPS\Request::i()->delete;
				\IPS\Db::i()->delete( 'rp_groups_members', array( 'player_uid = ? AND group_id = ?', $deleteChar, $group_id ) );
				\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=group&tab=employees&char_id=".$char."&group_id=".$group_id, 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Pomyślnie usunięto postać z grupy.') );
			}
			else \IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}


		if(isset(\IPS\Request::i()->new_rank) && isset(\IPS\Request::i()->new_name))
		{
			$name = \IPS\Request::i()->new_name;
			$rank = \IPS\Request::i()->new_rank;

			try
			{
				$player_uid = \IPS\Db::i()->select( 'char_uid', 'ipb_characters', array( 'char_name = ?', $name ) )->first();
				try
				{
					$select = \IPS\Db::i()->select( 'char_uid', 'ipb_game_group', array( 'group_uid = ? AND player_uid = ?', $group_id, $player_uid ) )->first();
					\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=group&tab=employees&char_id=".$char."&group_id=".$group_id, 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Ta postać znajduje się już w tej grupie.') );
				}
				catch( \UnderflowException $e )
				{
					//SELECT count(*) FROM rp_groups_members WHERE player_uid = 2;
					$slots = \IPS\Db::i()->select( 'player_uid', 'rp_groups_members', array( 'player_uid = ?', $player_uid ) );
					if( count($slots) >= 3 )
					{
						\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=group&tab=employees&char_id=".$char."&group_id=".$group_id, 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Ta postać przekroczyła limit slotów grupowych (max 3).') );
					}
					else
					{
						\IPS\Db::i()->insert( 'rp_groups_members', array( 'player_uid' => $player_uid, 'group_id' => $group_id, 'subgroup' => '0', 'time' => '0', 'rank_uid' => $rank ) );
					}
				}
				\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=group&tab=employees&char_id=".$char."&group_id=".$group_id, 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Pomyślnie dodano postać '. $name . ' do grupy.') );
			}
			catch( \UnderflowException $e )
			{
				\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=group&tab=employees&char_id=".$char."&group_id=".$group_id, 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Postać o takim imieniu i nazwisku nie istnieje.') );
			}
		}

		return \IPS\Theme::i()->getTemplate('group')->employees( $groupDataWorkers, $perm, $groupDataRanks );
	}

	protected function _ranks( $group_id, $perm )
	{
		$char_id = \IPS\Request::i()->char_id;
		$group_id = \IPS\Request::i()->group_id;
		if(isset(\IPS\Request::i()->deleteRank))
		{
			if(!($perm & 1))
			{
				\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
			}
			$deleteRank = \IPS\Request::i()->deleteRank;
			\IPS\Db::i()->update( 'rp_groups_members', array( 'rank_uid' => 0 ), array( 'group_id = ? AND rank_uid = ?', $group_id, $deleteRank ) );
			\IPS\Db::i()->delete( 'rp_ranks', array( 'uid = ? AND group_uid = ?', $deleteRank, $group_id ) );
			\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=group&tab=ranks&char_id=".$char_id."&group_id=".$group_id, 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Pomyślnie usunięto rangę.') );
		}
		if(isset(\IPS\Request::i()->new_rankName))
		{
			$rankName = \IPS\Request::i()->new_rankName;

			\IPS\Db::i()->insert( 'rp_ranks', array( 'group_uid' => $group_id, 'name' => $rankName ) );
			\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=group&tab=ranks&char_id=".$char_id."&group_id=".$group_id, 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Pomyślnie dodano rangę.') );
		}
		if(isset(\IPS\Request::i()->rankFlag) && isset(\IPS\Request::i()->payout))
		{
			$rankFlag = \IPS\Request::i()->rankFlag;
			$payout = \IPS\Request::i()->payout;
			foreach($rankFlag as $rank_id => $id)
			{
				foreach($id as $flag => $key)
				{
					$flags = $flags + $flag;
				}
				$payoutRank = $payout[$rank_id];
				if($payoutRank > 300 || $payoutRank < 0)
				{
					\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=group&tab=ranks&char_id=".$char_id."&group_id=".$group_id, 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Wprowadzono błędną kwotę wypłaty (max: 300 dolarów).') );
				}
				\IPS\Db::i()->update( 'rp_ranks', array( 'permissions' => $flags, 'payout' => $payoutRank ), array( 'uid = ?', $rank_id ) );
				$flags = 0;
			}
			\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=group&tab=ranks&char_id=".$char_id."&group_id=".$group_id, 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Pomyślnie zapisano ustawienia rang.') );
		}
		$groupDataRanks = \IPS\game\Group::fetchGroupDataRanks($group_id);
		return \IPS\Theme::i()->getTemplate('group')->ranks( $groupDataRanks, $perm );
	}
}