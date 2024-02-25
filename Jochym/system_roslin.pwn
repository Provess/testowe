/*
#define P_NASIONA			115
#define P_ROSLINA			116
#define P_KONEWKA			117
*/

enum nNasiona {
	nID,
	Float:nX,
	Float:nY,
	Float:nZ,
	nUID,
	nTyp,
	nCzas,
	nObiekt,
	nStan,
	Text3D:nOpis,
	nVW
};

new Nasiona[MAX_NASION][nNasiona];

stock ZasadzNasiono(playerid, Float:X, Float:Y, Float:Z, Typ, Czas, Model, Stan)
{
	new itemid = GetFreeSQLUID("jochym_nasiona", "ID");
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_nasiona` (`ID`, `X`, `Y`, `Z`, `UID`, `Typ`, `Czas`, `Obiekt`, `Stan`, `VW`) VALUES ('%d','%f','%f','%f','%d','%d','%d', '%d', '%d', '%d')",
	itemid, X, Y, Z, DaneGracza[playerid][gUID], Typ, Czas, Model, Stan, GetPlayerVirtualWorld(playerid));
	mysql_check();
	mysql_query2(zapyt);
	Nasiona[itemid][nID] = itemid;
	Nasiona[itemid][nX] = X;
	Nasiona[itemid][nY] = Y;
	Nasiona[itemid][nZ] = Z;
	Nasiona[itemid][nUID] = DaneGracza[playerid][gUID];
	Nasiona[itemid][nTyp] = Typ;
	Nasiona[itemid][nCzas] = Czas;
	Nasiona[itemid][nObiekt] = Model;
	Nasiona[itemid][nStan] = Stan;
	Nasiona[itemid][nVW] = GetPlayerVirtualWorld(playerid);
	mysql_free_result();
	Nasiona[itemid][nID] = CreateDynamicObject(Nasiona[itemid][nObiekt], Nasiona[itemid][nX], Nasiona[itemid][nY], Nasiona[itemid][nZ]-0.36, 0, 0, 0, Nasiona[itemid][nVW], 0);
	new rok, miesiac, dzien, godzina, minuta, sekunda;
	sekundytodata(Nasiona[itemid][nCzas], rok, miesiac, dzien, godzina, minuta, sekunda);
	new string[256];
	format(string, sizeof(string), "Roslina (%d)\n\n%d% Nawodnienia.\nZebrac mozna dopiero:\n%02d-%02d-%d, %02d:%02d\n\nBy wejsc w interakcje musisz kliknac klawisz 'Y'", itemid, Nasiona[itemid][nStan], dzien, miesiac, rok, godzina, minuta);
	Nasiona[itemid][nOpis] = CreateDynamic3DTextLabel(string, 0xb2b2b2EE, Nasiona[itemid][nX], Nasiona[itemid][nY], Nasiona[itemid][nZ]+0.4, 3.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,Nasiona[itemid][nVW]);
	return itemid;
}

stock PrzeladujNasiona()
{
	new id = false;
	mysql_query( "SELECT * FROM `jochym_nasiona`" );
	mysql_store_result( );
	while(mysql_fetch_row(zapyt))
	{
	    sscanf(zapyt, "p<|>i", id );
	    sscanf(zapyt, "p<|>dfffdddddd",
	    Nasiona[id][nID],
		Nasiona[id][nX],
		Nasiona[id][nY],
		Nasiona[id][nZ],
		Nasiona[id][nUID],
		Nasiona[id][nTyp],
		Nasiona[id][nCzas],
		Nasiona[id][nObiekt],
		Nasiona[id][nStan],
		Nasiona[id][nVW]);
	}
	mysql_free_result( );
	printf("Przeladowano nasiona   - %d", id);
	return 1;
}

stock ZaladujNasiona()
{
	new id = false;
	mysql_query( "SELECT * FROM `jochym_nasiona`" );
	mysql_store_result( );
	while(mysql_fetch_row(zapyt))
	{
	    sscanf(zapyt, "p<|>i", id );
	    sscanf(zapyt, "p<|>dfffdddddd",
	    Nasiona[id][nID],
		Nasiona[id][nX],
		Nasiona[id][nY],
		Nasiona[id][nZ],
		Nasiona[id][nUID],
		Nasiona[id][nTyp],
		Nasiona[id][nCzas],
		Nasiona[id][nObiekt],
		Nasiona[id][nStan],
		Nasiona[id][nVW]);
	    Nasiona[id][nID] = CreateDynamicObject(Nasiona[id][nObiekt], Nasiona[id][nX], Nasiona[id][nY], Nasiona[id][nZ]-0.36, 0, 0, 0, Nasiona[id][nVW], 0);
		new rok, miesiac, dzien, godzina, minuta, sekunda;
		sekundytodata(Nasiona[id][nCzas], rok, miesiac, dzien, godzina, minuta, sekunda);
		new string[256];
		format(string, sizeof(string), "Roslina (%d)\n\n%d% Nawodnienia.\nZebrac mozna dopiero:\n%02d-%02d-%d, %02d:%02d\n\nBy wejsc w interakcje musisz kliknac klawisz 'Y'", id, Nasiona[id][nStan], dzien, miesiac, rok, godzina, minuta);
		Nasiona[id][nOpis] = CreateDynamic3DTextLabel(string, 0xb2b2b2EE, Nasiona[id][nX], Nasiona[id][nY], Nasiona[id][nZ]+0.4, 3.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,Nasiona[id][nVW]);
	}
	mysql_free_result( );
	printf("Nasiona   - %d", id);
	return 1;
}

stock ZapiszNasiono(id)
{
	strdel(zapyt, 0, 512);
	format(zapyt, sizeof(zapyt),
	"UPDATE `jochym_nasiona` SET `X` = '%f', `Y` = '%f', `Z` = '%f', `UID` = '%d', `Typ` = '%d', `Czas` = '%d', `Obiekt` = '%d', `Stan` = '%d', `VW` = '%d' WHERE `ID`= '%d'",
	Nasiona[id][nX],
	Nasiona[id][nY],
	Nasiona[id][nZ],
	Nasiona[id][nUID],
	Nasiona[id][nTyp],
	Nasiona[id][nCzas],
	Nasiona[id][nObiekt],
	Nasiona[id][nStan],
	Nasiona[id][nVW],
	Nasiona[id][nID]);
	mysql_query(zapyt);
	new rok, miesiac, dzien, godzina, minuta, sekunda;
	sekundytodata(Nasiona[id][nCzas], rok, miesiac, dzien, godzina, minuta, sekunda);
	new string[256];
	format(string, sizeof(string), "Roslina (%d)\n\n%d% Nawodnienia.\nZebrac mozna dopiero:\n%02d-%02d-%d, %02d:%02d\n\nBy wejsc w interakcje musisz kliknac klawisz 'Y'", id, Nasiona[id][nStan], dzien, miesiac, rok, godzina, minuta);
	UpdateDynamic3DTextLabelText(Nasiona[id][nOpis], 0xb2b2b2EE, string);
	return 1;
}

stock UsunNasiono(id)
{
	format(zapyt, sizeof(zapyt), "DELETE FROM `jochym_nasiona` WHERE `ID` = '%d'", id);
	mysql_check();
	mysql_query2(zapyt);
 	Nasiona[id][nX] = 0;
	Nasiona[id][nY] = 0;
	Nasiona[id][nZ] = 0;
	Nasiona[id][nUID] = 0;
	Nasiona[id][nTyp] = 0;
	Nasiona[id][nCzas] = 0;
	Nasiona[id][nObiekt] = 0;
	Nasiona[id][nStan] = 0;
	Nasiona[id][nVW] = 0;
	DestroyDynamicObject(Nasiona[id][nID]);
	DestroyDynamic3DTextLabel(Text3D:Nasiona[id][nOpis]);
	return 1;
}

stock GraczObokNasion(playerid)
{
	SetPVarInt(playerid, "Nasiona", 0);
	ForeachEx(id, MAX_NASION)
	{
		if(Nasiona[id][nID] == id)
		{
			if(IsPlayerInRangeOfPoint(playerid, 3, Nasiona[id][nX], Nasiona[id][nY], Nasiona[id][nZ]))
			{
				if(id != 0)
				{
					SetPVarInt(playerid, "Nasiona", id);
					return true;
				}
			}
		}
	}
	return 1;
}

/*stock OdswiezNasiona()
{	
	ForeachEx(id, MAX_NASION)
	{
		if(Nasiona[id][nID] == id)
		{
			if(Nasiona[id][nStan] >= 10)
			{
				Nasiona[id][nStan] -= 2;
				ZapiszNasiono(id);
			}
			else
			{
				UsunNasiono(id);
			}
		}
	}
}*/

enum fForex {
	fID,
	fUID,
	fGUID,
	fWaluta,
	fIlosc,
	fWymieniono,
	Float:fKurs,
	fCzas
};

new Forex[MAX_FOREX][fForex];

stock ZaladujForex()
{
	new id = false;
	mysql_query( "SELECT * FROM `jochym_forex`" );
	mysql_store_result( );
	while(mysql_fetch_row(zapyt))
	{
	    sscanf(zapyt, "p<|>i", id );
	    sscanf(zapyt, "p<|>ddddddfd",
	    Forex[id][fID],
		Forex[id][fUID],
		Forex[id][fGUID],
		Forex[id][fWaluta],
		Forex[id][fIlosc],
		Forex[id][fWymieniono],
		Forex[id][fKurs],
		Forex[id][fCzas]);
	}
	mysql_free_result( );
	printf("Forex   - %d", id);
	return 1;
}

stock DodajForex(playerid, waluta, ilosc, Float:kurs)
{
	new itemid = GetFreeSQLUID("jochym_forex", "ID");
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_forex` (`ID`, `UID`, `GUID`, `WALUTA`, `ILOSC`, `WYMIENIONO`, `KURS`, `CZAS`) VALUES ('%d','%d','%d','%d','%d','%d','%f', '%d')",
	itemid, DaneGracza[playerid][gUID], DaneGracza[playerid][gGUID], waluta, ilosc, 0, kurs, gettime()+CZAS_LETNI);
	mysql_check();
	mysql_query2(zapyt);
	Forex[itemid][fID] = itemid;
	Forex[itemid][fUID] = DaneGracza[playerid][gUID];
	Forex[itemid][fGUID] = DaneGracza[playerid][gGUID];
	Forex[itemid][fWaluta] = waluta;
	Forex[itemid][fIlosc] = ilosc;
	Forex[itemid][fWymieniono] = 0;
	Forex[itemid][fKurs] = kurs;
	Forex[itemid][fCzas] = gettime()+CZAS_LETNI;
	mysql_free_result();
	return itemid;
}

stock ZapiszForex(id)
{
	strdel(zapyt, 0, 512);
	format(zapyt, sizeof(zapyt),
	"UPDATE `jochym_forex` SET `UID` = '%d', `GUID` = '%d', `WALUTA` = '%d', `ILOSC` = '%d', `WYMIENIONO` = '%d', `KURS` = '%f', `CZAS` = '%d' WHERE `ID`= '%d'",
	Forex[id][fUID],
	Forex[id][fGUID],
	Forex[id][fWaluta],
	Forex[id][fIlosc],
	Forex[id][fWymieniono],
	Forex[id][fKurs],
	Forex[id][fCzas],
	Forex[id][fID]);
	return 1;
}
