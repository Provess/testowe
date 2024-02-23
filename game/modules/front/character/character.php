<?php


namespace IPS\game\modules\front\character;

/* To prevent PHP errors (extending class does not exist) revealing path */
if ( !defined( '\IPS\SUITE_UNIQUE_KEY' ) )
{
	header( ( isset( $_SERVER['SERVER_PROTOCOL'] ) ? $_SERVER['SERVER_PROTOCOL'] : 'HTTP/1.0' ) . ' 403 Forbidden' );
	exit;
}

/**
 * character
 */
class _character extends \IPS\Dispatcher\Controller
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
		
		/* Work out output */
		$chars_online = \IPS\game\Character::fetchCharactersOnline();
		$tab = \IPS\Request::i()->tab ?: 'character';
		if ( method_exists( $this, "_{$tab}" ) )
		{
			$output = call_user_func( array( $this, "_{$tab}" ) );
		}

		/* Zabezpieczenie panelu grup */

		if( isset( \IPS\Request::i()->group_char_id ) )
		{
			$char_id = \IPS\Request::i()->group_char_id;
			$charData = \IPS\game\Character::fetchCharacter($char_id);

			if( \IPS\Member::loggedIn()->member_id != $charData['gid'] )
			{
				\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
			}
		}
		
		/* Display */
		if( !\IPS\Request::i()->isAjax() )
		{
			\IPS\Output::i()->title = \IPS\Member::loggedIn()->language()->addToStack('module__game_character');
			\IPS\Output::i()->output = \IPS\Theme::i()->getTemplate('character')->tab($tab, $output, $chars_online);
		}
		else
		{
			\IPS\Output::i()->title = \IPS\Member::loggedIn()->language()->addToStack('module__game_character');
			\IPS\Output::i()->output = $output;
		}
	}
	
	/**
	 * Dashboard
	 *
	 * @return	void
	 */

	/* Chararcter Functions */

	

	/* Modules Functions */

	protected function _character()
	{
		$member_id = \IPS\Member::loggedIn()->member_id;
		$characters = \IPS\game\Character::fetchCharacters($member_id);

		if( isset( \IPS\Request::i()->hide ) && isset ( \IPS\Request::i()->hidden ) )
		{
			// Zabezpieczenia, sprawdza czy gracz ma premium i czy to jego postać.
			if(!\IPS\game\Character::isPremium($member_id))
			{
				\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
			}
			$char_id = \IPS\Request::i()->hide;
			if(!\IPS\game\Character::checkCharacterOwner($char_id, $member_id))
			{
				\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
			}

			$hidden = \IPS\Request::i()->hidden;
			if(!$hidden)
			{
				\IPS\Db::i()->update( 'ipb_characters', array( 'ukryta' => 1 ), array( 'id = ?', $char_id ) );
				\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=character", 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Postać została ukryta.') );
			}
			else
			{
				\IPS\Db::i()->update( 'ipb_characters', array( 'ukryta' => 0 ), array( 'id = ?', $char_id ) );
				\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=character", 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Postać została odkryta.') );
			}
		}

		// Pobranie danych z formularze
		$firstName = \IPS\Request::i()->char_firstName;
		$lastName = \IPS\Request::i()->char_lastName;
		$gender = \IPS\Request::i()->char_gender;
		$skin = \IPS\Request::i()->char_skin;

		// Sprawdzenie czy kliknieto "Stwórz postać"
		if( isset($firstName) && isset($lastName) && isset($gender) && isset($skin) )
		{
			$firstName = ucfirst($firstName);
			$lastName = ucfirst($lastName);
			$nick = $firstName.'_'.$lastName;

			try
			{
				$row = \IPS\Db::i()->select( 'char_name', 'ipb_characters', array( 'char_name = ?', $nick ) )->first();

				if(count($row) != 0)
				{
					\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=character", 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Postać o takim imieniu i nazwisku już istnieje w bazie danych.') );
				}
			}
			catch( \UnderflowException $e )
			{
				$gotHours = \IPS\game\Character::checkPlayerHours($member_id);
				if(!$gotHours)
				{
					\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=character", 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Nie przegrałeś wystarczajacej ilości godzin na swoich postaciach aby utworzyć nową (minimum: 10h, konto premium: 3h).') );
				}

				$maleSkins = array(2, 6, 7, 8, 14, 15, 17, 19, 20, 21, 22, 23, 24, 25, 26, 28, 29, 34, 35, 36, 37, 43, 46, 47, 48, 59, 60, 66, 67, 73, 78, 79, 98, 101, 121, 128, 133, 136, 142, 143, 147, 156, 161, 170, 171, 176, 177, 179, 180, 181, 182, 183, 185, 186, 188, 202, 206, 212, 217, 221, 222, 223, 240, 242, 258, 291, 297, 299);

				$femaleSkins = array(9, 11, 12, 13, 31, 38, 40, 41, 55, 56, 63, 65, 69, 76, 90, 91, 129, 130, 131, 141, 150, 151, 152, 169, 172, 190, 191, 193, 194, 211, 214, 215, 216, 219, 225, 226, 233, 298);

				// Walidacja poprawności wybranego skina
				if($gender == 1)
				{
					if( !in_array($skin, $maleSkins) )
					{
						\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=character", 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Wybrano nieprawidłowy skin.') );
					}
				}

				elseif($gender == 2)
				{
					if( !in_array($skin, $femaleSkins) )
					{
						\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=character", 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Wybrano nieprawidłowy skin.') );
					}
				}

				\IPS\Db::i()->insert( 'ipb_characters', array( 'char_name' => $nick, 'char_sex' => $gender, 'char_skin' => $skin, 'char_gid' => $member_id ) );

				\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=character", 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Pomyślnie utworzono postać.') );
			}
		}

		return \IPS\Theme::i()->getTemplate('character')->dashboard( $characters );
	}

	protected function _create()
	{
		/* Return */
		return \IPS\Theme::i()->getTemplate('character')->tabCreate();
	}
	protected function _groups()
	{
		$member_id = \IPS\Member::loggedIn()->member_id;
		$characters = \IPS\game\Character::fetchCharacters($member_id);
		if(isset( \IPS\Request::i()->group_char_id ))
		{
			$char_id = \IPS\Request::i()->group_char_id;
			$groups = \IPS\game\Character::fetchCharacterGroups($char_id);
		}

		/* Return */
		return \IPS\Theme::i()->getTemplate('character')->tabGroups( $characters, $groups, $char_id );
	}
	protected function _possessions()
	{
		$member_id = \IPS\Member::loggedIn()->member_id;
		$characters = \IPS\game\Character::fetchCharacters($member_id);
		if(isset( \IPS\Request::i()->possession_char_id ))
		{
			$char_id = \IPS\Request::i()->possession_char_id;
			$posessions = \IPS\game\Character::fetchCharacterDoors($char_id);
		}

		/* Return */
		return \IPS\Theme::i()->getTemplate('character')->tabPossessions(  $characters, $posessions, $char_id );
	}
	protected function _premium()
	{
		if(isset(\IPS\Request::i()->check_code))
		{
			$code = \IPS\Request::i()->check_code;
			$account = array("account" => 27432, "name" => "Konto Premium", "netto" => 9.00, "brutto" => 11.07, "number" => "7955", "text" => "HPAY.SANANDREASRP");
			if(!preg_match("/^[A-Za-z0-9]{8}$/", $code))
				$result = "Zly format kodu - 8 znakow.";
			elseif($account['account'] != $_POST['service'])
				$result = "Brak takiej uslugi.";
			else
			{
				$config = array(
					'id' => 27432,
					'key' => '0bdf0e2e09c3b65b6088577fbf1be3c5',
					'command' => 'CheckSms',
					'account' => $_POST['service'],
					'code' => $code
					);

				$json = json_encode($config);

				$ch = curl_init();
				curl_setopt($ch, CURLOPT_URL, 'https://homepay.pl/api');
				curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json; charset=utf-8', 'Accept:application/json, text/javascript, */*; q=0.01', 'Content-Length: ' . strlen($json)));
				curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

				$result = curl_exec($ch);
				curl_close($ch);

				$json = json_decode($result, true);

				if($json['code'] == "1")
					$result = "Gratulacje, kod poprawny. Kupiles cos w usludze " . $account['name'];
				elseif($json['code'] == "0")
					$result = "Nieprawidlowy kod.";
				else
					$result = "Blad w polaczeniu z operatorem.";
			}
		}
		/* Return */
		return \IPS\Theme::i()->getTemplate('character')->tabPremium( $result);
	}
	protected function _staff()
	{
		$groups = \IPS\core\StaffDirectory\Group::roots();
		/* Return */
		return \IPS\Theme::i()->getTemplate('character')->tabStaff( $groups );
	}
	protected function _tickets()
	{
		/* Pobieranie member_id zalogowanego gracza */
		$member_id = \IPS\Member::loggedIn()->member_id;

		/* Pokazywanie ticketu */
		if(isset(\IPS\Request::i()->action) && \IPS\Request::i()->action = 'create')
		{
			/* Tworzenie formularza */
			$form = new \IPS\Helpers\Form;
			$form->add( new \IPS\Helpers\Form\Text('Tytuł') );
			$form->add( new \IPS\Helpers\Form\Editor( 'Wpis', NULL, TRUE, array( 'app' => 'game', 'key' => 'tickets' ) ) );
			$form->add( new \IPS\Helpers\Form\Select( 'Kategoria', NULL, TRUE, array( 'options' => array( 1 => 'Forum', 2 => 'Gra', 3 => 'Inne' ) ) ) );

			/* Wysłał zgłoszenie */
			if( $values = $form->values() )
			{
				if( $values['Kategoria'] < 1 || $values['Kategoria'] > 3 )
				{
					\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "/character/&tab=tickets", 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Wystąpił błąd przy pobieraniu wartości formularza. Spróbuj przesłać go jeszcze raz.') );
				}
				\IPS\Db::i()->insert( 'game_tickets', array( 'user_id' => $member_id, 'category_id' => $values['Kategoria'], 'status' => 1, 'title' => $values['Tytuł'], 'content' => $values['Wpis'], 'time' => time() ) );

				\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "/character/&tab=tickets", 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Zgłoszenie zostało utworzone.') );
			}
			return \IPS\Theme::i()->getTemplate('character')->createTicket( $form );
		}
		else
		{
			if(isset(\IPS\Request::i()->showTicket))
			{
				$ticket_id = \IPS\Request::i()->showTicket;
				try
				{
					$ticket = \IPS\Db::i()->select( '*', 'game_tickets', array( 'id = ? AND user_id = ?', $ticket_id, $member_id ) )->first();
					$selectPosts = \IPS\Db::i()->select( '*', 'game_tickets_posts', array( 'ticket_id = ?', $ticket_id ) );
					foreach($selectPosts as $row)
					{
						$posts[] = $row;
					}

					/* Formularz odpowiedzi */
					$form = new \IPS\Helpers\Form('', 'add_reply');
					$form->class = 'ipsForm_vertical';
					$form->add( new \IPS\Helpers\Form\Editor( 'Odpowiedź', NULL, TRUE, array( 'app' => 'game', 'key' => 'tickets', 'autoSaveKey' => 'ticket_reply_'.$ticket_id ) ) );

					/* Dodał odpowiedź */
					if( $values = $form->values() )
					{
						\IPS\Db::i()->insert( 'game_tickets_posts', array( 'ticket_id' => $ticket_id, 'content' => $values['Odpowiedź'], 'author' => $member_id, 'time' => time() ) );

						\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "/character/&tab=tickets&showTicket=".$ticket_id, 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Dodano odpowiedź do zgłoszenia.') );
					}

					\IPS\Output::i()->breadcrumb = array();
					\IPS\Output::i()->breadcrumb[] = array( \IPS\Http\Url::internal( '/character/&tab=tickets', 'front' ), 'Zgłoszenia' );
					\IPS\Output::i()->breadcrumb[] = array( \IPS\Http\Url::internal( '/character/&tab=tickets&showTicket=2', 'front' ), $ticket['title'] );
					return \IPS\Theme::i()->getTemplate('character')->showTicket( $ticket, $posts, $form );
				}
				catch( \UnderflowException $e  )
				{
					\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
				}
			}
			elseif(isset(\IPS\Request::i()->editTicket))
			{
				/* Edycja zgłoszenia */
				$ticket_id = \IPS\Request::i()->editTicket;

				/* Zabezpieczenie przed edycją cudzego zgłoszenia */
				try
				{
					$ticketData = \IPS\Db::i()->select( '*', 'game_tickets', array( 'id = ? AND user_id = ?', $ticket_id, $member_id ) )->first();
				}
				catch( \UnderflowException $e  )
				{
					\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
				}

				/* Tworzenie formularza edycji */
				$form = new \IPS\Helpers\Form;
				$form->add( new \IPS\Helpers\Form\Text('Tytuł', $ticketData['title'] ) );
				$form->add( new \IPS\Helpers\Form\Editor( 'Wpis', $ticketData['content'], TRUE, array( 'app' => 'game', 'key' => 'tickets', 'autoSaveKey' => 'ticket_edit_'.$ticket_id ) ) );
				$form->add( new \IPS\Helpers\Form\Select( 'Kategoria', $ticketData['category_id'], TRUE, array( 'options' => array( 1 => 'Forum', 2 => 'Gra', 3 => 'Inne' ) ) ) );

				/* Zapisanie zgłoszenie */
				if( $values = $form->values() )
				{
					if( $values['Kategoria'] < 1 || $values['Kategoria'] > 3 )
					{
						\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "/character/&tab=tickets", 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Wystąpił błąd przy pobieraniu wartości formularza. Spróbuj przesłać go jeszcze raz.') );
					}

					\IPS\Db::i()->update( 'game_tickets', array( 'title' => $values['Tytuł'], 'content' => $values['Wpis'], 'category_id' => $values['Kategoria'] ), array( 'id = ?', $ticket_id ) );
					\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "/character/&tab=tickets&showTicket=" . $ticket_id, 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Zgłoszenie zostało pomyślnie zapisane.') );

				}

				return \IPS\Theme::i()->getTemplate('character')->editTicket( $form );
			}
			else
			{
				/* Listowanie ticketów */

				$select = \IPS\Db::i()->select( '*', 'game_tickets', array( 'user_id = ?', $member_id ) );
				foreach( $select as $row )
				{
					$row['status_name'] = \IPS\game\Character::getTicketStatusName($row['status']);
					$row['category_name'] = $this->getCategoryName( $row['category_id'] );
					$tickets[] = $row;
				}

				$ticketsCount = \IPS\Db::i()->select( 'count(*)', 'game_tickets', array( 'user_id = ?', $member_id ) )->first();
				$solvedCount = \IPS\Db::i()->select( 'count(*)', 'game_tickets', array( 'user_id = ? AND category_id = 2', $member_id ) )->first();
				$unsolvedCount = \IPS\Db::i()->select( 'count(*)', 'game_tickets', array( 'user_id = ? AND category_id = 1', $member_id ) )->first();


				/* Return */
				\IPS\Output::i()->breadcrumb = array();
				\IPS\Output::i()->breadcrumb[] = array( \IPS\Http\Url::internal( '/character/&tab=tickets', 'front' ), 'Zgłoszenia' );
				return \IPS\Theme::i()->getTemplate('character')->tabTickets( $ticketsCount, $solvedCount, $unsolvedCount, $tickets );
			}
		}
	}
	protected function _online()
	{
		$chars_online = \IPS\game\Character::fetchCharactersOnline();
		
		/* Return */
		return \IPS\Theme::i()->getTemplate('character')->tabOnline( $chars_online );
	}
	

	/* Pozostałe funkcje */

	protected function getCategoryName($category_id)
	{
		$categoryName = array("Forum", "Gra", "Inne");
		return $categoryName[$category_id - 1];
	}
	
}