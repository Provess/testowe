<?php
namespace IPS\game;

/* To prevent PHP errors (extending class does not exist) revealing path */
if ( !defined( '\IPS\SUITE_UNIQUE_KEY' ) )
{
	header( ( isset( $_SERVER['SERVER_PROTOCOL'] ) ? $_SERVER['SERVER_PROTOCOL'] : 'HTTP/1.0' ) . ' 403 Forbidden' );
	exit;
}

class _AdminCP extends \IPS\Patterns\ActiveRecord
{
	/* Pobieranie typu w w³aœciciela */
	public function GetOwnerType( $ownertyp )
	{
		$typ = array(
							1 => 'Gracz',
							2 => 'Grupa',
			);
			
			$ownertype = $typ[$ownertyp];

			return $ownertype;
	}
	
	public function Dashboard_Count_Characters()
	{
		try
		{
			$result = \IPS\Db::i()->select( 'count(*)', 'ipb_characters')->first();
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		return $result;
	}
	
	public function Dashboard_Count_Groups()
	{
		try
		{
			$result = \IPS\Db::i()->select( 'count(*)', 'ipb_game_groups')->first();
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		return $result;
	}
	
	public function Dashboard_Count_Items()
	{
		try
		{
			$result = \IPS\Db::i()->select( 'count(*)', 'ipb_items')->first();
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		return $result;
	}
	
	public function Dashboard_Count_Vehicles()
	{
		try
		{
			$result = \IPS\Db::i()->select( 'count(*)', 'ipb_vehicles')->first();
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		return $result;
	}
	
	public function Dashboard_Count_Doors()
	{
		try
		{
			$result = \IPS\Db::i()->select( 'count(*)', 'ipb_doors')->first();
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		return $result;
	}
	
	public function Dashboard_Count_Areas()
	{
		try
		{
			$result = \IPS\Db::i()->select( 'count(*)', 'ipb_areas')->first();
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		return $result;
	}
	
	public function Dashboard_Count_Objects()
	{
		try
		{
			$result = \IPS\Db::i()->select( 'count(*)', 'ipb_objects')->first();
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		return $result;
	}
	
	public function Dashboard_Count_Pickups()
	{
		try
		{
			$result = \IPS\Db::i()->select( 'count(*)', 'ipb_dynamicpickup')->first();
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		return $result;
	}
	
	public function Dashboard_Count_Money()
	{
		try
		{
			$result = \IPS\Db::i()->select( 'count(`char_cash`)', 'ipb_characters')->first();
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		return $result;
	}
	
	public function Characters_Active()
	{
		$select = \IPS\Db::i()->select( '*', 'ipb_characters', array('char_active = 0') );		
		foreach( $select as $key => $id )
		{	
			$id['char_cash'] = number_format($id['char_cash']);
			$id['bank'] = number_format($id['char_bank']);
			$id['nick_ooc'] =  \IPS\Member::load( $id['char_gid'] )->name;
			$id['imie_nazwisko'] = str_replace('_', ' ', $id['char_name']);
			$result[] = $id;
		}
		return $result;
	}
	
	public function Characters_Disabled()
	{
		$select = \IPS\Db::i()->select( '*', 'ipb_characters', array('char_active = 1') );		
		foreach( $select as $key => $id )
		{	
			$id['nick_ooc'] =  \IPS\Member::load( $id['char_gid'] )->name;
			$id['imie_nazwisko'] = str_replace('_', ' ', $id['char_name']);
			$result[] = $id;
		}
		return $result;
	}
	
	public function Doors_OwnerType_Player()
	{
		$select = \IPS\Db::i()->select( '`ipb_doors`.id as doorid, ipb_doors.*, ipb_characters.*', 'ipb_doors', array('typ_wlasciciela = 1') );
		$select = $select->join('ipb_characters', 'ipb_doors.wlasciciel = ipb_characters.id', 'INNER' );
		foreach( $select as $key => $id )
		{	
			$id['nick_ooc'] =  \IPS\Member::load( $id['gid'] )->name;
			$id['imie_nazwisko'] = str_replace('_', ' ', $id['imie_nazwisko']);
			$id['typ_wlasciciela'] = \IPS\game\AdminCP::GetOwnerType($id['typ_wlasciciela']);
			$result[] = $id;
		}
		return $result;
	}
	
	public function Doors_OwnerType_Group()
	{
		$select = \IPS\Db::i()->select( '`ipb_doors`.id as doorid, ipb_doors.*, ipb_game_groups.*', 'ipb_doors', array('typ_wlasciciela = 2') );
		$select = $select->join('ipb_game_groups', 'ipb_doors.wlasciciel = ipb_game_groups.id', 'INNER' );
		foreach( $select as $key => $id )
		{
			$id['typ_wlasciciela'] = \IPS\game\AdminCP::GetOwnerType($id['typ_wlasciciela']);
			$result[] = $id;
		}
		return $result;
	}
	
	public function Vehicles_OwnerType_Player()
	{
		$select = \IPS\Db::i()->select( '*', 'ipb_vehicles', array('vehicle_ownertype = 1') );
		$select = $select->join('ipb_characters', 'ipb_vehicles.vehicle_owner = ipb_characters.char_uid', 'LEFT' );
		foreach( $select as $key => $id )
		{	
			$id['imie_nazwisko'] = str_replace('_', ' ', $id['char_name']);
			$id['nick_ooc'] =  \IPS\Member::load( $id['char_uid'] )->name;
			$id['name'] = \IPS\game\Vehicle::GetVehicleName($id['vehicle_model']);
			$id['c1'] = \IPS\game\Vehicle::GetVehicleColor($id['vehicle_color1']);
			$id['c2'] = \IPS\game\Vehicle::GetVehicleColor($id['vehicle_color2']);
			$id['ownertype'] = \IPS\game\AdminCP::GetOwnerType($id['vehicle_ownertype']);
			$id['idpojazdu'] = number_format($id['vehicle_uid']);
			$result[] = $id;
		}
		return $result;
	}
	
	public function Vehicles_OwnerType_Group()
	{
		$select = \IPS\Db::i()->select( '*', 'ipb_vehicles', array('vehicle_ownertype = 2') );
		$select->join('ipb_game_groups', 'ipb_vehicles.vehicle_owner = ipb_game_groups.group_uid', 'LEFT' );
		foreach( $select as $key => $id )
		{	
			$id['name'] = \IPS\game\Vehicle::GetVehicleName($id['vehicle_model']);
			$id['c1'] = \IPS\game\Vehicle::GetVehicleColor($id['vehicle_color1']);
			$id['c2'] = \IPS\game\Vehicle::GetVehicleColor($id['vehicle_color2']);
			$id['ownertype'] = \IPS\game\AdminCP::GetOwnerType($id['vehicle_ownertype']);
			$id['idpojazdu'] = number_format($id['vehicle_uid']);
			$result[] = $id;
		}
		return $result;
	}
	
	// Liczenie rekordów dla diagramów
	
		// Liczenie iloœci pojazdów nale¿acych do graczy
	public function Vehicles_CountChart_Players()
	{
		try
		{
			$result = \IPS\Db::i()->select( 'count(*)', 'ipb_vehicles', 'vehicle_ownertype = 1')->first();
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		return $result;
	}
		// Liczenie iloœci pojazdów nale¿acych do grup
	public function Vehicles_CountChart_Groups()
	{
		try
		{
			$result = \IPS\Db::i()->select( 'count(*)', 'ipb_vehicles', 'vehicle_ownertype = 2')->first();
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		return $result;
	}
		// Liczenie iloœci drzwi nale¿acych do graczy
	public function Doors_CountChart_Players()
	{
		try
		{
			$result = \IPS\Db::i()->select( 'count(*)', 'ipb_doors', 'typ_wlasciciela = 1')->first();
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		return $result;
	}
		// Liczenie iloœci drzwi nale¿acych do grup
	public function Doors_CountChart_Groups()
	{
		try
		{
			$result = \IPS\Db::i()->select( 'count(*)', 'ipb_doors', 'typ_wlasciciela = 2')->first();
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		return $result;
	}
}

?>