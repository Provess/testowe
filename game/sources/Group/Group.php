<?php
namespace IPS\game;

/* To prevent PHP errors (extending class does not exist) revealing path */
if ( !defined( '\IPS\SUITE_UNIQUE_KEY' ) )
{
	header( ( isset( $_SERVER['SERVER_PROTOCOL'] ) ? $_SERVER['SERVER_PROTOCOL'] : 'HTTP/1.0' ) . ' 403 Forbidden' );
	exit;
}

class _Group extends \IPS\Patterns\ActiveRecord
{
	/* Pobieranie typu grupy */
	public function GetGroupType( $grouptype )
	{
		$typ = array(
							0 => 'Nieokreślona',
							1 => 'Police Departament',
							2 => 'FBI',
							3 => 'Government',
							4 => 'Medical Centre',
							5 => 'Fire Departament',
							6 => 'San News',
							7 => 'ZGP',
							8 => 'Przestępcza',
							9 => 'Ściganci',
							10 => 'Syndykat',
							11 => 'Sklep',
							12 => 'Warsztat',
							13 => 'Restauracja',
							14 => 'Salon',
							15 => 'Ochrona',
							16 => 'Bank',
							17 => 'Taxi',
							18 => 'Sport',
							19 => 'Klub',
							20 => 'Napad mieszkania',
							21 => 'Siłownia',
			);
			
			$typgrupy = $typ[$grouptype];

			return $typgrupy;
	}
	/* Pobieranie danych grupy o id = `$group_id` */
	public function fetchGroupData($group_id)
	{
		try
		{
			$row = \IPS\Db::i()->select( 'rp_groups.*, imie_nazwisko', 'rp_groups', array('rp_groups.id = ?', $group_id));
			$row->join('rp_postacie', 'rp_groups.leader = rp_postacie.id', 'INNER' );
			foreach( $row as $a => $b )
			{
				$b['imie_nazwisko'] = str_replace('_', ' ', $b['imie_nazwisko']);
				$b['f-cash'] = number_format($b['cash']);
				$b['typgrupy'] = \IPS\game\Group::GetGroupType($b['kind']);
				$b['map_color'] = explode(",", $b['map']);
				$b['chat_color'] = explode(",", $b['chat']);
				$result = $b;
			}
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		return $result;
	}
	public function fetchGroupDataCars($group_id)
	{
		$select = \IPS\Db::i()->select( '*', 'rp_cars', array('ownertype = 2 AND owner = ?', $group_id) );
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
	public function fetchGroupDataDoors($group_id)
	{
		$select = \IPS\Db::i()->select( '*', 'rp_doors', array('typ_wlasciciela = 2 AND wlasciciel = ?',$group_id) );
		foreach( $select as $key => $id )
		{
			$result[] = $id;
		}
		return $result;
	}
	public function fetchGroupDataMagazine($group_id)
	{
		$select = \IPS\Db::i()->select( '*', 'rp_magazine', array('groupid = ?',$group_id) );
		foreach( $select as $key => $id )
		{
			$result[] = $id;
		}
		return $result;
	}
	public function fetchGroupDataWorkeres($group_id)
	{
		$select = \IPS\Db::i()->select( 'player_uid, imie_nazwisko, name, time, gid, last', 'rp_postacie', array('group_id = ?', $group_id) );
		$select = $select->join('rp_groups_members', 'rp_groups_members.player_uid = rp_postacie.id', 'INNER' );
		$select = $select->join('rp_ranks', 'rp_ranks.uid = rp_groups_members.rank_uid', 'LEFT' );
		foreach( $select as $key => $id )
		{
			$id['photo'] =  \IPS\Member::load( $id['gid'] )->photo;
			$id['imie_nazwisko'] = str_replace('_', ' ', $id['imie_nazwisko']);
			$result[] = $id;
		}
		return $result;
	}
	public function fetchGroupDataRanks($group_id)
	{
		$select = \IPS\Db::i()->select( '*', 'rp_ranks', array('group_uid = ?',$group_id) );
		foreach( $select as $key => $id )
		{
			$result[] = $id;
		}
		return $result;
	}
}

?>