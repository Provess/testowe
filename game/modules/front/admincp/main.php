<?php
namespace IPS\game\modules\front\admincp;

/* To prevent PHP errors (extending class does not exist) revealing path */
if ( !defined( '\IPS\SUITE_UNIQUE_KEY' ) )
{
	header( ( isset( $_SERVER['SERVER_PROTOCOL'] ) ? $_SERVER['SERVER_PROTOCOL'] : 'HTTP/1.0' ) . ' 403 Forbidden' );
	exit;
}

/**
 * Portal
 */
class _main extends \IPS\Dispatcher\Controller
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

		if( !\IPS\Member::loggedIn()->modPermission())
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		
		/* Work out output */
		$tab = \IPS\Request::i()->tab ?: 'dashboard';
		if ( method_exists( $this, "_{$tab}" ) )
		{
			$output = call_user_func( array( $this, "_{$tab}" ) );
		}
		
		/* Display */
		if( !\IPS\Request::i()->isAjax() )
		{
			\IPS\Output::i()->title = \IPS\Member::loggedIn()->language()->addToStack('module__game_admincp');
			\IPS\Output::i()->output = \IPS\Theme::i()->getTemplate('admincp')->main($tab, $output);
		}
		else
		{
			\IPS\Output::i()->title = \IPS\Member::loggedIn()->language()->addToStack('module__game_admincp');
			\IPS\Output::i()->output = $output;
		}
	}

	protected function _dashboard()
	{
		$Count_Characters = \IPS\game\AdminCP::Dashboard_Count_Characters();
		$Count_Groups = \IPS\game\AdminCP::Dashboard_Count_Groups();
		$Count_Items = \IPS\game\AdminCP::Dashboard_Count_Items();
		$Count_Cars = \IPS\game\AdminCP::Dashboard_Count_Vehicles();
		$Count_Doors = \IPS\game\AdminCP::Dashboard_Count_Doors();
		$Count_Areas = \IPS\game\AdminCP::Dashboard_Count_Areas();
		$Count_Objects = \IPS\game\AdminCP::Dashboard_Count_Objects();
		$Count_Pickups = \IPS\game\AdminCP::Dashboard_Count_Pickups();
		$Count_Money = \IPS\game\AdminCP::Dashboard_Count_Money();
		$Count_MoneyBank = \IPS\game\AdminCP::Dashboard_Count_MoneyBank();
		return \IPS\Theme::i()->getTemplate('admincp')->dashboard( $Count_Characters, $Count_Groups, $Count_Items, $Count_Cars, $Count_Doors, $Count_Areas, $Count_Objects, $Count_Pickups, $Count_Money, $Count_MoneyBank );
	}

	protected function _characters()
	{
		$Chars_Act = \IPS\game\AdminCP::Characters_Active();
		$Chars_Dis = \IPS\game\AdminCP::Characters_Disabled();
		return \IPS\Theme::i()->getTemplate('admincp')->characters( $Chars_Act, $Chars_Dis );
	}

	protected function _uprawnienia()
	{
		if(isset( \IPS\Request::i()->perm ))
		{
			// Update'owanie flag uprawnień
			$perm = \IPS\Request::i()->perm;
			$duties = \IPS\Request::i()->duties;
			foreach($perm as $member_id => $id)
			{
				foreach($id as $flag => $key)
				{
					$flags = $flags + $flag;
				}

				foreach($duties as $key => $value)
				{
					if($key == $member_id)
					{
						\IPS\Db::i()->update( 'core_members', array( 'flags' => $flags, 'admin_obowiazki' => $value ), array( 'member_id = ?', $member_id ) );
					}
				}

				$flags = 0;
			}
			\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=admincp&tab=uprawnienia", 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Pomyślnie zapisano uprawnienia.') );
		}
		if(!(\IPS\Member::loggedIn()->flags & 1))
		{
			\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=admincp", 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Nie posiadasz uprawnień do przeglądania tej zakladki.') );
		}
		try
		{
			$perm = \IPS\Db::i()->select( 'member_group_id, member_id, name, flags, admin_obowiazki', 'core_members', 'flags IS NOT NULL');
			foreach($perm as $key => $id)
			{
				$adminsData[] = $id;
			}
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		return \IPS\Theme::i()->getTemplate('admincp')->uprawnienia( $adminsData );
	}
	
	protected function _groups()
	{
		return \IPS\Theme::i()->getTemplate('admincp')->groups();
	}
	
	protected function _items()
	{
		return \IPS\Theme::i()->getTemplate('admincp')->items();
	}
	
	protected function _cars()
	{
		$Vehicles_Player = \IPS\game\AdminCP::Vehicles_OwnerType_Player();
		$Vehicles_Group = \IPS\game\AdminCP::Vehicles_OwnerType_Group();
		$Vehicles_Count_Players = \IPS\game\AdminCP::Vehicles_CountChart_Players();
		$Vehicles_Count_Groups = \IPS\game\AdminCP::Vehicles_CountChart_Groups();
		return \IPS\Theme::i()->getTemplate('admincp')->cars( $Vehicles_Player, $Vehicles_Group, $Vehicles_Count_Players, $Vehicles_Count_Groups );
	}
	
	protected function _doors()
	{
		$Doors_Player = \IPS\game\AdminCP::Doors_OwnerType_Player();
		$Doors_Group = \IPS\game\AdminCP::Doors_OwnerType_Group();
		$Doors_Count_Players = \IPS\game\AdminCP::Doors_CountChart_Players();
		$Doors_Count_Groups = \IPS\game\AdminCP::Doors_CountChart_Groups();
		return \IPS\Theme::i()->getTemplate('admincp')->doors( $Doors_Player, $Doors_Group, $Doors_Count_Players, $Doors_Count_Groups );
	}
	
	protected function _areas()
	{
		return \IPS\Theme::i()->getTemplate('admincp')->areas();
	}
	
	protected function _objects()
	{
		return \IPS\Theme::i()->getTemplate('admincp')->objects();
	}
	
	protected function _pickups()
	{
		return \IPS\Theme::i()->getTemplate('admincp')->pickups();
	}
	
	protected function _salon()
	{
		
		return \IPS\Theme::i()->getTemplate('admincp')->salon();
	}
	
	protected function _products()
	{
		return \IPS\Theme::i()->getTemplate('admincp')->products();
	}
	
	protected function _anims()
	{
		return \IPS\Theme::i()->getTemplate('admincp')->anims();
	}
	
	protected function _logs()
	{
		return \IPS\Theme::i()->getTemplate('admincp')->logs();
	}

	protected function _tickets()
	{
		if(isset(\IPS\Request::i()->showTicket))
		{
			$ticket_id = \IPS\Request::i()->showTicket;
			$member_id = \IPS\Member::loggedIn()->member_id;
			try
			{
				$ticket = \IPS\Db::i()->select( '*', 'game_tickets', array( 'id = ?', $ticket_id ) )->first();
				$selectPosts = \IPS\Db::i()->select( '*', 'game_tickets_posts', array( 'ticket_id = ?', $ticket_id ) );
				foreach($selectPosts as $row)
				{
					$posts[] = $row;
				}

				/* Formularz odpowiedzi */
				$form = new \IPS\Helpers\Form('', 'add_reply');
				$form->class = 'ipsForm_vertical';
				$form->add( new \IPS\Helpers\Form\Editor( 'Odpowiedź', NULL, TRUE, array( 'app' => 'game', 'key' => 'tickets', 'autoSaveKey' => 'ticket_reply_'.$ticket_id ) ) );

				/* Admin dodał odpowiedź */
				if( $values = $form->values() )
				{
					\IPS\Db::i()->insert( 'game_tickets_posts', array( 'ticket_id' => $ticket_id, 'content' => $values['Odpowiedź'], 'author' => $member_id, 'time' => time() ) );

					$notification = new \IPS\Notification( \IPS\Application::load('game'), 'profile_reply', \IPS\Member::loggedIn(), array( \IPS\Member::loggedIn() ) );
					$notification->recipients->attach( \IPS\Member::load( $ticket['user_id'] ) );
					$notification->send();

					\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "/admincp/&tab=tickets&showTicket=".$ticket_id, 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Dodano odpowiedź do zgłoszenia.') );
				}

				/* Admin - akcje */

				if( isset( \IPS\Request::i()->action ) )
				{
					$getAction =  \IPS\Request::i()->action;
					if($getAction == 'inprogress' || $getAction == 'done')
					{
						switch( $getAction )
						{
							case 'inprogress':
									$status = 2;
									break;
							case 'done':
									$status = 3;
									break;
						}
						/* Mysql Query */
						\IPS\Db::i()->update( 'game_tickets', array( 'status' => $status), array( 'id = ?', $ticket_id ) );



						/* Ouput for user */
						\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "/admincp/&tab=tickets&showTicket=".$ticket_id, 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Pomyślnie zmieniono status zgłoszenia.') );

					}
					elseif($getAction == 'close')
					{

					}
				}

				return \IPS\Theme::i()->getTemplate('admincp')->showTicket( $ticket, $posts, $form );
			}
			catch( \UnderflowException $e  )
			{
				\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
			}
		}
		else
		{
			$tabNames = array('forum', 'game', 'others');
			$i = 1;
			foreach($tabNames as $name)
			{
				$select[$name] =  \IPS\Db::i()->select( 'id, user_id, title, category_id, status, time', 'game_tickets', array( 'category_id = ?', $i ) );
				foreach($select[$name] as $row)
				{
					$row['status_name'] = \IPS\game\Character::getTicketStatusName( $row['status'] );
					$tickets[$name][] = $row;
				}
				$i ++;
			}
			return \IPS\Theme::i()->getTemplate('admincp')->tickets( $tabNames, $tickets );
		}
	}

}