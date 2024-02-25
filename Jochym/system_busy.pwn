AntiDeAMX();
enum bus
{
	busUID,
	busText[ 32 ],
	Float:busPozX,
	Float:busPozY,
	Float:busPozZ,
	Float:busPozA,
	Text3D:busTag
}
new Przystanek[MAX_BUS][bus];
CMD:abus( playerid, params[ ] )
{
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCMa(playerid, 0))
    {
		new opcja[8], str[100];
		if( sscanf( params, "s[8]", opcja ) )
		{
		    new id = GetPVarInt( playerid,"BusPoz");
		    if( !id )
		    	return dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:","{DEDEDE}Aby stworzyæ/edytowaæ{DEDEDE} przystanek autobusowy wpisz: /abus [opcja].\n{DEDEDE}Dostêpne opcje: stworz, edytuj.", "Zamknij", "" );


			new
			    Float:x,
			    Float:y,
			    Float:z,
			    Float:a
			;

			GetPlayerPos( playerid, x, y, z );
			GetPlayerFacingAngle( playerid, a );

			Przystanek[ id ][ busPozX ] = x;
			Przystanek[ id ][ busPozY ] = y;
			Przystanek[ id ][ busPozZ ] = z;
			Przystanek[ id ][ busPozA ] = a;
			ZapiszPrzystanek( id );
			DestroyDynamic3DTextLabel( Przystanek[ id ][ busTag ] );
			format( str, sizeof( str ), "Przystanek %d. %s\n{A9C4E4}Aby kupiæ bilet, kliknij Y lub wpisz /bus",id, Przystanek[ id ][ busText ] );
			Przystanek[ id ][ busTag ] = CreateDynamic3DTextLabel( str, SZARY,Przystanek[ id ][ busPozX ], Przystanek[ id ][ busPozY ], Przystanek[ id ][ busPozZ ],30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0);
			return DeletePVar( playerid, "BusPoz" );
		}

		if( !strcmp( opcja, "stworz", true ) )
		{
		    dShowPlayerDialog( playerid, DIALOG_NOWYBUS_CZ1, DIALOG_STYLE_INPUT, "• TIP: Przystanek:",
		    "{DEDEDE}Rozpoczêto proces tworzenia nowego przystanku.\n{DEDEDE}Wpisz nazwê nowego przystanku.", "Dalej", "Zamknij" );
		}
		else if( !strcmp( opcja, "edytuj", true ) )
		{
		    new
		        stop_id = GetPlayerBusStop( playerid );

			if( !stop_id )
			    return dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:","{DEDEDE}Nie znajdujesz siê na ¿adnym{DEDEDE} przystanku." , "Zamknij", "" );

			SetPVarInt( playerid, "BusPoz", stop_id );

		    new info[ 256 ];
		    format( info, sizeof( info ), "Nazwa:\t\t%s\n\
		    Pozycja:\n\
		    \t\tPoz. X: %f\n\
		    \t\tPoz. Y: %f\n\
		    \t\tPoz. Z: %f\n\
		    \t\tPoz. A: %f\n\
		    \n\
		    Zmieñ nazwê\n\
		    Zmieñ pozycjê\nUsuñ przystanek",
			Przystanek[ stop_id ][ busText ],
			Przystanek[ stop_id ][ busPozX ],
			Przystanek[ stop_id ][ busPozY ],
			Przystanek[ stop_id ][ busPozZ ],
			Przystanek[ stop_id ][ busPozA ]
			);
		    dShowPlayerDialog( playerid, DIALOG_BUS_EDIT, DIALOG_STYLE_LIST, "• TIP: Przystanek:",
		    info, "PrzejdŸ", "Zamknij" );
		}
	}
	return 1;
}
CMD:businterakcja22( playerid, cmdtext[ ] )
{
	//printf("U¿yta komenda bus");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
    new	stop_id = GetPlayerBusStop(playerid),big_str[800];

	if( !stop_id )
	    return 1;

	format( big_str, sizeof( big_str ), "%s{848484}ID\tNazwa przystanku\n", big_str);
	for( new i = 1; i < MAX_BUS; i++ )
	{
	    if( i == stop_id || !Przystanek[ i ][ busUID ] )
	        continue;

		format( big_str, sizeof( big_str ), "%s%d\t%s\n",
		big_str, i, Przystanek[ i ][ busText ] );
	}

	dShowPlayerDialog( playerid, DIALOG_BUS, DIALOG_STYLE_LIST, "Przystanki:",
	big_str, "Wybierz", "Zamknij" );

	return 1;
}
CMD:bus( playerid, cmdtext[ ] )
{
	//printf("U¿yta komenda bus");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
    new	stop_id = GetPlayerBusStop(playerid),big_str[800];

	if( !stop_id )
	    return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Nie jesteœ na przystanku autobusowym.", "Zamknij", "");

	format( big_str, sizeof( big_str ), "%s{848484}ID\tNazwa przystanku\n", big_str);
	for( new i = 1; i < MAX_BUS; i++ )
	{
	    if( i == stop_id || !Przystanek[ i ][ busUID ] )
	        continue;

		format( big_str, sizeof( big_str ), "%s%d\t%s\n",
		big_str, i, Przystanek[ i ][ busText ] );
	}

	dShowPlayerDialog( playerid, DIALOG_BUS, DIALOG_STYLE_LIST, "Przystanki:",
	big_str, "Wybierz", "Zamknij" );

	return 1;
}
forward ZaladujPrzystanki( );
public ZaladujPrzystanki( )
{
	new sql[ 256 ], id = false;
	mysql_query( "SELECT * FROM `jochym_bus`" );
	mysql_store_result( );
	while( mysql_fetch_row( sql ) )
	{
	    sscanf( sql, "p<|>i", id );
	    sscanf( sql, "p<|>is[32]ffff",
		Przystanek[ id ][ busUID ],
		Przystanek[ id ][ busText ],
		Przystanek[ id ][ busPozX ],
		Przystanek[ id ][ busPozY ],
		Przystanek[ id ][ busPozZ ],
		Przystanek[ id ][ busPozA ]
		);
		new sqla[256];
		format( sqla, sizeof(sqla), "Przystanek %d. %s\n\
		{A9C4E4}Aby kupiæ bilet, kliknij Y lub wpisz /bus",
		id, Przystanek[ id ][ busText ] );
		Przystanek[ id ][ busTag ] = CreateDynamic3DTextLabel( sqla, SZARY,	Przystanek[ id ][ busPozX ], Przystanek[ id ][ busPozY ], Przystanek[ id ][ busPozZ ], 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0);
	}
	mysql_free_result( );
	printf("Przystanki  - %d", id);
	return 1;
}
forward ZapiszPrzystanek( id );
public ZapiszPrzystanek( id )
{
	new sql[ 256 ];
	strdel(sql, 0, 256);
	format( sql, sizeof( sql ), "UPDATE `jochym_bus` SET `text` = '%s', `pozX` = %f, \
	`pozY` = %f, `pozZ` = %f, `pozA` = %f WHERE `uid` = %d",
	Przystanek[ id ][ busText ],
	Przystanek[ id ][ busPozX ],
	Przystanek[ id ][ busPozY ],
	Przystanek[ id ][ busPozZ ],
	Przystanek[ id ][ busPozA ],
	Przystanek[ id ][ busUID ]);
	mysql_query( sql );
	return 1;
}
forward UsunPrzystanek(id);
public UsunPrzystanek(id)
{
	new sql[100];
	format( sql, sizeof( sql ), "DELETE FROM `jochym_bus` WHERE `uid` = %d", id );
	mysql_query( sql );
	Przystanek[ id ][ busUID ]  = 0;
	Przystanek[ id ][ busPozX ] = 0.0;
	Przystanek[ id ][ busPozY ] = 0.0;
	Przystanek[ id ][ busPozZ ] = 0.0;
	Przystanek[ id ][ busPozA ] = 0.0;
	DestroyDynamic3DTextLabel( Przystanek[ id ][ busTag ] );
	return 1;
}
forward StworzPrzystanek( text[ ], Float:pozX, Float:pozY, Float:pozZ, Float:pozA );
public StworzPrzystanek( text[ ], Float:pozX, Float:pozY, Float:pozZ, Float:pozA )
{
	new id = false;
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_bus` (`text`, `pozX`, `pozY`, `pozZ`, `pozA`) \
	VALUES ('%s', %f, %f, %f, %f)", text, pozX, pozY, pozZ, pozA );
	mysql_query( zapyt );

	id = mysql_insert_id( );
	format( Przystanek[ id ][ busText ], 32, "%s", text );
	Przystanek[ id ][ busUID ] 	= id;
	Przystanek[ id ][ busPozX ] = pozX;
	Przystanek[ id ][ busPozY ] = pozY;
	Przystanek[ id ][ busPozZ ] = pozZ;
	Przystanek[ id ][ busPozA ] = pozA;
	format( zapyt, 100, "Przystanek %d. %s\n\
	{A9C4E4}Aby kupiæ bilet, kliknij Y lub wpisz /bus",
	id, Przystanek[ id ][ busText ] );
	Przystanek[ id ][ busTag ] 	= CreateDynamic3DTextLabel( zapyt, SZARY,	Przystanek[ id ][ busPozX ], Przystanek[ id ][ busPozY ], Przystanek[ id ][ busPozZ ],	30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0);
	return id;
}

forward BusStart( playerid );
public BusStart( playerid )
{
	new
	    koszt 	= GetPVarInt( playerid, "BusKoszt" ),
		czas    = GetPVarInt( playerid, "BusCzas" ),
		stop1   = GetPVarInt( playerid, "BusPrzystanek" ),
		stop2   = GetPVarInt( playerid, "BusDo" );

	if( !IsPlayerInRangeOfPoint( playerid, 10.0, Przystanek[ stop1 ][ busPozX ],
	Przystanek[ stop1 ][ busPozY ], Przystanek[ stop1 ][ busPozZ ] ) )
	{
	    DeletePVar( playerid, "BusKoszt" );
	    DeletePVar( playerid, "BusCzas" );
	    DeletePVar( playerid, "BusDo" );
	    DeletePVar( playerid, "BusPrzystanek" );
	    return GameTextForPlayer(playerid, "~r~Przegapiles autobus.", 3000, 5);
	}

	if( koszt > GetPlayerMoney( playerid ) )
	{
	    DeletePVar( playerid, "BusKoszt" );
	    DeletePVar( playerid, "BusCzas" );
	    DeletePVar( playerid, "BusDo" );
		DeletePVar( playerid, "BusPrzystanek" );
	    return GameTextForPlayer( playerid, "Nie staæ Ciê na kupno biletu.", 3000, 5);
	}
	SetPVarInt(playerid, "AntyAirBrkBUS", 1);
	new akcjame[256];
	format(akcjame,sizeof(akcjame),"wsiada do autobusu jad¹cego w kierunku przystanku %s.", Przystanek[stop2][busText]);
	cmd_me(playerid, akcjame);
    new akcja[256];
	format(akcja,sizeof(akcja),"*wsiada do autobusu jad¹cego w kierunku przystanku %s*", Przystanek[stop2][busText]);
	SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
	new akcja2[256];
	format(akcja2,sizeof(akcja2),"wsiada do autobusu jadacego w kierunku przystanku %s", Przystanek[stop2][busText]);
	TextDrawSetString(AkcjaTD[playerid], akcja2);
	TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
	CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
	Frezuj(playerid, 0);
	FrezzPlayer[playerid] = 5;
	BUSS[playerid] = czas;
	Teleportuj(playerid, BudynekInfo[INT_BUS_VW][nXW],BudynekInfo[INT_BUS_VW][nYW],BudynekInfo[INT_BUS_VW][nZW]);
	SetPlayerFacingAngle(playerid, BudynekInfo[INT_BUS_VW][naw]);
	SetPlayerVirtualWorld(playerid, BudynekInfo[INT_BUS_VW][nVWW]);
	SetPlayerInterior(playerid, BudynekInfo[INT_BUS_VW][nINTW]);
	Dodajkase( playerid, -koszt );
 	DeletePVar( playerid, "BusKoszt" );
	DeletePVar( playerid, "BusCzas" );
	DeletePVar( playerid, "BusDo" );
	DeletePVar( playerid, "BusPrzystanek" );
	SetTimerEx( "BusStop", czas*1000, 0, "ii", playerid, stop2 );
	return 1;
}
forward BusStop( playerid, stop_id );
public BusStop( playerid, stop_id )
{
    SetPVarInt(playerid, "AntyAirBrkBUS", 0);
	Teleportuj(playerid, Przystanek[ stop_id ][ busPozX ],Przystanek[ stop_id ][ busPozY ],Przystanek[ stop_id ][ busPozZ ]);
	SetPlayerInterior( playerid, 0 );
	SetPlayerVirtualWorld( playerid, 0 );
	Frezuj( playerid, 1 );
	GameTextForPlayer( playerid, "~y~~h~dotarles do celu.", 3000, 5);
	return 1;
}
stock GetPlayerBusStop( playerid )
{
	for( new i = 1; i < MAX_BUS; i++ )
	    if( IsPlayerInRangeOfPoint( playerid, 6.0, Przystanek[ i ][ busPozX ],
		Przystanek[ i ][ busPozY ], Przystanek[ i ][ busPozZ ] ) )
		    return i;
	return 0;
}
