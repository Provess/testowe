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
class _todo extends \IPS\Dispatcher\Controller
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
		// Wyświetlanie wpisu
		if( isset( \IPS\Request::i()->id ) )
		{
			$id = \IPS\Request::i()->id;
			$todoData = $this->getTodoContent( $id );

			// output
			\IPS\Output::i()->output = \IPS\Theme::i()->getTemplate( 'todo' )->showTodo( $todoData ); 
		}
		else
		{
			$todoData = $this->getTodoList();

	     	/* Output, lista wpisów w to-do */
			\IPS\Output::i()->output = \IPS\Theme::i()->getTemplate( 'todo' )->main( $todoData ); 
		}
	}

	protected function getTodoContent($id)
	{
		try
		{
			$row = \IPS\Db::i()->select( '*', 'hub_todo', array( 'id=?', $id ), 'id DESC')->first();
			return $row;
		}
		catch( \UnderflowException $e )
		{
			\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=todo", 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Błędny numer wpisu.') );
		}

	}

	protected function getTodoList()
	{
		$select = \IPS\Db::i()->select( '*', 'hub_todo', '', 'id DESC');
		foreach( $select as $key => $id )
		{
			$member = \IPS\Member::load( $id['admin_id'] );
			$id['nick'] = $member->real_name;
			$id['avatar'] = $member->photo;
			$id['priorytet'] = $this->getRealPriority($id['priority']);
			$result[] = $id;
		}
		return $result;
	}

	protected function getRealPriority($priority)
	{
		switch($priority)
		{
			case 1:
			{
				return 'new';
			}
			case 2:
			{
				return 'positive';
			}
			case 3:
			{
				return 'negative';
			}
		}
	}
}