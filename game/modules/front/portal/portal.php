<?php
namespace IPS\game\modules\front\portal;

/* To prevent PHP errors (extending class does not exist) revealing path */
if ( !defined( '\IPS\SUITE_UNIQUE_KEY' ) )
{
	header( ( isset( $_SERVER['SERVER_PROTOCOL'] ) ? $_SERVER['SERVER_PROTOCOL'] : 'HTTP/1.0' ) . ' 403 Forbidden' );
	exit;
}

/**
 * Portal
 */
class _portal extends \IPS\Dispatcher\Controller
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
     	$news = $this->getNewsThreads(2);
     	$newsCM = $this->getNewsThreads(2);
     	$latestchanges = $this->getLatestChanges();
     	$allchanges = $this->getAllChanges();
     	if( isset( \IPS\Request::i()->changes_desc ) )
 		{
 			$changes = \IPS\Request::i()->changes_desc;
			$member = \IPS\Member::loggedIn()->member_id;
			$date = time();
			\IPS\Db::i()->insert( 'hub_changes', array( 'admin' => $member, 'date' => $date, 'content' => $changes ) );

			// redirect to main
			\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=portal", 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Pomyślnie dodano zmianę.') );
 		}
 		if( isset( \IPS\Request::i()->deleteChange ) )
		{
			$change = \IPS\Request::i()->deleteChange;
			\IPS\Db::i()->delete( 'hub_changes', array( 'id=?', $change ) );

			// redirect to main
			\IPS\Output::i()->redirect( \IPS\Http\Url::internal( "app=game&module=portal", 'front' ), \IPS\Member::loggedIn()->language()->addToStack('Pomyślnie usunięto zmianę.') );
		}

     	/* Output */
		\IPS\Output::i()->output = \IPS\Theme::i()->getTemplate( 'portal' )->main($news, $newsCM, $latestchanges, $allchanges); 
	}

	protected function getLatestChanges()
	{
		$select = \IPS\Db::i()->select( '*', 'hub_changes', '', 'id DESC', '5');
		foreach( $select as $key => $id )
		{
			$member = \IPS\Member::load( $id['admin'] );
			$id['nick'] = $member->real_name;

			/* Sprawdzenie czy wpis jest NOWY */
			if($id['date'] + 86400 >= time())
			{
				$id['isNew'] = true;
			}
			
			$result[] = $id;
		}
		return $result;
	}

	protected function getAllChanges()
	{
		$select = \IPS\Db::i()->select( '*', 'hub_changes', '', 'id DESC');
		foreach( $select as $key => $id )
		{
			$member = \IPS\Member::load( $id['admin'] );
			$id['nick'] = $member->real_name;

			/* Sprawdzenie czy wpis jest NOWY */
			if($id['date'] + 86400 >= time())
			{
				$id['isNew'] = true;
			}
			
			$result[] = $id;
		}
		return $result;
	}

	protected function getNewsThreads($topic_id)
	{
		$select = \IPS\Db::i()->select( 'topic_id, title, post, author_name, author_id, start_date, views, posts, pinned, featured', 'forums_posts', 'forum_id='.$topic_id.' AND new_topic=1', 'topic_id DESC', '1');
		$select = $select->join( 'forums_topics', 'forums_topics.tid = forums_posts.topic_id', 'INNER' );
		foreach( $select as $key => $id )
		{
			/* Ładowanie danych użytkownika */
			$member = \IPS\Member::load( $id['author_id'] );

			/* Budowa zdjecia, przeliczanie odpowiedzi */
			$id['photo'] = $member->photo;
			$id['posts'] -= 1;

		    $result[] = $id;
		}
		return $result;
	}
}