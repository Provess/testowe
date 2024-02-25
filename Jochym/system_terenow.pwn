forward DodajTeren(Float: x, Float: y);
public DodajTeren(Float: x, Float: y)
{
    //new kolor = 0xFFFFFFAA;
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_tereny` (`X`, `XX`, `Y`, `YY`, `Kolor`) VALUES ('%f', '%f', '%f', '%f', '%s', '%d', '%d')",
	x, x, y, y, "0xFFFFFF77", 0, 0);
	mysql_check();
	mysql_query2(zapyt);
	new uid = mysql_insert_id();
	Lokacja[uid][gUID] = uid;
	Lokacja[uid][gX] = x;
	Lokacja[uid][gXX] = x;
	Lokacja[uid][gY] = y;
	Lokacja[uid][gYY] = y;
	Lokacja[uid][gObiekty] = 0;
	Lokacja[uid][gCena] = 0;
	Lokacja[uid][gWojna] = 0;
	Lokacja[uid][gLimit] = 0;
	Lokacja[uid][gMetr] = 0;
	Lokacja[uid][gBudowanie] = 0;
	Lokacja[uid][gID] = GangZoneCreate(Lokacja[uid][gX], Lokacja[uid][gY], Lokacja[uid][gXX], Lokacja[uid][gYY]);
	GangZoneShowForAll(Lokacja[uid][gID], 0xFFFFFF77);
	mysql_free_result();
    return uid;
}
forward ZapiszTeren(uid);
public ZapiszTeren(uid)
{
	strdel(zapyt, 0, 1024);
	format(zapyt, sizeof(zapyt), "UPDATE `jochym_tereny` SET `X`='%f', `XX`='%f', `Y`='%f', `YY`='%f', `OWNER`='%d', `OWNERP`='%d', `Kolor`='%s', `Obiekty`='%d', `Cena`='%d', `Wojna`='%d', `Limit`='%d', `Metr`='%d', `Budowanie`='%d' WHERE `UID`='%d'",
	Lokacja[uid][gX],
	Lokacja[uid][gXX],
	Lokacja[uid][gY],
	Lokacja[uid][gYY],
	Lokacja[uid][gOwner],
	Lokacja[uid][gOwnerP],
	Lokacja[uid][gKolor],
	Lokacja[uid][gObiekty],
	Lokacja[uid][gCena],
	Lokacja[uid][gWojna],
	Lokacja[uid][gLimit],
	Lokacja[uid][gMetr],
	Lokacja[uid][gBudowanie],
	uid);
	mysql_query(zapyt);
	printf("ZapiszTeren");
	return 1;
}
forward ZaladujTereny();
public ZaladujTereny()
{
	//czaswykonania = gettime();
	new id = false;
	mysql_query( "SELECT * FROM `jochym_tereny`" );
	mysql_store_result( );
	while(mysql_fetch_row(zapyt))
	{
	    sscanf(zapyt, "p<|>i", id );
	    sscanf(zapyt, "p<|>dffffdds[10]dddddd",
	    Lokacja[id][gUID],
	    Lokacja[id][gX],
        Lokacja[id][gXX],
		Lokacja[id][gY],
	    Lokacja[id][gYY],
		Lokacja[id][gOwner],
		Lokacja[id][gOwnerP],
		Lokacja[id][gKolor],
		Lokacja[id][gObiekty],
		Lokacja[id][gCena],
		Lokacja[id][gWojna],
		Lokacja[id][gLimit],
		Lokacja[id][gMetr],
		Lokacja[id][gBudowanie]);
		Lokacja[id][gID] = GangZoneCreate(Lokacja[id][gX], Lokacja[id][gY], Lokacja[id][gXX], Lokacja[id][gYY]);
	}
	printf("Strefy - %d", id);
	return 1;
}
