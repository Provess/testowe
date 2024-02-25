AntiDeAMX();
enum objKolczatka
{
	kSAMP,
	Float:kPozX,
	Float:kPozY,
	Float:kPozZ,
	Float:kRotX,
	Float:kRotY,
	Float:kRotZ,
	kvWorld,
	kModel,
	kUzyta
}
new KolczatkaInfo[MAX_KOLCZATEK][objKolczatka];
enum objBlokada2
{
	kSAMP,
	Float:kPozX,
	Float:kPozY,
	Float:kPozZ,
	Float:kRotX,
	Float:kRotY,
	Float:kRotZ,
	kvWorld,
	kModel,
	kUzyta
}
new Blokada2Info[MAX_BLOKAD2][objBlokada2];
enum gPoszukiwany
{
	kID,
	kUID,
	kUIDN,
	kNick[64],
	kNickN[64],
	kGUID,
	kGUIDN,
	kData[64],
	kGodzina[64],
	kPowod[124],
	kTyp
}
new PoszukiwanyInfo[MAX_KARTOTEKA][gPoszukiwany];
enum gKartoteka
{
	kID,
	kUID,
	kUIDN,
	kNick[64],
	kNickN[64],
	kGUID,
	kGUIDN,
	kData[64],
	kGodzina[64],
	kPowod[124],
	kTyp
}
new KartotekaInfo[MAX_KARTOTEKA][gKartoteka];
forward UsunKartoteka(uid);
public UsunKartoteka(uid)
{
	format(zapyt, sizeof(zapyt), "DELETE FROM `jochym_kartotekaaa` WHERE `ID` = '%d'", uid);
	mysql_check();
	mysql_query2(zapyt);
	KartotekaInfo[uid][kID] = 0;
	KartotekaInfo[uid][kUID] = 0;
	KartotekaInfo[uid][kUIDN] = 0;
	KartotekaInfo[uid][kGUID] = 0;
	KartotekaInfo[uid][kGUIDN] = 0;
	KartotekaInfo[uid][kTyp] = 0;
	mysql_free_result();
	return 1;
}
new typ_wpisu_kartoteka[3][124] =
{
	{"Wpis"},
	{"Mandat"},
	{"Przetrzymanie"}
};
forward ZaladujKartoteki();
public ZaladujKartoteki()
{
	new sql[ 500 ], id = false;
	mysql_query( "SELECT * FROM `jochym_kartotekaaa`" );
	mysql_store_result( );
	while( mysql_fetch_row( sql ) )
	{
	    sscanf( sql, "p<|>i", id );
	    sscanf( sql, "p<|>ddddds[64]s[64]s[64]s[64]s[124]d",
	    KartotekaInfo[id ][kID],
	    KartotekaInfo[id][kUID],
	    KartotekaInfo[id][kUIDN],
		KartotekaInfo[id][kGUID],
		KartotekaInfo[id][kGUIDN],
		KartotekaInfo[id][kNick],
		KartotekaInfo[id][kNickN],
		KartotekaInfo[id][kData],
		KartotekaInfo[id][kGodzina],
		KartotekaInfo[id][kPowod],
		KartotekaInfo[id][kTyp]
	    );
	}
	mysql_free_result( );
	return 1;
}
forward ZaladujPoszukiwania();
public ZaladujPoszukiwania()
{
	new sql[ 500 ], id = false;
	mysql_query( "SELECT * FROM `jochym_poszukiwany`" );
	mysql_store_result( );
	while( mysql_fetch_row( sql ) )
	{
	    sscanf( sql, "p<|>i", id );
	    sscanf( sql, "p<|>ddddds[64]s[64]s[64]s[64]s[124]d",
	    PoszukiwanyInfo[id ][kID],
	    PoszukiwanyInfo[id][kUID],
	    PoszukiwanyInfo[id][kUIDN],
		PoszukiwanyInfo[id][kGUID],
		PoszukiwanyInfo[id][kGUIDN],
		PoszukiwanyInfo[id][kNick],
		PoszukiwanyInfo[id][kNickN],
		PoszukiwanyInfo[id][kData],
		PoszukiwanyInfo[id][kGodzina],
		PoszukiwanyInfo[id][kPowod],
		PoszukiwanyInfo[id][kTyp]
	    );
	}
	mysql_free_result( );
	return 1;
}
CMD:dowod(playerid, cmdtext[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_POLICYJNA)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby u¿yæ tej komendy, musisz znajdowaæ siê na s³u¿bie organizacji porz¹dkowej.", "Zamknij", "");
		return 1;
	}
	new playerid2;
	if(sscanf(cmdtext, "i", playerid2))
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby sprawdziæ dowód wpisz: /dowod [id gracza]", "Zamknij", "");
		return 1;
	}
	if(!PlayerObokPlayera(playerid, playerid2, 3))
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz którego chcesz sprawdziæ jest zbyt daleko od ciebie.", "Zamknij", "");
		return 1;
	}
	if(Dokument(playerid2, D_DOWOD))
	{
  		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz którego obecnie sprawdzasz posiada dowód osobisty.", "Zamknij", "");
		return 1;
	}
	else
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz którego obecnie sprawdzasz nie posiada dowodu osobistego.", "Zamknij", "");
		return 1;
	}
}
CMD:skuj(playerid,cmdtext[])
{
	//printf("U¿yta komenda skuj");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_POLICYJNA)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby u¿yæ tej komendy, musisz znajdowaæ siê na s³u¿bie organizacji porz¹dkowej.", "Zamknij", "");
		return 1;
	}
	if(!GraczaMaTypPrzedmiotu(playerid, P_KAJDANKI))
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby u¿yæ tej komendy, musisz posiadac w ekwipunku kajdanki!", "Zamknij", "");
		return 1;
	}
	new playerid2;
	if(sscanf(cmdtext, "i", playerid2))
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby skuæ gracza wpisz: /skuj [id gracza]", "Zamknij", "");
		return 1;
	}
	if(!PlayerObokPlayera(playerid, playerid2, 3))
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz którego chcesz skuæ jest zbyt daleko od ciebie.", "Zamknij", "");
		return 1;
	}
	if(IsPlayerInAnyVehicle(playerid) && IsPlayerInAnyVehicle(playerid2) || !IsPlayerInAnyVehicle(playerid) && !IsPlayerInAnyVehicle(playerid2))
	{
	    //
	}
	else
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Je¿eli siedzisz w pojeŸdzie, a gracz którego chcesz skuæ nie znajduje siê w nim nie mo¿esz u¿yæ komendy\nJe¿eli znajdujesz siê obok pojazdu a gracz w pojeŸdzie nie skujesz go musisz wejœæ do pojazdu.", "Zamknij", "");
		return 1;
	}
	if(zalogowany[playerid2] == false)
    {
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz którego chcesz skuæ nie znajduje siê obok Ciebie.", "Zamknij", "");
        return 0;
    }
	if(playerid == playerid2) return 1;
	if(DaneGracza[playerid][gSznur] != -1)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz którego próbujesz skuæ jest zwi¹zany!", "Zamknij", "");
		return 0;
	}
	if(IsPlayerInAnyVehicle(playerid2) &&  GetPlayerState(playerid2) == PLAYER_STATE_DRIVER)
	{
		return 0;
	}
	if(DaneGracza[playerid][gKajdanki] != -1)
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Masz na sobie kajdanki, nie mo¿esz tego zrobiæ!", "Zamknij", "");
		return 0;
	}
	if(DaneGracza[playerid2][gKajdanki] == -1)
	{
		if(DaneGracza[playerid2][gBW] != 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz którego próbujesz skuæ jest nieprzytomny!", "Zamknij", "");
		new str[250];
	    DaneGracza[playerid2][gKajdanki] = playerid;
		DaneGracza[playerid][gKajdankiS] = playerid2;
		SetPlayerSpecialAction(playerid2, SPECIAL_ACTION_CUFFED);
		SetPlayerAttachedObject(playerid2, 7, 19418, 6,0.0,0.04,-0.01,0.0,0.0,90.0);
		if(IsPlayerInAnyVehicle(playerid2))
		{
		Frezuj(playerid2, 0);
		format(str, sizeof(str), "przykuwa %s do pojazdu.", ZmianaNicku(playerid2));
		}else{
		format(str, sizeof(str), "za³o¿y³ kajdanki %s na rêce.", ZmianaNicku(playerid2));
		}
	    cmd_fasdasfdfive(playerid, str);
	}
	else
	{
		new str[250];
	    DaneGracza[playerid2][gKajdanki] = -1;
		DaneGracza[playerid][gKajdankiS] = 0;
		SetPlayerSpecialAction(playerid2,SPECIAL_ACTION_NONE);
		RemovePlayerAttachedObject(playerid2, 7);
	    Frezuj(playerid2, 1);
	  	format(str, sizeof(str), "zdj¹³ kajdanki z r¹k %s.", ZmianaNicku(playerid2));
	    cmd_fasdasfdfive(playerid, str);
	}
	return 1;
}
CMD:suszarka(playerid,cmdtext[])
{
	//printf("U¿yta komenda przeszukaj");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_POLICYJNA)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby u¿yæ tej komendy, musisz znajdowaæ siê na s³u¿bie organizacji porz¹dkowej.", "Zamknij", "");
		return 1;
	}
	if(GetPVarInt(playerid, "Suszarka") == 0)
	{
		SetPVarInt(playerid, "Suszarka", 1);
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Suszarka w³¹czona", "Zamknij", "");
		return 1;
	}
	else
	{
	    SetPVarInt(playerid, "Suszarka", 0);
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Suszarka wy³¹czona", "Zamknij", "");
		return 1;
	}
}
//Oferuj(playerid, id, DaneGracza[playerid][gSluzba], pkt, gettime()+CZAS_LETNI, 0, OFEROWANIE_MANDATU, cena, powod, 0);
CMD:mandat(playerid, cmdtext[])
{
	if(DaneGracza[playerid][gSluzba] == 0)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Nie jesteœ na s³u¿bie!", "Zamknij", "");
		return 0;
	}
	if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_POLICYJNA)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Nie jesteœ na s³u¿bie odpowiedniej grupy!", "Zamknij", "");
		return 0;
	}
	new gracz, cena, pkt, powod[256];
	if(sscanf(cmdtext, "ddds[256]", gracz, cena, pkt, powod))
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby oferowaæ graczu mandat wpisz: /mandat [id gracza] [cena] [pkt karne] [powód]", "Zamknij", "");
		return 1;
	}
	if(cena <= 0) return 1;
	if(pkt < 0) return 1;
	if(playerid == gracz) return 1;
	if(!PlayerObokPlayera(playerid, gracz, 3))
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz oferowaæ mandat nie znajduje siê obok ciebie.", "Zamknij", "");
		return 1;
	}
	if(zalogowany[gracz] == false)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz oferowaæ mandat nie jest zalogowany.", "Zamknij", "");
		return 0;
	}
	new akcja[256];
	format(akcja, sizeof(akcja), "%s", powod);
	DodajZadluzenie(0, DaneGracza[gracz][gUID], cena, gettime()+CZAS_LETNI, akcja, -1, gettime()+CZAS_LETNI, 1);
	ZaladujZadluzenia();
	SetPVarInt(gracz, "DlugGracza", 0);
	ForeachEx(id, MAX_HISTORY)
	{
		if(Zadluzenie[id][dUID] == DaneGracza[gracz][gUID] && Zadluzenie[id][dAktywne] == 1)
		{
			SetPVarInt(gracz, "DlugGracza", GetPVarInt(gracz, "DlugGracza")+Zadluzenie[id][dMoney]);
			SetPVarInt(gracz, "ZadluzeniePoTerminie", 0);
			if(Zadluzenie[id][dTime2] < gettime()+CZAS_LETNI)
			{
				SetPVarInt(playerid, "ZadluzeniePoTerminie", GetPVarInt(gracz, "ZadluzeniePoTerminie")+1);
			}
		}
	}
	DodajKartoteke(playerid, gracz, 1, powod);
	DaneGracza[gracz][gPktKarne] += pkt;
	ZapiszGracza(gracz);
	if(DutyNR[playerid] == 1) DaneGracza[playerid][gPrzynaleznosci][3]++;
	else if(DutyNR[playerid] == 2) DaneGracza[playerid][gPrzynaleznosci][9]++;
	else if(DutyNR[playerid] == 3) DaneGracza[playerid][gPrzynaleznosci][15]++;
	else if(DutyNR[playerid] == 4) DaneGracza[playerid][gPrzynaleznosci][21]++;
	else if(DutyNR[playerid] == 5) DaneGracza[playerid][gPrzynaleznosci][27]++;
	else if(DutyNR[playerid] == 6) DaneGracza[playerid][gPrzynaleznosci][33]++;
	StatykujTransakcje(DaneGracza[playerid][gSluzba], playerid, gracz, "Mandat", cena);
	new opismandatu[256];
	format(opismandatu, sizeof(opismandatu), "Wystawi³eœ mandat dla %s (%d) na kwotê %d$ oraz nada³eœ %d punktów karnych z powodem:", ImieGracza2(gracz), gracz, cena, pkt);
	SendClientMessage(playerid, SZARY, opismandatu);
	format(opismandatu, sizeof(opismandatu), "%s.", powod);
	SendClientMessage(playerid, SZARY, opismandatu);
	format(opismandatu, sizeof(opismandatu), "Otrzyma³es mandat od %s (%d) na kwotê %d$ oraz %d punktów karnych z powodem:", ImieGracza2(playerid), playerid, cena, pkt);
	SendClientMessage(gracz, SZARY, opismandatu);
	format(opismandatu, sizeof(opismandatu), "%s.", powod);
	SendClientMessage(gracz, SZARY, opismandatu);
	return 1;
}
CMD:przeszukaj(playerid,cmdtext[])
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
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "/przeszukaj [gracza, pojazd, dom] [id gracza]", "Zamknij", "");
		return 1;
	}
    if(!strcmp(comm1,"gracza",true))
	{
		new playerid2;
		if(sscanf(comm2, "i", playerid2))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby przeszukaæ gracza wpisz: /przeszukaj [gracza] [id gracza]", "Zamknij", "");
			return 1;
		}
		if(!PlayerObokPlayera(playerid, playerid2, 2))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz którego chcesz przeszukaæ jest zbyt daleko od ciebie.", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz którego chcesz przeszukaæ nie znajduje siê obok Ciebie.", "Zamknij", "");
			return 0;
		}
		if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_POLICYJNA)
		{
			if(DaneGracza[playerid2][gBW] < 0)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Ten gracz musi byæ nieprzytomny", "Zamknij", "");
				return 1;
			}
		}
		if(DaneGracza[playerid][gCZAS_ONLINE] < 3600 * 5)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz przeszukiwaæ bo nie masz wiêcej ni¿ 5 godzin gry.", "Zamknij", "");
			return 0;
		}
		if(playerid == playerid2) return 1;
		new str[124];
		format(str, sizeof(str), "przeszuka³ %s.", ZmianaNicku(playerid2));
		cmd_fasdasfdfive(playerid, str);
		Przedmioty(playerid, playerid2, DIALOG_INFO, "• Przedmioty » Gracz:", TYP_WLASCICIEL, 0);
	}
	if(!strcmp(comm1,"pojazd",true))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie jesteœ w ¿adnym pojeŸdzie.", "Zamknij", "");
		    return 0;
		}
		if(DaneGracza[playerid][gCZAS_ONLINE] < 3600 * 20)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz przeszukiwaæ bo nie masz wiêcej ni¿ 20 godzin gry.", "Zamknij", "");
			return 0;
		}
		if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_POLICYJNA)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz tego zrobiæ, mo¿liwe tylko dla graczy z org. porz¹dkowych.", "Zamknij", "");
			return 1;
		}
	    new vehicleid = GetPlayerVehicleID(playerid);
		new uid = SprawdzCarUID(vehicleid);
		new str[124];
	    format(str, sizeof(str), "przeszuka³ pojazd %s w wszystkich mo¿liwych jego miejscach.", GetVehicleModelName(PojazdInfo[uid][pModel]));
		cmd_fasdasfdfive(playerid, str);
		if(GetPVarInt(playerid, "PDVehPodnies") == 0)
		{
			Przedmioty(playerid, playerid, DIALOG_INFO, "• Przedmioty » Pojazd:", TYP_AUTO, uid);
			 SetPVarInt(playerid, "PDVehPodnies", 1);
		}
		else
		{
		    Przedmioty(playerid, playerid, DIALOG_PRZEDZMIOTY_PODNIES_VEH, "• Przedmioty » Pojazd:", TYP_AUTO, uid);
		}
	}
	if(!strcmp(comm1,"dom",true))
	{
	    new vw = GetPlayerVirtualWorld(playerid);
	    if(vw == 0)
	    {
	        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie jesteœ w ¿adnym budynku.", "Zamknij", "");
			return 1;
	    }
	    if(DaneGracza[playerid][gCZAS_ONLINE] < 3600 * 40)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz przeszukiwaæ bo nie masz wiêcej ni¿ 40 godzin gry.", "Zamknij", "");
			return 0;
		}
		if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_POLICYJNA)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz tego zrobiæ, mo¿liwe tylko dla graczy z org. porz¹dkowych.", "Zamknij", "");
			return 1;
		}
		if(ZarzadzanieSzafa(21, playerid))
		{
			GameTextForPlayer(playerid, "", 3000, 5);
			return 0;
		}
 	    new str[124];
	    format(str, sizeof(str), "przeszuka³ szafy oraz schowki w budynku %d", vw);
		cmd_fasdasfdfive(playerid, str);
		Przedmioty(playerid, playerid, DIALOG_INFO, "• Przedmioty » Szafa:", TYP_SZAFA, vw);//DIALOG_PRZEDZMIOTY_PODNIES_SZAFA
	}
	return 1;
}
CMD:blokada(playerid,cmdtext[])
{
	//printf("U¿yta komenda kolczatka");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(GetPlayerVirtualWorld(playerid) != 0)
	{
		return 0;
	}
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_POLICYJNA)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby u¿yæ tej komendy, musisz znajdowaæ siê na s³u¿bie organizacji porz¹dkowej.", "Zamknij", "");
		return 1;
	}
	if(!ZarzadzanieBlokadami(playerid))
	{
	    GameTextForPlayer(playerid, "~r~Brak uprawnien grupy!", 3000, 5);
		return 1;
	}
	new	comm1[32], comm2[128];
	if(sscanf(cmdtext, "s[32]S()[128]", comm1, comm2))
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby stworzyæ blokade wpisz: /blokada [stworz, usun]", "Zamknij", "");
		return 1;
	}
	if(!strcmp(comm1,"stworz",true))
	{
		new typ, model, amodel;
		if(sscanf(comm2, "dd", typ, amodel))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby stworzyæ blokade wpisz:  /blokada stworz [Slot (1-20)] [Model blokady 1-18]", "Zamknij", "");
			return 1;
		}
		if(amodel == 1)
		{
		    model = 3578;
		}
		if(amodel == 2)
		{
		    model = 2773;
		}
		if(amodel == 3)
		{
		    model = 997;
		}
		if(amodel == 4)
		{
		    model = 19425;
		}
		if(amodel == 5)
		{
		    model = 19834;
		}
		if(amodel == 6)
		{
		    model = 1949;
		}
		if(amodel == 7)
		{
		    model = 973;
		}
		if(amodel == 8)
		{
		    model = 1228;
		}
		if(amodel == 9)
		{
		    model = 1237;
		}
		if(amodel == 10)
		{
		    model = 1282;
		}
		if(amodel == 11)
		{
		    model = 1422;
		}
		if(amodel == 12)
		{
		    model = 1423;
		}
		if(amodel == 13)
		{
		    model = 1424;
		}
		if(amodel == 14)
		{
		    model = 1425;
		}
		if(amodel == 15)
		{
		    model = 1434;
		}
		if(amodel == 16)
		{
		    model = 1459;
		}
		if(amodel == 17)
		{
		    model = 3091;
		}
		if(amodel == 18)
		{
		    model = 1238;
		}
		if(amodel >= 1 && amodel <= 18)
		{
		    //
		}
		else
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Mo¿esz postawiæ blokadê o modelu 1-18!", "Zamknij", "");
			return 0;
		}
		if(typ <= 0 || typ >= 21)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby stworzyæ blokade wpisz:  /blokada stworz [Slot (1-20)] [Model blokady 1-18]", "Zamknij", "");
			return 0;
		}
		if(Blokada2Info[typ][kModel] != 0)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz tego zrobiæ, poniewa¿ tej blokady ktoœ w³aœnie u¿ywa.", "Zamknij", "");
			return 0;
		}
		new Float: x, Float: y, Float: z, Float: a;
		GetPlayerPos(playerid, x, y, z);
		GetPlayerFacingAngle(playerid, a);
		GetXYInFrontOfPoint(x, y, a, 1.2);
		if(amodel == 1)
		{
			Blokada2Info[typ][kSAMP] = CreateDynamicObject(model, x, y, z - 0.37, 0, 0, a);
		}
		else if(amodel == 2)
		{
			Blokada2Info[typ][kSAMP] = CreateDynamicObject(model, x, y, z - 0.37, 0, 0, a);
		}
		else if(amodel == 3)
		{
			Blokada2Info[typ][kSAMP] = CreateDynamicObject(model, x, y, z - 0.9, 0, 0, a);
		}
		else if(amodel == 4)//
		{
			Blokada2Info[typ][kSAMP] = CreateDynamicObject(model, x, y, z - 1, 0, 0, a);
		}
		else if(amodel == 5)
		{
			Blokada2Info[typ][kSAMP] = CreateDynamicObject(model, x, y, z - 0.37, 0, 0, a);
		}
		else if(amodel == 6)
		{
			Blokada2Info[typ][kSAMP] = CreateDynamicObject(model, x, y, z - 1, 0, 0, a);
		}
		else if(amodel == 7)
		{
			Blokada2Info[typ][kSAMP] = CreateDynamicObject(model, x, y, z - 0.37, 0, 0, a);
		}
		else if(amodel == 8)
		{
			Blokada2Info[typ][kSAMP] = CreateDynamicObject(model, x, y, z - 0.37, 0, 0, a);
		}
		else if(amodel == 9)
		{
			Blokada2Info[typ][kSAMP] = CreateDynamicObject(model, x, y, z - 1, 0, 0, a);
		}
		else if(amodel == 10)
		{
			Blokada2Info[typ][kSAMP] = CreateDynamicObject(model, x, y, z - 0.37, 0, 0, a);
		}
		else if(amodel == 11)
		{
			Blokada2Info[typ][kSAMP] = CreateDynamicObject(model, x, y, z - 0.37, 0, 0, a);
		}
		else if(amodel == 12)
		{
			Blokada2Info[typ][kSAMP] = CreateDynamicObject(model, x, y, z - 0.37, 0, 0, a);
		}
		else if(amodel == 13)
		{
			Blokada2Info[typ][kSAMP] = CreateDynamicObject(model, x, y, z - 0.37, 0, 0, a);
		}
		else if(amodel == 14)
		{
			Blokada2Info[typ][kSAMP] = CreateDynamicObject(model, x, y, z - 0.37, 0, 0, a);
		}
		else if(amodel == 15)
		{
			Blokada2Info[typ][kSAMP] = CreateDynamicObject(model, x, y, z - 0.9, 0, 0, a);
		}
		else if(amodel == 16)
		{
			Blokada2Info[typ][kSAMP] = CreateDynamicObject(model, x, y, z - 0.37, 0, 0, a);
		}
		else if(amodel == 17)
		{
			Blokada2Info[typ][kSAMP] = CreateDynamicObject(model, x, y, z - 0.37, 0, 0, a);
		}
		else if(amodel == 18)
		{
			Blokada2Info[typ][kSAMP] = CreateDynamicObject(model, x, y, z - 0.69, 0, 0, a);
		}
		//Blokada2Info[typ][kSAMP] = CreateDynamicObject(model, x, y, z - 0.37, 0, 0, a);
		Blokada2Info[typ][kUzyta] = 1;
		Blokada2Info[typ][kPozX] = x;
		Blokada2Info[typ][kPozY] = y;
		Blokada2Info[typ][kPozZ] = z;
		Blokada2Info[typ][kRotX] = 0;
		Blokada2Info[typ][kRotY] = 0;
		Blokada2Info[typ][kRotZ] = a;
		Blokada2Info[typ][kvWorld] = GetPlayerVirtualWorld(playerid);
		Blokada2Info[typ][kModel] = model;
		Streamer_Update(playerid);
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 0, 0, 0, 0, 0);
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Blokada zosta³a stworzona.", "Zamknij", "");
	}
	if(!strcmp(comm1,"usun",true))
	{
		new typ;
		if(sscanf(comm2, "d", typ))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby usun¹æ blokade wpisz: /blokada usun [blokada (1-20)]", "Zamknij", "");
			return 1;
		}
		if(typ <= 0 || typ > 20)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby usun¹æ blokade wpisz: /blokada usun [blokada (1-20)]", "Zamknij", "");
			return 0;
		}
		if(Blokada2Info[typ][kModel] == 0)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Taka blokada nie zosta³a stworzona.", "Zamknij", "");
			return 0;
		}
		DestroyDynamicObject(Blokada2Info[typ][kSAMP]);
		Blokada2Info[typ][kSAMP] = 0;
		Blokada2Info[typ][kPozX] = 0;
		Blokada2Info[typ][kPozY] = 0;
		Blokada2Info[typ][kPozZ] = 0;
		Blokada2Info[typ][kUzyta] = 0;
		Blokada2Info[typ][kRotX] = 0;
		Blokada2Info[typ][kRotY] = 0;
		Blokada2Info[typ][kRotZ] = 0;
		Blokada2Info[typ][kvWorld] = 0;
		Blokada2Info[typ][kModel] = 0;
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Blokada zosta³a usuniêta.", "Zamknij", "");

	}
	return 1;
}
CMD:blokuj(playerid,cmdtext[])
{
	//printf("U¿yta komenda blokuj");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
 	if(!ZarzadzanieBlokadaKola(playerid))
	{
	    GameTextForPlayer(playerid, "~r~Brak uprawnien grupy!", 3000, 5);
		return 0;
	}
	if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_POLICYJNA)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby u¿yæ tej komendy, musisz znajdowaæ siê na s³u¿bie organizacji porz¹dkowej.", "Zamknij", "");
		return 1;
	}
	new litry, powod[256];
	if(sscanf(cmdtext, "ds[256]", litry, powod))
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby na³o¿yæ blokade na ko³o pojazdu wpisz: /blokuj [kwota] [powód]", "Zamknij", "");
		return 1;
	}
	if(litry < 0 || litry > 5000)
	{
		GameTextForPlayer(playerid, "~r~Podana kwota jest niepoprawna!", 3000, 5);
		return 0;
	}
	new vec = GetClosestVehicle(playerid, 15);
    new vehc = SprawdzCarUID(vec);
    if(vec == INVALID_VEHICLE_ID)
    {
        GameTextForPlayer(playerid, "~r~Nie stoisz przy zadnym pojezdzie!", 3000, 5);
	    return 1;
	}
	if(IsPlayerInAnyVehicle(playerid))
	{
		GameTextForPlayer(playerid, "~r~Nie mozesz znajdowac sie w pojezdzie!", 3000, 5);
		return 0;
	}
	if(!ZarzadzanieBlokadaKola(playerid) && GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA)
	{
		PojazdInfo[vehc][pBlokada] = litry;
	}
	else
	{
		PojazdInfo[vehc][pBlokada] += litry;
	}
	GetVehiclePos(vec, PojazdInfo[vehc][pX], PojazdInfo[vehc][pY], PojazdInfo[vehc][pZ]);
 	GetVehicleZAngle(vec, PojazdInfo[vehc][pAngle]);
	ZapiszPojazd(vehc, 1);
	StworzPojazd(vehc, -1);
	OnPlayerText(playerid, "-szukaj");
	Transakcja(T_BLOKADAK, DaneGracza[playerid][gUID], PojazdInfo[vehc][pOwnerPostac], DaneGracza[playerid][gGUID], PojazdInfo[vehc][pOwnerDzialalnosc], litry, vehc, vec, -1, powod, gettime()+CZAS_LETNI);
	new strss[256];
	format(strss, sizeof(strss), "Nalo¿y³eœ blokade na pojazd %s, kwota: %d$, powód: %s.",GetVehicleModelName(PojazdInfo[vehc][pModel]), PojazdInfo[vehc][pBlokada], powod);
	SendClientMessage(playerid, 0xFFb00000, strss);
	StworzPojazd(vehc, -1);
	return 1;
}
CMD:alkomat(playerid, params[])
{
	//printf("U¿yta komenda alkomat");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_POLICYJNA)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby u¿yæ tej komendy, musisz znajdowaæ siê na s³u¿bie organizacji porz¹dkowej.", "Zamknij", "");
		return 1;
	}
	new playerid2;
	if(sscanf(params, "i", playerid2))
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby u¿yæ alkomatu wpisz: /alkomat [id gracza]", "Zamknij", "");
		return 1;
	}
	if(!PlayerObokPlayera(playerid, playerid2, 2))
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz którego chesz sprawdziæ alkomatem nie znajduje siê obok Ciebie.", "Zamknij", "");
		return 1;
	}
	if(zalogowany[playerid2] == false)
    {
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz którego chesz sprawdziæ alkomatem nie jest zalogowany.", "Zamknij", "");
        return 0;
    }
	new Float: promil = 0;
	if(GetPlayerDrunkLevel(playerid2) >= 1000) promil = 0.1;
	if(GetPlayerDrunkLevel(playerid2) >= 1400) promil = 0.2;
	if(GetPlayerDrunkLevel(playerid2) >= 1800) promil = 0.3;
	if(GetPlayerDrunkLevel(playerid2) >= 2200) promil = 0.4;
	if(GetPlayerDrunkLevel(playerid2) >= 2600) promil = 0.5;
	if(GetPlayerDrunkLevel(playerid2) >= 3600) promil = 0.6;
	if(GetPlayerDrunkLevel(playerid2) >= 4000) promil = 0.7;
	if(GetPlayerDrunkLevel(playerid2) >= 4400) promil = 0.8;
	if(GetPlayerDrunkLevel(playerid2) >= 4800) promil = 0.9;
	if(GetPlayerDrunkLevel(playerid2) >= 5200) promil = 1.0;
	if(GetPlayerDrunkLevel(playerid2) >= 5600) promil = 1.1;
	if(GetPlayerDrunkLevel(playerid2) >= 6000) promil = 1.2;
	if(GetPlayerDrunkLevel(playerid2) >= 6400) promil = 1.3;
	if(GetPlayerDrunkLevel(playerid2) >= 6800) promil = 1.4;
	if(GetPlayerDrunkLevel(playerid2) >= 7200) promil = 1.5;
	if(GetPlayerDrunkLevel(playerid2) >= 7600) promil = 1.6;
	if(GetPlayerDrunkLevel(playerid2) >= 8000) promil = 1.7;
	if(GetPlayerDrunkLevel(playerid2) >= 8400) promil = 1.8;
	if(GetPlayerDrunkLevel(playerid2) >= 8800) promil = 1.9;
	if(GetPlayerDrunkLevel(playerid2) >= 9200) promil = 2.0;
	if(GetPlayerDrunkLevel(playerid2) >= 9600) promil = 2.1;
	if(GetPlayerDrunkLevel(playerid2) >= 10000) promil = 2.2;
	if(GetPlayerDrunkLevel(playerid2) >= 10400) promil = 2.3;
	if(GetPlayerDrunkLevel(playerid2) >= 10800) promil = 2.4;
	if(GetPlayerDrunkLevel(playerid2) >= 11200) promil = 2.5;
	if(GetPlayerDrunkLevel(playerid2) >= 11600) promil = 2.6;
	if(GetPlayerDrunkLevel(playerid2) >= 12000) promil = 2.7;
	if(GetPlayerDrunkLevel(playerid2) >= 12400) promil = 2.8;
	if(GetPlayerDrunkLevel(playerid2) >= 12800) promil = 2.9;
	if(GetPlayerDrunkLevel(playerid2) >= 13200) promil = 3.0;
	if(GetPlayerDrunkLevel(playerid2) >= 13600) promil = 3.1;
	if(GetPlayerDrunkLevel(playerid2) >= 14000) promil = 3.2;
	if(GetPlayerDrunkLevel(playerid2) >= 14400) promil = 3.3;
	if(GetPlayerDrunkLevel(playerid2) >= 14800) promil = 3.4;
	if(GetPlayerDrunkLevel(playerid2) >= 15200) promil = 3.5;
	if(GetPlayerDrunkLevel(playerid2) >= 15600) promil = 3.6;
	if(GetPlayerDrunkLevel(playerid2) >= 16000) promil = 3.7;
	if(GetPlayerDrunkLevel(playerid2) >= 16400) promil = 3.8;
	if(GetPlayerDrunkLevel(playerid2) >= 16800) promil = 3.9;
	if(GetPlayerDrunkLevel(playerid2) >= 17200) promil = 4.0;
	cmd_fasdasfdfive(playerid, "chwyta za alkomat nastêpnie przyk³ada go do ust zatrzymanego.");
	new strss[256];
	format(strss, sizeof(strss), "Pomiar: %s. Czytnik wykaza³ %0.1f promili.", ZmianaNicku(playerid2),promil);
	SendClientMessage(playerid, 0xFFb00000, strss);
	return 1;
}
CMD:przetrzymaj(playerid, params[])
{
	//printf("U¿yta komenda przetrzymaj");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	if(!ZarzadzaniePrzetrzymaniem(playerid) && GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA || !ZarzadzaniePrzetrzymaniem(playerid) && GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA || !ZarzadzaniePrzetrzymaniem(playerid) && GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_MAFIE || !ZarzadzaniePrzetrzymaniem(playerid) && GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_GANGI)
	{
		return 0;
	}
	new vw = GetPlayerVirtualWorld(playerid);
	if(vw != 0)
	{
		if(!OtwieranieBudynku(GetPlayerVirtualWorld(playerid), playerid))
		{
			GameTextForPlayer(playerid, "~r~Nie posiadasz kluczy do tych drzwi.", 3000, 5);
			return 0;
		}
	}
	else
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Administracja", "Nie jesteœ w odpowiednim budynku", "Zamknij", "");
		return 0;
	}
	new playerid2, czas, typ[24], powod[64], okres;
	if(sscanf(params, "dds[24]s[64]", playerid2, czas, typ, powod))
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby przetrzymaæ gracza wpisz: /przetrzymaj [id gracza] [czas] [typ - d, h, m] [powód]\nPrzyk³ad: /przetrzymaj 7 30 d Uciekinier\nTypy: d - dni, h - godzin, m - minut", "Zamknij", "");
		return 1;
	}
	if(playerid == playerid2) return 1;
	if(czas < 0)
	{
		return 0;
	}
	if(ComparisonString(typ, "m") || ComparisonString(typ, "h") || ComparisonString(typ, "d") || ComparisonString(typ, "M") || ComparisonString(typ, "H") || ComparisonString(typ, "D"))
	{
		if(!PlayerObokPlayera(playerid, playerid2, 2))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz którego chcesz przetrzymaæ jest zbyt daleko od ciebie.", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz którego chcesz przetrzymaæ nie znajduje siê obok Ciebie.", "Zamknij", "");
			return 0;
		}
		if(strlen(powod) < 3)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby przetrzymaæ gracza wpisz: /przetrzymaj [id gracza] [czas] [typ - d, h, m] [powód]\nPrzyk³ad: /przetrzymaj 7 30 d Uciekinier\nTypy: d - dni, h - godzin, m - minut", "Zamknij", "");
			return 0;
		}
		if(!GraczPrzetrzymywany(playerid2))
		{
			//Oferuj(playerid, playerid2, DaneGracza[playerid][gSluzba], GetPlayerVirtualWorld(playerid), 0, 0, OFEROWANIE_PRZETRZYMANIA, czas, "", 0);
			//SetPVarString(playerid2, "TypPrzetrzymania", typ);
			//SetPVarString(playerid2, "PowodPrzetrzymania", powod);
			if(ComparisonString(typ, "d") || ComparisonString(typ, "D"))
			{
				okres = (gettime()+CZAS_LETNI)+(86400*czas);
			}
			else if(ComparisonString(typ, "m") || ComparisonString(typ, "M"))
			{
				okres = (gettime()+CZAS_LETNI)+(60*czas);
			}
			else if(ComparisonString(typ, "h") || ComparisonString(typ, "H"))
			{
				okres = (gettime()+CZAS_LETNI)+(3600*czas);
			}
			Oferuj(playerid, playerid2, DaneGracza[playerid][gSluzba], GetPlayerVirtualWorld(playerid), 0, 0, OFEROWANIE_PRZETRZYMANIA, okres, powod, 0);
			/*
			GetPlayerPos(playerid2,DaneGracza[playerid2][gPX],DaneGracza[playerid2][gPY],DaneGracza[playerid2][gPZ]);
			DaneGracza[playerid2][gPUID] = vw;
			ZapiszGracza(playerid2);
			RefreshNick(playerid2);
			new strss[256];
			new rok, miesiac, dzien, godzina, minuta, sekunda;
			sekundytodata(DaneGracza[playerid2][gPrzetrzmanie]+(3600*3), rok, miesiac, dzien, godzina, minuta, sekunda);
			format(strss, sizeof(strss), "{CC0000}Zosta³eœ przetrzymany przez gracza: %s (ID:%d) do: %02d-%02d-%d, %02d:%02d, powód: %s",ZmianaNicku(playerid), playerid,dzien, miesiac, rok, godzina+5, minuta, powod);
			SendClientMessage(playerid2, 0xFFb00000, strss);
			DodajKartoteke(playerid, playerid2, 2, powod);
			if(BudynekInfo[vw][nWlascicielD] != 0)
			{
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							if(DaneGracza[i][gDzialalnosc1] == BudynekInfo[vw][nWlascicielD] ||
							DaneGracza[i][gDzialalnosc2] == BudynekInfo[vw][nWlascicielD] ||
							DaneGracza[i][gDzialalnosc3] == BudynekInfo[vw][nWlascicielD] ||
							DaneGracza[i][gDzialalnosc4] == BudynekInfo[vw][nWlascicielD] ||
							DaneGracza[i][gDzialalnosc5] == BudynekInfo[vw][nWlascicielD] ||
							DaneGracza[i][gDzialalnosc6] == BudynekInfo[vw][nWlascicielD])
							{
								new strs[256];
								format(strs, sizeof(strs), "{CC0000}Gracz %s (ID: %d) przetrzymuje gracza: %s (ID:%d) do: %02d-%02d-%d, %02d:%02d, powód: %s",ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2,dzien, miesiac, rok, godzina+5, minuta, powod);
								SendClientMessage(i, 0xFFb00000, strs);
							}
						}
					}
				}
			}else{
				new strs[256];
				format(strs, sizeof(strs), "{CC0000}Gracz %s (ID: %d) przetrzymuje gracza: %s (ID:%d) do: %02d-%02d-%d, %02d:%02d, powód: %s",ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2,dzien, miesiac, rok, godzina+5, minuta, powod);
				SendClientMessage(playerid, 0xFFb00000, strs);
			}*/
		}
		else
		{
			if(!ZarzadzanieBlokadaKola(playerid) && GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA)
			{
				GameTextForPlayer(playerid, "~r~Nie masz uprawnien do zdejmowania przetrzymania.", 3000, 5);
				return 0;
			}
			DaneGracza[playerid2][gPrzetrzmanie] = 0;
			ZapiszGracza(playerid2);
			RefreshNick(playerid2);
			new strss[256];
			format(strss, sizeof(strss), "{CC0000}Zosta³eœ uwolniony przez gracza: %s (ID:%d), powód: %s",ZmianaNicku(playerid), playerid, powod);
			SendClientMessage(playerid2, 0xFFb00000, strss);
			if(BudynekInfo[vw][nWlascicielD] != 0)
			{
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							if(DaneGracza[i][gDzialalnosc1] == BudynekInfo[vw][nWlascicielD] ||
							DaneGracza[i][gDzialalnosc2] == BudynekInfo[vw][nWlascicielD] ||
							DaneGracza[i][gDzialalnosc3] == BudynekInfo[vw][nWlascicielD] ||
							DaneGracza[i][gDzialalnosc4] == BudynekInfo[vw][nWlascicielD] ||
							DaneGracza[i][gDzialalnosc5] == BudynekInfo[vw][nWlascicielD] ||
							DaneGracza[i][gDzialalnosc6] == BudynekInfo[vw][nWlascicielD])
							{
								new strs[256];
								format(strs, sizeof(strs), "{CC0000}Gracz %s (ID: %d) zdejmuje przetrzymanie graczu: %s (ID:%d), powód: %s",ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2, powod);
								SendClientMessage(i, 0xFFb00000, strs);
							}
						}
					}
				}
			}else{
				new strs[256];
				format(strs, sizeof(strs), "{CC0000}Gracz %s (ID: %d) zdejmuje przetrzymanie graczu: %s (ID:%d), powód: %s",ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2, powod);
				SendClientMessage(playerid, 0xFFb00000, strs);
			}
		}
	}else{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby przetrzymaæ gracza wpisz: /przetrzymaj [id gracza] [czas] [typ - d, h, m] [powód]\nPrzyk³ad: /przetrzymaj 7 30 d Uciekinier\nTypy: d - dni, h - godzin, m - minut", "Zamknij", "");
	}
	return 1;
}
CMD:zgloszenia(playerid, cmdtext[])
{
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
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie znajdujesz siê na s³u¿bie grupy, by sprawdziæ zg³oszenia.", "Zamknij", "");
		return 0;
	}
	new vw = GetPlayerVirtualWorld(playerid);
	if(IsPlayerInAnyVehicle(playerid))
 	{
 	    if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA)
		{
			new vehids = GetPlayerVehicleID(playerid);
			new uipd = SprawdzCarUID(vehids);
			if(GrupaInfo[PojazdInfo[uipd][pOwnerDzialalnosc]][gTyp] != DZIALALNOSC_POLICYJNA)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Ten pojazd nie nale¿y do s³u¿b porz¹dkowych.", "Zamknij", "");
				return 0;
			}
		}
	}
	else
	{
		if(vw == 0)
		{
			return 0;
		}
		if(BudynekInfo[vw][nWlascicielD] != DaneGracza[playerid][gSluzba])
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie znajdujesz siê na s³u¿bie lub w budynku nale¿¹cego do tej grupy.", "Zamknij", "");
			return 0;
		}
	}
    ZaladujZgloszenia();
	new found = 0;
	strdel(tekst_global, 0, 1024);
	format(tekst_global, sizeof(tekst_global), "ID\tImie i nazwisko, numer telefonu\tZg³oszenie\tStatus", tekst_global);
    ForeachEx(i, MAX_ZGLOSZEN)
	{
		if(Zgloszenie[i][zZAKONCZONE] == 0 && Zgloszenie[i][zID] == i && i != 0 && Zgloszenie[i][zUID_GRUPY] == DaneGracza[playerid][gSluzba])
		{
		    new string[32];
		    if(Zgloszenie[i][zODEBRAL] == 0)
		    {
		        format(string, sizeof(string), "Nieodebrane");
		    }
		    else
		    {
		        format(string, sizeof(string), "Odebrane");
		    }
			format(tekst_global, sizeof(tekst_global), "%s\n%d\t%s - %d\t%s\t%s", tekst_global, Zgloszenie[i][zID], Zgloszenie[i][zNICK], Zgloszenie[i][zNUMER], Zgloszenie[i][zTRESC], string);
			found++;
		}
	}
	if(found != 0) dShowPlayerDialog(playerid, DIALOG_ZGLOSZENIE_OPCJE, DIALOG_STYLE_TABLIST_HEADERS, "• Zg³oszenia:", tekst_global, "Opcje", "Zamknij");
	else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Brak zg³oszeñ w bazie danych.", "Rozumiem", "Zamknij");
	return 1;
}
CMD:kartoteka(playerid, params[])
{
	//printf("U¿yta komenda kartoteka");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	if(!ZarzadzanieKartoteka(playerid))
	{
	    GameTextForPlayer(playerid, "~r~Brak uprawnien grupy!", 3000, 5);
		return 0;
	}
	if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_POLICYJNA)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby u¿yæ tej komendy, musisz znajdowaæ siê na s³u¿bie organizacji porz¹dkowej.", "Zamknij", "");
		return 1;
	}
	// new vw = GetPlayerVirtualWorld(playerid);
	// if(IsPlayerInAnyVehicle(playerid))
	// {
	// 	new vehids = GetPlayerVehicleID(playerid);
	// 	new uipd = SprawdzCarUID(vehids);
	// 	if(GrupaInfo[PojazdInfo[uipd][pOwnerDzialalnosc]][gTyp] != DZIALALNOSC_POLICYJNA)
	// 	{
	// 		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Ten pojazd nie nale¿y do s³u¿b porz¹dkowych.", "Zamknij", "");
	// 		return 0;
	// 	}
	// }
	// else
	// {
		// if(vw == 0)
		// {
		// 	return 0;
		// }
		// if(GrupaInfo[BudynekInfo[vw][nWlascicielD]][gTyp] != DZIALALNOSC_POLICYJNA)
		// {
		// 	dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie znajdujesz siê w budynku który nale¿y do s³u¿b porz¹dkowych.", "Zamknij", "");
		// 	return 0;
		// }
	// }
	new playerid2;
	if(sscanf(params, "i", playerid2))
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby sprawdziæ kartoteke gracza: /kartoteka [id gracza]", "Zamknij", "");
		return 1;
	}
	if(zalogowany[playerid2] == false)
    {
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz któremu chcesz sprawdziæ kartoteke nie jest zalogowany.", "Zamknij", "");
        return 0;
    }
	new	tytul[512];
	new	tresc[512];
	SetPVarInt(playerid,"KartotekaID",playerid2);
	format(tytul, sizeof(tytul), "Kartoteka osobowa %s", ZmianaNicku(playerid2));
	format(tresc, sizeof(tresc), "%s\nImie i nazwisko: \t%s", tresc, ZmianaNicku(playerid2));
	if(DaneGracza[playerid2][gPLEC] == 0)
	{
		format(tresc, sizeof(tresc), "%s\nP³eæ: \t\t\tMê¿czyzna", tresc);
	}
	else
	{
        format(tresc, sizeof(tresc), "%s\nP³eæ: \t\t\tKobieta", tresc);
	}
	format(tresc, sizeof(tresc), "%s\nRok urodzenia: \t%d", tresc, 2019-DaneGracza[playerid2][gWIEK]);
	format(tresc, sizeof(tresc), "%s\nDNA: \t\t\t%d%d", tresc, DaneGracza[playerid2][gUID]+DaneGracza[playerid][gGUID]);
	format(tresc, sizeof(tresc), "%s\nWzrost: \t\t175cm", tresc);
	format(tresc, sizeof(tresc), "%s\nKolor w³osów: \t\tBrak danych", tresc);
	format(tresc, sizeof(tresc), "%s\nStan cywilny: \t\t%s", tresc, DaneGracza[playerid2][gSTAN_CYWILNY]);
	if(!Dokument(playerid2, D_DOWOD))
	{
	    format(tresc, sizeof(tresc), "%s\nDowód: \t\tBrak", tresc);
	}
	else
	{
	    format(tresc, sizeof(tresc), "%s\nDowód: \t\tWa¿ny", tresc);
	}
	if(!Dokument(playerid2, D_PRAWKO_A) && !Dokument(playerid2, D_PRAWKO_B))
	{
		format(tresc, sizeof(tresc), "%s\nPrawko: \t\tBrak", tresc);
	}
	else
	{
	    format(tresc, sizeof(tresc), "%s\nPrawko: \t\tWa¿ne", tresc);
	}
	format(tresc, sizeof(tresc), "%s\nPunkty karne: \t\t%d/24", tresc, DaneGracza[playerid2][gPktKarne]);
	format(tresc, sizeof(tresc), "%s\nZnaki szczególne: \tBrak", tresc);
	format(tresc, sizeof(tresc), "%s\nOrgan wpisuj¹cy: \tRSO (20.01.2019r)", tresc);
	format(tresc, sizeof(tresc), "%s\n---------------------------", tresc);
	format(tresc, sizeof(tresc), "%s\n1. Wyœwietl wpisy karne oraz wykroczenia", tresc);
	format(tresc, sizeof(tresc), "%s\n2. Wyœwietl zarejestowane pojazdy", tresc);
	if(DaneGracza[playerid2][gPOSZ] == 0)
	{
  		format(tresc, sizeof(tresc), "%s\n4. {FF0000}Oznacz osobê jako poszukiwan¹", tresc);
	}
	else
	{
	    format(tresc, sizeof(tresc), "%s\n4. {008000}Zakoñcz poszukiwania", tresc);
	}
	format(tresc, sizeof(tresc), "%s\n5. SprawdŸ list goñczy", tresc);
	format(tresc, sizeof(tresc), "%s\n6. Odbierz prawo jazdy", tresc);
	dShowPlayerDialog(playerid, DIALOG_KARTOTEKA_PODGLAD, DIALOG_STYLE_LIST, tytul,tresc, "Wybierz", "Zamknij");
	new akcjarp[126];
	format(akcjarp,sizeof(akcjarp),"sprawdza kartotekê %s.", ZmianaNicku(playerid2));
	cmd_me(playerid, akcjarp);
    new akcja[126];
	format(akcja,sizeof(akcja),"*sprawdza kartotekê %s*", ZmianaNicku(playerid2));
	SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
	new akcja2[126];
	format(akcja2,sizeof(akcja2),"sprawdza kartotekê %s", ZmianaNicku(playerid2));
	TextDrawSetString(AkcjaTD[playerid], akcja2);
	TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
	CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
	return 1;
}
forward DodajPoszukiwany(playerid, playerid2, typ, powod[]);
public DodajPoszukiwany(playerid, playerid2, typ, powod[])
{
	if(zalogowany[playerid2] == false)
    {
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz któremu chcesz dodaæ wpisz do kartoteki nie jest zalogowany.", "Zamknij", "");
        return 0;
    }
	new	data[124];
	new Rok, Miesiac, Dzien;
	getdate(Rok, Miesiac, Dzien);
	format(data, sizeof(data), "%02d:%02d:%d", Dzien, Miesiac, Rok);
	new	godz[124];
	new godzina, minuta;
	gettime(godzina, minuta);
	format(godz, sizeof(godz), "%02d:%02d", godzina, minuta);
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_poszukiwany` (`UID_GRACZA`, `UID_NADAJACEGO`, `GUID_GRACZA`, `GUID_NADAJACEGO`, `NICK_GRACZA`, `NICK_NADAJACEGO`, `DATA`, `GODZINA`, `POWOD`, `TYP`) VALUES ('%d', '%d', '%d', '%d', '%s', '%s', '%s', '%s', '%s', '%d')",
	DaneGracza[playerid2][gUID], DaneGracza[playerid][gUID], DaneGracza[playerid2][gGUID], DaneGracza[playerid][gGUID], ZmianaNicku(playerid2), ZmianaNicku(playerid), data, godz, powod, typ);
	mysql_check();
	mysql_query2(zapyt);
	new uid = mysql_insert_id();
	KartotekaInfo[uid][kID] = uid;
	KartotekaInfo[uid][kUID] = DaneGracza[playerid2][gUID];
	KartotekaInfo[uid][kUIDN] = DaneGracza[playerid][gUID];
	format(KartotekaInfo[uid][kNick], 124, "%s", ZmianaNicku(playerid2));
	format(KartotekaInfo[uid][kNickN], 124, "%s", ZmianaNicku(playerid));
	KartotekaInfo[uid][kGUID] = DaneGracza[playerid2][gGUID];
	KartotekaInfo[uid][kGUIDN] = DaneGracza[playerid][gGUID];
	format(KartotekaInfo[uid][kData], 124, "%s", data);
	format(KartotekaInfo[uid][kGodzina], 124, "%s", godz);
	format(KartotekaInfo[uid][kPowod], 256, "%s", powod);
	KartotekaInfo[uid][kTyp] = typ;
	mysql_free_result();
	return uid;
}
forward DodajKartoteke(playerid, playerid2, typ, powod[]);
public DodajKartoteke(playerid, playerid2, typ, powod[])
{
	if(zalogowany[playerid2] == false)
    {
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz któremu chcesz dodaæ wpisz do kartoteki nie jest zalogowany.", "Zamknij", "");
        return 0;
    }
	new	data[124];
	new Rok, Miesiac, Dzien;
	getdate(Rok, Miesiac, Dzien);
	format(data, sizeof(data), "%02d:%02d:%d", Dzien, Miesiac, Rok);
	new	godz[124];
	new godzina, minuta;
	gettime(godzina, minuta);
	format(godz, sizeof(godz), "%02d:%02d", godzina, minuta);
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_kartotekaaa` (`UID_GRACZA`, `UID_NADAJACEGO`, `GUID_GRACZA`, `GUID_NADAJACEGO`, `NICK_GRACZA`, `NICK_NADAJACEGO`, `DATA`, `GODZINA`, `POWOD`, `TYP`) VALUES ('%d', '%d', '%d', '%d', '%s', '%s', '%s', '%s', '%s', '%d')",
	DaneGracza[playerid2][gUID], DaneGracza[playerid][gUID], DaneGracza[playerid2][gGUID], DaneGracza[playerid][gGUID], ZmianaNicku(playerid2), ZmianaNicku(playerid), data, godz, powod, typ);
	mysql_check();
	mysql_query2(zapyt);
	new uid = mysql_insert_id();
	KartotekaInfo[uid][kID] = uid;
	KartotekaInfo[uid][kUID] = DaneGracza[playerid2][gUID];
	KartotekaInfo[uid][kUIDN] = DaneGracza[playerid][gUID];
	format(KartotekaInfo[uid][kNick], 124, "%s", ZmianaNicku(playerid2));
	format(KartotekaInfo[uid][kNickN], 124, "%s", ZmianaNicku(playerid));
	KartotekaInfo[uid][kGUID] = DaneGracza[playerid2][gGUID];
	KartotekaInfo[uid][kGUIDN] = DaneGracza[playerid][gGUID];
	format(KartotekaInfo[uid][kData], 124, "%s", data);
	format(KartotekaInfo[uid][kGodzina], 124, "%s", godz);
	format(KartotekaInfo[uid][kPowod], 256, "%s", powod);
	KartotekaInfo[uid][kTyp] = typ;
	mysql_free_result();
	return uid;
}
stock GraczPrzetrzymywany(playerid)
{
	new pkt = DaneGracza[playerid][gPrzetrzmanie];
	if(pkt > gettime()+CZAS_LETNI) return true;
	else return false;
}
CMD:kolczatka(playerid,cmdtext[])
{
	//printf("U¿yta komenda kolczatka");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	if(!ZarzadzanieKolczatka(playerid))
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby u¿yæ tej komendy, musisz posiadaæ uprawnienie do zarz¹dzania kolczatkami.", "Zamknij", "");
		return 1;
	}
	if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_POLICYJNA)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby u¿yæ tej komendy, musisz znajdowaæ siê na s³u¿bie organizacji porz¹dkowej.", "Zamknij", "");
		return 1;
	}
	new	comm1[32], comm2[128];
	if(sscanf(cmdtext, "s[32]S()[128]", comm1, comm2))
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby stworzyæ kolaczatke wpisz: /kolczatka [stworz, usun]", "Zamknij", "");
		return 1;
	}
	if(!strcmp(comm1,"stworz",true))
	{
		new typ;
		if(sscanf(comm2, "d", typ))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby stworzyæ kolaczatke wpisz:  /kolczatka stworz [kolczatka (1-5)]", "Zamknij", "");
			return 1;
		}
		if(typ <= 0 || typ >= 6)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby stworzyæ kolaczatke wpisz:  /kolczatka stworz [kolczatka (1-5)]", "Zamknij", "");
			return 0;
		}
		if(KolczatkaInfo[typ][kModel] != 0)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz tego zrobiæ, poniewa¿ tej kolczatki ktoœ w³aœnie u¿ywa.", "Zamknij", "");
			return 0;
		}
		new Float: x, Float: y, Float: z, Float: a;
		GetPlayerPos(playerid, x, y, z);
		GetPlayerFacingAngle(playerid, a);
		GetXYInFrontOfPoint(x, y, a, 5.2);
		KolczatkaInfo[typ][kSAMP] = CreateDynamicObject(2892, x, y, z - 1, 0, 0, a);
		KolczatkaInfo[typ][kUzyta] = 1;
		KolczatkaInfo[typ][kPozX] = x;
		KolczatkaInfo[typ][kPozY] = y;
		KolczatkaInfo[typ][kPozZ] = z;
		KolczatkaInfo[typ][kRotX] = 0;
		KolczatkaInfo[typ][kRotY] = 0;
		KolczatkaInfo[typ][kRotZ] = a;
		KolczatkaInfo[typ][kvWorld] = GetPlayerVirtualWorld(playerid);
		KolczatkaInfo[typ][kModel] = 2892;
		Streamer_Update(playerid);
		OnPlayerText(playerid, "-rzuc");
		OnPlayerText(playerid, "-rzuc");
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Kolczatka zosta³a stworzona.", "Zamknij", "");
	}
	if(!strcmp(comm1,"usun",true))
	{
		new typ;
		if(sscanf(comm2, "d", typ))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby usun¹æ kolczatke wpisz: /kolczatka usun [kolczatka (1-5)]", "Zamknij", "");
			return 1;
		}
		if(typ <= 0 || typ > 5)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby usun¹æ kolczatke wpisz: /kolczatka usun [kolczatka (1-5)]", "Zamknij", "");
			return 0;
		}
		if(KolczatkaInfo[typ][kModel] == 0)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Taka kolczatka nie zosta³a stworzona.", "Zamknij", "");
			return 0;
		}
		DestroyDynamicObject(KolczatkaInfo[typ][kSAMP]);
		KolczatkaInfo[typ][kSAMP] = 0;
		KolczatkaInfo[typ][kPozX] = 0;
		KolczatkaInfo[typ][kPozY] = 0;
		KolczatkaInfo[typ][kPozZ] = 0;
		KolczatkaInfo[typ][kUzyta] = 0;
		KolczatkaInfo[typ][kRotX] = 0;
		KolczatkaInfo[typ][kRotY] = 0;
		KolczatkaInfo[typ][kRotZ] = 0;
		KolczatkaInfo[typ][kvWorld] = 0;
		KolczatkaInfo[typ][kModel] = 0;
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Kolczatka zosta³a usuniêta.", "Zamknij", "");
			
	}
	return 1;
}
stock GetXYInFrontOfPoint(&Float:x, &Float:y, Float:angle, Float:distance) {
	x += (distance * floatsin(-angle, degrees));
	y += (distance * floatcos(-angle, degrees));
}
