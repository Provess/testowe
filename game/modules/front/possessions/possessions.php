<?php


namespace IPS\game\modules\front\possessions;

/* To prevent PHP errors (extending class does not exist) revealing path */
if ( !defined( '\IPS\SUITE_UNIQUE_KEY' ) )
{
	header( ( isset( $_SERVER['SERVER_PROTOCOL'] ) ? $_SERVER['SERVER_PROTOCOL'] : 'HTTP/1.0' ) . ' 403 Forbidden' );
	exit;
}

/**
 * character
 */
class _possessions extends \IPS\Dispatcher\Controller
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
		if( isset( \IPS\Request::i()->possession_id ) )
		{
			$possession_id = \IPS\Request::i()->possession_id;
			$char_id = \IPS\Request::i()->char_id;
			if(!$char_id || !$possession_id)
			{
				\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
			}

			/* Uprawnienia osoby przegladajacej */

			$permissions = \IPS\Db::i()->select( 'wlasciciel', 'rp_doors', array( 'typ_wlasciciela = 1 AND wlasciciel = ? AND gid = ?', $char_id, $member_id));
			$permissions = $permissions->join( 'rp_postacie', 'rp_doors.wlasciciel = rp_postacie.id', 'INNER' );

			if( count($permissions) == 0 )
			{
				\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
			}
			else
			{
				/* Work out output */
				$tab = \IPS\Request::i()->tab ?: 'dashboard';
				if ( method_exists( $this, "_{$tab}" ) )
				{
					$output = call_user_func( array( $this, "_{$tab}" ), $possession_id);
				}
				/* Display */
				if( !\IPS\Request::i()->isAjax() )
				{
					\IPS\Output::i()->title = \IPS\Member::loggedIn()->language()->addToStack('module__game_possessions');
					\IPS\Output::i()->output = \IPS\Theme::i()->getTemplate('possessions')->skeletonPossessions($tab, $output, $char_id, $possession_id);
				}
				else
				{
					\IPS\Output::i()->title = \IPS\Member::loggedIn()->language()->addToStack('module__game_possessions');
					\IPS\Output::i()->output = $output;
				}
			}
		}
		
	}

	protected function _dashboard( $possession_id )
	{
		$possessionData = \IPS\game\Possession::fetchPossessionData( $possession_id );
		return \IPS\Theme::i()->getTemplate('possessions')->dashboard( $possessionData );
	}

	protected function _inhabitants( $possession_id )
	{
		$select = \IPS\Db::i()->select( '*', 'rp_doors_members', array( 'doorid = ?', $possession_id ) );
		$select = $select->join( 'rp_postacie', 'rp_doors_members.char_id = rp_postacie.id', 'INNER' );
		foreach( $select as $row )
		{
			$row['imie_nazwisko'] = str_replace("_", " ", $row['imie_nazwisko']);
			$doorInhabitants[] = $row;
		}
		return \IPS\Theme::i()->getTemplate('possessions')->inhabitants( $doorInhabitants );
	}
}