<?php
/**
 * @brief		Front Navigation Extension: Game
 * @author		<a href='http://www.invisionpower.com'>Invision Power Services, Inc.</a>
 * @copyright	(c) 2001 - 2016 Invision Power Services, Inc.
 * @license		http://www.invisionpower.com/legal/standards/
 * @package		IPS Community Suite
 * @subpackage	Game
 * @since		08 Jan 2014
 * @version		SVN_VERSION_NUMBER
 */

namespace IPS\game\extensions\core\FrontNavigation;

/* To prevent PHP errors (extending class does not exist) revealing path */
if ( !defined( '\IPS\SUITE_UNIQUE_KEY' ) )
{
	header( ( isset( $_SERVER['SERVER_PROTOCOL'] ) ? $_SERVER['SERVER_PROTOCOL'] : 'HTTP/1.0' ) . ' 403 Forbidden' );
	exit;
}

/**
 * Front Navigation Extension: Game
 */
class _Possession extends \IPS\core\FrontNavigation\FrontNavigationAbstract
{
	/**
	 * Get Type Title which will display in the AdminCP Menu Manager
	 *
	 * @return	string
	 */
	public static function typeTitle()
	{
		return \IPS\Member::loggedIn()->language()->addToStack( 'frontnavigation_game_possessions' );
	}
		
	/**
	 * Can access?
	 *
	 * @return	bool
	 */
	public function canView()
	{
		return parent::canView() and \IPS\Member::loggedIn()->canAccessModule( \IPS\Application\Module::get( 'game', 'possessions' ) );
	}
	
	/**
	 * Get Title
	 *
	 * @return	string
	 */
	public function title()
	{
		return \IPS\Member::loggedIn()->language()->addToStack( 'frontnavigation_game_possessions' );
	}
	
	/**
	 * Get Link
	 *
	 * @return	\IPS\Http\Url
	 */
	public function link()
	{
		return \IPS\Http\Url::internal( "app=game&module=_Possession", 'front', 'game__possessions' );
	}
	
	/**
	 * Is Active?
	 *
	 * @return	bool
	 */
	public function active()
	{
		return \IPS\Dispatcher::i()->application->directory === 'game' and \IPS\Dispatcher::i()->module->key === 'possessions';
	}
}