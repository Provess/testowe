enum intKopia {
	intID,
	intModel,
	Float:intX,
	Float:intY,
	Float:intZ,
	Float:intRX,
	Float:intRY,
	Float:intRZ,
	intINT,
	intVW,
	intUID,
	intDrzwi,
	intWersja,
	intTekstura
};

new KopiaInterioru[MAX_KOPIA][intKopia];

enum txtKopia {
	txtUID,
	txtWersja,
	txtUIDG,
	txtModel,
	txtTyp,
	txtIndex,
	txtNazwa[124],
	txtRozmiar,
	txtCzcionka[124],
	txtSize,
	txtBolt,
	txtKol1[124],
	txtKol2[124],
	txtWysrodkowanie,
	txtNewModel
};

new KopiaTextury[MAX_KOPIA_TXT][txtKopia];

stock ZaladujKopieInterioru()
{
	new id = false;
	mysql_query( "SELECT * FROM `jochym_kopia`" );
	mysql_store_result( );
	while(mysql_fetch_row(zapyt))
	{
	    sscanf(zapyt, "p<|>i", id );
	    sscanf(zapyt, "p<|>ddffffffdddddd",
	    KopiaInterioru[id][intID],
		KopiaInterioru[id][intModel],
		KopiaInterioru[id][intX],
		KopiaInterioru[id][intY],
		KopiaInterioru[id][intZ],
		KopiaInterioru[id][intRX],
		KopiaInterioru[id][intRY],
		KopiaInterioru[id][intRZ],
		KopiaInterioru[id][intINT],
		KopiaInterioru[id][intVW],
		KopiaInterioru[id][intUID],
		KopiaInterioru[id][intDrzwi],
		KopiaInterioru[id][intWersja],
		KopiaInterioru[id][intTekstura]);
	}
	mysql_free_result( );
	printf("Kopia obiektow - %d", id);
	return 1;
}

stock ZaladujKopieTekstur()
{
	new id = false;
	mysql_query( "SELECT * FROM `jochym_kopiatxt`" );
	mysql_store_result( );
	while(mysql_fetch_row(zapyt))
	{
	    sscanf(zapyt, "p<|>i", id );
	    sscanf(zapyt, "p<|>dddddds[124]ds[124]dds[124]s[124]dd",
	    KopiaTextury[id][txtUID],
		KopiaTextury[id][txtWersja],
		KopiaTextury[id][txtUIDG],
		KopiaTextury[id][txtModel],
		KopiaTextury[id][txtTyp],
		KopiaTextury[id][txtIndex],
		KopiaTextury[id][txtNazwa],
		KopiaTextury[id][txtRozmiar],
		KopiaTextury[id][txtCzcionka],
		KopiaTextury[id][txtSize],
		KopiaTextury[id][txtBolt],
		KopiaTextury[id][txtKol1],
		KopiaTextury[id][txtKol2],
		KopiaTextury[id][txtWysrodkowanie],
		KopiaTextury[id][txtNewModel]);
	}
	mysql_free_result( );
	printf("Kopia tekstur - %d", id);
	return 1;
}

stock KopiujInteror(uid, playerid)
{
	new StworzonaKopiaInterioru = 0, StworzonaKopiaTekstur = 0;
	new Wersja = GetFreeSQLUID("jochym_przedmioty", "ID");
	ForeachEx(i, MAX_OBIEKT)
	{
		if(ObiektInfo[i][objUID] == i && ObiektInfo[i][objvWorld] == GetPlayerVirtualWorld(playerid) && ObiektInfo[i][objModel] != 0)
		{
			new Float:x = BudynekInfo[uid][nXW];
			new Float:y = BudynekInfo[uid][nYW];
			new Float:z = BudynekInfo[uid][nZW];
			new itemid = GetFreeSQLUID("jochym_kopia", "ID");
			format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_kopia` (`ID`, `Model`, `X`, `Y`, `Z`, `RX`, `RY`, `RZ`, `INT`, `VW`, `UID`, `Drzwi`, `Wersja`, `Tekstura`) VALUES ('%d','%d','%f','%f','%f','%f','%f', '%f', '%d', '%d', '%d', '%d', '%d', '%d')",
			itemid, ObiektInfo[i][objModel], ObiektInfo[i][objPozX]-x, ObiektInfo[i][objPozY]-y, ObiektInfo[i][objPozZ]-z, ObiektInfo[i][objRotX], ObiektInfo[i][objRotY], ObiektInfo[i][objRotZ], ObiektInfo[i][objInterior], ObiektInfo[i][objvWorld], DaneGracza[playerid][gUID], GetPlayerVirtualWorld(playerid), Wersja, ObiektInfo[i][objTekstura]);
			mysql_check();
			mysql_query2(zapyt);
			KopiaInterioru[itemid][intID] = itemid;
			KopiaInterioru[itemid][intModel] = ObiektInfo[i][objModel];
			KopiaInterioru[itemid][intX] = ObiektInfo[i][objPozX] - x;
			KopiaInterioru[itemid][intY] = ObiektInfo[i][objPozY] - y;
			KopiaInterioru[itemid][intZ] = ObiektInfo[i][objPozZ] - z;
			KopiaInterioru[itemid][intRX] = ObiektInfo[i][objRotX];
			KopiaInterioru[itemid][intRY] = ObiektInfo[i][objRotY];
			KopiaInterioru[itemid][intRZ] = ObiektInfo[i][objRotZ];
			KopiaInterioru[itemid][intINT] = ObiektInfo[i][objInterior];
			KopiaInterioru[itemid][intVW] = ObiektInfo[i][objvWorld];
			KopiaInterioru[itemid][intUID] = DaneGracza[playerid][gUID];
			KopiaInterioru[itemid][intDrzwi] = GetPlayerVirtualWorld(playerid);
			KopiaInterioru[itemid][intWersja] = Wersja;
			KopiaInterioru[itemid][intTekstura] = ObiektInfo[i][objTekstura];
			mysql_free_result();
			StworzonaKopiaInterioru++;
			ForeachEx(t, MAX_TEXTUR)
			{
				if(ObiektInfo[i][objTekstura] == TextruaInfo[t][objModel] && ObiektInfo[i][objUID] == i && TextruaInfo[t][objUID] == t)
				{
					new txtid = GetFreeSQLUID("jochym_kopiatxt", "ID");
					format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_kopiatxt` (`ID`, `Wersja`, `UID`, `Model`, `Typ`, `Index`, `Nazwa`, `Rozmiar`, `Czcionka`, `Size`, `Bolt`, `Kol1`, `Kol2`, `Wysrodkowanie`, `NewModel`) VALUES ('%d','%d','%d','%d','%d','%d','%s', '%d', '%s', '%d', '%d', '%s', '%s', '%d', '%d')",
					txtid, Wersja, DaneGracza[playerid][gUID], TextruaInfo[t][objModel], TextruaInfo[t][objTyp], TextruaInfo[t][objIndex], TextruaInfo[t][objNazwa], TextruaInfo[t][objRozmiar], TextruaInfo[t][objCzcionka], TextruaInfo[t][objSize], TextruaInfo[t][objBolt], TextruaInfo[t][objKol1], TextruaInfo[t][objKol2], TextruaInfo[t][objWysrotkowanie], 0);
					mysql_check();
					mysql_query2(zapyt);
					KopiaTextury[txtid][txtUID] = txtid;
					KopiaTextury[txtid][txtWersja] = Wersja;
					KopiaTextury[txtid][txtUIDG] = DaneGracza[playerid][gUID];
					KopiaTextury[txtid][txtModel] = TextruaInfo[t][objModel];
					KopiaTextury[txtid][txtTyp] = TextruaInfo[t][objTyp];
					KopiaTextury[txtid][txtIndex] = TextruaInfo[t][objIndex];
					KopiaTextury[txtid][txtNazwa] = TextruaInfo[t][objNazwa];
					KopiaTextury[txtid][txtRozmiar] = TextruaInfo[t][objRozmiar];
					KopiaTextury[txtid][txtCzcionka] = TextruaInfo[t][objCzcionka];
					KopiaTextury[txtid][txtSize] = TextruaInfo[t][objSize];
					KopiaTextury[txtid][txtBolt] = TextruaInfo[t][objBolt];
					KopiaTextury[txtid][txtKol1] = TextruaInfo[t][objKol1];
					KopiaTextury[txtid][txtKol2] = TextruaInfo[t][objKol2];
					KopiaTextury[txtid][txtWysrodkowanie] = TextruaInfo[t][objWysrotkowanie];
					mysql_free_result();
					StworzonaKopiaTekstur++;
				}
			}
		}
	}
	printf("Stworzona Kopia Interioru: %d", StworzonaKopiaInterioru);
	printf("Stworzona Kopia Tekstur: %d", StworzonaKopiaTekstur);
	if(StworzonaKopiaInterioru != 0)
	{
		new nazwa[64];
		format(nazwa, sizeof(nazwa), "Projekt wnetrza (UID: %d)", uid);
		DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_KOPIAWNETRZ, Wersja, uid, nazwa, DaneGracza[playerid][gUID], StworzonaKopiaInterioru, -1, 0, 0, 0, 0, "");
	}
	return 1;
}

stock DodajInterior(playerid, wersja, uid)
{
	new Float:x = BudynekInfo[uid][nXW];
	new Float:y = BudynekInfo[uid][nYW];
	new Float:z = BudynekInfo[uid][nZW];
	ForeachEx(i, MAX_KOPIA)
	{
		new itemid = GetFreeSQLUID("jochym_obiekty", "ID");
		if(KopiaInterioru[i][intWersja] == wersja && KopiaInterioru[i][intID] == i)
		{
			format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_obiekty` (`ID`,`model`, `vw`, `interior`, `pozX`, `pozY`, `pozZ`, `rotX`, `rotY`, `rotZ`, `CZAS`, `HP`, `Stworzyl`, `objTekstura`, `Kopia`) VALUES ('%d','%d','%d','%d','%f','%f','%f', '%f', '%f', '%f', '%d', '%d', '%d', '%d', '%d')",
			itemid, KopiaInterioru[i][intModel], BudynekInfo[uid][nVWW], BudynekInfo[uid][nINTW], KopiaInterioru[i][intX]+x, KopiaInterioru[i][intY]+y, KopiaInterioru[i][intZ]+z, KopiaInterioru[i][intRX], KopiaInterioru[i][intRY], KopiaInterioru[i][intRZ], gettime()+CZAS_LETNI, 100, DaneGracza[playerid][gUID], -1, KopiaInterioru[i][intTekstura]);
			mysql_check();
			mysql_query2(zapyt);
			ObiektInfo[itemid][objUID] = itemid;
			ObiektInfo[itemid][objModel] = KopiaInterioru[i][intModel];
			ObiektInfo[itemid][objvWorld] = BudynekInfo[uid][nVWW];
			ObiektInfo[itemid][objInterior] = BudynekInfo[uid][nINTW];
			ObiektInfo[itemid][objPozX] = KopiaInterioru[i][intX]+x;
			ObiektInfo[itemid][objPozY] = KopiaInterioru[i][intY]+y;
			ObiektInfo[itemid][objPozZ] = KopiaInterioru[i][intZ]+z;
			ObiektInfo[itemid][objPosX] = 0;
			ObiektInfo[itemid][objPosY] = 0;
			ObiektInfo[itemid][objPosZ] = 0;
			ObiektInfo[itemid][objBrama] = 0;
			ObiektInfo[itemid][objSprarowanyUID] = 0;
			ObiektInfo[itemid][objOwnerBrama] = 0;
			ObiektInfo[itemid][objTypOwneraBramy] = 0;
			ObiektInfo[itemid][objTekstura] = -1;
			ObiektInfo[itemid][objWlacznik] = 0;
			ObiektInfo[itemid][objWartosc] = 0;
			ObiektInfo[itemid][objRotX] = KopiaInterioru[i][intRX];
			ObiektInfo[itemid][objRotY] = KopiaInterioru[i][intRY];
			ObiektInfo[itemid][objRotZ] = KopiaInterioru[i][intRZ];
			ObiektInfo[itemid][objHP] = 100;
			ObiektInfo[itemid][objStworzyl] = DaneGracza[playerid][gUID];
			ObiektInfo[itemid][objKopia] = KopiaInterioru[i][intTekstura];
			ObiektInfo[itemid][gPokerKarty][0] = EOS;
			ObiektInfo[itemid][gPokerObj] = EOS;
			ObiektInfo[itemid][objPokerDiler] = 0;
			ObiektInfo[itemid][gRundaPoker] = 0;
			mysql_free_result();
		}
	}
}

stock PrzeladujInteriorPodTekstury(playerid, wersja, uid)
{
	new IloscObiektowDoZmianyTekstury = 0;
	for(new t = 0; t < 2048; t++)
	{
		ForeachEx(i, MAX_OBIEKT)
		{	
			if(ObiektInfo[i][objUID] == i && KopiaTextury[t][txtUID] == t && ObiektInfo[i][objKopia] != 0 && ObiektInfo[i][objKopia] == KopiaTextury[t][txtModel] && KopiaTextury[t][txtWersja] == wersja)
			{
				if(KopiaTextury[t][txtTyp] == 0)
				{
					new id = GetFreeSQLUID("jochym_textury", "ID");
					format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_textury` (`ID` ,`model` ,`typ` ,`index` ,`rozmiar`,`czcionka`,`size`,`bolt`,`kol1`,`kol2`,`wysrodkowanie`,`nazwa`) VALUES ('%d', '%d', '%d', '%d', '%d', '%s', '%d', '%d', '%s', '%s', '%d', '%s')",
					id, ObiektInfo[i][objUID], KopiaTextury[t][txtTyp], KopiaTextury[t][txtIndex], KopiaTextury[t][txtRozmiar], KopiaTextury[t][txtCzcionka], 0, 0, KopiaTextury[t][txtKol1], " ", 0, KopiaTextury[t][txtNazwa]);
					mysql_check();
					mysql_query(zapyt);
					ZaladujTexturyx2();
					ObiektInfo[i][objKopia] = 0;
					ObiektInfo[i][objTekstura] = i;
					ZapiszObiekt(i);
				}
				else
				{
					new id = GetFreeSQLUID("jochym_textury", "ID");
					format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_textury` (`ID` ,`model` ,`typ` ,`index` ,`rozmiar`,`czcionka`,`size`,`bolt`,`kol1`,`kol2`,`wysrodkowanie`,`nazwa`) VALUES ('%d', '%d', '%d', '%d', '%d', '%s', '%d', '%d', '%s', '%s', '%d', '%s')",
					id, ObiektInfo[i][objUID], KopiaTextury[t][txtTyp], KopiaTextury[t][txtIndex], KopiaTextury[t][txtRozmiar], KopiaTextury[t][txtCzcionka], KopiaTextury[t][txtSize], KopiaTextury[t][txtBolt], KopiaTextury[t][txtKol1], KopiaTextury[t][txtKol2], KopiaTextury[t][txtWysrodkowanie], KopiaTextury[t][txtNazwa]);
					mysql_check();
					mysql_query(zapyt);
					ZaladujTexturyx2();
					ObiektInfo[i][objKopia] = 0;
					ObiektInfo[i][objTekstura] = i;
					ZapiszObiekt(i);
				}
				IloscObiektowDoZmianyTekstury++;	
			}
		}
	}
	UnloadObject(uid);
	LoadObject(uid);
	dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Projekt wnêtrza:", "Projekt wnêtrza zosta³ poprawnie za³adowany w Twoim budynku!", "Zamknij", "");
	return 1;
}