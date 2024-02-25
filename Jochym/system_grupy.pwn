AntiDeAMX();
enum invPracownik
{
	invID,
	invUID,
	invDzialalnosc,
	invUIDRangi,
	invSluzba,
	invSkin,
	invRanga[100],
	invKlientow,
	invWyplata,
	invPremia,
	inv1,
	inv2,
	inv3,
	inv4,
	inv5,
	inv6,
	inv7,
	inv8,
	inv9,
	inv10,
	inv11,
	inv12,
	inv13,
	inv14,
	inv15,
	inv16,
	inv17,
	inv18,
	inv19,
	inv20,
	inv21,
	inv22,
	inv23,
	inv24,
	inv25,
	inv26,
	inv27,
	inv28,
	inv29,
	inv30,
	inv31,
	inv32,
	inv33,
	inv34,
	inv35,
	inv36,
	inv37,
	inv38,
	inv39,
	inv40,
	inv41,
	inv42,
	inv43,
	inv44,
	inv45,
	inv46,
	inv47,
	inv48,
	inv49,
	inv50,
	inv51,
	inv52,
	inv53,
	inv54,
	inv55
}
new Pracownik[MAX_PRACOWNIK][invPracownik];

forward ZaladujMembers();
public ZaladujMembers()
{
	//czaswykonania = gettime();
	new zatrudnien = 0;
	new id = false;
	mysql_query( "SELECT * FROM `jochym_pracownicy`" );
	mysql_store_result( );
	while(mysql_fetch_row(zapyt))
	{
	    sscanf(zapyt, "p<|>i", id );
	    sscanf(zapyt, "p<|>dddddds[100]dddddddddddddddddddddddddddddddddddddddddddddddddddddddddd",
	    Pracownik[id][invID],
		Pracownik[id][invUID],
		Pracownik[id][invDzialalnosc],
		Pracownik[id][invUIDRangi],
		Pracownik[id][invSluzba],
		Pracownik[id][invSkin],
		Pracownik[id][invRanga],
		Pracownik[id][invKlientow],
		Pracownik[id][invWyplata],
		Pracownik[id][invPremia],
		Pracownik[id][inv1],
		Pracownik[id][inv2],
		Pracownik[id][inv3],
		Pracownik[id][inv4],
		Pracownik[id][inv5],
		Pracownik[id][inv6],
		Pracownik[id][inv7],
		Pracownik[id][inv8],
		Pracownik[id][inv9],
		Pracownik[id][inv10],
		Pracownik[id][inv11],
		Pracownik[id][inv12],
		Pracownik[id][inv13],
		Pracownik[id][inv14],
		Pracownik[id][inv15],
		Pracownik[id][inv16],
		Pracownik[id][inv17],
		Pracownik[id][inv18],
		Pracownik[id][inv19],
		Pracownik[id][inv20],
		Pracownik[id][inv21],
		Pracownik[id][inv22],
		Pracownik[id][inv23],
		Pracownik[id][inv24],
		Pracownik[id][inv25],
		Pracownik[id][inv26],
		Pracownik[id][inv27],
		Pracownik[id][inv28],
		Pracownik[id][inv29],
		Pracownik[id][inv30],
		Pracownik[id][inv31],
		Pracownik[id][inv32],
		Pracownik[id][inv33],
		Pracownik[id][inv34],
		Pracownik[id][inv35],
		Pracownik[id][inv36],
		Pracownik[id][inv37],
		Pracownik[id][inv38],
		Pracownik[id][inv39],
		Pracownik[id][inv40],
		Pracownik[id][inv41],
		Pracownik[id][inv42],
		Pracownik[id][inv43],
		Pracownik[id][inv44],
		Pracownik[id][inv45],
		Pracownik[id][inv46],
		Pracownik[id][inv47],
		Pracownik[id][inv48],
		Pracownik[id][inv49],
		Pracownik[id][inv50],
		Pracownik[id][inv51],
		Pracownik[id][inv52],
		Pracownik[id][inv53],
		Pracownik[id][inv54],
		Pracownik[id][inv55]);
		printf("Zaladowano zatrudnienie - %d", id);
		zatrudnien++;
	}
	mysql_free_result( );
	printf("Zatrudnien   - %d", zatrudnien);
	return 1;
}
enum ginfo
{
	gUID,
	gNazwa[50],
	gTyp,
	gOwner,
	gKolorCzatu[50],
	gKolorNicku[50],
	gKolorTerenu[50],
	gSaldo,
	gOwnerUID,
	gTeren,
	gOrg,
	gWojna
};
new GrupaInfo[MAX_GROUP][ginfo];
CMD:d(playerid, cmdtext[])
{
	//printf("U¿yta komenda d");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	if(DaneGracza[playerid][gSluzba] == 0)
	{
	    GameTextForPlayer(playerid, "~r~Nie jestes na sluzbie dzialalnosci.", 3000, 5);
		return 0;
	}
	if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_RZADOWA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_MEDYCZNA)
	{
		strdel(tekst_globals, 0, 2048);
		if(sscanf(cmdtext, "s[256]", tekst_globals))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Aby pisaæ na czacie departamentowym wpisz: /d [treœæ]", "Zamknij", "");
			return 1;
		}
		tekst_globals[0] = toupper(tekst_globals[0]);
		new trws[256];
		new id = DaneGracza[playerid][gSluzba];
		format(trws, sizeof(trws), "{CC0033}** (%s) %s (radio): %s **", GrupaInfo[id][gNazwa], ZmianaNicku(playerid), tekst_globals);
		ForeachEx(i, MAX_PLAYERS)
		{
			if(IsPlayerConnected(i))
			{
				if(zalogowany[i] == true)
				{
					if(GrupaInfo[DaneGracza[i][gDzialalnosc1]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[i][gDzialalnosc1]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[i][gDzialalnosc1]][gTyp] == DZIALALNOSC_RZADOWA ||
					GrupaInfo[DaneGracza[i][gDzialalnosc2]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[i][gDzialalnosc2]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[i][gDzialalnosc2]][gTyp] == DZIALALNOSC_RZADOWA ||
					GrupaInfo[DaneGracza[i][gDzialalnosc3]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[i][gDzialalnosc3]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[i][gDzialalnosc3]][gTyp] == DZIALALNOSC_RZADOWA ||
					GrupaInfo[DaneGracza[i][gDzialalnosc4]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[i][gDzialalnosc4]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[i][gDzialalnosc4]][gTyp] == DZIALALNOSC_RZADOWA ||
					GrupaInfo[DaneGracza[i][gDzialalnosc5]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[i][gDzialalnosc5]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[i][gDzialalnosc5]][gTyp] == DZIALALNOSC_RZADOWA ||
					GrupaInfo[DaneGracza[i][gDzialalnosc6]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[i][gDzialalnosc6]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[i][gDzialalnosc6]][gTyp] == DZIALALNOSC_RZADOWA)
					{
						DGCZAT(i, "CC0033", 0xCC0033FF, trws);
					}
				}
			}
		}
		new str[256];
		format(str, sizeof(str), "%s (s³uchawka): %s", ZmianaNicku(playerid), tekst_globals);
		Sluchawka(playerid, str, 10);
	}
	return 1;
}
stock PokazMembers(playerid, grupa)
{
	ZaladujMembers();
	SetPVarInt(playerid, "MembersGrupa", grupa);
	new str[2048], temp = 0;
	format(str, sizeof(str), "{848484}#\tImiê i nazwisko\tUprawnienia\tWyp³ata");
	if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_POLICYJNA)
	{
		TextDrawSetString(tdmembers1[playerid], "A - Zarzadzanie grupa.~n~B - Mozliwosc wejscia na sluzbe.~n~C - Zamawianie przedmiotów.~n~D - Zarzadzanie budynkiem.");
		TextDrawShowForPlayer(playerid, tdmembers1[playerid]);
		TextDrawSetString(tdmembers2[playerid], "E - Zarzadzanie szafa w budynku.~n~F - Zarzadzanie bramami.~n~G - Mozliwosc uzywania kanalu OOC.~n~H - Mozliwosc uzywania radia/czat IC.");
		TextDrawShowForPlayer(playerid, tdmembers2[playerid]);
		TextDrawSetString(tdmembers3[playerid], "I - Uzywanie mikrofonu.~n~J - Podawanie produktow.~n~K - Mozliwosc zapraszania do grupy.~n~L - Zarzadzanie pojazdami.");
		TextDrawShowForPlayer(playerid, tdmembers3[playerid]);
		TextDrawSetString(tdmembers4[playerid], "M - Otwieranie i zamykanie budynkow~n~N - Zarzadzanie blokadami.~n~O - Zarzadzanie przetrzymaniami.~n~P - Zarzadzanie blokadami na kolo.");
		TextDrawShowForPlayer(playerid, tdmembers4[playerid]);
		TextDrawSetString(tdmembers5[playerid], "R - Zarzadzanie kartoteka.~n~S - Zarzadzanie kolczatkami.~n~T - Czat departamentowy.");
		TextDrawShowForPlayer(playerid, tdmembers5[playerid]);
	}
	if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_ZMOTORYZOWANA)
	{
		TextDrawSetString(tdmembers1[playerid], "A - Zarzadzanie grupa.~n~B - Mozliwosc wejscia na sluzbe.~n~C - Zamawianie przedmiotów.~n~D - Zarzadzanie budynkiem.");
		TextDrawShowForPlayer(playerid, tdmembers1[playerid]);
		TextDrawSetString(tdmembers2[playerid], "E - Zarzadzanie szafa w budynku.~n~F - Zarzadzanie bramami.~n~G - Mozliwosc uzywania kanalu OOC.~n~H - Mozliwosc uzywania radia/czat IC.");
		TextDrawShowForPlayer(playerid, tdmembers2[playerid]);
		TextDrawSetString(tdmembers3[playerid], "I - Uzywanie mikrofonu.~n~J - Podawanie produktow.~n~K - Mozliwosc zapraszania do grupy.~n~L - Zarzadzanie pojazdami.");
		TextDrawShowForPlayer(playerid, tdmembers3[playerid]);
		TextDrawSetString(tdmembers4[playerid], "M - Otwieranie i zamykanie budynkow~n~N - Zarzadzanie przetrzymaniami.~n~O - Zarzadzanie wyscigami.~n~P - Dolaczanie do wyœcigu.");
		TextDrawShowForPlayer(playerid, tdmembers4[playerid]);
	}
	if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_WARSZTAT)
	{
		TextDrawSetString(tdmembers1[playerid], "A - Zarzadzanie grupa.~n~B - Mozliwosc wejscia na sluzbe.~n~C - Zamawianie przedmiotów.~n~D - Zarzadzanie budynkiem.");
		TextDrawShowForPlayer(playerid, tdmembers1[playerid]);
		TextDrawSetString(tdmembers2[playerid], "E - Zarzadzanie szafa w budynku.~n~F - Zarzadzanie bramami.~n~G - Mozliwosc uzywania kanalu OOC.~n~H - Mozliwosc uzywania radia/czat IC.");
		TextDrawShowForPlayer(playerid, tdmembers2[playerid]);
		TextDrawSetString(tdmembers3[playerid], "I - Uzywanie mikrofonu.~n~J - Podawanie produktow.~n~K - Mozliwosc zapraszania do grupy.~n~L - Zarzadzanie pojazdami.");
		TextDrawShowForPlayer(playerid, tdmembers3[playerid]);
		TextDrawSetString(tdmembers4[playerid], "M - Otwieranie i zamykanie budynkow~n~N - Montowanie komponentow.");
		TextDrawShowForPlayer(playerid, tdmembers4[playerid]);
	}
	if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_CHURCH)
	{
		TextDrawSetString(tdmembers1[playerid], "A - Zarzadzanie grupa.~n~B - Mozliwosc wejscia na sluzbe.~n~C - Zamawianie przedmiotów.~n~D - Zarzadzanie budynkiem.");
		TextDrawShowForPlayer(playerid, tdmembers1[playerid]);
		TextDrawSetString(tdmembers2[playerid], "E - Zarzadzanie szafa w budynku.~n~F - Zarzadzanie bramami.~n~G - Mozliwosc uzywania kanalu OOC.~n~H - Mozliwosc uzywania radia/czat IC.");
		TextDrawShowForPlayer(playerid, tdmembers2[playerid]);
		TextDrawSetString(tdmembers3[playerid], "I - Uzywanie mikrofonu.~n~J - Podawanie produktow.~n~K - Mozliwosc zapraszania do grupy.~n~L - Zarzadzanie pojazdami.");
		TextDrawShowForPlayer(playerid, tdmembers3[playerid]);
		TextDrawSetString(tdmembers4[playerid], "M - Otwieranie i zamykanie budynkow");
		TextDrawShowForPlayer(playerid, tdmembers4[playerid]);
	}
	if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_ELEKTRTYKA)
	{
		TextDrawSetString(tdmembers1[playerid], "A - Zarzadzanie grupa.~n~B - Mozliwosc wejscia na sluzbe.~n~C - Zamawianie przedmiotów.~n~D - Zarzadzanie budynkiem.");
		TextDrawShowForPlayer(playerid, tdmembers1[playerid]);
		TextDrawSetString(tdmembers2[playerid], "E - Zarzadzanie szafa w budynku.~n~F - Zarzadzanie bramami.~n~G - Mozliwosc uzywania kanalu OOC.~n~H - Mozliwosc uzywania radia/czat IC.");
		TextDrawShowForPlayer(playerid, tdmembers2[playerid]);
		TextDrawSetString(tdmembers3[playerid], "I - Uzywanie mikrofonu.~n~J - Podawanie produktow.~n~K - Mozliwosc zapraszania do grupy.~n~L - Zarzadzanie pojazdami.");
		TextDrawShowForPlayer(playerid, tdmembers3[playerid]);
		TextDrawSetString(tdmembers4[playerid], "M - Otwieranie i zamykanie budynkow~n~N - Montaz elektryki.");
		TextDrawShowForPlayer(playerid, tdmembers4[playerid]);
	}
	if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_SANNEWS)
	{
		TextDrawSetString(tdmembers1[playerid], "A - Zarzadzanie grupa.~n~B - Mozliwosc wejscia na sluzbe.~n~C - Zamawianie przedmiotów.~n~D - Zarzadzanie budynkiem.");
		TextDrawShowForPlayer(playerid, tdmembers1[playerid]);
		TextDrawSetString(tdmembers2[playerid], "E - Zarzadzanie szafa w budynku.~n~F - Zarzadzanie bramami.~n~G - Mozliwosc uzywania kanalu OOC.~n~H - Mozliwosc uzywania radia/czat IC.");
		TextDrawShowForPlayer(playerid, tdmembers2[playerid]);
		TextDrawSetString(tdmembers3[playerid], "I - Uzywanie mikrofonu.~n~J - Podawanie produktow.~n~K - Mozliwosc zapraszania do grupy.~n~L - Zarzadzanie pojazdami.");
		TextDrawShowForPlayer(playerid, tdmembers3[playerid]);
		TextDrawSetString(tdmembers4[playerid], "M - Otwieranie i zamykanie budynkow~n~N - Nadawanie newsów.~n~O - Nadawanie reklam.~n~P - Nadawanie live.");
		TextDrawShowForPlayer(playerid, tdmembers4[playerid]);
	}
	if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_MAFIE)
	{
		TextDrawSetString(tdmembers1[playerid], "A - Zarzadzanie grupa.~n~B - Mozliwosc wejscia na sluzbe.~n~C - Zamawianie przedmiotów.~n~D - Zarzadzanie budynkiem.");
		TextDrawShowForPlayer(playerid, tdmembers1[playerid]);
		TextDrawSetString(tdmembers2[playerid], "E - Zarzadzanie szafa w budynku.~n~F - Zarzadzanie bramami.~n~G - Mozliwosc uzywania kanalu OOC.~n~H - Mozliwosc uzywania radia/czat IC.");
		TextDrawShowForPlayer(playerid, tdmembers2[playerid]);
		TextDrawSetString(tdmembers3[playerid], "I - Uzywanie mikrofonu.~n~J - Podawanie produktow.~n~K - Mozliwosc zapraszania do grupy.~n~L - Zarzadzanie pojazdami.");
		TextDrawShowForPlayer(playerid, tdmembers3[playerid]);
		TextDrawSetString(tdmembers4[playerid], "M - Otwieranie i zamykanie budynkow~n~N - Zarzadzanie przetrzymaniami.");
		TextDrawShowForPlayer(playerid, tdmembers4[playerid]);
	}
	if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_MEDYCZNA)
	{
		TextDrawSetString(tdmembers1[playerid], "A - Zarzadzanie grupa.~n~B - Mozliwosc wejscia na sluzbe.~n~C - Zamawianie przedmiotów.~n~D - Zarzadzanie budynkiem.");
		TextDrawShowForPlayer(playerid, tdmembers1[playerid]);
		TextDrawSetString(tdmembers2[playerid], "E - Zarzadzanie szafa w budynku.~n~F - Zarzadzanie bramami.~n~G - Mozliwosc uzywania kanalu OOC.~n~H - Mozliwosc uzywania radia/czat IC.");
		TextDrawShowForPlayer(playerid, tdmembers2[playerid]);
		TextDrawSetString(tdmembers3[playerid], "I - Uzywanie mikrofonu.~n~J - Podawanie produktow.~n~K - Mozliwosc zapraszania do grupy.~n~L - Zarzadzanie pojazdami.");
		TextDrawShowForPlayer(playerid, tdmembers3[playerid]);
		TextDrawSetString(tdmembers4[playerid], "M - Otwieranie i zamykanie budynkow~n~N - Czat departamentowy.");
		TextDrawShowForPlayer(playerid, tdmembers4[playerid]);
	}
	if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_GANGI)
	{
		TextDrawSetString(tdmembers1[playerid], "A - Zarzadzanie grupa.~n~B - Mozliwosc wejscia na sluzbe.~n~C - Zamawianie przedmiotów.~n~D - Zarzadzanie budynkiem.");
		TextDrawShowForPlayer(playerid, tdmembers1[playerid]);
		TextDrawSetString(tdmembers2[playerid], "E - Zarzadzanie szafa w budynku.~n~F - Zarzadzanie bramami.~n~G - Mozliwosc uzywania kanalu OOC.~n~H - Mozliwosc uzywania radia/czat IC.");
		TextDrawShowForPlayer(playerid, tdmembers2[playerid]);
		TextDrawSetString(tdmembers3[playerid], "I - Uzywanie mikrofonu.~n~J - Podawanie produktow.~n~K - Mozliwosc zapraszania do grupy.~n~L - Zarzadzanie pojazdami.");
		TextDrawShowForPlayer(playerid, tdmembers3[playerid]);
		TextDrawSetString(tdmembers4[playerid], "M - Otwieranie i zamykanie budynkow~n~N - Zarzadzanie przetrzymaniami.");
		TextDrawShowForPlayer(playerid, tdmembers4[playerid]);
	}
	if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_RZADOWA)
	{
		TextDrawSetString(tdmembers1[playerid], "A - Zarzadzanie grupa.~n~B - Mozliwosc wejscia na sluzbe.~n~C - Zamawianie przedmiotów.~n~D - Zarzadzanie budynkiem.");
		TextDrawShowForPlayer(playerid, tdmembers1[playerid]);
		TextDrawSetString(tdmembers2[playerid], "E - Zarzadzanie szafa w budynku.~n~F - Zarzadzanie bramami.~n~G - Mozliwosc uzywania kanalu OOC.~n~H - Mozliwosc uzywania radia/czat IC.");
		TextDrawShowForPlayer(playerid, tdmembers2[playerid]);
		TextDrawSetString(tdmembers3[playerid], "I - Uzywanie mikrofonu.~n~J - Podawanie produktow.~n~K - Mozliwosc zapraszania do grupy.~n~L - Zarzadzanie pojazdami.");
		TextDrawShowForPlayer(playerid, tdmembers3[playerid]);
		TextDrawSetString(tdmembers4[playerid], "M - Otwieranie i zamykanie budynkow~n~N - Wydawanie dokumentow.~n~O - Wydawanie dzialalnosci.~n~P - Czat departamentowy");
		TextDrawShowForPlayer(playerid, tdmembers4[playerid]);
	}
	if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_SYNDYKAT)
	{
		TextDrawSetString(tdmembers1[playerid], "A - Zarzadzanie grupa.~n~B - Mozliwosc wejscia na sluzbe.~n~C - Zamawianie przedmiotów.~n~D - Zarzadzanie budynkiem.");
		TextDrawShowForPlayer(playerid, tdmembers1[playerid]);
		TextDrawSetString(tdmembers2[playerid], "E - Zarzadzanie szafa w budynku.~n~F - Zarzadzanie bramami.~n~G - Mozliwosc uzywania kanalu OOC.~n~H - Mozliwosc uzywania radia/czat IC.");
		TextDrawShowForPlayer(playerid, tdmembers2[playerid]);
		TextDrawSetString(tdmembers3[playerid], "I - Uzywanie mikrofonu.~n~J - Podawanie produktow.~n~K - Mozliwosc zapraszania do grupy.~n~L - Zarzadzanie pojazdami.");
		TextDrawShowForPlayer(playerid, tdmembers3[playerid]);
		TextDrawSetString(tdmembers4[playerid], "M - Otwieranie i zamykanie budynkow~n~N - Zarzadzanie przetrzymaniami.");
		TextDrawShowForPlayer(playerid, tdmembers4[playerid]);
	}
	if(GrupaInfo[grupa][gTyp] != DZIALALNOSC_POLICYJNA && GrupaInfo[grupa][gTyp] != DZIALALNOSC_ZMOTORYZOWANA && GrupaInfo[grupa][gTyp] != DZIALALNOSC_WARSZTAT && GrupaInfo[grupa][gTyp] != DZIALALNOSC_CHURCH && GrupaInfo[grupa][gTyp] != DZIALALNOSC_ELEKTRTYKA && GrupaInfo[grupa][gTyp] != DZIALALNOSC_SANNEWS 
	&& GrupaInfo[grupa][gTyp] != DZIALALNOSC_MAFIE && GrupaInfo[grupa][gTyp] != DZIALALNOSC_MEDYCZNA && GrupaInfo[grupa][gTyp] != DZIALALNOSC_GANGI && GrupaInfo[grupa][gTyp] != DZIALALNOSC_RZADOWA && GrupaInfo[grupa][gTyp] != DZIALALNOSC_SYNDYKAT)//Pozosta³e grupy
	{
		TextDrawSetString(tdmembers1[playerid], "A - Zarzadzanie grupa.~n~B - Mozliwosc wejscia na sluzbe.~n~C - Zamawianie przedmiotów.~n~D - Zarzadzanie budynkiem.");
		TextDrawShowForPlayer(playerid, tdmembers1[playerid]);
		TextDrawSetString(tdmembers2[playerid], "E - Zarzadzanie szafa w budynku.~n~F - Zarzadzanie bramami.~n~G - Mozliwosc uzywania kanalu OOC.~n~H - Mozliwosc uzywania radia/czat IC.");
		TextDrawShowForPlayer(playerid, tdmembers2[playerid]);
		TextDrawSetString(tdmembers3[playerid], "I - Uzywanie mikrofonu.~n~J - Podawanie produktow.~n~K - Mozliwosc zapraszania do grupy.~n~L - Zarzadzanie pojazdami.");
		TextDrawShowForPlayer(playerid, tdmembers3[playerid]);
		TextDrawSetString(tdmembers4[playerid], "M - Otwieranie i zamykanie budynkow");
		TextDrawShowForPlayer(playerid, tdmembers4[playerid]);
	}
	ForeachEx(id, MAX_PRACOWNIK)
	{
		if(Pracownik[id][invID] == id && Pracownik[id][invDzialalnosc] == grupa)
		{
			new a[12], b[12], c[12], d[12], e[12], f[12], g[12], h[12], i[12], j[12], k[12], l[12], m[12], n[3], o[3], p[3], r[3], s[3], t[3];
			if(Pracownik[id][inv1] == 1)
			{
				format(a, sizeof(a), "A");
			}
			else
			{
				format(a, sizeof(a), "_");
			}
			if(Pracownik[id][inv2] == 1)
			{
				format(b, sizeof(b), "B");
			}
			else
			{
				format(b, sizeof(b), "_");
			}
			if(Pracownik[id][inv3] == 1)
			{
				format(c, sizeof(c), "C");
			}
			else
			{
				format(c, sizeof(c), "_", id);
			}
			if(Pracownik[id][inv4] == 1)
			{
				format(d, sizeof(d), "D");
			}
			else
			{
				format(d, sizeof(d), "_");
			}
			if(Pracownik[id][inv5] == 1)
			{
				format(e, sizeof(e), "E");
			}
			else
			{
				format(e, sizeof(e), "_");
			}
			if(Pracownik[id][inv6] == 1)
			{
				format(f, sizeof(f), "F");
			}
			else
			{
				format(f, sizeof(f), "_");
			}
			if(Pracownik[id][inv7] == 1)
			{
				format(g, sizeof(g), "G");
			}
			else
			{
				format(g, sizeof(g), "_");
			}
			if(Pracownik[id][inv8] == 1)
			{
				format(h, sizeof(h), "H");
			}
			else
			{
				format(h, sizeof(h), "_");
			}
			if(Pracownik[id][inv9] == 1)
			{
				format(i, sizeof(i), "I");
			}
			else
			{
				format(i, sizeof(i), "_");
			}
			if(Pracownik[id][inv10] == 1)
			{
				format(j, sizeof(j), "J");
			}
			else
			{
				format(j, sizeof(j), "_");
			}
			if(Pracownik[id][inv20] == 1)
			{
				format(k, sizeof(k), "K");
			}
			else
			{
				format(k, sizeof(k), "_");
			}
			if(Pracownik[id][inv21] == 1)
			{
				format(l, sizeof(l), "L");
			}
			else
			{
				format(l, sizeof(l), "_");
			}
			if(Pracownik[id][inv23] == 1)
			{
				format(m, sizeof(m), "M");
			}
			else
			{
				format(m, sizeof(m), "_");
			}
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_POLICYJNA)
			{
				if(Pracownik[id][inv11] == 1)
				{
					format(n, sizeof(n), "N");
				}
				else
				{
					format(n, sizeof(n), "_");
				}
				if(Pracownik[id][inv13] == 1)
				{
					format(o, sizeof(o), "O");
				}
				else
				{
					format(o, sizeof(o), "_");
				}
				if(Pracownik[id][inv14] == 1)
				{
					format(p, sizeof(p), "P");
				}
				else
				{
					format(p, sizeof(p), "_");
				}
				if(Pracownik[id][inv16] == 1)
				{
					format(r, sizeof(r), "R");
				}
				else
				{
					format(r, sizeof(r), "_");
				}
				if(Pracownik[id][inv17] == 1)
				{
					format(s, sizeof(s), "S");
				}
				else
				{
					format(s, sizeof(s), "_");
				}
				if(Pracownik[id][inv22] == 1)
				{
					format(t, sizeof(t), "T");
				}
				else
				{
					format(t, sizeof(t), "_");
				}
			}
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_ZMOTORYZOWANA)
			{
				if(Pracownik[id][inv13] == 1)
				{
					format(n, sizeof(n), "N");
				}
				else
				{
					format(n, sizeof(n), "_");
				}
				if(Pracownik[id][inv18] == 1)
				{
					format(o, sizeof(o), "O");
				}
				else
				{
					format(o, sizeof(o), "_");
				}
				if(Pracownik[id][inv19] == 1)
				{
					format(p, sizeof(p), "P");
				}
				else
				{
					format(p, sizeof(p), "_");
				}
			}
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_WARSZTAT)
			{
				if(Pracownik[id][inv12] == 1)
				{
					format(n, sizeof(n), "N");
				}
				else
				{
					format(n, sizeof(n), "_");
				}
			}
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_ELEKTRTYKA)
			{
				if(Pracownik[id][inv15] == 1)
				{
					format(n, sizeof(n), "N");
				}
				else
				{
					format(n, sizeof(n), "_");
				}
			}
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_SANNEWS)
			{
				if(Pracownik[id][inv24] == 1)
				{
					format(n, sizeof(n), "N");
				}
				else
				{
					format(n, sizeof(n), "_");
				}
				if(Pracownik[id][inv25] == 1)
				{
					format(o, sizeof(o), "O");
				}
				else
				{
					format(o, sizeof(o), "_");
				}
				if(Pracownik[id][inv26] == 1)
				{
					format(p, sizeof(p), "P");
				}
				else
				{
					format(p, sizeof(p), "_");
				}
			}
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_MAFIE)
			{
				if(Pracownik[id][inv13] == 1)
				{
					format(n, sizeof(n), "N");
				}
				else
				{
					format(n, sizeof(n), "_");
				}
			}
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_MEDYCZNA)
			{
				if(Pracownik[id][inv22] == 1)
				{
					format(n, sizeof(n), "N");
				}
				else
				{
					format(n, sizeof(n), "_");
				}
			}
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_GANGI)
			{
				if(Pracownik[id][inv13] == 1)
				{
					format(n, sizeof(n), "N");
				}
				else
				{
					format(n, sizeof(n), "_");
				}
			}
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_RZADOWA)
			{
				if(Pracownik[id][inv27] == 1)
				{
					format(n, sizeof(n), "N");
				}
				else
				{
					format(n, sizeof(n), "_");
				}
				if(Pracownik[id][inv28] == 1)
				{
					format(o, sizeof(o), "O");
				}
				else
				{
					format(o, sizeof(o), "_");
				}
				if(Pracownik[id][inv22] == 1)
				{
					format(p, sizeof(p), "P");
				}
				else
				{
					format(p, sizeof(p), "_");
				}
			}
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_SYNDYKAT)
			{
				if(Pracownik[id][inv13] == 1)
				{
					format(n, sizeof(n), "N");
				}
				else
				{
					format(n, sizeof(n), "_");
				}
			}
			temp++;
			format(str, sizeof(str), "%s\n%d\t%s\t%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\t100%", str, Pracownik[id][invID], ImieWlasciciela(Pracownik[id][invUID]),a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,r,s,t);
		}
	}
	if(temp == 0)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie znaleziono ¿adnego cz³onka którym móg³byœ zarz¹dzaæ.", "Zamknij", "");
		TextDrawHideForPlayer(playerid, tdmembers1[playerid]);
		TextDrawHideForPlayer(playerid, tdmembers2[playerid]);
		TextDrawHideForPlayer(playerid, tdmembers3[playerid]);
		TextDrawHideForPlayer(playerid, tdmembers4[playerid]);
		TextDrawHideForPlayer(playerid, tdmembers5[playerid]);
		return 0;
	}
	else
	{
		dShowPlayerDialog(playerid, DIALOG_MEMBERS, DIALOG_STYLE_TABLIST_HEADERS, "• Zarz¹dzanie osobami w grupie:", str, "Zarz¹dzaj", "Anuluj");
		return 1;
	}
}
CMD:r(playerid, cmdtext[])
{
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
    new typ, tekst_globalsa[256], dz, upr, kl[20];
	strdel(tekst_globalsa, 0, 256);
	if(sscanf(cmdtext, "ds[256]", typ, tekst_globalsa))
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Aby pisaæ na czacie IC grupy{DEDEDE} wpisz: /r [slot] [treœæ] lub /g [slot] [tresc], @[slot] [treœæ]", "Zamknij", "");
		return 1;
	}
	if(GetPVarInt(playerid, "WYKRZYKNIK") == 1)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby pisaæ na czacie IC grupy odblokuj czat (/tog !)", "Zamknij", "");
		return 0;
	}
	if(typ <= 0 || typ >=7) return 1;
	switch(typ)
    {
		case 1: 
		{
			dz = DaneGracza[playerid][gDzialalnosc1];
			upr = GetPVarInt(playerid, "g1u8");
			format(kl, sizeof(kl), "%s", DaneGracza[playerid][gKolorChatu1]);
		}
		case 2: 
		{
			upr = GetPVarInt(playerid, "g2u8");
			dz = DaneGracza[playerid][gDzialalnosc2];
			format(kl, sizeof(kl), "%s", DaneGracza[playerid][gKolorChatu2]);
		}
		case 3: 
		{
			upr = GetPVarInt(playerid, "g3u8");
			dz = DaneGracza[playerid][gDzialalnosc3];
			format(kl, sizeof(kl), "%s", DaneGracza[playerid][gKolorChatu3]);
		}
		case 4: 
		{
			upr = GetPVarInt(playerid, "g4u8");
			dz = DaneGracza[playerid][gDzialalnosc4];
			format(kl, sizeof(kl), "%s", DaneGracza[playerid][gKolorChatu4]);
		}
		case 5: 
		{
			upr = GetPVarInt(playerid, "g5u8");
			dz = DaneGracza[playerid][gDzialalnosc5];
			format(kl, sizeof(kl), "%s", DaneGracza[playerid][gKolorChatu5]);
		}
		case 6: 
		{
			upr = GetPVarInt(playerid, "g6u8");
			dz = DaneGracza[playerid][gDzialalnosc6];
			format(kl, sizeof(kl), "%s", DaneGracza[playerid][gKolorChatu6]);
		}
	}
	if(upr == 1)
	{
		tekst_globalsa[0] = toupper(tekst_globalsa[0]);
		new trws[256];
		//Transakcja(T_DGIC, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, dz, -1, -1, tekst_globalsa, gettime());
		ForeachEx(i, MAX_PLAYERS)
		{
			if(IsPlayerConnected(i))
			{
				if(zalogowany[i] == true)
				{
					new idg;
					if(DaneGracza[i][gDzialalnosc1] == dz)
					{
						idg = 1;
					}
					if(DaneGracza[i][gDzialalnosc2] == dz)
					{
						idg = 2;
					}
					if(DaneGracza[i][gDzialalnosc3] == dz)
					{
						idg = 3;
					}
					if(DaneGracza[i][gDzialalnosc4] == dz)
					{
						idg = 4;
					}
					if(DaneGracza[i][gDzialalnosc5] == dz)
					{
						idg = 5;
					}
					if(DaneGracza[i][gDzialalnosc6] == dz)
					{
						idg = 6;
					}
					if(idg == 1)
					{
						new uid = DaneGracza[i][gDzialalnosc1];
						format(trws, sizeof(trws), "!1 %s ** %s: %s **", GrupaInfo[uid][gNazwa], ZmianaNicku(playerid), tekst_globalsa);
					}
					if(idg == 2)
					{
						new uid = DaneGracza[i][gDzialalnosc2];
						format(trws, sizeof(trws), "!2 %s ** %s: %s **", GrupaInfo[uid][gNazwa], ZmianaNicku(playerid), tekst_globalsa);
					}
					if(idg == 3)
					{
						new uid = DaneGracza[i][gDzialalnosc3];
						format(trws, sizeof(trws), "!3 %s ** %s: %s **", GrupaInfo[uid][gNazwa], ZmianaNicku(playerid), tekst_globalsa);
					}
					if(idg == 4)
					{
						new uid = DaneGracza[i][gDzialalnosc4];
						format(trws, sizeof(trws), "!4 %s ** %s: %s **", GrupaInfo[uid][gNazwa], ZmianaNicku(playerid), tekst_globalsa);
					}
					if(idg == 5)
					{
						new uid = DaneGracza[i][gDzialalnosc5];
						format(trws, sizeof(trws), "!5 %s ** %s: %s **", GrupaInfo[uid][gNazwa], ZmianaNicku(playerid), tekst_globalsa);
					}
					if(idg == 6)
					{
						new uid = DaneGracza[i][gDzialalnosc6];
						format(trws, sizeof(trws), "!6 %s ** %s: %s **", GrupaInfo[uid][gNazwa], ZmianaNicku(playerid), tekst_globalsa);
					}
					if(DaneGracza[i][gDzialalnosc1] == dz && GetPVarInt(i, "WYKRZYKNIK") == 0||
					DaneGracza[i][gDzialalnosc2] == dz && GetPVarInt(i, "WYKRZYKNIK") == 0||
					DaneGracza[i][gDzialalnosc3] == dz && GetPVarInt(i, "WYKRZYKNIK") == 0||
					DaneGracza[i][gDzialalnosc4] == dz && GetPVarInt(i, "WYKRZYKNIK") == 0||
					DaneGracza[i][gDzialalnosc5] == dz && GetPVarInt(i, "WYKRZYKNIK") == 0||
					DaneGracza[i][gDzialalnosc6] == dz && GetPVarInt(i, "WYKRZYKNIK") == 0)
					{
						DGCZAT(i, kl, 0xFFFFFFFF, trws);
					}
				}
			}
		}
		new str[256];
		format(str, sizeof(str), "%s (s³uchawka): %s", ZmianaNicku(playerid), tekst_globalsa);
		Sluchawka(playerid, str, 10);
	}else{
	GameTextForPlayer(playerid, "~r~Brak uprawnien do korzystania z tego kanalu.", 3000, 5);
	}
	return 1;
}
stock ListaGrup(playerid)
{
	new	dzg_lista[350], find;
	format(dzg_lista, sizeof(dzg_lista), "{848484}Slot\t{848484}UID\t{848484}Nazwa grupy\t{848484}Czas na s³u¿bie");
	if(DaneGracza[playerid][gDzialalnosc1] != 0)
	{
		new uid = DaneGracza[playerid][gDzialalnosc1];
		new wynik;
		wynik = GetPVarInt(playerid, "w1")+DaneGracza[playerid][gPrzynaleznosci][1];
		find = 1;
		if(DaneGracza[playerid][gSluzba] == uid)
		{
			format(dzg_lista, sizeof(dzg_lista), "%s\n{FF0033}%d{FFFFFF}\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
		}
		else
		{
			format(dzg_lista, sizeof(dzg_lista), "%s\n{FFFFFF}%d\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
		}
	}
	if(DaneGracza[playerid][gDzialalnosc2] != 0)
	{
		new uid = DaneGracza[playerid][gDzialalnosc2];
		new wynik;
		wynik = GetPVarInt(playerid, "w2")+DaneGracza[playerid][gPrzynaleznosci][7];
		find = 2;
		if(DaneGracza[playerid][gSluzba] == uid)
		{
			format(dzg_lista, sizeof(dzg_lista), "%s\n{FF0033}%d{FFFFFF}\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
		}
		else
		{
			format(dzg_lista, sizeof(dzg_lista), "%s\n{FFFFFF}%d\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
		}
	}
	if(DaneGracza[playerid][gDzialalnosc3] != 0)
	{
		new uid = DaneGracza[playerid][gDzialalnosc3];
		new wynik;
		wynik = GetPVarInt(playerid, "w3")+DaneGracza[playerid][gPrzynaleznosci][13];
		find = 3;
		if(DaneGracza[playerid][gSluzba] == uid)
		{
			format(dzg_lista, sizeof(dzg_lista), "%s\n{FF0033}%d{FFFFFF}\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
		}
		else
		{
			format(dzg_lista, sizeof(dzg_lista), "%s\n{FFFFFF}%d\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
		}
	}
	if(DaneGracza[playerid][gDzialalnosc4] != 0)
	{
		new uid = DaneGracza[playerid][gDzialalnosc4];
		new wynik;
		wynik = GetPVarInt(playerid, "w4")+DaneGracza[playerid][gPrzynaleznosci][19];
		find = 4;
		if(GraczPremium(playerid))
		{
			if(DaneGracza[playerid][gSluzba] == uid)
			{
				format(dzg_lista, sizeof(dzg_lista), "%s\n{FF0033}%d{FFFFFF}\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
			}
			else
			{
				format(dzg_lista, sizeof(dzg_lista), "%s\n{FFFFFF}%d\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
			}
		}
		else
		{
			format(dzg_lista, sizeof(dzg_lista), "%s\n{000000}%d\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
		}
	}
	if(DaneGracza[playerid][gDzialalnosc5] != 0)
	{
		new uid = DaneGracza[playerid][gDzialalnosc5];
		new wynik;
		wynik = GetPVarInt(playerid, "w5")+DaneGracza[playerid][gPrzynaleznosci][25];
		find = 5;
		if(GraczPremium(playerid))
		{
			if(DaneGracza[playerid][gSluzba] == uid)
			{
				format(dzg_lista, sizeof(dzg_lista), "%s\n{FF0033}%d{FFFFFF}\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
			}
			else
			{
				format(dzg_lista, sizeof(dzg_lista), "%s\n{FFFFFF}%d\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
			}
		}
		else
		{
			format(dzg_lista, sizeof(dzg_lista), "%s\n{000000}%d\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
		}
	}
	if(DaneGracza[playerid][gDzialalnosc6] != 0)
	{
		new uid = DaneGracza[playerid][gDzialalnosc6];
		new wynik;
		wynik = GetPVarInt(playerid, "w6")+DaneGracza[playerid][gPrzynaleznosci][31];
		find = 6;
		if(GraczPremium(playerid))
		{
			if(DaneGracza[playerid][gSluzba] == uid)
			{
				format(dzg_lista, sizeof(dzg_lista), "%s\n{FF0033}%d{FFFFFF}\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
			}
			else
			{
				format(dzg_lista, sizeof(dzg_lista), "%s\n{FFFFFF}%d\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
			}
		}
		else
		{
			format(dzg_lista, sizeof(dzg_lista), "%s\n{000000}%d\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
		}
	}
	if(find > 0) dShowPlayerDialog(playerid, DIALOG_DZIALALNOSCI, DIALOG_STYLE_TABLIST_HEADERS, "• Twoje grupy:", dzg_lista, "Wiêcej", "Wyjdz");
	else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Grupy:", "Nie posiadasz ¿adnej grupy na liœcie. Poszukaj pracy w og³oszeniach z ofertami lub popytaj o ni¹\nodwiedzaj¹c firmy innych graczy. Mo¿esz równie¿ zatruniæ siê w instytucjach publicznych.\nZdecyduj gdzie Twoja postaæ bêdzie pracowaæ!", "Zamknij", "");
	return 1;
}
CMD:g(playerid, cmdtext[])
{
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
    new	comm1[32], comm2[128];
	if(sscanf(cmdtext, "s[32]S()[128]", comm1, comm2))
	{
	    if(DaneGracza[playerid][gDzialalnosc1] != 0 || DaneGracza[playerid][gDzialalnosc2] != 0 || DaneGracza[playerid][gDzialalnosc3] != 0 || DaneGracza[playerid][gDzialalnosc4] != 0 || DaneGracza[playerid][gDzialalnosc5] != 0 || DaneGracza[playerid][gDzialalnosc6] != 0)
		{
	        //ShowPlayerGroups(playerid);
			ListaGrup(playerid);
			if(ComparisonString(DaneGracza[playerid][gHistoria], ""))
			{
				new dzial1[512], dzial2[512], dzial3[512], dzial4[512], dzial5[512], dzial6[512];
				if(DaneGracza[playerid][gDzialalnosc1] != 0)
				{
					if(ComparisonString(DaneGracza[playerid][gHistoria], ""))
					{
						format(dzial1, sizeof(dzial1), "%s", GrupaInfo[DaneGracza[playerid][gDzialalnosc1]][gNazwa]);
					}
					else
					{
						format(dzial1, sizeof(dzial1), "%s, %s", DaneGracza[playerid][gHistoria], GrupaInfo[DaneGracza[playerid][gDzialalnosc1]][gNazwa]);
					}
					format(DaneGracza[playerid][gHistoria], 512, "%s", dzial1);
					ZapiszGracza(playerid);
				}
				if(DaneGracza[playerid][gDzialalnosc2] != 0)
				{
					if(ComparisonString(DaneGracza[playerid][gHistoria], ""))
					{
						format(dzial2, sizeof(dzial2), "%s", GrupaInfo[DaneGracza[playerid][gDzialalnosc2]][gNazwa]);
					}
					else
					{
						format(dzial2, sizeof(dzial2), "%s, %s", DaneGracza[playerid][gHistoria], GrupaInfo[DaneGracza[playerid][gDzialalnosc2]][gNazwa]);
					}
					format(DaneGracza[playerid][gHistoria], 512, "%s", dzial2);
					ZapiszGracza(playerid);
				}
				if(DaneGracza[playerid][gDzialalnosc3] != 0)
				{
					if(ComparisonString(DaneGracza[playerid][gHistoria], ""))
					{
						format(dzial3, sizeof(dzial3), "%s", GrupaInfo[DaneGracza[playerid][gDzialalnosc3]][gNazwa]);
					}
					else
					{
						format(dzial3, sizeof(dzial3), "%s, %s", DaneGracza[playerid][gHistoria], GrupaInfo[DaneGracza[playerid][gDzialalnosc3]][gNazwa]);
					}
					format(DaneGracza[playerid][gHistoria], 512, "%s", dzial3);
					ZapiszGracza(playerid);
				}
				if(DaneGracza[playerid][gDzialalnosc4] != 0)
				{
					if(ComparisonString(DaneGracza[playerid][gHistoria], ""))
					{
						format(dzial4, sizeof(dzial4), "%s", GrupaInfo[DaneGracza[playerid][gDzialalnosc4]][gNazwa]);
					}
					else
					{
						format(dzial4, sizeof(dzial4), "%s, %s", DaneGracza[playerid][gHistoria], GrupaInfo[DaneGracza[playerid][gDzialalnosc4]][gNazwa]);
					}
					format(DaneGracza[playerid][gHistoria], 512, "%s", dzial4);
					ZapiszGracza(playerid);
				}
				if(DaneGracza[playerid][gDzialalnosc5] != 0)
				{
					if(ComparisonString(DaneGracza[playerid][gHistoria], ""))
					{
						format(dzial5, sizeof(dzial5), "%s", GrupaInfo[DaneGracza[playerid][gDzialalnosc5]][gNazwa]);
					}
					else
					{
						format(dzial5, sizeof(dzial5), "%s, %s", DaneGracza[playerid][gHistoria], GrupaInfo[DaneGracza[playerid][gDzialalnosc5]][gNazwa]);
					}
					format(DaneGracza[playerid][gHistoria], 512, "%s", dzial5);
					ZapiszGracza(playerid);
				}
				if(DaneGracza[playerid][gDzialalnosc6] != 0)
				{
					if(ComparisonString(DaneGracza[playerid][gHistoria], ""))
					{
						format(dzial6, sizeof(dzial6), "%s", GrupaInfo[DaneGracza[playerid][gDzialalnosc6]][gNazwa]);
					}
					else
					{
						format(dzial6, sizeof(dzial6), "%s, %s", DaneGracza[playerid][gHistoria], GrupaInfo[DaneGracza[playerid][gDzialalnosc6]][gNazwa]);
					}
					format(DaneGracza[playerid][gHistoria], 512, "%s", dzial6);
					ZapiszGracza(playerid);
				}
			}
		}
		else
		{
		    //HidePlayerGroups(playerid);
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Grupy:", "Nie posiadasz ¿adnej grupy na liœcie. Poszukaj pracy w og³oszeniach z ofertami lub popytaj o ni¹\nodwiedzaj¹c firmy innych graczy. Mo¿esz równie¿ zatruniæ siê w instytucjach publicznych.\nZdecyduj gdzie Twoja postaæ bêdzie pracowaæ!", "Zamknij", "");
		}
	}
	else if(!strcmp(comm1,"lista", true))
	{
		ListaGrup(playerid);
		return 1;
	}
	else if(!strcmp(comm1,"1",true))
	{
		if(DaneGracza[playerid][gDzialalnosc1] != 0)
		{
			new typ[124];
			if(sscanf(comm2, "s[124]", typ))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Aby pisaæ na czacie grupowym{DEDEDE} wpisz: /g 1 [treœæ]", "Zamknij", "");
				return 1;
			}
			if(!strcmp(typ,"v",true))
			{
				new	list_vehicles[2048], find = 0;
				format(list_vehicles, sizeof(list_vehicles), "{848484}UID\t{848484}Stan (HP)\t{848484}Przebieg (KM)\t{848484}Nazwa pojazdu");
				ForeachEx(i, MAX_VEH)
				{
					if(PojazdInfo[i][pOwnerPostac] == 0  && PojazdInfo[i][pOwnerDzialalnosc] == DaneGracza[playerid][gDzialalnosc1])
					{
						if(PojazdInfo[i][pSpawn] != 0)
						{
							format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t%0.01f\t%0.01f\t* %s", list_vehicles, PojazdInfo[i][pUID], PojazdInfo[i][pStan], PojazdInfo[i][pPrzebieg]/1000, GetVehicleModelName(PojazdInfo[i][pModel]));
						}
						else format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t%0.01f\t%0.01f\t%s", list_vehicles, PojazdInfo[i][pUID], PojazdInfo[i][pStan], PojazdInfo[i][pPrzebieg]/1000, GetVehicleModelName(PojazdInfo[i][pModel]));
						find++;
					}
				}
				if(find > 0) dShowPlayerDialog(playerid, DIALOG_VEH_SPAWN_DZ, DIALOG_STYLE_TABLIST_HEADERS, "• Pojazdy:", list_vehicles, "Wybierz", "Wiêcej");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Ta grupa nie posiada ¿adnych pojazdów.", "Zamknij", "");
				return 1;
			}
			else if(!strcmp(typ,"info",true))
			{
				new stri[256], strin[256];
				new uid = DaneGracza[playerid][gDzialalnosc1];
				format(stri, sizeof(stri), "UID:\t\t\t\t%d\nSlot:\t\t\t\t%d\nBud¿et grupy:\t\t\t$%d\nTyp grupy:\t\t\t%s\nW³aœciciel:\t\t\t%s\n\n\n1\t{%s}Kolor czatu OOC\n\n2\t{%s}Kolor nicków",GrupaInfo[uid][gUID], 1, GrupaInfo[uid][gSaldo], NazwyDzialalnosci[GrupaInfo[uid][gTyp]], NickGraczaGlobalSQL(GrupaInfo[uid][gOwner]), GrupaInfo[uid][gKolorCzatu], GrupaInfo[uid][gKolorNicku]);
				format(strin, sizeof(strin), "• %s:",GrupaInfo[uid][gNazwa]);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, strin, stri, "Zamknij", "");
			}
			else if(!strcmp(typ,"magazyn",true))
			{
				Magazyn(playerid, DIALOG_MAGAZYNG, "• Grupa » Magazyn:", TYP_MAGAZYN, DaneGracza[playerid][gDzialalnosc1], "Wyci¹gnij", "Zamknij");
			}
			else if(!strcmp(typ,"members", true))
			{
				PokazMembers(playerid, DaneGracza[playerid][gDzialalnosc1]);
				return 1;
			}
			else if(!strcmp(typ,"online",true))
			{
				new str[512], temp = 0;
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							if(DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc1] ||
							DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc1] ||
							DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc1] ||
							DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc1] ||
							DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc1] ||
							DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc1])
							{
								temp++;
								format(str, sizeof(str), "%s\n{DEDEDE}[ID: %d]\t%s", str, i, ImieGracza2(i));
							}
						}
					}
				}
				if(temp == 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Brak pracowników na s³u¿bie.", "Zamknij", "");
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Lista pracowników online:", str, "Zamknij", "");
				return 1;
			}
		}
	    return 1;
	}
	else if(!strcmp(comm1,"2",true))
	{
		if(DaneGracza[playerid][gDzialalnosc2] != 0)
		{
			new typ[124];
			if(sscanf(comm2, "s[124]", typ))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Aby pisaæ na czacie grupowym{DEDEDE} wpisz: /g 2 [treœæ]", "Zamknij", "");
				return 1;
			}
			if(!strcmp(typ,"v",true))
			{
				new	list_vehicles[2048], find = 0;
				format(list_vehicles, sizeof(list_vehicles), "{848484}UID\tStan (HP)\tPrzebieg (KM)\tNazwa pojazdu");
				ForeachEx(i, MAX_VEH)
				{
					if(PojazdInfo[i][pOwnerPostac] == 0  && PojazdInfo[i][pOwnerDzialalnosc] == DaneGracza[playerid][gDzialalnosc2])
					{
						if(PojazdInfo[i][pSpawn] != 0)
						{
							format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t%0.01f\t%0.01f\t* %s", list_vehicles, PojazdInfo[i][pUID], PojazdInfo[i][pStan], PojazdInfo[i][pPrzebieg]/1000, GetVehicleModelName(PojazdInfo[i][pModel]));
						}
						else format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t%0.01f\t%0.01f\t%s", list_vehicles, PojazdInfo[i][pUID], PojazdInfo[i][pStan], PojazdInfo[i][pPrzebieg]/1000, GetVehicleModelName(PojazdInfo[i][pModel]));
						find++;
					}
				}
				if(find > 0) dShowPlayerDialog(playerid, DIALOG_VEH_SPAWN_DZ, DIALOG_STYLE_TABLIST_HEADERS, "• Pojazdy:", list_vehicles, "Wybierz", "Wiêcej");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Ta grupa nie posiada ¿adnych pojazdów.", "Zamknij", "");
				return 1;
			}
			else if(!strcmp(typ,"info",true))
			{
				new stri[256], strin[256];
				new uid = DaneGracza[playerid][gDzialalnosc2];
				format(stri, sizeof(stri), "UID:\t\t\t\t%d\nSlot:\t\t\t\t%d\nBud¿et grupy:\t\t\t$%d\nTyp grupy:\t\t\t%s\nW³aœciciel:\t\t\t%s\n\n\n1\t{%s}Kolor czatu OOC\n\n2\t{%s}Kolor nicków",GrupaInfo[uid][gUID], 2, GrupaInfo[uid][gSaldo], NazwyDzialalnosci[GrupaInfo[uid][gTyp]], NickGraczaGlobalSQL(GrupaInfo[uid][gOwner]), GrupaInfo[uid][gKolorCzatu], GrupaInfo[uid][gKolorNicku]);
				format(strin, sizeof(strin), "• %s:",GrupaInfo[uid][gNazwa]);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, strin, stri, "Zamknij", "");
			}
			else if(!strcmp(typ,"magazyn",true))
			{
				Magazyn(playerid, DIALOG_MAGAZYNG, "• Grupa » {FFFFFF}Magazyn:", TYP_MAGAZYN, DaneGracza[playerid][gDzialalnosc2], "Wyci¹gnij", "Zamknij");
			}
			else if(!strcmp(typ,"members", true))
			{
				PokazMembers(playerid, DaneGracza[playerid][gDzialalnosc2]);
				return 1;
			}
			else if(!strcmp(typ,"online",true))
			{
				new str[512], temp = 0;
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							if(DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc2] ||
							DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc2] ||
							DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc2] ||
							DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc2] ||
							DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc2] ||
							DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc2])
							{
								temp++;
								format(str, sizeof(str), "%s\n{DEDEDE}[ID: %d]\t%s", str, i, ImieGracza2(i));
							}
						}
					}
				}
				if(temp == 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Brak pracowników na s³u¿bie.", "Zamknij", "");
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Lista pracowników online:", str, "Zamknij", "");
				return 1;
			}
		}
	    return 1;
	}
	else if(!strcmp(comm1,"3",true))
	{
		if(DaneGracza[playerid][gDzialalnosc3] != 0)
		{
			new typ[124];
			if(sscanf(comm2, "s[124]", typ))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Aby pisaæ na czacie grupowym{DEDEDE} wpisz: /g 3 [treœæ]", "Zamknij", "");
				return 1;
			}
			if(!strcmp(typ,"v",true))
			{
				new	list_vehicles[2048], find = 0;
				format(list_vehicles, sizeof(list_vehicles), "{848484}UID\tStan (HP)\tPrzebieg (KM)\tNazwa pojazdu");
				ForeachEx(i, MAX_VEH)
				{
					if(PojazdInfo[i][pOwnerPostac] == 0  && PojazdInfo[i][pOwnerDzialalnosc] == DaneGracza[playerid][gDzialalnosc3])
					{
						if(PojazdInfo[i][pSpawn] != 0)
						{
							format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t%0.01f\t%0.01f\t* %s", list_vehicles, PojazdInfo[i][pUID], PojazdInfo[i][pStan], PojazdInfo[i][pPrzebieg]/1000, GetVehicleModelName(PojazdInfo[i][pModel]));
						}
						else format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t%0.01f\t%0.01f\t%s", list_vehicles, PojazdInfo[i][pUID], PojazdInfo[i][pStan], PojazdInfo[i][pPrzebieg]/1000, GetVehicleModelName(PojazdInfo[i][pModel]));
						find++;
					}
				}
				if(find > 0) dShowPlayerDialog(playerid, DIALOG_VEH_SPAWN_DZ, DIALOG_STYLE_TABLIST_HEADERS, "• Pojazdy:", list_vehicles, "Wybierz", "Wiêcej");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Ta grupa nie posiada ¿adnych pojazdów.", "Zamknij", "");
				return 1;
			}
			else if(!strcmp(typ,"info",true))
			{
				new stri[256], strin[256];
				new uid = DaneGracza[playerid][gDzialalnosc3];
				format(stri, sizeof(stri), "UID:\t\t\t\t%d\nSlot:\t\t\t\t%d\nBud¿et grupy:\t\t\t$%d\nTyp grupy:\t\t\t%s\nW³aœciciel:\t\t\t%s\n\n\n1\t{%s}Kolor czatu OOC\n\n2\t{%s}Kolor nicków",GrupaInfo[uid][gUID], 3, GrupaInfo[uid][gSaldo], NazwyDzialalnosci[GrupaInfo[uid][gTyp]], NickGraczaGlobalSQL(GrupaInfo[uid][gOwner]), GrupaInfo[uid][gKolorCzatu], GrupaInfo[uid][gKolorNicku]);
				format(strin, sizeof(strin), "• %s:",GrupaInfo[uid][gNazwa]);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, strin, stri, "Zamknij", "");
			}
			else if(!strcmp(typ,"magazyn",true))
			{
				Magazyn(playerid, DIALOG_MAGAZYNG, "• Grupa » {FFFFFF}Magazyn:", TYP_MAGAZYN, DaneGracza[playerid][gDzialalnosc3], "Wyci¹gnij", "Zamknij");
			}
			else if(!strcmp(typ,"members", true))
			{
				PokazMembers(playerid, DaneGracza[playerid][gDzialalnosc3]);
				return 1;
			}
			else if(!strcmp(typ,"online",true))
			{
				new str[512], temp = 0;
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							if(DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc3] ||
							DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc3] ||
							DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc3] ||
							DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc3] ||
							DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc3] ||
							DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc3])
							{
								temp++;
								format(str, sizeof(str), "%s\n{DEDEDE}[ID: %d]\t%s", str, i, ImieGracza2(i));
							}
						}
					}
				}
				if(temp == 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Brak pracowników na s³u¿bie.", "Zamknij", "");
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Lista pracowników online:", str, "Zamknij", "");
				return 1;
			}
		}
	    return 1;
	}
	else if(!strcmp(comm1,"4",true))
	{
		if(DaneGracza[playerid][gDzialalnosc4] != 0 && GraczPremium(playerid))
		{
			new typ[124];
			if(sscanf(comm2, "s[124]", typ))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Aby pisaæ na czacie grupowym{DEDEDE} wpisz: /g 4 [treœæ]", "Zamknij", "");
				return 1;
			}
			if(!strcmp(typ,"v",true))
			{
				new	list_vehicles[2048], find = 0;
				format(list_vehicles, sizeof(list_vehicles), "{848484}UID\tStan (HP)\tPrzebieg (KM)\tNazwa pojazdu");
				ForeachEx(i, MAX_VEH)
				{
					if(PojazdInfo[i][pOwnerPostac] == 0  && PojazdInfo[i][pOwnerDzialalnosc] == DaneGracza[playerid][gDzialalnosc4])
					{
						if(PojazdInfo[i][pSpawn] != 0)
						{
							format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t%0.01f\t%0.01f\t* %s", list_vehicles, PojazdInfo[i][pUID], PojazdInfo[i][pStan], PojazdInfo[i][pPrzebieg]/1000, GetVehicleModelName(PojazdInfo[i][pModel]));
						}
						else format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t%0.01f\t%0.01f\t%s", list_vehicles, PojazdInfo[i][pUID], PojazdInfo[i][pStan], PojazdInfo[i][pPrzebieg]/1000, GetVehicleModelName(PojazdInfo[i][pModel]));
						find++;
					}
				}
				if(find > 0) dShowPlayerDialog(playerid, DIALOG_VEH_SPAWN_DZ, DIALOG_STYLE_TABLIST_HEADERS, "• Pojazdy:", list_vehicles, "Wybierz", "Wiêcej");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Ta grupa nie posiada ¿adnych pojazdów.", "Zamknij", "");
				return 1;
			}
			else if(!strcmp(typ,"info",true))
			{
				new stri[256], strin[256];
				new uid = DaneGracza[playerid][gDzialalnosc4];
				format(stri, sizeof(stri), "UID:\t\t\t\t%d\nSlot:\t\t\t\t%d\nBud¿et grupy:\t\t\t$%d\nTyp grupy:\t\t\t%s\nW³aœciciel:\t\t\t%s\n\n\n1\t{%s}Kolor czatu OOC\n\n2\t{%s}Kolor nicków",GrupaInfo[uid][gUID], 4, GrupaInfo[uid][gSaldo], NazwyDzialalnosci[GrupaInfo[uid][gTyp]], NickGraczaGlobalSQL(GrupaInfo[uid][gOwner]), GrupaInfo[uid][gKolorCzatu], GrupaInfo[uid][gKolorNicku]);
				format(strin, sizeof(strin), "• %s:",GrupaInfo[uid][gNazwa]);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, strin, stri, "Zamknij", "");
			}
			else if(!strcmp(typ,"magazyn",true))
			{
				Magazyn(playerid, DIALOG_MAGAZYNG, "• Grupa » {FFFFFF}Magazyn:", TYP_MAGAZYN, DaneGracza[playerid][gDzialalnosc4], "Wyci¹gnij", "Zamknij");
			}
			else if(!strcmp(typ,"members", true))
			{
				PokazMembers(playerid, DaneGracza[playerid][gDzialalnosc4]);
				return 1;
			}
			else if(!strcmp(typ,"online",true))
			{
				new str[512], temp = 0;
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							if(DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc4] ||
							DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc4] ||
							DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc4] ||
							DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc4] ||
							DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc4] ||
							DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc4])
							{
								temp++;
								format(str, sizeof(str), "%s\n{DEDEDE}[ID: %d]\t%s", str, i, ImieGracza2(i));
							}
						}
					}
				}
				if(temp == 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Brak pracowników na s³u¿bie.", "Zamknij", "");
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Lista pracowników online:", str, "Zamknij", "");
				return 1;
			}
		}
	    return 1;
	}
	else if(!strcmp(comm1,"5",true))
	{
		if(DaneGracza[playerid][gDzialalnosc5] != 0 && GraczPremium(playerid))
		{
			new typ[124];
			if(sscanf(comm2, "s[124]", typ))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Aby pisaæ na czacie grupowym{DEDEDE} wpisz: /g 5 [treœæ]", "Zamknij", "");
				return 1;
			}
			if(!strcmp(typ,"v",true))
			{
				new	list_vehicles[2048], find = 0;
				format(list_vehicles, sizeof(list_vehicles), "{848484}UID\tStan (HP)\tPrzebieg (KM)\tNazwa pojazdu");
				ForeachEx(i, MAX_VEH)
				{
					if(PojazdInfo[i][pOwnerPostac] == 0  && PojazdInfo[i][pOwnerDzialalnosc] == DaneGracza[playerid][gDzialalnosc5])
					{
						if(PojazdInfo[i][pSpawn] != 0)
						{
							format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t%0.01f\t%0.01f\t* %s", list_vehicles, PojazdInfo[i][pUID], PojazdInfo[i][pStan], PojazdInfo[i][pPrzebieg]/1000, GetVehicleModelName(PojazdInfo[i][pModel]));
						}
						else format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t%0.01f\t%0.01f\t%s", list_vehicles, PojazdInfo[i][pUID], PojazdInfo[i][pStan], PojazdInfo[i][pPrzebieg]/1000, GetVehicleModelName(PojazdInfo[i][pModel]));
						find++;
					}
				}
				if(find > 0) dShowPlayerDialog(playerid, DIALOG_VEH_SPAWN_DZ, DIALOG_STYLE_TABLIST_HEADERS, "• Pojazdy:", list_vehicles, "Wybierz", "Wiêcej");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Ta grupa nie posiada ¿adnych pojazdów.", "Zamknij", "");
				return 1;
			}
			else if(!strcmp(typ,"info",true))
			{
				new stri[256], strin[256];
				new uid = DaneGracza[playerid][gDzialalnosc5];
				format(stri, sizeof(stri), "UID:\t\t\t\t%d\nSlot:\t\t\t\t%d\nBud¿et grupy:\t\t\t$%d\nTyp grupy:\t\t\t%s\nW³aœciciel:\t\t\t%s\n\n\n1\t{%s}Kolor czatu OOC\n\n2\t{%s}Kolor nicków",GrupaInfo[uid][gUID], 5, GrupaInfo[uid][gSaldo], NazwyDzialalnosci[GrupaInfo[uid][gTyp]], NickGraczaGlobalSQL(GrupaInfo[uid][gOwner]), GrupaInfo[uid][gKolorCzatu], GrupaInfo[uid][gKolorNicku]);
				format(strin, sizeof(strin), "• %s:",GrupaInfo[uid][gNazwa]);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, strin, stri, "Zamknij", "");
			}
			else if(!strcmp(typ,"magazyn",true))
			{
				Magazyn(playerid, DIALOG_MAGAZYNG, "• Grupa » {FFFFFF}Magazyn:", TYP_MAGAZYN, DaneGracza[playerid][gDzialalnosc5],"Wyci¹gnij", "Zamknij");
			}
			else if(!strcmp(typ,"members", true))
			{
				PokazMembers(playerid, DaneGracza[playerid][gDzialalnosc5]);
				return 1;
			}
			else if(!strcmp(typ,"online",true))
			{
				new str[512], temp = 0;
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							if(DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc5] ||
							DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc5] ||
							DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc5] ||
							DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc5] ||
							DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc5] ||
							DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc5])
							{
								temp++;
								format(str, sizeof(str), "%s\n{DEDEDE}[ID: %d]\t%s", str, i, ImieGracza2(i));
							}
						}
					}
				}
				if(temp == 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Brak pracowników na s³u¿bie.", "Zamknij", "");
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Lista pracowników online:", str, "Zamknij", "");
				return 1;
			}
		}
	    return 1;
	}
	else if(!strcmp(comm1,"6",true))
	{
		if(DaneGracza[playerid][gDzialalnosc6] != 0 && GraczPremium(playerid))
		{
			new typ[124];
			if(sscanf(comm2, "s[124]", typ))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Aby pisaæ na czacie grupowym{DEDEDE} wpisz: /g 6 [treœæ]", "Zamknij", "");
				return 1;
			}
			if(!strcmp(typ,"v",true))
			{
				new	list_vehicles[2048], find = 0;
				format(list_vehicles, sizeof(list_vehicles), "{848484}UID\tStan (HP)\tPrzebieg (KM)\tNazwa pojazdu");
				ForeachEx(i, MAX_VEH)
				{
					if(PojazdInfo[i][pOwnerPostac] == 0  && PojazdInfo[i][pOwnerDzialalnosc] == DaneGracza[playerid][gDzialalnosc6])
					{
						if(PojazdInfo[i][pSpawn] != 0)
						{
							format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t%0.01f\t%0.01f\t* %s", list_vehicles, PojazdInfo[i][pUID], PojazdInfo[i][pStan], PojazdInfo[i][pPrzebieg]/1000, GetVehicleModelName(PojazdInfo[i][pModel]));
						}
						else format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t%0.01f\t%0.01f\t%s", list_vehicles, PojazdInfo[i][pUID], PojazdInfo[i][pStan], PojazdInfo[i][pPrzebieg]/1000, GetVehicleModelName(PojazdInfo[i][pModel]));
						find++;
					}
				}
				if(find > 0) dShowPlayerDialog(playerid, DIALOG_VEH_SPAWN_DZ, DIALOG_STYLE_TABLIST_HEADERS, "• Pojazdy:", list_vehicles, "Wybierz", "Wiêcej");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Ta grupa nie posiada ¿adnych pojazdów.", "Zamknij", "");
				return 1;
			}
			else if(!strcmp(typ,"info",true))
			{
				new stri[256], strin[256];
				new uid = DaneGracza[playerid][gDzialalnosc6];
				format(stri, sizeof(stri), "UID:\t\t\t\t%d\nSlot:\t\t\t\t%d\nBud¿et grupy:\t\t\t$%d\nTyp grupy:\t\t\t%s\nW³aœciciel:\t\t\t%s\n\n\n1\t{%s}Kolor czatu OOC\n\n2\t{%s}Kolor nicków",GrupaInfo[uid][gUID], 6, GrupaInfo[uid][gSaldo], NazwyDzialalnosci[GrupaInfo[uid][gTyp]], NickGraczaGlobalSQL(GrupaInfo[uid][gOwner]), GrupaInfo[uid][gKolorCzatu], GrupaInfo[uid][gKolorNicku]);
				format(strin, sizeof(strin), "• %s:",GrupaInfo[uid][gNazwa]);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, strin, stri, "Zamknij", "");
			}
			else if(!strcmp(typ,"magazyn",true))
			{
				Magazyn(playerid, DIALOG_MAGAZYNG, "• Grupa » {FFFFFF}Magazyn:", TYP_MAGAZYN, DaneGracza[playerid][gDzialalnosc6], "Wyci¹gnij", "Zamknij");
			}
			else if(!strcmp(typ,"members", true))
			{
				PokazMembers(playerid, DaneGracza[playerid][gDzialalnosc6]);
				return 1;
			}
			else if(!strcmp(typ,"online",true))
			{
				new str[512], temp = 0;
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							if(DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc6] ||
							DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc6] ||
							DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc6] ||
							DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc6] ||
							DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc6] ||
							DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc6])
							{
								temp++;
								format(str, sizeof(str), "%s\n{DEDEDE}[ID: %d]\t%s", str, i, ImieGracza2(i));
							}
						}
					}
				}
				if(temp == 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Brak pracowników na s³u¿bie.", "Zamknij", "");
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Lista pracowników online:", str, "Zamknij", "");
				return 1;
			}
		}
	    return 1;
	}
	else if(!strcmp(comm1,"wypros",true))
	{
	    new typ, war1;
		if(sscanf(comm2, "dd", typ, war1))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Aby wyprosiæ{DEDEDE} gracza z grupy{DEDEDE} wpisz: /g wypros [grupa 1-6] [Id Gracza]", "Zamknij", "");
			return 1;
		}
		if(typ == 1 && GetPVarInt(playerid, "g1u20") == 1)
		{
	       	WywalzDZ(playerid, war1, DaneGracza[playerid][gDzialalnosc1]);
		}
		else if(typ == 2 && GetPVarInt(playerid, "g2u20") == 1)
		{
	        WywalzDZ(playerid, war1, DaneGracza[playerid][gDzialalnosc2]);
		}
		else if(typ == 3 && GetPVarInt(playerid, "g3u20") == 1)
		{
	        WywalzDZ(playerid, war1, DaneGracza[playerid][gDzialalnosc3]);
		}
		else if(typ == 4 && GetPVarInt(playerid, "g4u20") == 1)
		{
	        WywalzDZ(playerid, war1, DaneGracza[playerid][gDzialalnosc4]);
		}
		else if(typ == 5 && GetPVarInt(playerid, "g5u20") == 1)
		{
	        WywalzDZ(playerid, war1, DaneGracza[playerid][gDzialalnosc5]);
		}
		else if(typ == 6 && GetPVarInt(playerid, "g6u20") == 1)
		{
	   	    WywalzDZ(playerid, war1, DaneGracza[playerid][gDzialalnosc6]);
		}
		return 1;
	}
	else if(!strcmp(comm1,"zapros",true))
	{
	    new typ, war1;
		if(sscanf(comm2, "dd", typ, war1))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby zaprosiæ gracza do grupy wpisz: /g zapros [grupy 1-6] [Id Gracza]", "Zamknij", "");
			return 1;
		}
		if(!PlayerObokPlayera(playerid, war1, 5))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz którego chcesz zaprosiæ nie znajduje siê obok ciebie.", "Zamknij", "");
			return 1;
		}
		if(DaneGracza[war1][gKONTO_W_BANKU] == 0)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz którego chcesz zaprosiæ nie posiada konta w banku.", "Zamknij", "");
			return 1;
		}
		if(playerid != war1 && IsPlayerConnected(war1))
		{
			if(typ == 1 && GetPVarInt(playerid, "g1u20") == 1)
			{
 				SprawdzDostepnoscDzialalnosci(playerid, war1, DaneGracza[playerid][gDzialalnosc1]);
			}
			else if(typ == 2 && GetPVarInt(playerid, "g2u20") == 1)
			{
  				SprawdzDostepnoscDzialalnosci(playerid, war1, DaneGracza[playerid][gDzialalnosc2]);
			}
			else if(typ == 3 && GetPVarInt(playerid, "g3u20") == 1)
			{
  				SprawdzDostepnoscDzialalnosci(playerid, war1, DaneGracza[playerid][gDzialalnosc3]);
			}
			else if(typ == 4 && GetPVarInt(playerid, "g4u20") == 1)
			{
  				SprawdzDostepnoscDzialalnosci(playerid, war1, DaneGracza[playerid][gDzialalnosc4]);
			}
			else if(typ == 5 && GetPVarInt(playerid, "g5u20") == 1)
			{
  				SprawdzDostepnoscDzialalnosci(playerid, war1, DaneGracza[playerid][gDzialalnosc5]);
			}
			else if(typ == 6 && GetPVarInt(playerid, "g6u20") == 1)
			{
	    	    SprawdzDostepnoscDzialalnosci(playerid, war1, DaneGracza[playerid][gDzialalnosc6]);
			}
		}
		return 1;
	}
	return 1;
}
CMD:czatoocmalpa(playerid, cmdtext[])
{
	//printf("U¿yta komenda dg");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
    new	comm1[32], comm2[128];
    new text[256];
	if(sscanf(cmdtext, "s[32]S()[128]", comm1, comm2))
	{
	    if(DaneGracza[playerid][gDzialalnosc1] != 0 || DaneGracza[playerid][gDzialalnosc2] != 0 || DaneGracza[playerid][gDzialalnosc3] != 0 || DaneGracza[playerid][gDzialalnosc4] != 0 || DaneGracza[playerid][gDzialalnosc5] != 0 || DaneGracza[playerid][gDzialalnosc6] != 0)
		{
	        //ShowPlayerGroups(playerid);
		}
		else
		{
		    //HidePlayerGroups(playerid);
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Grupy:", "Nie posiadasz ¿adnej grupy na liœcie, znajdŸ sobie pracê by otrzymywaæ dochody!", "Zamknij", "");
		}
	}
	else if(!strcmp(comm1,"1",true))
	{
		if(DaneGracza[playerid][gDzialalnosc1] != 0)
		{
			if(BlokadaOOC(playerid))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Nie mo¿esz tego zrobiæ, poniewa¿ posiadasz aktywn¹ blokade czatów OOC{DEDEDE} \
				\nJeœli uwa¿asz, ¿e kara zosta³a nadana nies³usznie{DEDEDE} mo¿esz od niej apelowaæ na forum (www."PROJEKT"{DEDEDE}).", "Zamknij", "");
				return 0;
			}
			new typ[124];
			if(sscanf(comm2, "s[124]", typ))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Aby pisaæ na czacie grupowym{DEDEDE} wpisz: /g 1 [treœæ]", "Zamknij", "");
				return 1;
			}
			if(!strcmp(typ,"v",true))
			{
				new	list_vehicles[2048], find = 0;
				ForeachEx(i, MAX_VEH)
				{
					if(PojazdInfo[i][pOwnerPostac] == 0  && PojazdInfo[i][pOwnerDzialalnosc] == DaneGracza[playerid][gDzialalnosc1])
					{
						if(PojazdInfo[i][pSpawn] != 0)
						{
							format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t%s", list_vehicles, PojazdInfo[i][pUID], GetVehicleModelName(PojazdInfo[i][pModel]));
						}
						else format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t{DEDEDE}%s", list_vehicles, PojazdInfo[i][pUID], GetVehicleModelName(PojazdInfo[i][pModel]));
						find++;
					}
				}
				if(find > 0) dShowPlayerDialog(playerid, DIALOG_VEH_SPAWN_DZ, DIALOG_STYLE_LIST, "• Pojazdy:", list_vehicles, "Wybierz", "Wiêcej");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Ta grupa nie{DEDEDE} posiada ¿adnych pojazdów.", "Zamknij", "");
				return 1;
			}
			else if(!strcmp(typ,"info",true))
			{
				new stri[256], strin[256];
				new uid = DaneGracza[playerid][gDzialalnosc1];
				format(stri, sizeof(stri), "UID:\t\t\t\t%d\nSlot:\t\t\t\t%d\nBud¿et grupy:\t\t\t$%d\nTyp grupy:\t\t\t%s\nW³aœciciel:\t\t\t%s\n\n\n1\t{%s}Kolor czatu OOC\n\n2\t{%s}Kolor nicków",GrupaInfo[uid][gUID], 1, GrupaInfo[uid][gSaldo], NazwyDzialalnosci[GrupaInfo[uid][gTyp]], NickGraczaGlobalSQL(GrupaInfo[uid][gOwner]), GrupaInfo[uid][gKolorCzatu], GrupaInfo[uid][gKolorNicku]);
				format(strin, sizeof(strin), "• %s:",GrupaInfo[uid][gNazwa]);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, strin, stri, "Zamknij", "");
			}
			else if(!strcmp(typ,"magazyn",true))
			{
				Magazyn(playerid, DIALOG_MAGAZYNG, "• Grupa » {FFFFFF}Magazyn:", TYP_MAGAZYN, DaneGracza[playerid][gDzialalnosc1], "Wyci¹gnij", "Zamknij");
			}
			else if(!strcmp(typ,"online",true))
			{
				new str[512], temp = 0;
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							if(DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc1] ||
							DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc1] ||
							DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc1] ||
							DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc1] ||
							DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc1] ||
							DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc1])
							{
								temp++;
								format(str, sizeof(str), "%s\n{DEDEDE}[ID: %d]\t%s", str, i, ImieGracza2(i));
							}
						}
					}
				}
				if(temp == 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Brak pracowników na s³u¿bie.", "Zamknij", "");
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Lista pracowników online:", str, "Zamknij", "");
				return 1;
			}
			else if(GetPVarInt(playerid, "g1u7") == 1)
			{
				typ[0] = toupper(typ[0]);
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							new ido;
							if(DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc1])
							{
								ido = 1;
							}
							if(DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc1])
							{
								ido = 2;
							}
							if(DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc1])
							{
								ido = 3;
							}
							if(DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc1])
							{
								ido = 4;
							}
							if(DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc1])
							{
								ido = 5;
							}
							if(DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc1])
							{
								ido = 6;
							}
							format(text, sizeof(text), "@%d %s (( %d.%s: %s ))", ido, GrupaInfo[DaneGracza[playerid][gDzialalnosc1]][gNazwa], playerid,ZmianaNicku(playerid),typ);
							if(DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc1] && GetPVarInt(i, "MALPA") == 0 ||
							DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc1] && GetPVarInt(i, "MALPA") == 0 ||
							DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc1] && GetPVarInt(i, "MALPA") == 0 ||
							DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc1] && GetPVarInt(i, "MALPA") == 0 ||
							DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc1] && GetPVarInt(i, "MALPA") == 0 ||
							DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc1] && GetPVarInt(i, "MALPA") == 0 )
							{
								DGCZAT(i, DaneGracza[playerid][gKolorChatu1], 0xFFFFFFFF, text);
							}
						}
					}
				}
			}else{
			GameTextForPlayer(playerid, "~r~Brak uprawnien do korzystania z tego kanalu.", 3000, 5);
			}
		}
	    return 1;
	}
	else if(!strcmp(comm1,"2",true))
	{
		if(DaneGracza[playerid][gDzialalnosc2] != 0)
		{
			if(BlokadaOOC(playerid))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Nie mo¿esz tego zrobiæ, poniewa¿ posiadasz aktywn¹ blokade czatów OOC{DEDEDE} \
				\nJeœli uwa¿asz, ¿e kara zosta³a nadana nies³usznie{DEDEDE} mo¿esz od niej apelowaæ na forum (www."PROJEKT"{DEDEDE}).", "Zamknij", "");
				return 0;
			}
			new typ[124];
			if(sscanf(comm2, "s[124]", typ))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Aby pisaæ na czacie grupowym{DEDEDE} wpisz: /g 2 [treœæ]", "Zamknij", "");
				return 1;
			}
			if(!strcmp(typ,"v",true))
			{
				new	list_vehicles[2048], find = 0;
				ForeachEx(i, MAX_VEH)
				{
					if(PojazdInfo[i][pOwnerPostac] == 0  && PojazdInfo[i][pOwnerDzialalnosc] == DaneGracza[playerid][gDzialalnosc2])
					{
						if(PojazdInfo[i][pSpawn] != 0)
						{
							format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t%s", list_vehicles, PojazdInfo[i][pUID], GetVehicleModelName(PojazdInfo[i][pModel]));
						}
						else format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t{DEDEDE}%s", list_vehicles, PojazdInfo[i][pUID], GetVehicleModelName(PojazdInfo[i][pModel]));
						find++;
					}
				}
				if(find > 0) dShowPlayerDialog(playerid, DIALOG_VEH_SPAWN_DZ, DIALOG_STYLE_LIST, "• Pojazdy:", list_vehicles, "Wybierz", "Wiêcej");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Ta grupa nie{DEDEDE} posiada ¿adnych pojazdów.", "Zamknij", "");
				return 1;
			}
			else if(!strcmp(typ,"info",true))
			{
				new stri[256], strin[256];
				new uid = DaneGracza[playerid][gDzialalnosc2];
				format(stri, sizeof(stri), "UID:\t\t\t\t%d\nSlot:\t\t\t\t%d\nBud¿et grupy:\t\t\t$%d\nTyp grupy:\t\t\t%s\nW³aœciciel:\t\t\t%s\n\n\n1\t{%s}Kolor czatu OOC\n\n2\t{%s}Kolor nicków",GrupaInfo[uid][gUID], 2, GrupaInfo[uid][gSaldo], NazwyDzialalnosci[GrupaInfo[uid][gTyp]], NickGraczaGlobalSQL(GrupaInfo[uid][gOwner]), GrupaInfo[uid][gKolorCzatu], GrupaInfo[uid][gKolorNicku]);
				format(strin, sizeof(strin), "• %s:",GrupaInfo[uid][gNazwa]);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, strin, stri, "Zamknij", "");
			}
			else if(!strcmp(typ,"magazyn",true))
			{
				Magazyn(playerid, DIALOG_MAGAZYNG, "• Grupa » {FFFFFF}Magazyn:", TYP_MAGAZYN, DaneGracza[playerid][gDzialalnosc2], "Wyci¹gnij", "Zamknij");
			}
			else if(!strcmp(typ,"online",true))
			{
				new str[512], temp = 0;
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							if(DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc2] ||
							DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc2] ||
							DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc2] ||
							DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc2] ||
							DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc2] ||
							DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc2])
							{
								temp++;
								format(str, sizeof(str), "%s\n{DEDEDE}[ID: %d]\t%s", str, i, ImieGracza2(i));
							}
						}
					}
				}
				if(temp == 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Brak pracowników na s³u¿bie.", "Zamknij", "");
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Lista pracowników online:", str, "Zamknij", "");
				return 1;
			}
			else if(GetPVarInt(playerid, "g2u7") == 1)
			{
				typ[0] = toupper(typ[0]);
				//Transakcja(T_DGOOC, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, DaneGracza[playerid][gDzialalnosc2], -1, -1, typ, gettime());
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							new ido;
							if(DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc2])
							{
								ido = 1;
							}
							if(DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc2])
							{
								ido = 2;
							}
							if(DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc2])
							{
								ido = 3;
							}
							if(DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc2])
							{
								ido = 4;
							}
							if(DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc2])
							{
								ido = 5;
							}
							if(DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc2])
							{
								ido = 6;
							}
							format(text, sizeof(text), "@%d %s (( %d.%s: %s ))", ido, GrupaInfo[DaneGracza[playerid][gDzialalnosc2]][gNazwa], playerid,ZmianaNicku(playerid),typ);
							if(DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc2] ||
							DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc2] ||
							DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc2] ||
							DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc2] ||
							DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc2] ||
							DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc2])
							{
								DGCZAT(i, DaneGracza[playerid][gKolorChatu2], 0xFFFFFFFF, text);
							}
						}
					}
				}
			}else{
			GameTextForPlayer(playerid, "~r~Brak uprawnien do korzystania z tego kanalu.", 3000, 5);
			}
		}
	    return 1;
	}
	else if(!strcmp(comm1,"3",true))
	{
		if(DaneGracza[playerid][gDzialalnosc3] != 0)
		{
			if(BlokadaOOC(playerid))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Nie mo¿esz tego zrobiæ, poniewa¿ posiadasz aktywn¹ blokade czatów OOC{DEDEDE} \
				\nJeœli uwa¿asz, ¿e kara zosta³a nadana nies³usznie{DEDEDE} mo¿esz od niej apelowaæ na forum (www."PROJEKT"{DEDEDE}).", "Zamknij", "");
				return 0;
			}
			new typ[124];
			if(sscanf(comm2, "s[124]", typ))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Aby pisaæ na czacie grupowym{DEDEDE} wpisz: /g 3 [treœæ]", "Zamknij", "");
				return 1;
			}
			if(!strcmp(typ,"v",true))
			{
				new	list_vehicles[2048], find = 0;
				ForeachEx(i, MAX_VEH)
				{
					if(PojazdInfo[i][pOwnerPostac] == 0  && PojazdInfo[i][pOwnerDzialalnosc] == DaneGracza[playerid][gDzialalnosc3])
					{
						if(PojazdInfo[i][pSpawn] != 0)
						{
							format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t%s", list_vehicles, PojazdInfo[i][pUID], GetVehicleModelName(PojazdInfo[i][pModel]));
						}
						else format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t{DEDEDE}%s", list_vehicles, PojazdInfo[i][pUID], GetVehicleModelName(PojazdInfo[i][pModel]));
						find++;
					}
				}
				if(find > 0) dShowPlayerDialog(playerid, DIALOG_VEH_SPAWN_DZ, DIALOG_STYLE_LIST, "• Pojazdy:", list_vehicles, "Wybierz", "Wiêcej");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Ta grupa nie{DEDEDE} posiada ¿adnych pojazdów.", "Zamknij", "");
				return 1;
			}
			else if(!strcmp(typ,"info",true))
			{
				new stri[256], strin[256];
				new uid = DaneGracza[playerid][gDzialalnosc3];
				format(stri, sizeof(stri), "UID:\t\t\t\t%d\nSlot:\t\t\t\t%d\nBud¿et grupy:\t\t\t$%d\nTyp grupy:\t\t\t%s\nW³aœciciel:\t\t\t%s\n\n\n1\t{%s}Kolor czatu OOC\n\n2\t{%s}Kolor nicków",GrupaInfo[uid][gUID], 3, GrupaInfo[uid][gSaldo], NazwyDzialalnosci[GrupaInfo[uid][gTyp]], NickGraczaGlobalSQL(GrupaInfo[uid][gOwner]), GrupaInfo[uid][gKolorCzatu], GrupaInfo[uid][gKolorNicku]);
				format(strin, sizeof(strin), "• %s:",GrupaInfo[uid][gNazwa]);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, strin, stri, "Zamknij", "");
			}
			else if(!strcmp(typ,"magazyn",true))
			{
				Magazyn(playerid, DIALOG_MAGAZYNG, "• Grupa » {FFFFFF}Magazyn:", TYP_MAGAZYN, DaneGracza[playerid][gDzialalnosc3], "Wyci¹gnij", "Zamknij");
			}
			else if(!strcmp(typ,"online",true))
			{
				new str[512], temp = 0;
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							if(DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc3] ||
							DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc3] ||
							DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc3] ||
							DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc3] ||
							DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc3] ||
							DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc3])
							{
								temp++;
								format(str, sizeof(str), "%s\n{DEDEDE}[ID: %d]\t%s", str, i, ImieGracza2(i));
							}
						}
					}
				}
				if(temp == 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Brak pracowników na s³u¿bie.", "Zamknij", "");
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Lista pracowników online:", str, "Zamknij", "");
				return 1;
			}
			else if(GetPVarInt(playerid, "g3u7") == 1)
			{
				typ[0] = toupper(typ[0]);
				//format(text, sizeof(text), "[3]%s (( [%d] %s: %s ))", GrupaInfo[DaneGracza[playerid][gDzialalnosc3]][gNazwa], playerid,ZmianaNicku(playerid),typ);
				//Transakcja(T_DGOOC, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, DaneGracza[playerid][gDzialalnosc3], -1, -1, typ, gettime());
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							new ido;
							if(DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc3])
							{
								ido = 1;
							}
							if(DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc3])
							{
								ido = 2;
							}
							if(DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc3])
							{
								ido = 3;
							}
							if(DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc3])
							{
								ido = 4;
							}
							if(DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc3])
							{
								ido = 5;
							}
							if(DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc3])
							{
								ido = 6;
							}
							format(text, sizeof(text), "@%d %s (( %d.%s: %s ))", ido, GrupaInfo[DaneGracza[playerid][gDzialalnosc3]][gNazwa], playerid,ZmianaNicku(playerid),typ);
							if(DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc3] ||
							DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc3] ||
							DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc3] ||
							DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc3] ||
							DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc3] ||
							DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc3])
							{
								//format(text, sizeof(text), "[3]%s (( [%d] %s: %s ))", GrupaInfo[DaneGracza[playerid][gDzialalnosc3]][gNazwa], playerid,ZmianaNicku(playerid),typ);
								DGCZAT(i, DaneGracza[playerid][gKolorChatu3], 0xFFFFFFFF, text);
							}
						}
					}
				}
			}else{
			GameTextForPlayer(playerid, "~r~Brak uprawnien do korzystania z tego kanalu.", 3000, 5);
			}
		}
	    return 1;
	}
	else if(!strcmp(comm1,"4",true))
	{
		if(DaneGracza[playerid][gDzialalnosc4] != 0 && GraczPremium(playerid))
		{
			if(BlokadaOOC(playerid))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Nie mo¿esz tego zrobiæ, poniewa¿ posiadasz aktywn¹ blokade czatów OOC{DEDEDE} \
				\nJeœli uwa¿asz, ¿e kara zosta³a nadana nies³usznie{DEDEDE} mo¿esz od niej apelowaæ na forum (www."PROJEKT"{DEDEDE}).", "Zamknij", "");
				return 0;
			}
			new typ[124];
			if(sscanf(comm2, "s[124]", typ))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Aby pisaæ na czacie grupowym{DEDEDE} wpisz: /g 4 [treœæ]", "Zamknij", "");
				return 1;
			}
			if(!strcmp(typ,"v",true))
			{
				new	list_vehicles[2048], find = 0;
				ForeachEx(i, MAX_VEH)
				{
					if(PojazdInfo[i][pOwnerPostac] == 0  && PojazdInfo[i][pOwnerDzialalnosc] == DaneGracza[playerid][gDzialalnosc4])
					{
						if(PojazdInfo[i][pSpawn] != 0)
						{
							format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t%s", list_vehicles, PojazdInfo[i][pUID], GetVehicleModelName(PojazdInfo[i][pModel]));
						}
						else format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t{DEDEDE}%s", list_vehicles, PojazdInfo[i][pUID], GetVehicleModelName(PojazdInfo[i][pModel]));
						find++;
					}
				}
				if(find > 0) dShowPlayerDialog(playerid, DIALOG_VEH_SPAWN_DZ, DIALOG_STYLE_LIST, "• Pojazdy:", list_vehicles, "Wybierz", "Wiêcej");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Ta grupa nie{DEDEDE} posiada ¿adnych pojazdów.", "Zamknij", "");
				return 1;
			}
			else if(!strcmp(typ,"info",true))
			{
				new stri[256], strin[256];
				new uid = DaneGracza[playerid][gDzialalnosc4];
				format(stri, sizeof(stri), "UID:\t\t\t\t%d\nSlot:\t\t\t\t%d\nBud¿et grupy:\t\t\t$%d\nTyp grupy:\t\t\t%s\nW³aœciciel:\t\t\t%s\n\n\n1\t{%s}Kolor czatu OOC\n\n2\t{%s}Kolor nicków",GrupaInfo[uid][gUID], 4, GrupaInfo[uid][gSaldo], NazwyDzialalnosci[GrupaInfo[uid][gTyp]], NickGraczaGlobalSQL(GrupaInfo[uid][gOwner]), GrupaInfo[uid][gKolorCzatu], GrupaInfo[uid][gKolorNicku]);
				format(strin, sizeof(strin), "• %s:",GrupaInfo[uid][gNazwa]);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, strin, stri, "Zamknij", "");
			}
			else if(!strcmp(typ,"magazyn",true))
			{
				Magazyn(playerid, DIALOG_MAGAZYNG, "• Grupa » {FFFFFF}Magazyn:", TYP_MAGAZYN, DaneGracza[playerid][gDzialalnosc4], "Wyci¹gnij", "Zamknij");
			}
			else if(!strcmp(typ,"online",true))
			{
				new str[512], temp = 0;
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							if(DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc4] ||
							DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc4] ||
							DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc4] ||
							DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc4] ||
							DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc4] ||
							DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc4])
							{
								temp++;
								format(str, sizeof(str), "%s\n{DEDEDE}[ID: %d]\t%s", str, i, ImieGracza2(i));
							}
						}
					}
				}
				if(temp == 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Brak pracowników na s³u¿bie.", "Zamknij", "");
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Lista pracowników online:", str, "Zamknij", "");
				return 1;
			}
			else if(GetPVarInt(playerid, "g4u7") == 1)
			{
				typ[0] = toupper(typ[0]);
				//format(text, sizeof(text), "[4]%s (( [%d] %s: %s ))", GrupaInfo[DaneGracza[playerid][gDzialalnosc4]][gNazwa], playerid,ZmianaNicku(playerid),typ);
				//Transakcja(T_DGOOC, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, DaneGracza[playerid][gDzialalnosc4], -1, -1, typ, gettime());
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							new ido;
							if(DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc4])
							{
								ido = 1;
							}
							if(DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc4])
							{
								ido = 2;
							}
							if(DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc4])
							{
								ido = 3;
							}
							if(DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc4])
							{
								ido = 4;
							}
							if(DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc4])
							{
								ido = 5;
							}
							if(DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc4])
							{
								ido = 6;
							}
							format(text, sizeof(text), "@%d %s (( %d.%s: %s ))", ido, GrupaInfo[DaneGracza[playerid][gDzialalnosc4]][gNazwa], playerid,ZmianaNicku(playerid),typ);
							if(DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc4] ||
							DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc4] ||
							DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc4] ||
							DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc4] ||
							DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc4] ||
							DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc4])
							{
								//format(text, sizeof(text), "[4]%s (( [%d] %s: %s ))", GrupaInfo[DaneGracza[playerid][gDzialalnosc4]][gNazwa], playerid,ZmianaNicku(playerid),typ);
								DGCZAT(i, DaneGracza[playerid][gKolorChatu4], 0xFFFFFFFF, text);
							}
						}
					}
				}
			}else{
			GameTextForPlayer(playerid, "~r~Brak uprawnien do korzystania z tego kanalu.", 3000, 5);
			}
		}
	    return 1;
	}
	else if(!strcmp(comm1,"5",true))
	{
		if(DaneGracza[playerid][gDzialalnosc5] != 0 && GraczPremium(playerid))
		{
			if(BlokadaOOC(playerid))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Nie mo¿esz tego zrobiæ, poniewa¿ posiadasz aktywn¹ blokade czatów OOC{DEDEDE} \
				\nJeœli uwa¿asz, ¿e kara zosta³a nadana nies³usznie{DEDEDE} mo¿esz od niej apelowaæ na forum (www."PROJEKT"{DEDEDE}).", "Zamknij", "");
				return 0;
			}
			new typ[124];
			if(sscanf(comm2, "s[124]", typ))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Aby pisaæ na czacie grupowym{DEDEDE} wpisz: /g 5 [treœæ]", "Zamknij", "");
				return 1;
			}
			if(!strcmp(typ,"v",true))
			{
				new	list_vehicles[2048], find = 0;
				ForeachEx(i, MAX_VEH)
				{
					if(PojazdInfo[i][pOwnerPostac] == 0  && PojazdInfo[i][pOwnerDzialalnosc] == DaneGracza[playerid][gDzialalnosc5])
					{
						if(PojazdInfo[i][pSpawn] != 0)
						{
							format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t%s", list_vehicles, PojazdInfo[i][pUID], GetVehicleModelName(PojazdInfo[i][pModel]));
						}
						else format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t{DEDEDE}%s", list_vehicles, PojazdInfo[i][pUID], GetVehicleModelName(PojazdInfo[i][pModel]));
						find++;
					}
				}
				if(find > 0) dShowPlayerDialog(playerid, DIALOG_VEH_SPAWN_DZ, DIALOG_STYLE_LIST, "• Pojazdy:", list_vehicles, "Wybierz", "Wiêcej");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Ta grupa nie{DEDEDE} posiada ¿adnych pojazdów.", "Zamknij", "");
				return 1;
			}
			else if(!strcmp(typ,"info",true))
			{
				new stri[256], strin[256];
				new uid = DaneGracza[playerid][gDzialalnosc5];
				format(stri, sizeof(stri), "UID:\t\t\t\t%d\nSlot:\t\t\t\t%d\nBud¿et grupy:\t\t\t$%d\nTyp grupy:\t\t\t%s\nW³aœciciel:\t\t\t%s\n\n\n1\t{%s}Kolor czatu OOC\n\n2\t{%s}Kolor nicków",GrupaInfo[uid][gUID], 5, GrupaInfo[uid][gSaldo], NazwyDzialalnosci[GrupaInfo[uid][gTyp]], NickGraczaGlobalSQL(GrupaInfo[uid][gOwner]), GrupaInfo[uid][gKolorCzatu], GrupaInfo[uid][gKolorNicku]);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, strin, stri, "Zamknij", "");
			}
			else if(!strcmp(typ,"magazyn",true))
			{
				Magazyn(playerid, DIALOG_MAGAZYNG, "• Grupa » {FFFFFF}Magazyn:", TYP_MAGAZYN, DaneGracza[playerid][gDzialalnosc5],"Wyci¹gnij", "Zamknij");
			}
			else if(!strcmp(typ,"online",true))
			{
				new str[512], temp = 0;
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							if(DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc5] ||
							DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc5] ||
							DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc5] ||
							DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc5] ||
							DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc5] ||
							DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc5])
							{
								temp++;
								format(str, sizeof(str), "%s\n{DEDEDE}[ID: %d]\t%s", str, i, ImieGracza2(i));
							}
						}
					}
				}
				if(temp == 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Brak pracowników na s³u¿bie.", "Zamknij", "");
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Lista pracowników online:", str, "Zamknij", "");
				return 1;
			}
			else if(GetPVarInt(playerid, "g5u7") == 1)
			{
				typ[0] = toupper(typ[0]);
				//format(text, sizeof(text), "[5]%s (( [%d] %s: %s ))", GrupaInfo[DaneGracza[playerid][gDzialalnosc5]][gNazwa], playerid,ZmianaNicku(playerid),typ);
				//Transakcja(T_DGOOC, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, DaneGracza[playerid][gDzialalnosc5], -1, -1, typ, gettime());
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							new ido;
							if(DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc5])
							{
								ido = 1;
							}
							if(DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc5])
							{
								ido = 2;
							}
							if(DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc5])
							{
								ido = 3;
							}
							if(DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc5])
							{
								ido = 4;
							}
							if(DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc5])
							{
								ido = 5;
							}
							if(DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc5])
							{
								ido = 6;
							}
							format(text, sizeof(text), "@%d %s (( %d.%s: %s ))", ido, GrupaInfo[DaneGracza[playerid][gDzialalnosc5]][gNazwa], playerid,ZmianaNicku(playerid),typ);
							if(DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc5] ||
							DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc5] ||
							DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc5] ||
							DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc5] ||
							DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc5] ||
							DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc5])
							{
								//format(text, sizeof(text), "[5]%s (( [%d] %s: %s ))", GrupaInfo[DaneGracza[playerid][gDzialalnosc5]][gNazwa], playerid,ZmianaNicku(playerid),typ);
								DGCZAT(i, DaneGracza[playerid][gKolorChatu5], 0xFFFFFFFF, text);
							}
						}
					}
				}
			}else{
			GameTextForPlayer(playerid, "~r~Brak uprawnien do korzystania z tego kanalu.", 3000, 5);
			}
  }
	    return 1;
	}
	else if(!strcmp(comm1,"6",true))
	{
		if(DaneGracza[playerid][gDzialalnosc6] != 0 && GraczPremium(playerid))
		{
			if(BlokadaOOC(playerid))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Nie mo¿esz tego zrobiæ, poniewa¿ posiadasz aktywn¹ blokade czatów OOC{DEDEDE} \
				\nJeœli uwa¿asz, ¿e kara zosta³a nadana nies³usznie{DEDEDE} mo¿esz od niej apelowaæ na forum (www."PROJEKT"{DEDEDE}).", "Zamknij", "");
				return 0;
			}
			new typ[124];
			if(sscanf(comm2, "s[124]", typ))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Aby pisaæ na czacie grupowym{DEDEDE} wpisz: /g 6 [treœæ]", "Zamknij", "");
				return 1;
			}
			if(!strcmp(typ,"v",true))
			{
				new	list_vehicles[2048], find = 0;
				ForeachEx(i, MAX_VEH)
				{
					if(PojazdInfo[i][pOwnerPostac] == 0  && PojazdInfo[i][pOwnerDzialalnosc] == DaneGracza[playerid][gDzialalnosc6])
					{
						if(PojazdInfo[i][pSpawn] != 0)
						{
							format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t%s", list_vehicles, PojazdInfo[i][pUID], GetVehicleModelName(PojazdInfo[i][pModel]));
						}
						else format(list_vehicles, sizeof(list_vehicles), "%s\n%d\t{DEDEDE}%s", list_vehicles, PojazdInfo[i][pUID], GetVehicleModelName(PojazdInfo[i][pModel]));
						find++;
					}
				}
				if(find > 0) dShowPlayerDialog(playerid, DIALOG_VEH_SPAWN_DZ, DIALOG_STYLE_LIST, "• Pojazdy:", list_vehicles, "Wybierz", "Wiêcej");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Ta grupa nie{DEDEDE} posiada ¿adnych pojazdów.", "Zamknij", "");
				return 1;
			}
			else if(!strcmp(typ,"info",true))
			{
				new stri[256], strin[256];
				new uid = DaneGracza[playerid][gDzialalnosc6];
				format(stri, sizeof(stri), "UID:\t\t\t\t%d\nSlot:\t\t\t\t%d\nBud¿et grupy:\t\t\t$%d\nTyp grupy:\t\t\t%s\nW³aœciciel:\t\t\t%s\n\n\n1\t{%s}Kolor czatu OOC\n\n2\t{%s}Kolor nicków",GrupaInfo[uid][gUID], 6, GrupaInfo[uid][gSaldo], NazwyDzialalnosci[GrupaInfo[uid][gTyp]], NickGraczaGlobalSQL(GrupaInfo[uid][gOwner]), GrupaInfo[uid][gKolorCzatu], GrupaInfo[uid][gKolorNicku]);
				format(strin, sizeof(strin), "• %s:",GrupaInfo[uid][gNazwa]);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, strin, stri, "Zamknij", "");
			}
			else if(!strcmp(typ,"magazyn",true))
			{
				Magazyn(playerid, DIALOG_MAGAZYNG, "• Grupa » {FFFFFF}Magazyn:", TYP_MAGAZYN, DaneGracza[playerid][gDzialalnosc6], "Wyci¹gnij", "Zamknij");
			}
			else if(!strcmp(typ,"online",true))
			{
				new str[512], temp = 0;
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							if(DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc6] ||
							DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc6] ||
							DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc6] ||
							DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc6] ||
							DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc6] ||
							DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc6])
							{
								temp++;
								format(str, sizeof(str), "%s\n{DEDEDE}[ID: %d]\t%s", str, i, ImieGracza2(i));
							}
						}
					}
				}
				if(temp == 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Brak pracowników na s³u¿bie.", "Zamknij", "");
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Lista pracowników online:", str, "Zamknij", "");
				return 1;
			}
			else if(GetPVarInt(playerid, "g6u7") == 1)
			{
				typ[0] = toupper(typ[0]);
				//format(text, sizeof(text), "[6]%s (( [%d] %s: %s ))", GrupaInfo[DaneGracza[playerid][gDzialalnosc6]][gNazwa], playerid,ZmianaNicku(playerid),typ);
				//Transakcja(T_DGOOC, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, DaneGracza[playerid][gDzialalnosc6], -1, -1, typ, gettime());
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							new ido;
							if(DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc6])
							{
								ido = 1;
							}
							if(DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc6])
							{
								ido = 2;
							}
							if(DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc6])
							{
								ido = 3;
							}
							if(DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc6])
							{
								ido = 4;
							}
							if(DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc6])
							{
								ido = 5;
							}
							if(DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc6])
							{
								ido = 6;
							}
							format(text, sizeof(text), "@%d %s (( %d.%s: %s ))", ido, GrupaInfo[DaneGracza[playerid][gDzialalnosc6]][gNazwa], playerid,ZmianaNicku(playerid),typ);
							if(DaneGracza[i][gDzialalnosc1] == DaneGracza[playerid][gDzialalnosc6] ||
							DaneGracza[i][gDzialalnosc2] == DaneGracza[playerid][gDzialalnosc6] ||
							DaneGracza[i][gDzialalnosc3] == DaneGracza[playerid][gDzialalnosc6] ||
							DaneGracza[i][gDzialalnosc4] == DaneGracza[playerid][gDzialalnosc6] ||
							DaneGracza[i][gDzialalnosc5] == DaneGracza[playerid][gDzialalnosc6] ||
							DaneGracza[i][gDzialalnosc6] == DaneGracza[playerid][gDzialalnosc6])
							{
							   // format(text, sizeof(text), "[6]%s (( [%d] %s: %s ))", GrupaInfo[DaneGracza[playerid][gDzialalnosc6]][gNazwa], playerid,ZmianaNicku(playerid),typ);
								DGCZAT(i, DaneGracza[playerid][gKolorChatu6], 0xFFFFFFFF, text);
							}
						}
					}
				}
			}else{
			GameTextForPlayer(playerid, "~r~Brak uprawnien do korzystania z tego kanalu.", 3000, 5);
			}
		}
	    return 1;
	}
	else if(!strcmp(comm1,"wypros",true))
	{
	    new typ, war1;
		if(sscanf(comm2, "dd", typ, war1))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Aby wyprosiæ{DEDEDE} gracza z grupy{DEDEDE} wpisz: /g wypros [grupa 1-6] [Id Gracza]", "Zamknij", "");
			return 1;
		}
		if(typ == 1 && GetPVarInt(playerid, "g1u20") == 1)
		{
	       	WywalzDZ(playerid, war1, DaneGracza[playerid][gDzialalnosc1]);
		}
		else if(typ == 2 && GetPVarInt(playerid, "g2u20") == 1)
		{
	        WywalzDZ(playerid, war1, DaneGracza[playerid][gDzialalnosc2]);
		}
		else if(typ == 3 && GetPVarInt(playerid, "g3u20") == 1)
		{
	        WywalzDZ(playerid, war1, DaneGracza[playerid][gDzialalnosc3]);
		}
		else if(typ == 4 && GetPVarInt(playerid, "g4u20") == 1)
		{
	        WywalzDZ(playerid, war1, DaneGracza[playerid][gDzialalnosc4]);
		}
		else if(typ == 5 && GetPVarInt(playerid, "g5u20") == 1)
		{
	        WywalzDZ(playerid, war1, DaneGracza[playerid][gDzialalnosc5]);
		}
		else if(typ == 6 && GetPVarInt(playerid, "g6u20") == 1)
		{
	   	    WywalzDZ(playerid, war1, DaneGracza[playerid][gDzialalnosc6]);
		}
		return 1;
	}
	else if(!strcmp(comm1,"zapros",true))
	{
	    new typ, war1;
		if(sscanf(comm2, "dd", typ, war1))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby zaprosiæ gracza do grupy wpisz: /g zapros [grupy 1-6] [Id Gracza]", "Zamknij", "");
			return 1;
		}
		if(!PlayerObokPlayera(playerid, war1, 5))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz którego chcesz zaprosiæ nie znajduje siê obok ciebie.", "Zamknij", "");
			return 1;
		}
		if(DaneGracza[war1][gKONTO_W_BANKU] == 0)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz którego chcesz zaprosiæ nie posiada konta w banku.", "Zamknij", "");
			return 1;
		}
		if(playerid != war1 && IsPlayerConnected(war1))
		{
			if(typ == 1)
			{
				if(GetPVarInt(playerid, "g1u20") == 1)
				{
					SprawdzDostepnoscDzialalnosci(playerid, war1, DaneGracza[playerid][gDzialalnosc1]);
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Brak uprawnieñ zapraszania do grupy, poproœ w³asciciela grupy o uprawnienia!", "Zamknij", "");
					return 1;
				}
			}
			else if(typ == 2)
			{
				if(GetPVarInt(playerid, "g2u20") == 1)
				{
					SprawdzDostepnoscDzialalnosci(playerid, war1, DaneGracza[playerid][gDzialalnosc2]);
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Brak uprawnieñ zapraszania do grupy, poproœ w³asciciela grupy o uprawnienia!", "Zamknij", "");
					return 1;
				}
			}
			else if(typ == 3)
			{
				if(GetPVarInt(playerid, "g3u20") == 1)
				{
					SprawdzDostepnoscDzialalnosci(playerid, war1, DaneGracza[playerid][gDzialalnosc3]);
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Brak uprawnieñ zapraszania do grupy, poproœ w³asciciela grupy o uprawnienia!", "Zamknij", "");
					return 1;
				}
			}
			else if(typ == 4)
			{
				if(GetPVarInt(playerid, "g4u20") == 1)
				{
					SprawdzDostepnoscDzialalnosci(playerid, war1, DaneGracza[playerid][gDzialalnosc4]);
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Brak uprawnieñ zapraszania do grupy, poproœ w³asciciela grupy o uprawnienia!", "Zamknij", "");
					return 1;
				}
			}
			else if(typ == 5)
			{
				if(GetPVarInt(playerid, "g5u20") == 1)
				{
					SprawdzDostepnoscDzialalnosci(playerid, war1, DaneGracza[playerid][gDzialalnosc5]);
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Brak uprawnieñ zapraszania do grupy, poproœ w³asciciela grupy o uprawnienia!", "Zamknij", "");
					return 1;
				}
			}
			else if(typ == 6)
			{
				if(GetPVarInt(playerid, "g6u20") == 1)
				{
					SprawdzDostepnoscDzialalnosci(playerid, war1, DaneGracza[playerid][gDzialalnosc6]);
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Brak uprawnieñ zapraszania do grupy, poproœ w³asciciela grupy o uprawnienia!", "Zamknij", "");
					return 1;
				}
			}
		}
		return 1;
	}
	return 1;
}
forward ZaladujDzialalnoscis();
public ZaladujDzialalnoscis()
{
	new result[450], iz = 0;
	format(zapyt, sizeof(zapyt), "SELECT `ID`, `NAZWA`, `TYP`, `GUID_OWNERA`, `KOLOR_CZATU`, `SALDO`, `UID_OWNERA`, `TEREN`, `ORG`, `WOJNA`, `KOLOR_NICKU` FROM `jochym_dzialalnosci`");
	mysql_check();
	mysql_query2(zapyt);
	mysql_store_result();

	while(mysql_fetch_row(result))
	{
		new uid;
		sscanf(result, "p<|>d", uid);
		sscanf(result,  "p<|>ds[50]dds[20]ddddds[50]", GrupaInfo[uid][gUID],
		GrupaInfo[uid][gNazwa],
		GrupaInfo[uid][gTyp],
		GrupaInfo[uid][gOwner],
		GrupaInfo[uid][gKolorCzatu],
		GrupaInfo[uid][gSaldo],
		GrupaInfo[uid][gOwnerUID],
		GrupaInfo[uid][gTeren],
		GrupaInfo[uid][gOrg],
		GrupaInfo[uid][gWojna],
		GrupaInfo[uid][gKolorNicku]);
		format(GrupaInfo[uid][gKolorTerenu], 50, "0x%sAA", GrupaInfo[uid][gKolorNicku]);
		iz++;
	}
	mysql_free_result();
	printf("Grup     - %d", iz);
}
forward ZaladujDzialalnoscisPracownika(id, playerid);
public ZaladujDzialalnoscisPracownika(id, playerid)
{
	new result[450], iz = 0;
	format(zapyt, sizeof(zapyt), "SELECT `ID`, `NAZWA`, `TYP`, `GUID_OWNERA`, `KOLOR_CZATU`, `UID_OWNERA`, `TEREN`, `ORG`, `WOJNA`, `KOLOR_NICKU` FROM `jochym_dzialalnosci` WHERE `ID` = %d", id);
	mysql_check();
	mysql_query2(zapyt);
	mysql_store_result();
	while(mysql_fetch_row(result))
	{
		new uid;
		sscanf(result, "p<|>d", uid);
		sscanf(result,  "p<|>ds[50]dds[20]dddds[50]", GrupaInfo[uid][gUID],
		GrupaInfo[uid][gNazwa],
		GrupaInfo[uid][gTyp],
		GrupaInfo[uid][gOwner],
		GrupaInfo[uid][gKolorCzatu],
		GrupaInfo[uid][gOwnerUID],
		GrupaInfo[uid][gTeren],
		GrupaInfo[uid][gOrg],
		GrupaInfo[uid][gWojna],
		GrupaInfo[uid][gKolorNicku]);
		format(GrupaInfo[uid][gKolorTerenu], 50, "0x%sAA", GrupaInfo[uid][gKolorNicku]);
		iz++;
	}
	mysql_free_result();
}
stock POD_DZIALALNOSC(playerid, dialog)
{
	new dz[1024];
	if(DaneGracza[playerid][gDzialalnosc1] != 0 || DaneGracza[playerid][gDzialalnosc2] != 0 || DaneGracza[playerid][gDzialalnosc3] != 0 && GraczPremium(playerid) || DaneGracza[playerid][gDzialalnosc4] != 0 && GraczPremium(playerid) || DaneGracza[playerid][gDzialalnosc5] != 0 && GraczPremium(playerid) || DaneGracza[playerid][gDzialalnosc6] != 0 && GraczPremium(playerid))
	{
		if(DaneGracza[playerid][gDzialalnosc1] != 0 && GrupaInfo[DaneGracza[playerid][gDzialalnosc1]][gOwnerUID] == DaneGracza[playerid][gUID] || DaneGracza[playerid][gDzialalnosc1] != 0 && ZarzadzanieGrupaUID(playerid, DaneGracza[playerid][gDzialalnosc1])) format(dz, sizeof(dz), "%s\n1.\t{DEDEDE}»  %s {DEDEDE}(UID: %d)", dz,GrupaInfo[DaneGracza[playerid][gDzialalnosc1]][gNazwa],DaneGracza[playerid][gDzialalnosc1]);
		if(DaneGracza[playerid][gDzialalnosc2] != 0 && GrupaInfo[DaneGracza[playerid][gDzialalnosc2]][gOwnerUID] == DaneGracza[playerid][gUID] || DaneGracza[playerid][gDzialalnosc2] != 0 && ZarzadzanieGrupaUID(playerid, DaneGracza[playerid][gDzialalnosc2])) format(dz, sizeof(dz), "%s\n2.\t{DEDEDE}»  %s {DEDEDE}(UID: %d)", dz,GrupaInfo[DaneGracza[playerid][gDzialalnosc2]][gNazwa],DaneGracza[playerid][gDzialalnosc2]);
		if(DaneGracza[playerid][gDzialalnosc3] != 0 && GrupaInfo[DaneGracza[playerid][gDzialalnosc3]][gOwnerUID] == DaneGracza[playerid][gUID] || DaneGracza[playerid][gDzialalnosc3] != 0 && ZarzadzanieGrupaUID(playerid, DaneGracza[playerid][gDzialalnosc3])) format(dz, sizeof(dz), "%s\n3.\t{DEDEDE}»  %s {DEDEDE}(UID: %d)", dz,GrupaInfo[DaneGracza[playerid][gDzialalnosc3]][gNazwa],DaneGracza[playerid][gDzialalnosc3]);
		if(DaneGracza[playerid][gDzialalnosc4] != 0 && GraczPremium(playerid) && GrupaInfo[DaneGracza[playerid][gDzialalnosc4]][gOwnerUID] == DaneGracza[playerid][gUID] || DaneGracza[playerid][gDzialalnosc4] != 0 && GraczPremium(playerid) && ZarzadzanieGrupaUID(playerid, DaneGracza[playerid][gDzialalnosc4])) format(dz, sizeof(dz), "%s\n4.\t{DEDEDE}»  %s {DEDEDE}(UID: %d)", dz,GrupaInfo[DaneGracza[playerid][gDzialalnosc4]][gNazwa],DaneGracza[playerid][gDzialalnosc4]);
		if(DaneGracza[playerid][gDzialalnosc5] != 0 && GraczPremium(playerid) && GrupaInfo[DaneGracza[playerid][gDzialalnosc5]][gOwnerUID] == DaneGracza[playerid][gUID] || DaneGracza[playerid][gDzialalnosc5] != 0 && GraczPremium(playerid) && ZarzadzanieGrupaUID(playerid, DaneGracza[playerid][gDzialalnosc5])) format(dz, sizeof(dz), "%s\n5.\t{DEDEDE}»  %s {DEDEDE}(UID: %d)", dz,GrupaInfo[DaneGracza[playerid][gDzialalnosc5]][gNazwa],DaneGracza[playerid][gDzialalnosc5]);
		if(DaneGracza[playerid][gDzialalnosc6] != 0 && GraczPremium(playerid) && GrupaInfo[DaneGracza[playerid][gDzialalnosc6]][gOwnerUID] == DaneGracza[playerid][gUID] || DaneGracza[playerid][gDzialalnosc6] != 0 && GraczPremium(playerid) && ZarzadzanieGrupaUID(playerid, DaneGracza[playerid][gDzialalnosc6])) format(dz, sizeof(dz), "%s\n6.\t{DEDEDE}»  %s {DEDEDE}(UID: %d)", dz,GrupaInfo[DaneGracza[playerid][gDzialalnosc6]][gNazwa],DaneGracza[playerid][gDzialalnosc6]);
		dShowPlayerDialog(playerid, dialog, DIALOG_STYLE_LIST, "• Grupy:", dz, "Wybierz", "Zamknij");
		return 1;
	}
	if(DaneGracza[playerid][gDzialalnosc1] == 0 && DaneGracza[playerid][gDzialalnosc2] == 0 && DaneGracza[playerid][gDzialalnosc3] == 0 && DaneGracza[playerid][gDzialalnosc4] == 0 && DaneGracza[playerid][gDzialalnosc5] == 0 && DaneGracza[playerid][gDzialalnosc6] == 0)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• TIP:", "Nie nale¿ysz do ¿adnych grup!", "Zamknij", "");
		return 1;
	}
	return 1;
}
forward ZapiszLidera(uid);
public ZapiszLidera(uid)
{
	strdel(zapyt, 0, 1024);
    format(zapyt, sizeof(zapyt),"UPDATE `jochym_dzialalnosci` SET `GUID_OWNERA` = '%d', `UID_OWNERA` = '%d' WHERE `ID`='%d'",
	GrupaInfo[uid][gOwner], GrupaInfo[uid][gOwnerUID], GrupaInfo[uid][gUID]);
    mysql_query(zapyt);
	return 1;
}
forward ZapiszSaldo(uid);
public ZapiszSaldo(uid)
{
	strdel(zapyt, 0, 1024);
    format(zapyt, sizeof(zapyt),"UPDATE `jochym_dzialalnosci` SET `SALDO` = '%d' WHERE `ID`='%d'", GrupaInfo[uid][gSaldo],
	GrupaInfo[uid][gUID]);
    mysql_query(zapyt);
	return 1;
}
forward ZapiszWojne(uid);
public ZapiszWojne(uid)
{
	strdel(zapyt, 0, 1024);
    format(zapyt, sizeof(zapyt),"UPDATE `jochym_dzialalnosci` SET `TEREN`= '%d', `ORG`= '%d', `WOJNA`= '%d' WHERE `ID`= '%d'", GrupaInfo[uid][gTeren], GrupaInfo[uid][gOrg], GrupaInfo[uid][gWojna],
	GrupaInfo[uid][gUID]);
    mysql_query(zapyt);
	return 1;
}
forward DodajGrupe(playerid, nazwa[], typ, przywileje[], skiny[]);
public DodajGrupe(playerid, nazwa[], typ, przywileje[], skiny[])
{
	new id = GetFreeSQLUID("jochym_dzialalnosci", "ID");
	strdel(zapyt, 0, 1024);
	format( zapyt, sizeof( zapyt ), "INSERT INTO `jochym_dzialalnosci` (`ID`,`NAZWA`, `TYP`, `PRZYWILEJE`, `GUID_OWNERA`, `UID_OWNERA`, `TEREN`, `ORG`, `WOJNA`, `SKINY`) VALUES ('%d', '%s', '%d', '%s', '%d', '%d', '%d', '%d', '%d', '%s')",
		 id, nazwa, typ, przywileje, DaneGracza[playerid][gGUID], DaneGracza[playerid][gUID], 0, 0, 0, skiny);
	mysql_query(zapyt);
	GrupaInfo[id][gUID] = id;
	format(GrupaInfo[id][gNazwa], 50, "%s", nazwa);
	GrupaInfo[id][gTyp] = typ;
	GrupaInfo[id][gOwner] = DaneGracza[playerid][gGUID];
	format(GrupaInfo[id][gKolorCzatu], 50, "%s", "FFFFFF");
	format(GrupaInfo[id][gKolorNicku], 50, "%s", "DEDEDE");
	format(GrupaInfo[id][gKolorTerenu], 50, "%s", "DEDEDE");
	GrupaInfo[id][gSaldo] = 0;
	GrupaInfo[id][gOwnerUID] = DaneGracza[playerid][gUID];
	GrupaInfo[id][gTeren] = 0;
	GrupaInfo[id][gOrg] = 0;
	GrupaInfo[id][gWojna] = 0;
	//
	strdel(zapyt, 0, 1024);
	new ids = GetFreeSQLUID("jochym_rangi", "ID");
	format( zapyt, sizeof( zapyt ), "INSERT INTO `jochym_rangi` (`ID`,`UID_DZIALALNOSCI`) VALUES ('%d', '%d')", ids, id);
	mysql_query(zapyt);
	//
	return id;
}
forward DodajGrupeLD(playerid2, nazwa[], typ);
public DodajGrupeLD(playerid2, nazwa[], typ)
{
	new id = GetFreeSQLUID("jochym_dzialalnosci", "ID");
	strdel(zapyt, 0, 1024);
	format( zapyt, sizeof( zapyt ), "INSERT INTO `jochym_dzialalnosci` (`ID`,`NAZWA`, `TYP`, `PRZYWILEJE`, `GUID_OWNERA`, `UID_OWNERA`, `TEREN`, `ORG`, `WOJNA`, `SKINY`) VALUES ('%d', '%s', '%d', '0', '%d', '%d', '%d', '%d', '%d', '-1')",
		 id, nazwa, typ, DaneGracza[playerid2][gGUID], DaneGracza[playerid2][gUID], 0, 0, 0);
	mysql_query(zapyt);
	GrupaInfo[id][gUID] = id;
	format(GrupaInfo[id][gNazwa], 50, "%s", nazwa);
	GrupaInfo[id][gTyp] = typ;
	GrupaInfo[id][gOwner] = DaneGracza[playerid2][gGUID];
	format(GrupaInfo[id][gKolorCzatu], 50, "%s", "FFFFFF");
	format(GrupaInfo[id][gKolorNicku], 50, "%s", "DEDEDE");
	format(GrupaInfo[id][gKolorTerenu], 50, "%s", "DEDEDE");
	GrupaInfo[id][gSaldo] = 0;
	GrupaInfo[id][gOwnerUID] = DaneGracza[playerid2][gUID];
	GrupaInfo[id][gTeren] = 0;
	GrupaInfo[id][gOrg] = 0;
	GrupaInfo[id][gWojna] = 0;
	DaneGracza[playerid2][gGrupas] = GrupaInfo[id][gUID];
	//
	strdel(zapyt, 0, 1024);
	new ids = GetFreeSQLUID("jochym_rangi", "ID");
	format( zapyt, sizeof( zapyt ), "INSERT INTO `jochym_rangi` (`ID`,`UID_DZIALALNOSCI`) VALUES ('%d', '%d')", ids, id);
	mysql_query(zapyt);
	//
	return id;
}
