<?php


namespace IPS\game\modules\front\ajax;

/* To prevent PHP errors (extending class does not exist) revealing path */
if ( !defined( '\IPS\SUITE_UNIQUE_KEY' ) )
{
	header( ( isset( $_SERVER['SERVER_PROTOCOL'] ) ? $_SERVER['SERVER_PROTOCOL'] : 'HTTP/1.0' ) . ' 403 Forbidden' );
	exit;
}

class _premium extends \IPS\Dispatcher\Controller
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
		$account = array("account" => 27432, "name" => "Konto Premium", "netto" => 9.00, "brutto" => 11.07, "number" => "7955", "text" => "HPAY.SANANDREASRP");

		/* output */
		\IPS\Output::i()->output = \IPS\Theme::i()->getTemplate('ajax')->premium( $account );
	}	
	
}