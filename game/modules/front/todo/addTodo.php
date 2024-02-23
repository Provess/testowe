<?php
namespace IPS\game\modules\front\todo;

/* To prevent PHP errors (extending class does not exist) revealing path */
if ( !defined( '\IPS\SUITE_UNIQUE_KEY' ) )
{
	header( ( isset( $_SERVER['SERVER_PROTOCOL'] ) ? $_SERVER['SERVER_PROTOCOL'] : 'HTTP/1.0' ) . ' 403 Forbidden' );
	exit;
}

/**
 * Portal
 */
class _addTodo extends \IPS\Dispatcher\Controller
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
		if(isset(\IPS\Request::i()->todoDesc) && isset(\IPS\Request::i()->todoTitle))
		{
			$title = \IPS\Request::i()->todoTitle;
			$desc = \IPS\Request::i()->todoDesc;
			$admin = \IPS\Member::loggedIn()->member_id;
			$priority = \IPS\Request::i()->todoPriority;
			$date = time();

			\IPS\Db::i()->insert( 'hub_todo', array( 'admin_id' => $admin, 'title' => $title, 'content' => $desc, 'priority' => $priority, 'date' => $date ) );

			// redirect to main
			\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=todo", 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Pomyślnie dodano wpis do To-Do.') );

		}

     	/* Output */
		\IPS\Output::i()->output = \IPS\Theme::i()->getTemplate( 'todo' )->addTodo(  ); 
	}

}