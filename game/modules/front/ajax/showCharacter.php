<?php


namespace IPS\game\modules\front\ajax;

/* To prevent PHP errors (extending class does not exist) revealing path */
if ( !defined( '\IPS\SUITE_UNIQUE_KEY' ) )
{
	header( ( isset( $_SERVER['SERVER_PROTOCOL'] ) ? $_SERVER['SERVER_PROTOCOL'] : 'HTTP/1.0' ) . ' 403 Forbidden' );
	exit;
}

class _showCharacter extends \IPS\Dispatcher\Controller
{
	/**
	 * Execute
	 *
	 * @return 	void
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

		$character_id = \IPS\Request::i()->id;
		if( isset( $character_id ) )
		{
			$characterData = \IPS\game\Character::fetchCharacter($character_id);
			$characterGroups = \IPS\game\Character::fetchCharacterGroups($character_id);
			$characterItems = \IPS\game\Character::fetchCharacterItems($character_id);
			$characterCars = \IPS\game\Character::fetchCharacterCars($character_id);
			$characterDoors = \IPS\game\Character::fetchCharacterDoors($character_id);
		}

		/* output */
		\IPS\Output::i()->output = \IPS\Theme::i()->getTemplate('ajax')->showCharacter( $characterData, $characterGroups, $characterItems, $characterCars, $characterDoors );
	}	
	
}