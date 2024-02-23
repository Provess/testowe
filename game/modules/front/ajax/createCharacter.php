<?php


namespace IPS\game\modules\front\ajax;

/* To prevent PHP errors (extending class does not exist) revealing path */
if ( !defined( '\IPS\SUITE_UNIQUE_KEY' ) )
{
	header( ( isset( $_SERVER['SERVER_PROTOCOL'] ) ? $_SERVER['SERVER_PROTOCOL'] : 'HTTP/1.0' ) . ' 403 Forbidden' );
	exit;
}

class _createCharacter extends \IPS\Dispatcher\Controller
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
		
		$maleSkins = array(2, 6, 7, 8, 14, 15, 17, 19, 20, 21, 22, 23, 24, 25, 26, 28, 29, 34, 35, 36, 37, 43, 46, 47, 48, 59, 60, 66, 67, 73, 78, 79, 98, 101, 121, 128, 133, 136, 142, 143, 147, 156, 161, 170, 171, 176, 177, 179, 180, 181, 182, 183, 185, 186, 188, 202, 206, 212, 217, 221, 222, 223, 240, 242, 258, 291, 297, 299);

		$femaleSkins = array(9, 11, 12, 13, 31, 38, 40, 41, 55, 56, 63, 65, 69, 76, 90, 91, 129, 130, 131, 141, 150, 151, 152, 169, 172, 190, 191, 193, 194, 211, 214, 215, 216, 219, 225, 226, 233, 298);
		/* output */
		\IPS\Output::i()->output = \IPS\Theme::i()->getTemplate('ajax')->createCharacter( $maleSkins, $femaleSkins );
	}	
	
}