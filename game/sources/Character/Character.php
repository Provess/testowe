<?php
namespace IPS\game;

/* To prevent PHP errors (extending class does not exist) revealing path */
if ( !defined( '\IPS\SUITE_UNIQUE_KEY' ) )
{
	header( ( isset( $_SERVER['SERVER_PROTOCOL'] ) ? $_SERVER['SERVER_PROTOCOL'] : 'HTTP/1.0' ) . ' 403 Forbidden' );
	exit;
}

class _Character extends \IPS\Patterns\ActiveRecord
{
	/* Sprawdza ownera postaci, jeżeli postać należy do $member_id - zwraca true */
	public function checkCharacterOwner($char_id, $member_id)
	{
		$characterData = \IPS\game\Character::fetchCharacter($char_id);
		if($characterData['gid'] == $member_id)
			return true;
		else return false;
	}

	/* Sprawdza czy gracz ma wystarczająco godzin na postaciach
		Jeżeli ma - zwraca true.
		W przeciwnym wypadku - false.
	*/
	public function checkPlayerHours($member_id)
	{
		// sprawdzenie czy gracz ma aktywne premium
		$isPremmy = \IPS\game\Character::isPremium($member_id);
		if($isPremmy)
		{
			$min_hours = 3;
		}
		else $min_hours = 10;

		$select = \IPS\Db::i()->select( 'char_hours', 'ipb_characters', array('char_gid = ? AND char_hours < ?', $member_id, $min_hours) );

		if( count($select) != 0 )
		{
			return false;
		}
		else return true;
		
	}

	// Funkcja sprawdza czy gracz(o $member_id) ma konto premium
	public function isPremium($member_id)
	{
		$premium = \IPS\Member::load( $member_id )->premium;
		if($premium > date())
			return true;
		else return false;
	}

	/* Fetch'e - pobór danych */

	public function fetchCharacters($member_id)
	{
		try
		{
			$select = \IPS\Db::i()->select( '*', 'ipb_characters', 'char_gid='.$member_id);
			foreach( $select as $key => $id )
			{
				$id['imie_nazwisko'] = str_replace('_', ' ', $id['imie_nazwisko']);
				$id['f-cash'] = number_format($id['cash']);
				$id['f-bank'] = number_format($id['bank']);
				$result[] = $id;
			}
			
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		return $result;
	}
	public function fetchCharacter($char_id)
	{
		try
		{
			$row = \IPS\Db::i()->select( '*', 'ipb_characters', array('char_uid = ?', $char_id))->first();
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		$row['imie_nazwisko'] = str_replace('_', ' ', $row['char_name']);
		$row['f-cash'] = number_format($row['char_cash']);
		$row['f-bank'] = number_format($row['char_bankcash']);
		return $row;
	}
	public function fetchCharacterGroups($char_id)
	{
		$select = \IPS\Db::i()->select('*', 'ipb_char_groups', array('char_uid = ?', $char_id) );
		$select = $select->join('ipb_game_groups', 'ipb_game_groups.group_uid = ipb_char_groups.group_belongs', 'INNER' );

		foreach( $select as $key => $id )
		{
			$id['imie_nazwisko'] = str_replace('_', ' ', $id['group_name']);
			$result[] = $id;
		}
		return $result;
	}

	public function fetchCharacterItems($char_id)
	{
		$select = \IPS\Db::i()->select( '*', 'ipb_items', array('item_ownertype = 2 AND item_owner = ?', $char_id) );
		foreach( $select as $key => $id )
		{
			$result[] = $id;
		}
		return $result;
	}
	public function fetchCharacterCars($char_id)
	{
		$select = \IPS\Db::i()->select( '*', 'ipb_vehicles', array('vehicle_ownertype = 1 AND vehicle_owner = ?', $char_id) );

		foreach( $select as $key => $id )
		{
			$id['f-distance'] = number_format($id['distance']);
			$id['f-hp'] = number_format($id['hp']);
			$id['f-fuel'] = number_format($id['fuel']);
			$id['name'] = \IPS\game\Vehicle::GetVehicleName($id['model']);
			$id['c1'] = \IPS\game\Vehicle::GetVehicleColor($id['color1']);
			$id['c2'] = \IPS\game\Vehicle::GetVehicleColor($id['color2']);
			$result[] = $id;
		}
		return $result;
	}
	public function fetchCharacterDoors($char_id)
	{
		$select = \IPS\Db::i()->select( '*', 'ipb_doors', array('door_ownertype = 2 AND door_owner = ?', $char_id) );
		foreach( $select as $key => $id )
		{
			$id['f-cash'] = number_format($id['cash']);
			$result[] = $id;
		}
		return $result;
	}
	public function fetchCharactersPenalty($member_id)
	{
		try
		{
			$select = \IPS\Db::i()->select( '*', 'rp_penalty', 'user_gid='.$member_id);
			$select = $select->join('ipb_characters', 'ipb_characters.id = rp_penalty.user_char_id', 'INNER' );
			foreach( $select as $key => $id )
			{	
				$id['imie_nazwisko'] = str_replace('_', ' ', $id['imie_nazwisko']);
				$id['admin'] =  \IPS\Member::load( $id['admin_gid'] )->name;
				$id['f-deactiver'] =  \IPS\Member::load( $id['deactiver'] )->name;
				$czas = time();
				$member = \IPS\Member::load( id );
				$id['penalty_type'] = \IPS\game\Character::fetchCharactersPenaltyTypes($id['type']);
				$result[] = $id;
			}
			
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		return $result;
	}
	public function fetchCharactersPenaltyTypes( $penalty_typeid )
	{
	$type = array(
						1 => 'Warn',
						2 => 'Kick',
						3 => 'Ban',
						4 => 'Blokada postaci',
						5 => 'GameScore',
						6 => 'AdminJail',
	
		);
		
		$penalty_type = $type[$penalty_typeid];

		return $penalty_type;
	}	
	public function fetchCharactersOnline()
	{
		try
		{
			$select = \IPS\Db::i()->select( '*', 'ipb_characters', 'czy_online=1');
			foreach( $select as $key => $id )
			{
				$id['photo'] =  \IPS\Member::load( $id['char_gid'] )->photo;
				$id['nickname'] =  \IPS\Member::load( $id['char_gid'] )->name;	
				$id['grupa'] =  \IPS\Member::load( $id['char_gid'] )->member_group_id;	
				$id['premium'] =  \IPS\Member::load( $id['char_gid'] )->premium;	
				$id['imie_nazwisko'] = str_replace('_', ' ', $id['char_name']);
				$result[] = $id;
			}
			
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		return $result;
	}
	public function playersOnline()
	{
		try
		{
			$result = \IPS\Db::i()->select( 'count(*)', 'ipb_characters', 'czy_online=1')->first();
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		return $result;
	}

	/* Funkcje - Tickety */

	public function getTicketStatusName( $status_id )
	{
		switch( $status_id )
		{
			case 1:
				return "<i class='fa fa-exclamation-triangle fa-2x ipsType_negative'></i><br/>Nowy";
				break;
			case 2:
				return "<i class='fa fa-envelope fa-2x'></i><br/>W trakcie rozwiązywania";
				break;
			case 3:
				return "<i class='fa fa-check-square fa-2x ipsType_positive'></i><br/>Rozwiazane";
				break;
		}
	}
}

?>