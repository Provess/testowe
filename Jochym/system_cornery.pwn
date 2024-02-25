forward ZaladujCornery();
public ZaladujCornery()
{
	new id = false;
	mysql_query( "SELECT * FROM `jochym_cornery`" );
	mysql_store_result( );
	while(mysql_fetch_row(zapyt))
	{
	    sscanf(zapyt, "p<|>i", id );
	    sscanf(zapyt, "p<|>dfff",
	    Corner[id][cID],
	    Corner[id][cX],
	    Corner[id][cY],
	    Corner[id][cZ]);
	}
	mysql_free_result( );
	printf("Miejsca cornerów - %d", id);
	return 1;
}
forward StworzCorner(playerid);
public StworzCorner(playerid)
{
	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
    new itemid = GetFreeSQLUID("jochym_cornery", "ID");
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_cornery` (`ID`, `X`, `Y`, `Z`) VALUES ('%d','%f','%f','%f')",
	itemid, X, Y, Z);
	mysql_check();
	mysql_query2(zapyt);
	Corner[itemid][cID] = itemid;
	Corner[itemid][cX] = X;
	Corner[itemid][cY] = Y;
	Corner[itemid][cZ] = Z;
	Corner[itemid][cID] = SetPlayerCheckpoint(playerid, Corner[itemid][cX], Corner[itemid][cY], Corner[itemid][cZ], 3.0);
	mysql_free_result();
	return itemid;
}
CMD:acorner(playerid, cmdtext[])
{
    if((DaneGracza[playerid][gAdmGroup] == 4 || DaneGracza[playerid][gAdmGroup] == 7) && DutyAdmina[playerid] == 1)
	{
    	new	comm1[32], comm2[128];
		if(sscanf(cmdtext, "s[32]S()[128]", comm1, comm2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/acorner [stworz, usun]", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"stworz",true))
		{
			StworzCorner(playerid);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Stowrzy³eœ corner, od tego momentu gracze moga w tym miejscu czekaæ na klienta!", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"usuñ",true))
		{
		    return 1;
		}
	}
	return 1;
}
