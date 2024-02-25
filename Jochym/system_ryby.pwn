AntiDeAMX();
#include <progress>

enum rRybak {
	rID,
	Float:rX,
	Float:rY,
	Float:rZ,
	rUID
};

new Rybak[MAX_RYBAK][rRybak];

stock StworzRybak(playerid, Float:X, Float:Y, Float:Z)
{
	new itemid = GetFreeSQLUID("jochym_rybak", "ID");
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_rybak` (`ID`, `X`, `Y`, `Z`, `UID`) VALUES ('%d','%f','%f','%f','%d')",
	itemid, X, Y, Z, DaneGracza[playerid][gUID]);
	mysql_check();
	mysql_query2(zapyt);
	Rybak[itemid][rID] = itemid;
	Rybak[itemid][rX] = X;
	Rybak[itemid][rY] = Y;
	Rybak[itemid][rZ] = Z;
	Rybak[itemid][rUID] = DaneGracza[playerid][gUID];
	mysql_free_result();
	//Rybak[itemid][rID] = CreateDynamicMapIcon(Rybak[itemid][rX], Rybak[itemid][rY], Rybak[itemid][rZ], 9, 0, 0);
	return itemid;
}

stock ZaladujRybak()
{
	new id = false;
	mysql_query( "SELECT * FROM `jochym_rybak`" );
	mysql_store_result( );
	while(mysql_fetch_row(zapyt))
	{
	    sscanf(zapyt, "p<|>i", id );
	    sscanf(zapyt, "p<|>dfffd",
	    Rybak[id][rID],
		Rybak[id][rX],
		Rybak[id][rY],
		Rybak[id][rZ],
		Rybak[id][rUID]);
		//Rybak[id][rID] = CreateDynamicMapIcon(Rybak[id][rX], Rybak[id][rY], Rybak[id][rZ], 9, 0, 0);
	}
	mysql_free_result( );
	printf("Rybak   - %d", id);
	return 1;
}

stock UsunRybak(id)
{
	format(zapyt, sizeof(zapyt), "DELETE FROM `jochym_rybak` WHERE `ID` = '%d'", id);
	mysql_check();
	mysql_query2(zapyt);
 	Rybak[id][rX] = 0;
	Rybak[id][rY] = 0;
	Rybak[id][rZ] = 0;
	Rybak[id][rUID] = 0;
	return 1;
}

new Bar:TabelaRyb[MAX_PLAYERS];

new graczlowiFish[MAX_PLAYERS];

new TypRyby[8][124] =
{
	{"Bolen"},
	{"Amur"},
	{"Szczupak"},
	{"Sum"},
	{"Karas"},
	{"Karp"},
	{"Szprotka"},
	{"Ploc"}
};
