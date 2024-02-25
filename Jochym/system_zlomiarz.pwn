enum zZlom {
	zID,
	Float:zX,
	Float:zY,
	Float:zZ,
	zUID
};

new Zlom[MAX_ZLOM][zZlom];

stock StworzZlom(playerid, Float:X, Float:Y, Float:Z)
{
	new itemid = GetFreeSQLUID("jochym_zlom", "ID");
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_zlom` (`ID`, `X`, `Y`, `Z`, `UID`) VALUES ('%d','%f','%f','%f','%d')",
	itemid, X, Y, Z, DaneGracza[playerid][gUID]);
	mysql_check();
	mysql_query2(zapyt);
	Zlom[itemid][zID] = itemid;
	Zlom[itemid][zX] = X;
	Zlom[itemid][zY] = Y;
	Zlom[itemid][zZ] = Z;
	Zlom[itemid][zUID] = DaneGracza[playerid][gUID];
	mysql_free_result();
	return itemid;
}

stock ZaladujZlom()
{
	new id = false;
	mysql_query( "SELECT * FROM `jochym_zlom`" );
	mysql_store_result( );
	while(mysql_fetch_row(zapyt))
	{
	    sscanf(zapyt, "p<|>i", id );
	    sscanf(zapyt, "p<|>dfffd",
	    Zlom[id][zID],
		Zlom[id][zX],
		Zlom[id][zY],
		Zlom[id][zZ],
		Zlom[id][zUID]);
	}
	mysql_free_result( );
	printf("Zlom   - %d", id);
	return 1;
}

stock UsunZlom(id)
{
	format(zapyt, sizeof(zapyt), "DELETE FROM `jochym_zlom` WHERE `ID` = '%d'", id);
	mysql_check();
	mysql_query2(zapyt);
 	Zlom[id][zX] = 0;
	Zlom[id][zY] = 0;
	Zlom[id][zZ] = 0;
	Zlom[id][zUID] = 0;
	return 1;
}