<?php
/**
 * @brief		Notification Options
 * @author		<a href='https://www.invisioncommunity.com'>Invision Power Services, Inc.</a>
 * @copyright	(c) Invision Power Services, Inc.
 * @license		https://www.invisioncommunity.com/legal/standards/
 * @package		Invision Community
 * @subpackage	Gra
 * @since		05 Nov 2017
 */

namespace IPS\game\extensions\core\Notifications;

/* To prevent PHP errors (extending class does not exist) revealing path */
if ( !defined( '\IPS\SUITE_UNIQUE_KEY' ) )
{
	header( ( isset( $_SERVER['SERVER_PROTOCOL'] ) ? $_SERVER['SERVER_PROTOCOL'] : 'HTTP/1.0' ) . ' 403 Forbidden' );
	exit;
}

/**
 * Notification Options
 */
class _Tickets
{
	/**
	 * Get configuration
	 *
	 * @param	\IPS\Member	$member	The member
	 * @return	array
	 */
	public function getConfiguration( $member )
	{
		// Basically just return a list of the keys for the types of notification your app will send
		// keys can be anything you want. You can specify what should be the default value and any disabled values (acceptable values are "email" and "inline")
		// For each key, create a language string "notifications__<key>" which is what will display in the user's Notification Options screen
		
		return array(
			'profile_reply'	=> array( 'default' => array( 'inline' ), 'disabled' => array() ),
		);
	}
	
	// For each type of notification you need a method like this which controls what will be displayed when the user clicks on the notification icon in the header:
	// Note that for each type of notification you must *also* create email templates. See documentation for details: https://remoteservices.invisionpower.com/docs/devdocs-notifications
	
	/**
	 * Parse notification: key
	 *
	 * @param	\IPS\Notification\Inline	$notification	The notification
	 * @return	array
	 * @code
	 return array(
		 'title'		=> "Mark has replied to A Topic",	// The notification title
		 'url'			=> \IPS\Http\Url::internal( ... ),	// The URL the notification should link to
		 'content'		=> "Lorem ipsum dolar sit",			// [Optional] Any appropriate content. Do not format this like an email where the text
		 													// 	 explains what the notification is about - just include any appropriate content.
		 													// 	 For example, if the notification is about a post, set this as the body of the post.
		 'author'		=>  \IPS\Member::load( 1 ),			// [Optional] The user whose photo should be displayed for this notification
	 );
	 * @endcode
	 */
	public function parse_profile_reply( \IPS\Notification\Inline $notification )
	{
		$item = $notification->item;

		return array(
			'title'		=> "Administrator (".$item->name.") odpowiedział na Twoje zgłoszenie.",	// The notification title
			'url'			=> \IPS\Http\Url::internal( "/character/&tab=tickets"),	// The URL the notification should link to
			'content'		=> "Lorem ipsum dolar sit",			// [Optional] Any appropriate content. Do not format this like an email where the text
																// 	 explains what the notification is about - just include any appropriate content.
																// 	 For example, if the notification is about a post, set this as the body of the post.
			'author'		=>  $item,			// [Optional] The user whose photo should be displayed for this notification
		);
	}
}