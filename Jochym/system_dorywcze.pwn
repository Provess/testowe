CMD:agazeta(playerid, cmdtext[])
{
    if((DaneGracza[playerid][gAdmGroup] == 4 || DaneGracza[playerid][gAdmGroup] == 7) && DutyAdmina[playerid] == 1)
	{
    	new	comm1[32], comm2[128];
		if(sscanf(cmdtext, "s[32]S()[128]", comm1, comm2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/agazeta [stworz]", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"stworz",true))
		{
			StworzGazety(playerid);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Stowrzy³eœ miejsce dostarczenia gazet, od tego momentu gracze moga w tym miejscu dostarczaæ gazety!", "Zamknij", "");
			return 1;
		}
	}
	return 1;
}
forward ZaladujGazety();
public ZaladujGazety()
{
	new id = false;
	mysql_query( "SELECT * FROM `jochym_gazety`" );
	mysql_store_result( );
	while(mysql_fetch_row(zapyt))
	{
	    sscanf(zapyt, "p<|>i", id );
	    sscanf(zapyt, "p<|>dfff",
	    Gazety[id][snID],
	    Gazety[id][snX],
	    Gazety[id][snY],
	    Gazety[id][snZ]);
	}
	mysql_free_result( );
	printf("Miejsca dostarczenia gazet - %d", id);
	return 1;
}
forward StworzGazety(playerid);
public StworzGazety(playerid)
{
	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
    new itemid = GetFreeSQLUID("jochym_gazety", "ID");
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_gazety` (`ID`, `X`, `Y`, `Z`) VALUES ('%d','%f','%f','%f')",
	itemid, X, Y, Z);
	mysql_check();
	mysql_query2(zapyt);
	Gazety[itemid][snID] = itemid;
	Gazety[itemid][snX] = X;
	Gazety[itemid][snY] = Y;
	Gazety[itemid][snZ] = Z;
	Gazety[itemid][snID] = SetPlayerCheckpoint(playerid, Gazety[itemid][snX], Gazety[itemid][snY], Gazety[itemid][snZ], 3.0);
	mysql_free_result();
	return itemid;
}
