<?php
namespace IPS\game;

/* To prevent PHP errors (extending class does not exist) revealing path */
if ( !defined( '\IPS\SUITE_UNIQUE_KEY' ) )
{
	header( ( isset( $_SERVER['SERVER_PROTOCOL'] ) ? $_SERVER['SERVER_PROTOCOL'] : 'HTTP/1.0' ) . ' 403 Forbidden' );
	exit;
}

class _Possession extends \IPS\Patterns\ActiveRecord
{
	/* Pobieranie danych grupy o id = `$group_id` */
	public function fetchPossessionData($possession_id)
	{
		try
		{
			$row = \IPS\Db::i()->select( 'rp_doors.*, imie_nazwisko', 'rp_doors', array('rp_doors.id = ?', $possession_id));
			$row->join('rp_postacie', 'rp_doors.wlasciciel = rp_postacie.id', 'INNER' );
			foreach( $row as $a => $b )
			{
				$result = $b;
			}
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->error( 'no_module_permission', '2C122/1', 403, '' );
		}
		return $result;
	}
}

?>