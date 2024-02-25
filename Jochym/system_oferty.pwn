AntiDeAMX();

enum oOferta
{
	oKlient,
	oCena,
	oTyp,
	oWar1,
	oWar2,
	oWar3,
	oWar4,
	oWar5,
	oSprzedajacy,
	oPowod[256]
}
new OfertaInfo[MAX_PLAYERS][oOferta];

stock Oferuj(playerid, playerid2, uid, dzialnoscuid, war1, skin, typ, cena, reason[], news)
{
	if(OferujeA[playerid] != -1)//war2, war1, war3
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Wys³a³eœ ju¿ ofertê, poczekaj na odpowiedz klienta.", "Zamknij", "");
		return 0;
	}
	else
	{
	    if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz któremu chcesz coœ oferowaæ nie jest zalogowany.", "Zamknij", "");
			return 0;
		}
		if(typ != OFEROWANIE_AKC_NAP)
		{
			if(!PlayerObokPlayera(playerid, playerid2, 5) || !PlayerObokPlayera(playerid, playerid, 5))
			{
			    if(typ != OFEROWANIE_MAGAZYN)
			    {
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz któremu chcesz coœ oferowaæ nie znajduje siê obok Ciebie.", "Zamknij", "");
					return 0;
				}
			}
		}
		if(typ != OFEROWANIE_INVITE && typ != OFEROWANIE_YO && typ != OFEROWANIE_WYNAJMU && typ != OFEROWANIE_WYSCIG && typ != OFEROWANIE_WYWIAD && typ != OFEROWANIE_KONTAKT && typ != OFEROWANIE_HOLOWANIA && typ != OFEROWANIE_PRZEDMIOTU)
		{
			//Warunki :0
		}
		new offername[256];
		OfertaInfo[playerid][oTyp] = typ;
		strmid(OfertaInfo[playerid][oPowod],reason, 0, 60, 60);
		//format(OfertaInfo[playerid][oPowod], 60, "%s", reason);
	    OfertaInfo[playerid][oKlient] = playerid2;
	    OfertaInfo[playerid][oCena] = cena;
	    OfertaInfo[playerid][oWar1] = war1;//w2, w3,w1
	    OfertaInfo[playerid][oWar2] = uid;
	    OfertaInfo[playerid][oWar3] = dzialnoscuid;
	    OfertaInfo[playerid][oWar4] = skin;
		OfertaInfo[playerid][oWar5] = news;
	    OfertaInfo[playerid2][oSprzedajacy] = playerid;
	    new but = -1;
	    if(typ == OFEROWANIE_INVITE)
		{
		    but = 1;
			format(offername, 256, "Typ oferty: Dolaczenie do grupy\n\n Grupa: %s\n Oferuje: %s", GrupaInfo[dzialnoscuid][gNazwa], ZmianaNicku(playerid));
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer invite %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_KONTAKT)
		{
		    but = 1;
			format(offername, 256, "Typ oferty: Kontakt\n\n Oferuje: %s", ZmianaNicku(playerid));
			cmd_me(playerid, "bierze do rêki telefon i wysy³a vCard.");
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer v-card %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_POJAZDU)
		{
			but = 0;
			format(offername, 256, "Typ oferty: Kupno pojazdu\n\nPojazd: %s\nOferuje: %s\nKoszt: %d$", GetVehicleModelName(PojazdInfo[war1][pModel]), ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer buy vehicles %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_TERENU)
		{
			but = 0;
			format(offername, 256, "Typ oferty: Kupno terenu\n\nTeren: %d\nOferuje: %s\nKoszt: %d$", war1, ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer buy area %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_POJAZDU2)
		{
			but = 0;
			format(offername, 256, "Typ oferty: Wymiana pojazdu\n\nPojazd : %s za %s\nOferuje: %s\nDoplata: %d$", GetVehicleModelName(PojazdInfo[war1][pModel]), GetVehicleModelName(PojazdInfo[uid][pModel]), ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer exchange vehicle %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_RP)
		{
			but = 0;
			format(offername, 256, "Typ oferty: RP\n\nOferuje: %s\nKoszt: %d$", ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer RP %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_LAKIERU)
		{
			but = 0;
			format(offername, 256, "Typ oferty: Usluga\n\nOferuje: %s\nKoszt: %d$", ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer respray vehicles %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_WYPOZYCZENIE)
		{
			but = 1;
			format(offername, 256, "Typ oferty: Wypozyczenie pojazdu\n\nPojazd: %s\nOferuje: %s\nCzas: %dmin", GetVehicleModelName(PojazdInfo[war1][pModel]), ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer rental vehicles %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_SZTUKEWALKI)
		{
			but = 0;
			format(offername, 256, "Typ oferty: Sztuke walki\n\nOferuje: %s\nKoszt: %d$", ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer martial art %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_DOKUMENTU)
		{
			but = 0;
			format(offername, 256, "Typ oferty: %s\n\nOferuje: %s\nKoszt: %d$", TypDokumentu[uid], ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer document %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_DOKUMENTU2)
		{
			but = 0;
   			format(offername, 256, "Typ oferty: %s\n\nOferuje: Mikel Corse\nKoszt: %d$", TypDokumentu[uid], cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer Document Mikel Corse (Urzednik)", ZmianaNicku(playerid), playerid);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_DZIALA)
		{
			but = 0;
			format(offername, 256, "Typ oferty: %s\nNazwa: %s\n\nOferuje: Mikel Corse\nKoszt: %d$", NazwyDzialalnosci[uid], reason, cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer new group Mikel Corse (Urzednik)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_HOLOWANIA)
		{
			but = 0;
			format(offername, 256, "Typ oferty: Holowanie (%s, %d)\n\nOferuje: %s\nKoszt: %d$", GetVehicleModelName(PojazdInfo[dzialnoscuid][pModel]), dzialnoscuid, ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer towing %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_TABLIC)
		{
			but = 0;
			format(offername, 256, "Typ oferty: Tablice (%s, %d)\n\nOferuje: %s\nKoszt: %d$", GetVehicleModelName(PojazdInfo[uid][pModel]), uid, ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer tables %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_TABLIC2)
		{
			but = 0;
			format(offername, 256, "Typ oferty: Tablice (%s, %d)\n\nOferuje: Mikel Corse\nKoszt: %d$", GetVehicleModelName(PojazdInfo[uid][pModel]), uid, cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer tables Mikel Corse (Urzednik)", ZmianaNicku(playerid), playerid);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_OPLATY)
		{
			but = 0;
			format(offername, 256, "Typ oferty: Budynek (%d)\n\nOferuje: %s\nKoszt: %d$", uid, ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer charge %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_OPLATY2)
		{
			but = 0;
			format(offername, 256, "Typ oferty: Budynek (%d)\n\nOferuje: Mikel Corse\nKoszt: %d$", uid, cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer charge Mikel Corse (Urzednik)", ZmianaNicku(playerid), playerid);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_WYREJ)
		{
			but = 0;
			format(offername, 256, "Typ oferty: Wyrejestrowanie (%s, %d)\n\nOferuje: %s\nKoszt: %d$", GetVehicleModelName(PojazdInfo[uid][pModel]), uid, ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer re tables %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_ELEKTRYKI)
		{
			but = 0;
			format(offername, 256, "Typ oferty: Zarzadzanie instalacja elektryczna\n\nCzas: %dmin\nOferuje: %s\nKoszt: %d$", war1, ZmianaNicku(playerid), cena);
		}
		if(typ == OFEROWANIE_OCHRONY)
		{
			but = 0;
			format(offername, 256, "Typ oferty: Ochrona budynku\n\nCzas montazu: %dmin\nOferuje: %s\nKoszt: %d$", war1, ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer security %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_BUDYNKU)
		{
		    but = 0;
		    format(offername, 256, "Typ oferty: Kupno budynku\n\nBudynek: %s\nOferuje: %s\nKoszt: %d$", BudynekInfo[war1][nAdres], ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer building %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_PRZEDMIOTU)
		{
		    new strings[64];
		    if(PrzedmiotInfo[uid][pWar4] == -1)
		    {
		        format(strings, sizeof(strings), "Nielegalna");
		    }
			if(PrzedmiotInfo[uid][pWar4] == -2)
		    {
		        format(strings, sizeof(strings), "ASG");
		    }
		    if(PrzedmiotInfo[uid][pWar4] == 0)
		    {
		        format(strings, sizeof(strings), "Legalna, niezarejestrowana");
		    }
		    if(PrzedmiotInfo[uid][pWar4] > 0)
		    {
		        format(strings, sizeof(strings), "Legalna, zarejestrowana");
		    }
		    if(PrzedmiotInfo[uid][pTyp] == P_WEAPON)
		    {
			    but = 0;
			    format(offername, 256, "Typ oferty: Kupno przedmiotu\n\nPrzedmiot: %s (%s)\nOferuje: %s\nKoszt: %d$", PrzedmiotInfo[uid][pNazwa], strings, ZmianaNicku(playerid), cena);
			}
			else
			{
			    but = 0;
			    format(offername, 256, "Typ oferty: Kupno przedmiotu\n\nPrzedmiot: %s\nOferuje: %s\nKoszt: %d$", PrzedmiotInfo[uid][pNazwa], ZmianaNicku(playerid), cena);
			}
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer things %s %s (%d)", ZmianaNicku(playerid), playerid, PrzedmiotInfo[uid][pNazwa], ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_PODAJ)
		{
		    but = 0;
		    format(offername, 256, "Typ oferty: Kupno przedmiotu\n\nPrzedmiot: %s\nOferuje: %s\nKoszt: %d$\nIlosc: %d", OfertaInfo[playerid][oPowod], ZmianaNicku(playerid), cena, news);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer pass %s %s (%d)", ZmianaNicku(playerid), playerid, OfertaInfo[playerid][oPowod], ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_PODAJ_AUTOMAT)
		{
		    but = 0;
		    format(offername, 256, "Typ oferty: Kupno przedmiotu\n\nPrzedmiot: %s\nOferuje: %s\nKoszt: %d$", OfertaInfo[playerid][oPowod], ZmianaNicku(playerid), cena);
		}
		if(typ == OFEROWANIE_MAGAZYN)
		{
		    but = 0;
		    format(offername, 256, "Typ oferty: Wyjecie przedmiotu\n\nPrzedmiot: %s\nOferuje: %s\nKoszt: %d$", OfertaInfo[playerid][oPowod], ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer pass magazin %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_MANDATU)
		{
		    but = 1;
			new rok, miesiac, dzien, godzina, minuta, sekunda;
			sekundytodata(OfertaInfo[playerid][oWar1], rok, miesiac, dzien, godzina, minuta, sekunda);
		    format(offername, 256, "Typ oferty: Mandat(Zad³u¿enie) (Punkty karne: %d)\n\nOferuje: %s\nKwota: %d$\nOkres sp³aty d³ugu: %d.%d.%d  %d:%d:%d\nPowód mandatu: %s", OfertaInfo[playerid][oWar3], ZmianaNicku(playerid), cena, dzien, miesiac, rok, godzina-czasHistory, minuta, sekunda, OfertaInfo[playerid][oPowod]);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer mandate %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_BLOKADY)
		{
		    but = 0;
		    format(offername, 256, "Typ oferty: Blokada\n\nOferuje: %s\nKoszt: %d$", ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer block %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_TANKOWANIA)
		{
		    but = 0;
		    format(offername, 256, "Typ oferty: Tankowanie\n\nLitry: %d (Lacznie: %d)\nOferuje: %s\nKoszt: %d$",dzialnoscuid,war1, ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer tank %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_WYSCIG)
		{
			but = 1;
			format(offername, 256, "Typ oferty: Wyscig\n\nOferuje: %s", ZmianaNicku(playerid));
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer race %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_WYWIAD)
		{
			but = 1;
			format(offername, 256, "Typ oferty: Wywiad\n\nOferuje: %s", ZmianaNicku(playerid));
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer live %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_WYNAJMU)
		{
		    but = 1;
			format(offername, 256, "Typ oferty: Wynajem pokoju\n\nBudynek: %s\nOferuje: %s", BudynekInfo[war1][nAdres], ZmianaNicku(playerid));
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer rent building %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_REJBRONI)
		{
		    but = 0;
			format(offername, 256, "Typ oferty: Rejestracja legalnej broni\n\nOferuje: %s\nKoszt: %d$", ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer flags weapon %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_PRZETRZYMANIA)
		{
			but = 1;
			new rok, miesiac, dzien, godzina, minuta, sekunda;
			sekundytodata(cena, rok, miesiac, dzien, godzina, minuta, sekunda);
		    format(offername, 256, "Typ oferty: Przetrzymanie\n\nOferuje: %s\nCzas przetrzymania: %02d-%02d-%d, %02d:%02d\nPowod: %s", ZmianaNicku(playerid), dzien, miesiac, rok, godzina, minuta, OfertaInfo[playerid][oPowod]);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer detention %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_LAKIEROWANIA)
		{
			but = 0;
		    format(offername, 256, "Typ oferty: Lakierowanie\n\nKolor: %d:%d\nOferuje: %s\nKoszt: %d$", OfertaInfo[playerid][oWar1], OfertaInfo[playerid][oWar4], ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer respray vehicles %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_DLUG)
		{
			but = 1;
			new rok, miesiac, dzien, godzina, minuta, sekunda;
			sekundytodata(OfertaInfo[playerid][oWar1], rok, miesiac, dzien, godzina, minuta, sekunda);
		    format(offername, 256, "Typ oferty: D³ug\n\nOferuje: %s\nKwota: %d$\nOkres sp³aty d³ugu: %d.%d.%d  %d:%d:%d\nPowód d³ugu: %s", ZmianaNicku(playerid), cena, dzien, miesiac, rok, godzina-czasHistory, minuta, sekunda, OfertaInfo[playerid][oPowod]);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer debet %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_DLUGSPLATA)
		{
			but = 0;
		    format(offername, 256, "Typ oferty: Sp³ata d³ugu\n\nKoszt: %d$", cena);
			SetPVarInt(playerid, "SplataOferta", 1);
		}
		if(typ == OFEROWANIE_PJ)
		{
			but = 0;
		    format(offername, 256, "Typ oferty: Paint-Job\n\nNumer: %d\nOferuje: %s\nKoszt: %d$", OfertaInfo[playerid][oWar1], ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer PJ %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_STREFY)
		{
			but = 0;
		    format(offername, 256, "Typ oferty: Strefa\n\nOferuje: %s\nCena: %d$", ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer area %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_TAXI)
		{
			but = 0;
		    format(offername, 256, "Typ oferty: Przejazd taxi\n\nOferuje: %s\nKoszt: %d$/km", ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer TAXI %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_TATUAZU)
		{
		    but = 0;
		    format(offername, 256, "Typ oferty: Tatuaz\n\nOferuje: %s\nKoszt: %d$", ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer tatto %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_HARACZU)
		{
		    but = 0;
		    format(offername, 256, "Typ oferty: Haracz\n\nOferuje: %s\nKoszt: %d$", ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer tribute %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_NAP_VEH)
		{
		    but = 1;
			format(offername, 256, "Typ oferty: Montaz\n\nCzesc: %s\nOferuje: %s\nKoszt: %d$", PrzedmiotInfo[uid][pNazwa], ZmianaNicku(playerid), NaprawianieCena[playerid]);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer repair caroserie %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_NAP_ENG)
		{
		    but = 1;
			format(offername, 256, "Typ oferty: Naprawa silnika\n\nOferuje: %s\nKoszt: %d$", ZmianaNicku(playerid), cena);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer repair engine %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_YO)
		{
		    but = 1;
			format(offername, 256, "Typ oferty: Przywitanie\n\nOferuje: %s", ZmianaNicku(playerid));
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[OFFER] [%s] [ID: %d] Send an offer yo %s (%d)", ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		}
		if(typ == OFEROWANIE_AKC_NAP)
		{
			but = 0;
			if(NaprawiaIUID[playerid] == -1) format(offername, 256, "Typ oferty: Naprawa silnika\n\nOferuje: %s\nKoszt: %d$", ZmianaNicku(playerid), cena);
			else format(offername, 256, "Typ oferty: Montaz\n\nCzesc: %s\nOferuje: %s\nKoszt: %d$", PrzedmiotInfo[uid][pNazwa], ZmianaNicku(playerid), NaprawianieCena[playerid]);
		}
		strdel(tekst_global, 0, 2048);
		GameTextForPlayer(playerid, "~y~Oferta:~n~~w~Zostala wyslana czekaj na reakcje gracza.", 3000, 5);
		format(tekst_global, sizeof(tekst_global), "%s", offername);
	    if(but == 0)//P³atnoœæ gotówk¹ lub kart¹
		{
			new naglowek[126];
			format(naglowek, sizeof(naglowek), "• Oferta od gracza %s (%d)", ZmianaNicku(playerid), playerid);
			dShowPlayerDialog(playerid2, DIALOG_OFERTA_BUT0, DIALOG_STYLE_MSGBOX, naglowek, offername, "Akceptuj", "Odrzuc");
	    }
	    else if(but == 1)//Akceptuj ofertê lub odrzuæ
	    {
			new naglowek[126];
			format(naglowek, sizeof(naglowek), "• Oferta od gracza %s (%d)", ZmianaNicku(playerid), playerid);
			dShowPlayerDialog(playerid2, DIALOG_OFERTA_BUT1, DIALOG_STYLE_MSGBOX, naglowek, offername, "Akceptuj", "Odrzuc");
	    }
		OferujeA[playerid] = playerid2;
	}
    return 1;
}
stock Akceptacja(playerid, accept, typp)
{
	new sellerid = OfertaInfo[playerid][oSprzedajacy];
	OferujeA[sellerid] = -1;
	new type = OfertaInfo[sellerid][oTyp];
	new cena = OfertaInfo[sellerid][oCena];
	new wart1 = OfertaInfo[sellerid][oWar1];
	new wart2 = OfertaInfo[sellerid][oWar2];
	new wart3 = OfertaInfo[sellerid][oWar3];//w2, w3,w1
	new wart4 = OfertaInfo[sellerid][oWar4];
	new wart5 = OfertaInfo[sellerid][oWar5];
	if(accept == 0)
	{
	    GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~~2~Twoja oferta zostala odrzucona.",5000,3);
		SetPVarInt(sellerid, "SplataOferta", 0);
		if(type == OFEROWANIE_NAP_VEH || type == OFEROWANIE_AKC_NAP || type == OFEROWANIE_NAP_ENG || type == OFEROWANIE_TUNE_VEH)
		{
			NaprawiaID[sellerid] = 0;
			NaprawianieVW[sellerid] = 0;
			NaprawiaVeh[sellerid] = 0;
			NaprawiaIUID[sellerid] = 0;
			NaprawiaCzas[sellerid] = 0;
			LakierujeCzas[sellerid] = 0;
			DeletePVar(sellerid,"TypM");
		}
	    return 1;
	}
	if(typp == 0)
	{
		if(DaneGracza[playerid][gPORTFEL] < cena)
		{
		    GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~~2~Twoja oferta zostala odrzucona.",5000,3);
			SetPVarInt(sellerid, "SplataOferta", 0);
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Nie posiadasz wystarczaj¹cej{DEDEDE} iloœæi pieniêdzy.", "Zamknij", "");
			if(type == OFEROWANIE_NAP_VEH || type == OFEROWANIE_AKC_NAP || type == OFEROWANIE_TUNE_VEH)
			{
				NaprawiaID[sellerid] = 0;
				NaprawianieVW[sellerid] = 0;
				NaprawiaVeh[sellerid] = 0;
				NaprawiaIUID[sellerid] = 0;
				NaprawiaCzas[sellerid] = 0;
				LakierujeCzas[sellerid] = 0;
				DeletePVar(sellerid,"TypM");
			}
		    return 1;
		}
	}
	else if(typp == 1)
	{
	    if(DaneGracza[playerid][gSTAN_KONTA] < cena)
		{
		    GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~~2~Twoja oferta zostala odrzucona.",5000,3);
			SetPVarInt(sellerid, "SplataOferta", 0);
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Nie posiadasz wystarczaj¹cej{DEDEDE} iloœæi pieniêdzy.", "Zamknij", "");
			if(type == OFEROWANIE_NAP_VEH || type == OFEROWANIE_AKC_NAP || type == OFEROWANIE_TUNE_VEH)
			{
				NaprawiaID[sellerid] = 0;
				NaprawianieVW[sellerid] = 0;
				NaprawiaVeh[sellerid] = 0;
				NaprawiaIUID[sellerid] = 0;
				NaprawiaCzas[sellerid] = 0;
				LakierujeCzas[sellerid] = 0;
				DeletePVar(sellerid,"TypM");
			}
		    return 1;
		}
	}
	if(type == OFEROWANIE_INVITE)
	{
	    if(DaneGracza[playerid][gZD2] == 0)
		{
			CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
			TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
			TextDrawSetString(TextNaDrzwi[playerid], "~y~Osiagniecie~n~~w~Niezla fucha ~g~+5QP");
			TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
			DaneGracza[playerid][gGAMESCORE] += 5;
			DaneGracza[playerid][gZD2] = 1;
		    SetPlayerScore(playerid,DaneGracza[playerid][gGAMESCORE]);
			ZapiszGracza(playerid);
			ZapiszGraczaGlobal(playerid, 1);
		}
		GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales oferte.",5000,3);
     	GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~Twoja oferta zostala akceptowana.",5000,3);
     	new dolaczyltext[256];
        format(dolaczyltext,sizeof(dolaczyltext),"Od teraz jesteœ cz³onkiem nowej grupy! SprawdŸ komendy grupy pod {FFFFFF}/pomoc - nazwa grupy do której do³¹czy³eœ.");
		SendClientMessage(playerid, 0x84C2E0FF, dolaczyltext);
		format(dolaczyltext,sizeof(dolaczyltext),"> Aby przywitaæ siê z cz³onkami tej grupy, napisz {FFFF00}@[3] Czeœæ. {84C2E0}lub {FFFF00}![3] Czeœæ.");
		SendClientMessage(playerid, 0x84C2E0FF, dolaczyltext);
		format(dolaczyltext,sizeof(dolaczyltext),"> Od teraz mozesz sprzedawaæ produkty za pomoc¹ {FFFFFF}/podaj [ID Gracza]{84C2E0} lub pokazaæ ceny produktów {FFFFFF}/cennik [ID Gracza].");
		SendClientMessage(playerid, 0x84C2E0FF, dolaczyltext);
     	new akcjarp[126];
		format(akcjarp,sizeof(akcjarp),"podpisuje umowê o pracê.");
		cmd_me(playerid, akcjarp);
	    new akcja[126];
		format(akcja,sizeof(akcja),"*podpisuje umowê o pracê.*");
		SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
		new akcja2[126];
		format(akcja2,sizeof(akcja2),"podpisuje umowe o prace.");
		TextDrawSetString(AkcjaTD[playerid], akcja2);
		TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
		CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
		//GrupaInfo[dzialnoscuid][gNazwa]
		if(DaneGracza[playerid][gDzialalnosc1] == 0)
		{
		    DaneGracza[playerid][gDzialalnosc1] = wart3;
		    DodajPracownika(DaneGracza[playerid][gUID], wart3, wart1, wart4);
			kolorchatu(playerid, wart3, 1);
			StatykujTransakcje(wart3, sellerid, playerid, "Zaprosil gracza", -1);
			Zaproszenie(playerid, sellerid, wart3, GrupaInfo[wart3][gNazwa], GrupaInfo[wart3][gTyp]);
			Transakcja(T_OKINV, DaneGracza[playerid][gUID], DaneGracza[sellerid][gUID], DaneGracza[playerid][gGUID], DaneGracza[sellerid][gGUID], -1, wart3, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
			return 1;
		}
		else if(DaneGracza[playerid][gDzialalnosc2] == 0)
		{
		    DaneGracza[playerid][gDzialalnosc2] = wart3;
			DodajPracownika(DaneGracza[playerid][gUID], wart3, wart1, wart4);
			kolorchatu(playerid, wart3, 2);
			StatykujTransakcje(wart3, sellerid, playerid, "Zaprosil gracza", -1);
			Zaproszenie(playerid, sellerid, wart3, GrupaInfo[wart3][gNazwa], GrupaInfo[wart3][gTyp]);
			Transakcja(T_OKINV, DaneGracza[playerid][gUID], DaneGracza[sellerid][gUID], DaneGracza[playerid][gGUID], DaneGracza[sellerid][gGUID], -1, wart3, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
			return 1;
		}
		else if(DaneGracza[playerid][gDzialalnosc3] == 0)
		{
            DaneGracza[playerid][gDzialalnosc3] = wart3;
			DodajPracownika(DaneGracza[playerid][gUID], wart3, wart1, wart4);
			kolorchatu(playerid, wart3, 3);
			StatykujTransakcje(wart3, sellerid, playerid, "Zaprosil gracza", -1);
			Zaproszenie(playerid, sellerid, wart3, GrupaInfo[wart3][gNazwa], GrupaInfo[wart3][gTyp]);
			Transakcja(T_OKINV, DaneGracza[playerid][gUID], DaneGracza[sellerid][gUID], DaneGracza[playerid][gGUID], DaneGracza[sellerid][gGUID], -1, wart3, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
			return 1;
		}
		else if(DaneGracza[playerid][gDzialalnosc4] == 0)
		{
            DaneGracza[playerid][gDzialalnosc4] = wart3;
			DodajPracownika(DaneGracza[playerid][gUID], wart3, wart1, wart4);
			kolorchatu(playerid, wart3, 4);
			StatykujTransakcje(wart3, sellerid, playerid, "Zaprosil gracza", -1);
			Zaproszenie(playerid, sellerid, wart3, GrupaInfo[wart3][gNazwa], GrupaInfo[wart3][gTyp]);
			Transakcja(T_OKINV, DaneGracza[playerid][gUID], DaneGracza[sellerid][gUID], DaneGracza[playerid][gGUID], DaneGracza[sellerid][gGUID], -1, wart3, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
			return 1;
		}
		else if(DaneGracza[playerid][gDzialalnosc5] == 0)
		{
            DaneGracza[playerid][gDzialalnosc5] = wart3;
			DodajPracownika(DaneGracza[playerid][gUID], wart3, wart1, wart4);
			kolorchatu(playerid, wart3, 5);
			StatykujTransakcje(wart3, sellerid, playerid, "Zaprosil gracza", -1);
			Zaproszenie(playerid, sellerid, wart3, GrupaInfo[wart3][gNazwa], GrupaInfo[wart3][gTyp]);
			Transakcja(T_OKINV, DaneGracza[playerid][gUID], DaneGracza[sellerid][gUID], DaneGracza[playerid][gGUID], DaneGracza[sellerid][gGUID], -1, wart3, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
			return 1;
		}
		else if(DaneGracza[playerid][gDzialalnosc6] == 0)
		{
            DaneGracza[playerid][gDzialalnosc6] = wart3;
			DodajPracownika(DaneGracza[playerid][gUID], wart3, wart1, wart4);
			kolorchatu(playerid, wart3, 6);
			StatykujTransakcje(wart3, sellerid, playerid, "Zaprosil gracza", -1);
			Zaproszenie(playerid, sellerid, wart3, GrupaInfo[wart3][gNazwa], GrupaInfo[wart3][gTyp]);
			Transakcja(T_OKINV, DaneGracza[playerid][gUID], DaneGracza[sellerid][gUID], DaneGracza[playerid][gGUID], DaneGracza[sellerid][gGUID], -1, wart3, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
			return 1;
		}
	}
	if(type == OFEROWANIE_YO)
	{
		SetPlayerToFacePlayer(playerid, sellerid);
		ApplyAnimation(playerid, "GANGS", "hndshkaa", 4.0, 0, 0, 0, 0, 0);
		ApplyAnimation(sellerid,"GANGS", "hndshkaa", 4.0, 0, 0, 0, 0, 0);
     	GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales oferte.",5000,3);
     	GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~Twoja oferta zostala akceptowana.",5000,3);
	}
	if(type == OFEROWANIE_TABLIC)
	{
		if(typp == 0)
		{
			Dodajkase( playerid, -cena );
			GrupaInfo[wart3][gSaldo] += cena;
			ZapiszGracza(playerid);
			ZapiszSaldo(wart3);
		}
		else if(typp == 1)
		{
			DaneGracza[playerid][gSTAN_KONTA] -= cena;
			GrupaInfo[wart3][gSaldo] += cena;
			ZapiszBankKasa(playerid);
			ZapiszSaldo(wart3);
		}
		new id = DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_TABLICA, wart2, 0, "Tablice", DaneGracza[playerid][gUID], 0, -1, 0, 0, 0, 0, "");
		PojazdInfo[wart2][pTablicaON] = id;
		ZapiszPojazd(wart2, 1);
		GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales oferte.",5000,3);
		if(DutyNR[sellerid] == 1) DaneGracza[sellerid][gPrzynaleznosci][3]++;
		else if(DutyNR[sellerid] == 2) DaneGracza[sellerid][gPrzynaleznosci][9]++;
		else if(DutyNR[sellerid] == 3) DaneGracza[sellerid][gPrzynaleznosci][15]++;
		else if(DutyNR[sellerid] == 4) DaneGracza[sellerid][gPrzynaleznosci][21]++;
		else if(DutyNR[sellerid] == 5) DaneGracza[sellerid][gPrzynaleznosci][27]++;
		else if(DutyNR[sellerid] == 6) DaneGracza[sellerid][gPrzynaleznosci][33]++;
		StatykujTransakcje(wart3, sellerid, playerid, "Tablice", cena);
     	GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~Twoja oferta zostala akceptowana.",5000,3);
	}
	if(type == OFEROWANIE_TABLIC2)
	{
		new id = DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_TABLICA, wart2, 0, "Tablice", DaneGracza[playerid][gUID], 0, -1, 0, 0, 0, 0, "");
		PojazdInfo[wart2][pTablicaON] = id;
		ZapiszPojazd(wart2, 1);
		if(typp == 0)
	    {
		    Dodajkase(playerid, -cena );
		    ZapiszGracza(playerid);
	    }
     	else if(typp == 1)
	    {
		    DaneGracza[playerid][gSTAN_KONTA] -= cena;
		    ZapiszBankKasa(playerid);
	    }
		SetPVarInt(playerid, "Poziom", 0);
		SetPVarInt(playerid, "BotAkcja", 0);
		GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales oferte.",5000,3);
	}
	if(type == OFEROWANIE_OPLATY)
	{
		if(typp == 0)
		{
			Dodajkase( playerid, -cena );
			GrupaInfo[wart3][gSaldo] += cena;
			ZapiszGracza(playerid);
			ZapiszSaldo(wart3);
		}
		else if(typp == 1)
		{
			DaneGracza[playerid][gSTAN_KONTA] -= cena;
			GrupaInfo[wart3][gSaldo] += cena;
			ZapiszBankKasa(playerid);
			ZapiszSaldo(wart3);
		}
		BudynekInfo[wart2][nOplata] = gettime()+CZAS_LETNI+(7*24*60*60);
		ZapiszNieruchomosc(wart2);
		GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales oferte.",5000,3);
		if(DutyNR[sellerid] == 1) DaneGracza[sellerid][gPrzynaleznosci][3]++;
		else if(DutyNR[sellerid] == 2) DaneGracza[sellerid][gPrzynaleznosci][9]++;
		else if(DutyNR[sellerid] == 3) DaneGracza[sellerid][gPrzynaleznosci][15]++;
		else if(DutyNR[sellerid] == 4) DaneGracza[sellerid][gPrzynaleznosci][21]++;
		else if(DutyNR[sellerid] == 5) DaneGracza[sellerid][gPrzynaleznosci][27]++;
		else if(DutyNR[sellerid] == 6) DaneGracza[sellerid][gPrzynaleznosci][33]++;
		StatykujTransakcje(wart3, sellerid, playerid, "Oplata budynku", cena);
     	GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~Twoja oferta zostala akceptowana.",5000,3);
	}
	if(type == OFEROWANIE_OPLATY2)
	{
	    if(typp == 0)
	    {
		    Dodajkase(playerid, -cena );
		    ZapiszGracza(playerid);
	    }
     	else if(typp == 1)
	    {
		    DaneGracza[playerid][gSTAN_KONTA] -= cena;
		    ZapiszBankKasa(playerid);
	    }
		BudynekInfo[wart2][nOplata] = gettime()+CZAS_LETNI+(7*24*60*60);
		ZapiszNieruchomosc(wart2);
		SetPVarInt(playerid, "Poziom", 0);
		SetPVarInt(playerid, "BotAkcja", 0);
		GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales oferte.",5000,3);
     	dShowPlayerDialog(playerid, DIALOG_INTERAKCJA_AKTOR_OPLATA, DIALOG_STYLE_MSGBOX, "• TIP:", "Chcesz jeszcze op³aciæ jakiœ swój budynek do którego posiadasz uprawnienia?", "Tak", "Nie");
	}
	if(type == OFEROWANIE_KONTAKT)
	{
	    SetPVarInt(playerid, "Kontakt", sellerid);
		dShowPlayerDialog(playerid, DIALOG_VCARD_ZAPISZ_TELEFON, DIALOG_STYLE_INPUT, "• vCard:", "{a9c4e4}Wys³ano Ci numer telefonu. Pod jak¹ naza chcesz go zapisaæ?\n\n{FF0000}(( Uwaga, Twoja postaæ mo¿e nie znaæ imienia i nazwiska tej osoby. ))\n(( Niech najpierw zapyta o Imie IC. Inaczej pope³nisz zakazany MetaGaming. )):", "Dalej", "Zamknij");
		GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales oferte.",5000,3);
     	GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~Twoja oferta zostala akceptowana.",5000,3);
	}
	if(type == OFEROWANIE_WYREJ)
	{
		if(typp == 0)
		{
			Dodajkase( playerid, -cena );
			GrupaInfo[wart3][gSaldo] += cena;
			ZapiszGracza(playerid);
			ZapiszSaldo(wart3);
		}
		else if(typp == 1)
		{
			DaneGracza[playerid][gSTAN_KONTA] -= cena;
			GrupaInfo[wart3][gSaldo] += cena;
			ZapiszBankKasa(playerid);
			ZapiszSaldo(wart3);
		}
		UsunPrzedmiot(PojazdInfo[wart2][pTablicaON]);
		PojazdInfo[wart2][pTablicaON] = 0;
		format(PojazdInfo[wart2][pTablice], 10, " ");
		GetVehiclePos(PojazdInfo[wart2][pID],PojazdInfo[wart2][pOX],PojazdInfo[wart2][pOY],PojazdInfo[wart2][pOZ]);
		PojazdInfo[wart2][pOVW] = GetVehicleVirtualWorld(PojazdInfo[wart2][pID]);
		GetVehicleZAngle(PojazdInfo[wart2][pID], PojazdInfo[wart2][pOA]);
		SetVehicleNumberPlate(PojazdInfo[wart2][pID], PojazdInfo[wart2][pTablice]);
		SetTimerEx("Naprawa",3000,false,"dd",PojazdInfo[wart2][pID],GetVehicleVirtualWorld(PojazdInfo[wart2][pID]));
		SetVehicleVirtualWorld(PojazdInfo[wart2][pID],9999);
		ZapiszPojazd(wart2, 1);
		GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales oferte.",5000,3);
		if(DutyNR[sellerid] == 1) DaneGracza[sellerid][gPrzynaleznosci][3]++;
		else if(DutyNR[sellerid] == 2) DaneGracza[sellerid][gPrzynaleznosci][9]++;
		else if(DutyNR[sellerid] == 3) DaneGracza[sellerid][gPrzynaleznosci][15]++;
		else if(DutyNR[sellerid] == 4) DaneGracza[sellerid][gPrzynaleznosci][21]++;
		else if(DutyNR[sellerid] == 5) DaneGracza[sellerid][gPrzynaleznosci][27]++;
		else if(DutyNR[sellerid] == 6) DaneGracza[sellerid][gPrzynaleznosci][33]++;
		StatykujTransakcje(wart3, sellerid, playerid, "Wyrejestrowa³ pojazd", cena);
     	GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~Twoja oferta zostala akceptowana.",5000,3);
	}
	if(type == OFEROWANIE_DOKUMENTU)
	{
		if(typp == 0)
		{
			Dodajkase( playerid, -cena );
			GrupaInfo[wart3][gSaldo] += cena;
			ZapiszGracza(playerid);
			ZapiszSaldo(wart3);
		}
		else if(typp == 1)
		{
			DaneGracza[playerid][gSTAN_KONTA] -= cena;
			GrupaInfo[wart3][gSaldo] += cena;
			ZapiszBankKasa(playerid);
			ZapiszSaldo(wart3);
		}
		if(wart2 == D_PRAWKO_A)
		{
			DaneGracza[playerid][gDokumenty][D_PRAWKO_A] = 1;
			DaneGracza[playerid][gDokumenty][D_PRAWKO_B] = 1;
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (Prawo jazdy)", cena);
			if(DaneGracza[playerid][gZD7] == 0)
			{
				CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
				TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
				TextDrawSetString(TextNaDrzwi[playerid], "~y~Osiagniecie~n~~w~Driver ~g~+5QP");
				TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
				DaneGracza[playerid][gGAMESCORE] += 5;
				DaneGracza[playerid][gZD7] = 1;
			    SetPlayerScore(playerid,DaneGracza[playerid][gGAMESCORE]);
				ZapiszGracza(playerid);
				ZapiszGraczaGlobal(playerid, 1);
			}
		}
		if(wart2 == D_DOWOD)
		{
		    DaneGracza[playerid][gDokumenty][D_DOWOD] = 1;
		    StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (Dowod)", cena);
			if(DaneGracza[playerid][gZD6] == 0)
			{
			    CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
				TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
				TextDrawSetString(TextNaDrzwi[playerid], "~y~Osiagniecie~n~~w~Zidentyfikowany ~g~+5QP");
				TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
				DaneGracza[playerid][gGAMESCORE] += 5;
				DaneGracza[playerid][gZD6] = 1;
			    SetPlayerScore(playerid,DaneGracza[playerid][gGAMESCORE]);
				ZapiszGracza(playerid);
				ZapiszGraczaGlobal(playerid, 1);
			}
		}
		if(wart2 == D_PRAWKO_B)
		{
		    DaneGracza[playerid][gDokumenty][D_PRAWKO_A] = 1;
			DaneGracza[playerid][gDokumenty][D_PRAWKO_B] = 1;
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (Prawo jazdy)", cena);
		}
		if(wart2 == D_BRON)
		{
			DaneGracza[playerid][gDokumenty][D_BRON] = 1;
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (licencja na broñ)", cena);
			if(DaneGracza[playerid][gZD9] == 0)
			{
			    CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
				TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
				TextDrawSetString(TextNaDrzwi[playerid], "~y~Osiagniecie~n~~w~Bang bang! ~g~+25QP");
				TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
				DaneGracza[playerid][gGAMESCORE] += 25;
				DaneGracza[playerid][gZD9] = 1;
			    SetPlayerScore(playerid,DaneGracza[playerid][gGAMESCORE]);
				ZapiszGracza(playerid);
				ZapiszGraczaGlobal(playerid, 1);
			}
		}
		if(wart2 == D_NIEKARALNOSC)
		{
			DaneGracza[playerid][gDokumenty][D_NIEKARALNOSC] = 1;
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (niekaralnoœci)", cena);
		}
		if(wart2 == D_NIEPOCZYTALNOSC)
		{
			DaneGracza[playerid][gDokumenty][D_NIEPOCZYTALNOSC] = 1;
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (niepoczytalnoœci)", cena);
		}
		if(wart2 == D_WEDKARSKA)
		{
			DaneGracza[playerid][gDokumenty][D_WEDKARSKA] = 1;
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (karta wêdkarska)", cena);
		}
		ZapiszGracza(playerid);
		GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales oferte.",5000,3);
		if(DutyNR[sellerid] == 1) DaneGracza[sellerid][gPrzynaleznosci][3]++;
		else if(DutyNR[sellerid] == 2) DaneGracza[sellerid][gPrzynaleznosci][9]++;
		else if(DutyNR[sellerid] == 3) DaneGracza[sellerid][gPrzynaleznosci][15]++;
		else if(DutyNR[sellerid] == 4) DaneGracza[sellerid][gPrzynaleznosci][21]++;
		else if(DutyNR[sellerid] == 5) DaneGracza[sellerid][gPrzynaleznosci][27]++;
		else if(DutyNR[sellerid] == 6) DaneGracza[sellerid][gPrzynaleznosci][33]++;
     	GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~Twoja oferta zostala akceptowana.",5000,3);
	}
	if(type == OFEROWANIE_DOKUMENTU2)
	{
	    if(typp == 0)
		{
			Dodajkase( playerid, -cena );
			//GrupaInfo[wart3][gSaldo] += cena;
			ZapiszGracza(playerid);
			//ZapiszSaldo(wart3);
		}
		else if(typp == 1)
		{
			DaneGracza[playerid][gSTAN_KONTA] -= cena;
			//GrupaInfo[wart3][gSaldo] += cena;
			ZapiszBankKasa(playerid);
			//ZapiszSaldo(wart3);
		}
		if(wart2 == D_PRAWKO_A)
		{
			DaneGracza[playerid][gDokumenty][D_PRAWKO_A] = 1;
			DaneGracza[playerid][gDokumenty][D_PRAWKO_B] = 1;
			SetPVarInt(playerid, "Poziom", 0);
			SetPVarInt(playerid, "BotAkcja", 0);
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (Prawo jazdy)", cena);
			if(DaneGracza[playerid][gZD7] == 0)
			{
				CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
				TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
				TextDrawSetString(TextNaDrzwi[playerid], "~y~Osiagniecie~n~~w~Driver ~g~+5QP");
				TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
				DaneGracza[playerid][gGAMESCORE] += 5;
				DaneGracza[playerid][gZD7] = 1;
			    SetPlayerScore(playerid,DaneGracza[playerid][gGAMESCORE]);
				ZapiszGracza(playerid);
				ZapiszGraczaGlobal(playerid, 1);
			}
		}
		if(wart2 == D_DOWOD)
		{
		    DaneGracza[playerid][gDokumenty][D_DOWOD] = 1;
		    StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (Dowod)", cena);
		    SetPVarInt(playerid, "Poziom", 0);
			SetPVarInt(playerid, "BotAkcja", 0);
			if(DaneGracza[playerid][gZD6] == 0)
			{
			    CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
				TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
				TextDrawSetString(TextNaDrzwi[playerid], "~y~Osiagniecie~n~~w~Zidentyfikowany ~g~+5QP");
				TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
				DaneGracza[playerid][gGAMESCORE] += 5;
				DaneGracza[playerid][gZD6] = 1;
			    SetPlayerScore(playerid,DaneGracza[playerid][gGAMESCORE]);
				ZapiszGracza(playerid);
				ZapiszGraczaGlobal(playerid, 1);
			}
		}
		if(wart2 == D_BRON)
		{
			DaneGracza[playerid][gDokumenty][D_BRON] = 1;
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (licencja na broñ)", cena);
			if(DaneGracza[playerid][gZD9] == 0)
			{
			    CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
				TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
				TextDrawSetString(TextNaDrzwi[playerid], "~y~Osiagniecie~n~~w~Bang bang! ~g~+25QP");
				TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
				DaneGracza[playerid][gGAMESCORE] += 25;
				DaneGracza[playerid][gZD9] = 1;
			    SetPlayerScore(playerid,DaneGracza[playerid][gGAMESCORE]);
				ZapiszGracza(playerid);
				ZapiszGraczaGlobal(playerid, 1);
			}
		}
		if(wart2 == D_NIEKARALNOSC)
		{
			DaneGracza[playerid][gDokumenty][D_NIEKARALNOSC] = 1;
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (niekaralnoœci)", cena);
		}
		if(wart2 == D_NIEPOCZYTALNOSC)
		{
			DaneGracza[playerid][gDokumenty][D_NIEPOCZYTALNOSC] = 1;
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (niepoczytalnoœci)", cena);
		}
		if(wart2 == D_WEDKARSKA)
		{
			DaneGracza[playerid][gDokumenty][D_WEDKARSKA] = 1;
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (karta wêdkarska)", cena);
		}
		ZapiszGracza(playerid);
		SetPVarInt(playerid, "Poziom", 0);
		SetPVarInt(playerid, "BotAkcja", 0);
		GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales oferte.",5000,3);
	}
	if(type == OFEROWANIE_DZIALA)
	{
	    if(typp == 0)
	    {
		    Dodajkase(playerid, -cena);
		    ZapiszGracza(playerid);
	    }
     	else if(typp == 1)
	    {
		    DaneGracza[playerid][gSTAN_KONTA] -= cena;
		    ZapiszBankKasa(playerid);
	    }
		if(wart2 == DZIALALNOSC_WARSZTAT)
		{
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (warsztat)", cena);
		}
		if(wart2 == DZIALALNOSC_247)
		{
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (27/7)", cena);
		}
		if(wart2 == DZIALALNOSC_ELEKTRTYKA)
		{
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (elektryka)", cena);
		}
		if(wart2 == DZIALALNOSC_WYPOZYCZALNIA)
		{
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (Ochrony)", cena);
		}
		if(wart2 == DZIALALNOSC_GASTRONOMIA)
		{
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (gastronomia)", cena);
		}
		if(wart2 == DZIALALNOSC_HOTEL)
		{
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (hotel)", cena);
		}
		if(wart2 == DZIALALNOSC_TAXI)
		{
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (taxi)", cena);
		}
		if(wart2 == DZIALALNOSC_SILOWNIA)
		{
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (silownia)", cena);
		}
		if(wart2 == DZIALALNOSC_SANNEWS)
		{
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (radio)", cena);
		}
		if(wart2 == DZIALALNOSC_SIEC)
		{
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (siec telefonow)", cena);
		}
		if(wart2 == DZIALALNOSC_STRZELNICA)
		{
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (strzelnica)", cena);
		}
		if(wart2 == DZIALALNOSC_AMUNATION)
		{
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (amunation)", cena);
		}
		if(wart2 == DZIALALNOSC_RODZINKA)
		{
			StatykujTransakcje(wart3, sellerid, playerid, "Dokumenty (rodzinka/party)", cena);
		}
		new nowa[25];
		strdel(nowa, 0, 25);
		format(nowa, sizeof(nowa), "typ:%d", wart2);
		new uid_grupy = DodajGrupe(playerid, OfertaInfo[sellerid][oPowod], wart2, nowa, nowa);
		Zaproszenie(playerid, playerid, uid_grupy, GrupaInfo[uid_grupy][gNazwa], GrupaInfo[uid_grupy][gTyp]);
		GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales oferte.",5000,3);
		DaneGracza[playerid][gPozwolenie] = 0;
		ZapiszGracza(playerid);
		ZaladujDzialalnoscisPracownika(uid_grupy, playerid);
		ZaladujUprawnieniaSRP(playerid);
		if(DaneGracza[playerid][gDzialalnosc1] == 0)
		{
		    DaneGracza[playerid][gDzialalnosc1] = uid_grupy;
		    DodajPracownika(DaneGracza[playerid][gUID], uid_grupy, 0, -1);
		    DodajLidera(DaneGracza[playerid][gUID], uid_grupy, -1);
			kolorchatu(playerid, uid_grupy, 1);
			cmd_login(playerid, "");
			return 1;
		}
		else if(DaneGracza[playerid][gDzialalnosc2] == 0)
		{
		    DaneGracza[playerid][gDzialalnosc2] = uid_grupy;
			DodajPracownika(DaneGracza[playerid][gUID], uid_grupy, 0, -1);
			DodajLidera(DaneGracza[playerid][gUID], uid_grupy, -1);
			kolorchatu(playerid, uid_grupy, 2);
			cmd_login(playerid, "");
			return 1;
		}
		else if(DaneGracza[playerid][gDzialalnosc3] == 0)
		{
            DaneGracza[playerid][gDzialalnosc3] = uid_grupy;
			DodajPracownika(DaneGracza[playerid][gUID], uid_grupy, 0, -1);
			DodajLidera(DaneGracza[playerid][gUID], uid_grupy, -1);
			kolorchatu(playerid, uid_grupy, 3);
			cmd_login(playerid, "");
			return 1;
		}
		else if(DaneGracza[playerid][gDzialalnosc4] == 0)
		{
            DaneGracza[playerid][gDzialalnosc4] = uid_grupy;
			DodajPracownika(DaneGracza[playerid][gUID], uid_grupy, 0, -1);
			DodajLidera(DaneGracza[playerid][gUID], uid_grupy, -1);
			kolorchatu(playerid, uid_grupy, 4);
			cmd_login(playerid, "");
			return 1;
		}
		else if(DaneGracza[playerid][gDzialalnosc5] == 0)
		{
            DaneGracza[playerid][gDzialalnosc5] = uid_grupy;
			DodajPracownika(DaneGracza[playerid][gUID], uid_grupy, 0, -1);
			DodajLidera(DaneGracza[playerid][gUID], uid_grupy, -1);
			kolorchatu(playerid, uid_grupy, 5);
			cmd_login(playerid, "");
			return 1;
		}
		else if(DaneGracza[playerid][gDzialalnosc6] == 0)
		{
            DaneGracza[playerid][gDzialalnosc6] = uid_grupy;
			DodajPracownika(DaneGracza[playerid][gUID], uid_grupy, 0, -1);
			DodajLidera(DaneGracza[playerid][gUID], uid_grupy, -1);
			kolorchatu(playerid, uid_grupy, 6);
			cmd_login(playerid, "");
			return 1;
		}
	}
	if(type == OFEROWANIE_WYSCIG)
	{
		if(Pracuje[playerid] != 0)
		{
			GameTextForPlayer(playerid, "~r~Aktualnie sprzatasz ulice. Anuluj zlecenie, aby dolaczyc do wyscigu.", 3000, 5);
			return 0;
		}
		new str[256];
		DaneGracza[playerid][gWyscig] = wart2;
		new texts[124];
		format(texts, sizeof(texts), "{DEDEDE}** Gracz: %s do³¹czy³ do wyœcigu.", ZmianaNicku(playerid));
		KomuninikatWyscig(playerid,texts);
		format(str, sizeof(str), "~g~Dolaczyles do wyscigu: ~w~%s", WyscigInfo[wart2][wNazwa]);
		CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
		TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
		TextDrawSetString(TextNaDrzwi[playerid], str);
		TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
		StatykujTransakcje(DaneGracza[sellerid][gSluzba], sellerid, playerid, "Do³¹czenie do wyœcigu", -1);
		GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~~2~Twoja oferta zostala akceptowana.",5000,3);
	}
	if(type == OFEROWANIE_WYWIAD)
	{
		DaneGracza[sellerid][gWywiad] = playerid;
		DaneGracza[playerid][gWywiad] = sellerid;
		GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~~2~Twoja oferta zostala akceptowana.",5000,3);
		CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
		TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
		TextDrawSetString(TextNaDrzwi[playerid], "Akceptowales wywiad, aby mowic na antenie wpisz ~g~/wywiad [tresc]");
		TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
		StatykujTransakcje(DaneGracza[sellerid][gSluzba], sellerid, playerid, "Wywiad", cena);
	}
	if(type == OFEROWANIE_HOLOWANIA)
	{
	    if(typp == 0)
	    {
		    Dodajkase( playerid, -cena );
		    Dodajkase( sellerid, cena );
		    ZapiszGracza(playerid);
		    ZapiszGracza(sellerid);
	    }
     	else if(typp == 1)
	    {
		    DaneGracza[playerid][gSTAN_KONTA] -= cena;
		    Dodajkase( sellerid, cena );
		    ZapiszBankKasa(playerid);
		    ZapiszGracza(sellerid);
	    }
		if(!IsPlayerInAnyVehicle(playerid))
		{
			dShowPlayerDialog(sellerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Gracz nie{DEDEDE} znajduje siê w pojezdzie.", "Zamknij", "");
			return 0;
		}
		if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER)
		{
			dShowPlayerDialog(sellerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Gracz nie mo¿e{DEDEDE} znajdywaæ siê za kierownic¹.", "Zamknij", "");
			return 0;
		}
		if(!IsPlayerInAnyVehicle(sellerid))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Gracz nie{DEDEDE} znajduje siê w pojezdzie.", "Zamknij", "");
			return 0;
		}
		if(GetPlayerState(sellerid) != PLAYER_STATE_DRIVER)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Gracz nie{DEDEDE} znajduje siê za kierownic¹.", "Zamknij", "");
			return 0;
		}
		AttachTrailerToVehicle(GetPlayerVehicleID(playerid),GetPlayerVehicleID(sellerid));
		new us = SprawdzCarUID(GetPlayerVehicleID(sellerid));
		PrzedmiotInfo[wart1][pUzywany] = us;
		PojazdInfo[us][pHolowany] = 1;
		ZapiszPrzedmiot(wart1);
	    GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales oferte.",5000,3);
     	GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~Twoja oferta zostala akceptowana.",5000,3);
	}
 	if(type == OFEROWANIE_POJAZDU)
	{
     	PojazdInfo[wart1][pOwnerPostac] = DaneGracza[playerid][gUID];
	    if(typp == 0)
	    {
		    Dodajkase( playerid, -cena );
      		Dodajkase( sellerid, cena );
		    ZapiszGracza(playerid);
		    ZapiszGracza(sellerid);
	    }
      	else if(typp == 1)
	    {
		    DaneGracza[playerid][gSTAN_KONTA] -= cena;
		    Dodajkase( sellerid, cena );
		    ZapiszBankKasa(playerid);
		    ZapiszGracza(sellerid);
	    }
	    ZapiszPojazd(wart1, 2);
	    Transakcja(T_OKVEH, DaneGracza[playerid][gUID], DaneGracza[sellerid][gUID], DaneGracza[playerid][gGUID], DaneGracza[sellerid][gGUID], cena, wart1, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
	    RemovePlayerFromVehicle(sellerid);
	    RemovePlayerFromVehicle(sellerid);
     	SetPVarInt(sellerid, "SprzedalPojazd", 0);
	    SetTimerEx("SprzedalPojazd",15000,0,"d",sellerid);
	    GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales oferte.",5000,3);
     	GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~Twoja oferta zostala akceptowana.",5000,3);
	}
	if(type == OFEROWANIE_TERENU)
	{
     	Lokacja[wart1][gOwnerP] = DaneGracza[playerid][gUID];
	    if(typp == 0)
	    {
		    Dodajkase( playerid, -cena );
      		Dodajkase( sellerid, cena );
		    ZapiszGracza(playerid);
		    ZapiszGracza(sellerid);
	    }
      	else if(typp == 1)
	    {
		    DaneGracza[playerid][gSTAN_KONTA] -= cena;
		    Dodajkase( sellerid, cena );
		    ZapiszBankKasa(playerid);
		    ZapiszGracza(sellerid);
	    }
	    ZapiszTeren(wart1);
	    GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales oferte.",5000,3);
     	GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~Twoja oferta zostala akceptowana.",5000,3);
	}
	if(type == OFEROWANIE_POJAZDU2)
	{
	    if(typp == 0)
	    {
		    Dodajkase( playerid, -cena );
      		Dodajkase( sellerid, cena );
		    ZapiszGracza(playerid);
		    ZapiszGracza(sellerid);
	    }
      	else if(typp == 1)
	    {
		    DaneGracza[playerid][gSTAN_KONTA] -= cena;
		    Dodajkase( sellerid, cena );
		    ZapiszBankKasa(playerid);
		    ZapiszGracza(sellerid);
	    }
		PojazdInfo[wart1][pOwnerPostac] = DaneGracza[playerid][gUID];
     	PojazdInfo[wart2][pOwnerPostac] = DaneGracza[sellerid][gUID];
	    ZapiszPojazd(wart1, 2);
	    ZapiszPojazd(wart2, 2);
	    Transakcja(T_OKVEH, DaneGracza[playerid][gUID], DaneGracza[sellerid][gUID], DaneGracza[playerid][gGUID], DaneGracza[sellerid][gGUID], cena, wart1, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
	    Transakcja(T_OKVEH, DaneGracza[sellerid][gUID], DaneGracza[playerid][gUID], DaneGracza[sellerid][gGUID], DaneGracza[playerid][gGUID], 0, wart2, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
	    RemovePlayerFromVehicle(sellerid);
	    RemovePlayerFromVehicle(sellerid);
	    RemovePlayerFromVehicle(playerid);
	    RemovePlayerFromVehicle(playerid);
     	SetPVarInt(sellerid, "SprzedalPojazd", 0);
	    SetTimerEx("SprzedalPojazd",15000,0,"d",sellerid);
	    SetPVarInt(playerid, "SprzedalPojazd", 0);
	    SetTimerEx("SprzedalPojazd",15000,0,"d",playerid);
	    GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales oferte.",5000,3);
     	GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~Twoja oferta zostala akceptowana.",5000,3);
	}
	if(type == OFEROWANIE_LAKIERU)
	{
        //new uidg = DaneGracza[sellerid][gSluzba];
	    if(typp == 0)
	    {
		    Dodajkase(playerid, -cena );
		    ZapiszGracza(playerid);
	    }
     	else if(typp == 1)
	    {
		    DaneGracza[playerid][gSTAN_KONTA] -= cena;
		    ZapiszBankKasa(playerid);
	    }
	    Dodajkase(sellerid, cena);
	    ZapiszGracza(playerid);
	    ZapiszGracza(sellerid);
		GameTextForPlayer(sellerid,"~n~~g~Przemalowano", 3000,4);
		UpdateDynamic3DTextLabelText(Vopis[MalowanieKolor[sellerid][3]], 0xAAAAFFFF, " ");
		if(PJ[sellerid] == 1)
		{
			PojazdInfo[MalowanieKolor[sellerid][3]][pPJ] = MalowanieKolor[sellerid][0];
			ChangeVehiclePaintjob(MalowanieKolor[sellerid][2], MalowanieKolor[sellerid][0]);
		}
		else
		{
			PojazdInfo[MalowanieKolor[sellerid][3]][pKolor] = MalowanieKolor[sellerid][0];
			PojazdInfo[MalowanieKolor[sellerid][3]][pKolor2] = MalowanieKolor[sellerid][1];
			ChangeVehicleColor(MalowanieKolor[sellerid][2], MalowanieKolor[sellerid][0], MalowanieKolor[sellerid][1]);
		}
		MalowanieKolor[sellerid][0] = -1;
		MalowanieKolor[sellerid][1] = -1;
		RoznicaLakieru[sellerid] = 0;
		LakierujeCzas[sellerid] = 0;
		ZapiszPojazd(MalowanieKolor[sellerid][3], 1);
		SetPVarInt(sellerid, "OfertaLakierowania", 0);
		SetPVarInt(sellerid, "LakierujeID", 0);
		SetPVarInt(sellerid, "LakierujeCena", 0);
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Oferta akceptowana pomyœlnie.", "Zamknij", "");
	    dShowPlayerDialog(sellerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Oferta akceptowana pomyœlnie.", "Zamknij", "");
	}
	if(type == OFEROWANIE_RP)
	{
        new uidg = DaneGracza[sellerid][gSluzba];
	    if(typp == 0)
	    {
		    Dodajkase(playerid, -cena );
		    ZapiszGracza(playerid);
	    }
     	else if(typp == 1)
	    {
		    DaneGracza[playerid][gSTAN_KONTA] -= cena;
		    ZapiszBankKasa(playerid);
	    }
	    GrupaInfo[uidg][gSaldo] += cena;
	    ZapiszGracza(playerid);
	    ZapiszGracza(sellerid);
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Oferta RP akceptowana pomyœlnie.", "Zamknij", "");
	    dShowPlayerDialog(sellerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Oferta RP akceptowana pomyœlnie.", "Zamknij", "");
	}
	if(type == OFEROWANIE_WYPOZYCZENIE)
	{
		DaneGracza[playerid][gWypozyczonyPojazdUID] = wart1;
		DaneGracza[playerid][gWypozyczonyPojazdCZAS] = gettime()+CZAS_LETNI+(60*cena);
	    GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales oferte.",5000,3);
     	GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~Twoja oferta zostala akceptowana.",5000,3);
	}
	if(type == OFEROWANIE_ELEKTRYKI)
	{
		new procent = cena/10;
		if(procent > 20)
		{
			procent = 20;
		}
		//DaneGracza[sellerid][gPremia] += procent;
		Dodajkase( sellerid, procent );
		if(typp == 0)
		{
			Dodajkase( playerid, -cena );
			GrupaInfo[wart2][gSaldo] += (cena-procent);
			ZapiszGracza(playerid);
			ZapiszSaldo(wart2);
		}
		else if(typp == 1)
		{
			DaneGracza[playerid][gSTAN_KONTA] -= cena;
			GrupaInfo[wart2][gSaldo] += (cena-procent);
			ZapiszBankKasa(playerid);
			ZapiszSaldo(wart2);
		}
		new czas = wart1*60000;
		DaneGracza[sellerid][gZarzadzajElektryka] = wart4;
		SetTimerEx("ZarzadzajElektryka",czas,0,"d",sellerid);
		if(DutyNR[sellerid] == 1) DaneGracza[sellerid][gPrzynaleznosci][3]++;
		else if(DutyNR[sellerid] == 2) DaneGracza[sellerid][gPrzynaleznosci][9]++;
		else if(DutyNR[sellerid] == 3) DaneGracza[sellerid][gPrzynaleznosci][15]++;
		else if(DutyNR[sellerid] == 4) DaneGracza[sellerid][gPrzynaleznosci][21]++;
		else if(DutyNR[sellerid] == 5) DaneGracza[sellerid][gPrzynaleznosci][27]++;
		else if(DutyNR[sellerid] == 6) DaneGracza[sellerid][gPrzynaleznosci][33]++;
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Elektryk mo¿e teraz zarz¹dzaæ{DEDEDE} instalacjami elektrycznymi{DEDEDE} w tym budynku.", "Zamknij", "");
		dShowPlayerDialog(sellerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Mo¿esz zarz¹dzaæ{DEDEDE} teraz instalacjami elektrycznymi{DEDEDE} w tym budynku\nPamiêtaj by zamontowaæ meble takie jak (364, 1958).", "Zamknij", "");
		StatykujTransakcje(wart2, sellerid, playerid, "Elektryke", cena);
	}
	if(type == OFEROWANIE_OCHRONY)
	{
		new procent = cena/10;
		if(procent > 20)
		{
			procent = 20;
		}
		Dodajkase( sellerid, procent );
		//DaneGracza[sellerid][gPremia] += procent;
		if(typp == 0)
		{
			Dodajkase( playerid, -cena );
			GrupaInfo[wart2][gSaldo] += (cena-procent);
			ZapiszGracza(playerid);
			ZapiszSaldo(wart2);
		}
		else if(typp == 1)
		{
			DaneGracza[playerid][gSTAN_KONTA] -= cena;
			GrupaInfo[wart2][gSaldo] += (cena-procent);
			ZapiszBankKasa(playerid);
			ZapiszSaldo(wart2);
		}
		new czas = wart1*60000;
		DaneGracza[sellerid][gZarzadzajElektryka] = wart4;
		new uids = GetPVarInt(sellerid, "uiddrzwi");
		BudynekInfo[uids][nUkryty] = GrupaInfo[DaneGracza[playerid][gSluzba]][gUID];
		SetTimerEx("ZarzadzajElektryka",czas,0,"d",sellerid);
		if(DutyNR[sellerid] == 1) DaneGracza[sellerid][gPrzynaleznosci][3]++;
		else if(DutyNR[sellerid] == 2) DaneGracza[sellerid][gPrzynaleznosci][9]++;
		else if(DutyNR[sellerid] == 3) DaneGracza[sellerid][gPrzynaleznosci][15]++;
		else if(DutyNR[sellerid] == 4) DaneGracza[sellerid][gPrzynaleznosci][21]++;
		else if(DutyNR[sellerid] == 5) DaneGracza[sellerid][gPrzynaleznosci][27]++;
		else if(DutyNR[sellerid] == 6) DaneGracza[sellerid][gPrzynaleznosci][33]++;
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Ochroniarz mo¿e teraz zamontowaæ potrzebne urz¹dzenia w tym budynku.", "Zamknij", "");
		dShowPlayerDialog(sellerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Mo¿esz teraz montowaæ urz¹dzenia w tym budynku\nPamiêtaj by zamontowaæ urz¹dzenia takie jak (1622, 1611, 1886).", "Zamknij", "");
		StatykujTransakcje(wart2, sellerid, playerid, "Elektryke", cena);
	}
	if(type == OFEROWANIE_PRZEDMIOTU)
	{
		if(typp == 0)
	    {
		    Dodajkase( playerid, -cena );
		    Dodajkase( sellerid, cena );
		    ZapiszGracza(playerid);
		    ZapiszGracza(sellerid);
	    }
     	else if(typp == 1)
	    {
		    DaneGracza[playerid][gSTAN_KONTA] -= cena;
		    Dodajkase( sellerid, cena );
		    ZapiszBankKasa(playerid);
		    ZapiszGracza(sellerid);
	    }
	    if(PrzedmiotInfo[wart2][pTyp] == P_TELEFONY)
	    {
	        new sim = PrzedmiotInfo[wart2][pWar2]-10000;
	        if(PrzedmiotInfo[sim][pTyp] == P_SIM && PrzedmiotInfo[wart2][pWar2] > 10000)
	        {
		        PrzedmiotInfo[sim][pOwner] = DaneGracza[playerid][gUID];
				ZapiszPrzedmiot(sim);
			}
	    }
		PrzedmiotInfo[wart2][pOwner] = DaneGracza[playerid][gUID];
		ZapiszPrzedmiot(wart2);
		format(tekst_global, sizeof(tekst_global), "* %s podaje przedmiot %s.", ZmianaNicku(sellerid), ZmianaNicku(playerid));
		SendWrappedMessageToPlayerRange(sellerid, FIOLETOWY, tekst_global, 10);
		new akcja[126];
		format(akcja,sizeof(akcja),"*podaje przedmiot %s*", ZmianaNicku(playerid));
		SetPlayerChatBubble(sellerid, akcja, FIOLETOWY, 10.0, 4000);
		new akcja2[126];
		format(akcja2,sizeof(akcja2),"podaje przedmiot %s", ZmianaNicku(playerid));
		TextDrawSetString(AkcjaTD[sellerid], akcja2);
		TextDrawShowForPlayer(sellerid, AkcjaTD[sellerid]);
		CzasWyswietlaniaTextuNaDrzwiach[sellerid] = 10;
		OnPlayerText(sellerid, "-daj");
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Przedmiot zosta³ zakupiony pomyœlnie.", "Zamknij", "");
	    dShowPlayerDialog(sellerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Przedmiot zosta³ sprzedany pomyœlnie.", "Zamknij", "");
	    
	}
	if(type == OFEROWANIE_BUDYNKU)
	{
	    BudynekInfo[wart1][nWlascicielP] = DaneGracza[playerid][gUID];
	    BudynekInfo[wart1][nWlascicielD] = 0;
        if(typp == 0)
	    {
		    Dodajkase( playerid, -cena );
		    Dodajkase( sellerid, cena );
		    ZapiszGracza(playerid);
		    ZapiszGracza(sellerid);
	    }
     	else if(typp == 1)
	    {
		    DaneGracza[playerid][gSTAN_KONTA] -= cena;
		    Dodajkase( sellerid, cena );
		    ZapiszBankKasa(playerid);
		    ZapiszGracza(sellerid);
	    }
	    ZapiszNieruchomosc(wart1);
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Budynek zosta³ zakupiony{DEDEDE} pomyœlnie.", "Zamknij", "");
	    dShowPlayerDialog(sellerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Budynek zosta³ sprzedany{DEDEDE} pomyœlnie.", "Zamknij", "");
	    Transakcja(T_OKHOUSE, DaneGracza[playerid][gUID], DaneGracza[sellerid][gUID], DaneGracza[playerid][gGUID], DaneGracza[sellerid][gGUID], cena, wart1, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
	}
	if(type == OFEROWANIE_PODAJ_AUTOMAT)
	{
	    ZaladujMagazyny();
		new grupa = MagazynInfo[wart2][mOwner];
		if(MagazynInfo[wart2][mIlosc] == 0)
		{
		    GameTextForPlayer(playerid, "~r~Nie ma takiego przedmiotu.", 3000, 5);
		    return 0;
		}
		new cenapl = GetPVarInt(playerid, "Cenapl");
		new cenagr = GetPVarInt(playerid, "Cenagr");
	    if(typp == 0)
	    {
		    Dodajkase( playerid, -cenapl );
		    GrupaInfo[grupa][gSaldo] += cenagr;
		    ZapiszGracza(playerid);
		    ZapiszSaldo(grupa);
	    }
     	else if(typp == 1)
	    {
		    DaneGracza[playerid][gSTAN_KONTA] -= cenapl;
		    GrupaInfo[grupa][gSaldo] += cenagr;
		    ZapiszBankKasa(playerid);
		    ZapiszSaldo(grupa);
	    }
		Transakcja(T_OKITEM, DaneGracza[playerid][gUID], DaneGracza[sellerid][gUID], DaneGracza[playerid][gGUID], DaneGracza[sellerid][gGUID], cenapl, wart2, wart3, wart1, "-", gettime()+KOREKTA_CZASOWA);
		DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], 0, -1, MagazynInfo[wart2][mWar5], 0, 0, 0, "");
		if(MagazynInfo[wart2][mIlosc] == 1)
		{
		    UsunMagazyn(wart2);
		    return 1;
		}
		else
		{
		    MagazynInfo[wart2][mIlosc]--;
		    ZapiszMagazyn(wart2);
		}
		format(tekst_global, sizeof(tekst_global), "* %s wyci¹ga przedmiot z automatu %s.", ZmianaNicku(playerid));
		SendWrappedMessageToPlayerRange(sellerid, FIOLETOWY, tekst_global, 10);
		new akcja[126];
		format(akcja,sizeof(akcja),"*%s wyciaga przedmiot z automatu*", ZmianaNicku(playerid));
		SetPlayerChatBubble(sellerid, akcja, FIOLETOWY, 10.0, 4000);
		new akcja2[126];
		format(akcja2,sizeof(akcja2),"%s wyciaga przedmiot z automatu", ZmianaNicku(playerid));
		TextDrawSetString(AkcjaTD[sellerid], akcja2);
		TextDrawShowForPlayer(sellerid, AkcjaTD[sellerid]);
		CzasWyswietlaniaTextuNaDrzwiach[sellerid] = 10;
		OnPlayerText(sellerid, "-daj");
        GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~~2~Kupiles przedmiot.",5000,3);
	}
	if(type == OFEROWANIE_PODAJ)
	{
	    ZaladujMagazyny();
		new procent = cena/10;
		if(procent > 20)
		{
			procent = 20;
		}
		new grupa = MagazynInfo[wart2][mOwner];
		if(MagazynInfo[wart2][mIlosc] == 0)
		{
		    GameTextForPlayer(playerid, "~r~Nie ma takiego przedmiotu.", 3000, 5);
		    return 0;
		}
		if(MagazynInfo[wart2][mIlosc] < wart5)
		{
		    GameTextForPlayer(playerid, "~r~Nie ma tyle produktow.", 3000, 5);
		    return 0;
		}
		Dodajkase( sellerid, procent );
	    if(typp == 0)
	    {
		    Dodajkase( playerid, -cena );
		    GrupaInfo[grupa][gSaldo] += (cena-procent);
		    ZapiszGracza(playerid);
		    ZapiszSaldo(grupa);
	    }
     	else if(typp == 1)
	    {
		    DaneGracza[playerid][gSTAN_KONTA] -= cena;
		    GrupaInfo[grupa][gSaldo] += (cena-procent);
		    ZapiszBankKasa(playerid);
		    ZapiszSaldo(grupa);
	    }
		Transakcja(T_OKITEM, DaneGracza[playerid][gUID], DaneGracza[sellerid][gUID], DaneGracza[playerid][gGUID], DaneGracza[sellerid][gGUID], cena, wart2, wart3, wart1, "-", gettime()+KOREKTA_CZASOWA);
		if(wart5 == 1)
		{
			DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		}
		else if(wart5 == 2)
		{
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		}
		else if(wart5 == 3)
		{
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		}
		else if(wart5 == 4)
		{
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		}
		else if(wart5 == 5)
		{
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		}
		else if(wart5 == 6)
		{
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		}
		else if(wart5 == 7)
		{
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		}
		else if(wart5 == 8)
		{
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		}
		else if(wart5 == 9)
		{
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		}
		else if(wart5 == 10)
		{
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		    DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], MagazynInfo[wart2][mWar5], -1, 0, 0, 0, 0, "");
		}
		if(MagazynInfo[wart2][mIlosc] == wart5)
		{
		    UsunMagazyn(wart2);
		    return 1;
		}
		else
		{
		    MagazynInfo[wart2][mIlosc] -= wart5;
		    ZapiszMagazyn(wart2);
		}
		StworzWykres(sellerid, cena, 1, DaneGracza[playerid][gUID], DaneGracza[playerid][gGUID], grupa);
        GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~~2~Kupiles przedmiot.",5000,3);
		if(DutyNR[sellerid] == 1) DaneGracza[sellerid][gPrzynaleznosci][3]++;
		else if(DutyNR[sellerid] == 2) DaneGracza[sellerid][gPrzynaleznosci][9]++;
		else if(DutyNR[sellerid] == 3) DaneGracza[sellerid][gPrzynaleznosci][15]++;
		else if(DutyNR[sellerid] == 4) DaneGracza[sellerid][gPrzynaleznosci][21]++;
		else if(DutyNR[sellerid] == 5) DaneGracza[sellerid][gPrzynaleznosci][27]++;
		else if(DutyNR[sellerid] == 6) DaneGracza[sellerid][gPrzynaleznosci][33]++;
		StatykujTransakcje(grupa, sellerid, playerid, OfertaInfo[sellerid][oPowod], cena);
     	GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~~2~Twoja oferta zostala akceptowana.",5000,3);
		new akcjarp[126];
		format(akcjarp,sizeof(akcjarp),"podaje %s produkt %s.", ZmianaNicku(playerid), OfertaInfo[sellerid][oPowod]);
		cmd_me(sellerid, akcjarp);
		new akcja[126];
		format(akcja,sizeof(akcja),"*podaje %s produkt %s*", ZmianaNicku(playerid), OfertaInfo[sellerid][oPowod]);
		SetPlayerChatBubble(sellerid, akcja, FIOLETOWY, 10.0, 4000);
		new akcja2[126];
		format(akcja2,sizeof(akcja2),"podaje %s produkt %s", ZmianaNicku(playerid), OfertaInfo[sellerid][oPowod]);
		TextDrawSetString(AkcjaTD[sellerid], akcja2);
		TextDrawShowForPlayer(sellerid, AkcjaTD[sellerid]);
		CzasWyswietlaniaTextuNaDrzwiach[sellerid] = 10;
		OnPlayerText(playerid, "-daj");
	}
	if(type == OFEROWANIE_MAGAZYN)
	{
	    ZaladujMagazyny();
		new procent = cena/10;
		if(procent > 20)
		{
			procent = 20;
		}
		new grupa = MagazynInfo[wart2][mOwner];
		if(MagazynInfo[wart2][mIlosc] == 0)
		{
		    GameTextForPlayer(playerid, "~r~Nie ma takiego przedmiotu.", 3000, 5);
		    return 0;
		}
		Dodajkase( sellerid, procent );
	    if(typp == 0)
	    {
		    Dodajkase( playerid, -cena );
		    GrupaInfo[grupa][gSaldo] += (cena-procent);
		    ZapiszGracza(playerid);
		    ZapiszSaldo(grupa);
	    }
     	else if(typp == 1)
	    {
		    DaneGracza[playerid][gSTAN_KONTA] -= cena;
		    GrupaInfo[grupa][gSaldo] += (cena-procent);
		    ZapiszBankKasa(playerid);
		    ZapiszSaldo(grupa);
	    }
		Transakcja(T_OKITEM, DaneGracza[playerid][gUID], DaneGracza[sellerid][gUID], DaneGracza[playerid][gGUID], DaneGracza[sellerid][gGUID], cena, wart2, wart3, wart1, "-", gettime()+KOREKTA_CZASOWA);
		DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, wart3, wart1, wart4, OfertaInfo[sellerid][oPowod], DaneGracza[playerid][gUID], 0, -1, 0, MagazynInfo[wart2][mWar5], 0, 0, "");
		if(MagazynInfo[wart2][mIlosc] == 1)
		{
		    UsunMagazyn(wart2);
		    return 1;
		}
		else
		{
		    MagazynInfo[wart2][mIlosc]--;
		    ZapiszMagazyn(wart2);
		}
		StworzWykres(sellerid, cena, 1, DaneGracza[playerid][gUID], DaneGracza[playerid][gGUID], grupa);
        GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~~2~Wyjales przedmiot.",5000,3);
		StatykujTransakcje(grupa, sellerid, playerid, OfertaInfo[sellerid][oPowod], cena);
		new akcjarp[126];
		format(akcjarp,sizeof(akcjarp),"%s wyci¹ga z magazynu produkt %s.", ZmianaNicku(playerid), OfertaInfo[sellerid][oPowod]);
		cmd_me(sellerid, akcjarp);
		new akcja[126];
		format(akcja,sizeof(akcja),"*%s wyciaga z magazynu produkt %s*", ZmianaNicku(playerid), OfertaInfo[sellerid][oPowod]);
		SetPlayerChatBubble(sellerid, akcja, FIOLETOWY, 10.0, 4000);
		new akcja2[126];
		format(akcja2,sizeof(akcja2),"%s wyciaga z magazynu produkt %s", ZmianaNicku(playerid), OfertaInfo[sellerid][oPowod]);
		TextDrawSetString(AkcjaTD[sellerid], akcja2);
		TextDrawShowForPlayer(sellerid, AkcjaTD[sellerid]);
		CzasWyswietlaniaTextuNaDrzwiach[sellerid] = 10;
		OnPlayerText(playerid, "-wez");
	}
	if(type == OFEROWANIE_TANKOWANIA)
	{
	    if(typp == 0)
	    {
		    Dodajkase(playerid, -cena );
		    ZapiszGracza(playerid);
	    }
     	else if(typp == 1)
	    {
		    DaneGracza[playerid][gSTAN_KONTA] -= cena;
		    ZapiszBankKasa(playerid);
	    }
		ApplyAnimation(sellerid,"INT_HOUSE","wash_up",4.1,0,0,0,0,0);
		cmd_fasdasfdfive(sellerid, "wk³ada pistolet do baku.");
		new akcja[126];
		format(akcja,sizeof(akcja),"*wk³ada pistolet do baku*");
		SetPlayerChatBubble(sellerid, akcja, FIOLETOWY, 10.0, 4000);
		new akcja2[126];
		format(akcja2,sizeof(akcja2),"wklada pistolet do baku");
		TextDrawSetString(AkcjaTD[sellerid], akcja2);
		TextDrawShowForPlayer(sellerid, AkcjaTD[sellerid]);
		CzasWyswietlaniaTextuNaDrzwiach[sellerid] = 10;
		new Float:ilosc = wart3;
		new Float:paliwo = PojazdInfo[wart2][pPaliwo];
		if(ilosc + paliwo >= 100)
		{
		    PojazdInfo[wart2][pPaliwo] = 100;
		}
		else
		{
			PojazdInfo[wart2][pPaliwo] += ilosc;
		}
		ZapiszPojazd(wart2, 1);
		new dla_nuba = cena / 10;
		Dodajkase( sellerid, dla_nuba );
		ZapiszGracza(sellerid);
        GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales oferte.",5000,3);
     	GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~Twoja oferta zostala akceptowana.",5000,3);
	}
	if(type == OFEROWANIE_BLOKADY)
	{
	    if(typp == 0)
	    {
		    Dodajkase( playerid, -cena );
		    GrupaInfo[wart2][gSaldo] += cena;
		    ZapiszGracza(playerid);
		    ZapiszSaldo(wart2);
	    }
     	else if(typp == 1)
	    {
		    DaneGracza[playerid][gSTAN_KONTA] -= cena;
		    GrupaInfo[wart2][gSaldo] += cena;
		    ZapiszBankKasa(playerid);
		    ZapiszSaldo(wart2);
	    }
		PojazdInfo[wart3][pBlokada] = 0;
		ZapiszPojazd(wart3, 1);
		new dla_nuba = cena / 10;
		Dodajkase( sellerid, dla_nuba );
		ZapiszGracza(sellerid);
        GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales oferte.",5000,3);
		if(DutyNR[sellerid] == 1) DaneGracza[sellerid][gPrzynaleznosci][3]++;
		else if(DutyNR[sellerid] == 2) DaneGracza[sellerid][gPrzynaleznosci][9]++;
		else if(DutyNR[sellerid] == 3) DaneGracza[sellerid][gPrzynaleznosci][15]++;
		else if(DutyNR[sellerid] == 4) DaneGracza[sellerid][gPrzynaleznosci][21]++;
		else if(DutyNR[sellerid] == 5) DaneGracza[sellerid][gPrzynaleznosci][27]++;
		else if(DutyNR[sellerid] == 6) DaneGracza[sellerid][gPrzynaleznosci][33]++;
		StatykujTransakcje(wart2, sellerid, playerid, "Zdjêcie blokady", cena);
     	GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~Twoja oferta zostala akceptowana.",5000,3);
	}
	if(type == OFEROWANIE_MANDATU)
	{
		new akcja[256];
		format(akcja, sizeof(akcja), "%s", OfertaInfo[sellerid][oPowod]);
		DodajZadluzenie(0, DaneGracza[playerid][gUID], cena, gettime()+CZAS_LETNI, akcja, -1, OfertaInfo[sellerid][oWar1], 1);
		ZaladujZadluzenia();
		SetPVarInt(playerid, "DlugGracza", 0);
		ForeachEx(id, MAX_HISTORY)
		{
			if(Zadluzenie[id][dUID] == DaneGracza[playerid][gUID] && Zadluzenie[id][dAktywne] == 1)
			{
				SetPVarInt(playerid, "DlugGracza", GetPVarInt(playerid, "DlugGracza")+Zadluzenie[id][dMoney]);
				SetPVarInt(playerid, "ZadluzeniePoTerminie", 0);
				if(Zadluzenie[id][dTime2] < gettime()+CZAS_LETNI)
				{
					SetPVarInt(playerid, "ZadluzeniePoTerminie", GetPVarInt(playerid, "ZadluzeniePoTerminie")+1);
				}
			}
		}
		DodajKartoteke(sellerid, playerid, 1, OfertaInfo[sellerid][oPowod]);
		DaneGracza[playerid][gPktKarne] += wart3;
		ZapiszGracza(playerid);
		if(DutyNR[sellerid] == 1) DaneGracza[sellerid][gPrzynaleznosci][3]++;
		else if(DutyNR[sellerid] == 2) DaneGracza[sellerid][gPrzynaleznosci][9]++;
		else if(DutyNR[sellerid] == 3) DaneGracza[sellerid][gPrzynaleznosci][15]++;
		else if(DutyNR[sellerid] == 4) DaneGracza[sellerid][gPrzynaleznosci][21]++;
		else if(DutyNR[sellerid] == 5) DaneGracza[sellerid][gPrzynaleznosci][27]++;
		else if(DutyNR[sellerid] == 6) DaneGracza[sellerid][gPrzynaleznosci][33]++;
		StatykujTransakcje(wart2, sellerid, playerid, "Mandat", cena);
		GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales mandat.",8000,3);
     	GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~Twoj mandat zostal akceptowany.",8000,3);
	}
	if(type == OFEROWANIE_REJBRONI)
	{
	    if(typp == 0)
	    {
		    Dodajkase( playerid, -cena );
		    GrupaInfo[wart2][gSaldo] += cena;
		    ZapiszGracza(playerid);
		    ZapiszSaldo(wart2);
	    }
     	else if(typp == 1)
	    {
		    DaneGracza[playerid][gSTAN_KONTA] -= cena;
		    GrupaInfo[wart2][gSaldo] += cena;
		    ZapiszBankKasa(playerid);
		    ZapiszSaldo(wart2);
	    }
		new dla_nuba = cena / 10;
		Dodajkase( sellerid, dla_nuba );
		ZapiszGracza(sellerid);
		DodajKartoteke(sellerid, playerid, 1, "Rejestracja broni legalnej");
		ZapiszGracza(playerid);
		DaneGracza[playerid][gDokumenty][D_BRON] = 1;
		if(DaneGracza[playerid][gZD9] == 0)
		{
		    CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
			TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
			TextDrawSetString(TextNaDrzwi[playerid], "~y~Osiagniecie~n~~w~Bang bang! ~g~+25QP");
			TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
			DaneGracza[playerid][gGAMESCORE] += 25;
			DaneGracza[playerid][gZD9] = 1;
		    SetPlayerScore(playerid,DaneGracza[playerid][gGAMESCORE]);
			ZapiszGracza(playerid);
			ZapiszGraczaGlobal(playerid, 1);
		}
        GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales oferte.",5000,3);
		if(DutyNR[sellerid] == 1) DaneGracza[sellerid][gPrzynaleznosci][3]++;
		else if(DutyNR[sellerid] == 2) DaneGracza[sellerid][gPrzynaleznosci][9]++;
		else if(DutyNR[sellerid] == 3) DaneGracza[sellerid][gPrzynaleznosci][15]++;
		else if(DutyNR[sellerid] == 4) DaneGracza[sellerid][gPrzynaleznosci][21]++;
		else if(DutyNR[sellerid] == 5) DaneGracza[sellerid][gPrzynaleznosci][27]++;
		else if(DutyNR[sellerid] == 6) DaneGracza[sellerid][gPrzynaleznosci][33]++;
		StatykujTransakcje(wart2, sellerid, playerid, "Rejestracja broni", cena);
     	GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~Twoja oferta zostala akceptowana.",5000,3);
		SetPVarInt(sellerid, "REJBRONI", playerid);
		Przedmioty4(sellerid, playerid, DIALOG_REJBRONI, "• Rejestracja broni:", TYP_REJBRONI, 0);
	}
	if(type == OFEROWANIE_WYNAJMU)
	{
		if(!Osiagniecia(playerid, OSIAGNIECIE_ZAMELDOWANIE))
		{
			CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
			TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
			TextDrawSetString(TextNaDrzwi[playerid], "~y~OSIAGNIECIE~n~~w~Zameldowanie ~g~+20GS");
			TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
			DaneGracza[playerid][gOsiagniecia][OSIAGNIECIE_ZAMELDOWANIE] = 1;
			DaneGracza[playerid][gGAMESCORE] += 20;
			SetPlayerScore(playerid,DaneGracza[playerid][gGAMESCORE]);
			ZapiszGraczaGlobal(playerid, 1);
		}
	    DaneGracza[playerid][gWynajem] = BudynekInfo[wart1][nUID];
	    ZapiszGracza(playerid);
		strdel(zapyt, 0, 1024);
	    format(zapyt, sizeof(zapyt),"UPDATE `jochym_postacie` SET `WYNAJEM`='%d' WHERE `ID`='%d'", DaneGracza[playerid][gWynajem], DaneGracza[playerid][gUID]);
	    mysql_query(zapyt);
	    new uisd, global, row[256], czassilka, astr[256];
		format(astr, sizeof(astr), "SELECT `ostatniczas`, `uid` FROM `jochym_wynajem` WHERE `dostal`= %d AND `uid` = %d LIMIT 1", DaneGracza[playerid][gUID], DaneGracza[sellerid][gUID]);
		mysql_check();
		mysql_query2(astr);
		mysql_store_result();
		mysql_fetch_row(row);
		sscanf(row,  "p<|>dd", uisd, global);
		if(uisd < gettime()+CZAS_LETNI)
		{
			if(global == 0)
			{
			    czassilka = gettime()+CZAS_LETNI;
				format(astr, sizeof(astr), "INSERT INTO `jochym_wynajem` (`uid`, `ostatniczas`, `dostal`, `drzwi`, `koszt`, `nick`) VALUES ('%d', '%d', '%d', '%d', '%d', '%s')", DaneGracza[sellerid][gUID], czassilka, DaneGracza[playerid][gUID], BudynekInfo[wart1][nUID], 0, ImieGracza2(playerid));
				mysql_check();
				mysql_query2(astr);
				mysql_free_result();
			}
			else
			{
			    czassilka = gettime()+CZAS_LETNI;
				new query[256];
				format(query, sizeof(query), "UPDATE `jochym_wynajem` SET `ostatniczas` = '%d', `drzwi` = '%d', `koszt` = '%d', `nick` = '%s' WHERE `uid` = %d AND `dostal` = %d",czassilka, BudynekInfo[wart1][nUID], 0, ImieGracza2(playerid), DaneGracza[sellerid][gUID], DaneGracza[playerid][gUID]);
				mysql_check();
				mysql_query(query);
			}
		}
	    GameTextForPlayer(playerid,"~y~~h~Oferta:~n~~w~Akceptowales oferte.",5000,3);
     	GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~Twoja oferta zostala akceptowana.",5000,3);
	}
	if(type == OFEROWANIE_TATUAZU)
	{
     	if(GetPVarInt(sellerid, "MaszynkaTATO") == 0)
     	{
     	    GameTextForPlayer(sellerid,"~r~Maszynka do tatuowania jest wylaczona!",5000,3);
     		GameTextForPlayer(playerid,"~r~Tatuazysta ma wylaczona maszynke!",5000,3);
     	}
     	else
     	{
			new maszynka;
			maszynka = GetPVarInt(sellerid, "MaszynkaTATO");
			if(PrzedmiotInfo[maszynka][pWar1] == 1 && PrzedmiotInfo[maszynka][pWar2] == 1)
			{
	     	    GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~~2~Twoja oferta zostala akceptowana.",5000,3);
	     		GameTextForPlayer(playerid,"~y~~h~Oferowanie:~n~~w~~2~Oferta zostala akceptowana.",5000,3);
				dShowPlayerDialog(playerid, DIALOG_TATUAZ, DIALOG_STYLE_INPUT, "• TIP:", "Rozpocz¹³eœ proces tatuowania poni¿ej wpisz treœæ tatua¿u", "Zatwierdz", "");
				if(typp == 0)
				{
					Dodajkase( playerid, -cena );
					GrupaInfo[wart3][gSaldo] += cena;
					ZapiszGracza(playerid);
					ZapiszSaldo(wart3);
				}
				else if(typp == 1)
				{
					DaneGracza[playerid][gSTAN_KONTA] -= cena;
					GrupaInfo[wart3][gSaldo] += cena;
					ZapiszBankKasa(playerid);
					ZapiszSaldo(wart3);
				}
				SetPVarInt(playerid, "TATUAZ", sellerid);
			}
			else
			{
			    GameTextForPlayer(sellerid,"~r~Maszynka nie posiada ig³y lub tuszu!",5000,3);
     			GameTextForPlayer(playerid,"~r~Tatuazysta nie wlozyl ig³y lub tuszu!",5000,3);
			}
     	}
	}
	if(type == OFEROWANIE_HARACZU)
	{
	    GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~~2~Twoja oferta zostala akceptowana.",5000,3);
     	GameTextForPlayer(playerid,"~y~~h~Oferowanie:~n~~w~~2~Oferta zostala akceptowana.",5000,3);
  		new uids = GetPVarInt(playerid, "uiddrzwi");
        BudynekInfo[uids][nHaracz] = GrupaInfo[DaneGracza[playerid][gSluzba]][gUID];
        BudynekInfo[uids][nHaraczC] = cena;
		ZapiszNieruchomosc(uids);
	}
	if(type == OFEROWANIE_TAXI)
	{
	    new Float:przejechane;
	    GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~~2~Twoja oferta zostala akceptowana.",5000,3);
     	GameTextForPlayer(playerid,"~y~~h~Oferowanie:~n~~w~~2~Oferta zostala akceptowana.",5000,3);
     	SetPVarInt(playerid, "przejazt", sellerid);
		SetPVarInt(playerid, "przejazvid", wart2);
		SetPVarInt(playerid, "przejazuid", wart1);
		SetPVarInt(playerid, "przejazguid", wart3);
		SetPVarInt(playerid, "przejazcena", cena);
		przejechane = (PojazdInfo[wart1][pPrzebieg]/1000.0);
		SetPVarFloat(playerid, "przejechanes", przejechane);
     	taxijedz[playerid] = 1;
		CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
		TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
		TextDrawSetString(TextNaDrzwi[playerid], "Wlasnie ~b~akceptowales~w~ usluge taksowkarza, aby zaznaczyc ~r~cel~w~ podrozy wcisnij ~n~klawisz ~y~ESC~w~ nastepnie uzyj ~g~~h~mapy~w~ by zaznaczyc punkt.");
		TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
	}
	if(type == OFEROWANIE_STREFY)
	{
	    GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~~2~Twoja oferta zostala akceptowana.",5000,3);
     	GameTextForPlayer(playerid,"~y~~h~Oferowanie:~n~~w~~2~Oferta zostala akceptowana.",5000,3);
	    new uid = GraczNaTerenie(sellerid);
	    Lokacja[uid][gOwnerP] = DaneGracza[playerid][gUID];
	    Lokacja[uid][gOwner] = 0;
	    format(Lokacja[uid][gKolor], 64, "0xFFFFFF77");
	    ZapiszTeren(uid);
	    GangZoneShowForPlayer(playerid, Lokacja[uid][gID], HexToInt(Lokacja[uid][gKolor]));
	}
	if(type == OFEROWANIE_NAP_VEH)
	{
		NaprawiaCzas[sellerid] = 30;
	}
	if(type == OFEROWANIE_TUNE_VEH)
	{
		NaprawiaCzas[sellerid] = 30;
	}
	if(type == OFEROWANIE_NAP_ENG)
	{
		NaprawiaIUID[sellerid] = -1;
		NaprawianieVW[sellerid] = wart2;
		NaprawianieDUID[sellerid] = wart1;
		NaprawiaCzas[sellerid] = 60;
	}
	if(type == OFEROWANIE_PRZETRZYMANIA)
	{
		new vw = GetPlayerVirtualWorld(sellerid);
		DaneGracza[playerid][gPrzetrzmanie] = cena;
		GetPlayerPos(playerid,DaneGracza[playerid][gPX],DaneGracza[playerid][gPY],DaneGracza[playerid][gPZ]);
		DaneGracza[playerid][gPUID] = vw;
		ZapiszGracza(playerid);
		RefreshNick(playerid);
		new strss[256];
		new rok, miesiac, dzien, godzina, minuta, sekunda;
		sekundytodata(DaneGracza[playerid][gPrzetrzmanie], rok, miesiac, dzien, godzina, minuta, sekunda);
		format(strss, sizeof(strss), "{CC0000}Zosta³eœ przetrzymany przez gracza: %s (ID:%d) do: %02d-%02d-%d, %02d:%02d, powód: %s",ZmianaNicku(sellerid), sellerid,dzien, miesiac, rok, godzina, minuta, OfertaInfo[sellerid][oPowod]);
		SendClientMessage(playerid, 0xFFb00000, strss);
		DodajKartoteke(sellerid, playerid, 2, OfertaInfo[sellerid][oPowod]);
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
							format(strs, sizeof(strs), "{CC0000}Gracz %s (ID: %d) przetrzymuje gracza: %s (ID:%d) do: %02d-%02d-%d, %02d:%02d, powód: %s",ZmianaNicku(sellerid), sellerid, ZmianaNicku(playerid), playerid,dzien, miesiac, rok, godzina+5, minuta, OfertaInfo[sellerid][oPowod]);
							SendClientMessage(i, 0xFFb00000, strs);
						}
					}
				}
			}
		}else{
			new strs[256];
			format(strs, sizeof(strs), "{CC0000}Gracz %s (ID: %d) przetrzymuje gracza: %s (ID:%d) do: %02d-%02d-%d, %02d:%02d, powód: %s",ZmianaNicku(sellerid), sellerid, ZmianaNicku(playerid), playerid,dzien, miesiac, rok, godzina+5, minuta, OfertaInfo[sellerid][oPowod]);
			SendClientMessage(sellerid, 0xFFb00000, strs);
		}
		GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~~2~Twoja oferta zostala akceptowana.",5000,3);
     	GameTextForPlayer(playerid,"~y~~h~Oferowanie:~n~~w~~2~Oferta zostala akceptowana.",5000,3);
	}
	if(type == OFEROWANIE_DLUG)
	{
		new akcja[256];
		format(akcja, sizeof(akcja), "%s", OfertaInfo[sellerid][oPowod]);
		DodajZadluzenie(0, DaneGracza[playerid][gUID], cena, gettime()+CZAS_LETNI, akcja, DaneGracza[sellerid][gUID], OfertaInfo[sellerid][oWar1], 1);
		ZaladujZadluzenia();
		SetPVarInt(playerid, "DlugGracza", 0);
		ForeachEx(id, MAX_HISTORY)
		{
			if(Zadluzenie[id][dUID] == DaneGracza[playerid][gUID] && Zadluzenie[id][dAktywne] == 1)
			{
				SetPVarInt(playerid, "DlugGracza", GetPVarInt(playerid, "DlugGracza")+Zadluzenie[id][dMoney]);
				SetPVarInt(playerid, "ZadluzeniePoTerminie", 0);
				if(Zadluzenie[id][dTime2] < gettime()+CZAS_LETNI)
				{
					SetPVarInt(playerid, "ZadluzeniePoTerminie", GetPVarInt(playerid, "ZadluzeniePoTerminie")+1);
				}
			}
		}
		GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~~2~Twoja oferta zostala akceptowana.",5000,3);
     	GameTextForPlayer(playerid,"~y~~h~Oferowanie:~n~~w~~2~Oferta zostala akceptowana.",5000,3);
	}
	if(type == OFEROWANIE_DLUGSPLATA)
	{
		if(typp == 0)
	    {
		    Dodajkase(playerid, -cena );
		    ZapiszGracza(playerid);
	    }
     	else if(typp == 1)
	    {
		    DaneGracza[playerid][gSTAN_KONTA] -= cena;
		    ZapiszBankKasa(playerid);
	    }
	    ZapiszGracza(playerid); 
		new dlug = GetPVarInt(playerid, "DlugID");
		new stankonta, row[256], astr[256];
		format(astr, sizeof(astr), "SELECT `STAN_KONTA` FROM `jochym_bank` WHERE `UID_POSTACI`= '%d' LIMIT 1", Zadluzenie[dlug][dOferowal]);
		mysql_check();
		mysql_query2(astr);
		mysql_store_result();
		mysql_fetch_row(row);
		sscanf(row,  "p<|>d", stankonta);
		new query[256];
		format(query, sizeof(query), "UPDATE `jochym_bank` SET `STAN_KONTA` = '%d' WHERE `UID_POSTACI` = '%d'", stankonta+cena, Zadluzenie[dlug][dOferowal]);
		mysql_check();
		mysql_query(query);
		ForeachEx(gracz, MAX_PLAYERS)
		{
			if(IsPlayerConnected(gracz) && zalogowany[gracz] == true)
			{
				if(DaneGracza[gracz][gKONTO_W_BANKU] != 0)
				{
					new sql4[200];
					format(sql4, sizeof(sql4), "SELECT * FROM `jochym_bank` WHERE `UID_POSTACI` = '%d' AND `ID` = '%d' LIMIT 1", DaneGracza[gracz][gUID], DaneGracza[gracz][gKONTO_W_BANKU]);
					mysql_query(sql4);
					mysql_store_result();
					if(mysql_num_rows() != 0)
					{
						mysql_fetch_row(sql4);
						sscanf(sql4, "p<|>ds[124]ddds[124]ds[124]{d}{d}", DaneGracza[gracz][gUID_BANKU]
							,DaneGracza[gracz][gNAZWA_BANKU]
							,DaneGracza[gracz][gNUMER_KONTA]
							,DaneGracza[gracz][gNUMER_KARTY]
							,DaneGracza[gracz][gSTAN_KONTA]
							,DaneGracza[gracz][gBIC]
							,DaneGracza[gracz][gKREDYT]
							,DaneGracza[gracz][gIBAN]
						);
					}
				}
			}
		}
		Zadluzenie[dlug][dAktywne] = 0;
		ZapiszZadluzenie(dlug);
		SetPVarInt(playerid, "DlugID", 0);
		ZaladujZadluzenia();
		SetPVarInt(playerid, "DlugGracza", 0);
		ForeachEx(id, MAX_HISTORY)
		{
			if(Zadluzenie[id][dUID] == DaneGracza[playerid][gUID] && Zadluzenie[id][dAktywne] == 1)
			{
				SetPVarInt(playerid, "DlugGracza", GetPVarInt(playerid, "DlugGracza")+Zadluzenie[id][dMoney]);
				SetPVarInt(playerid, "ZadluzeniePoTerminie", 0);
				if(Zadluzenie[id][dTime2] < gettime()+CZAS_LETNI)
				{
					SetPVarInt(playerid, "ZadluzeniePoTerminie", GetPVarInt(playerid, "ZadluzeniePoTerminie")+1);
				}
			}
		}
		SetPVarInt(playerid, "SplataOferta", 0);
		GameTextForPlayer(playerid,"~y~~h~Oferowanie:~n~~w~~2~Twoja oferta zostala akceptowana.",5000,3);
	}
	if(type == OFEROWANIE_LAKIEROWANIA)
	{
		if(typp == 0)
	    {
		    Dodajkase(playerid, -cena );
		    ZapiszGracza(playerid);
	    }
     	else if(typp == 1)
	    {
		    DaneGracza[playerid][gSTAN_KONTA] -= cena;
		    ZapiszBankKasa(playerid);
	    }
	    Dodajkase(sellerid, cena);
	    ZapiszGracza(playerid);
	    ZapiszGracza(sellerid);
		new bron_uid = GetPVarInt(sellerid, "UzywanaBronUID");
		PoziomLakieru[sellerid] = PrzedmiotInfo[bron_uid][pWar2];
		Tag[sellerid] = -1;
		LakierujeCzas[sellerid] = 1;
		//new uidpo = SprawdzCarUID(wart3);
		new uidpo = wart3;
		NaprawianieVW[sellerid] = GetVehicleVirtualWorld(GetPlayerVehicleID(playerid));
		MalowanieKolor[sellerid][0] = wart1;
		MalowanieKolor[sellerid][1] = wart4;
		MalowanieKolor[sellerid][2] = wart3;
		MalowanieKolor[sellerid][3] = wart5;
		NaprawiaID[sellerid] = playerid;
		NaprawiaVeh[sellerid] = wart3;
		SetPVarInt(sellerid, "LakierujeID", playerid);
		SetPVarInt(sellerid, "LakierujeCena", cena);
		UpdateDynamic3DTextLabelText(Vopis[uidpo], 0xAAAAFFFF, "Rozpoczynanie lakierowania");
		GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~~2~Twoja oferta zostala akceptowana.",5000,3);
		PJ[sellerid] = 0;
	}
	if(type == OFEROWANIE_PJ)
	{
		if(typp == 0)
	    {
		    Dodajkase(playerid, -cena );
		    ZapiszGracza(playerid);
	    }
     	else if(typp == 1)
	    {
		    DaneGracza[playerid][gSTAN_KONTA] -= cena;
		    ZapiszBankKasa(playerid);
	    }
	    Dodajkase(sellerid, cena);
	    ZapiszGracza(playerid);
	    ZapiszGracza(sellerid);
		new bron_uid = GetPVarInt(sellerid, "UzywanaBronUID");
		PoziomLakieru[sellerid] = PrzedmiotInfo[bron_uid][pWar2];
		Tag[sellerid] = -1;
		LakierujeCzas[sellerid] = 1;
		//new uidpo = SprawdzCarUID(wart3);
		new uidpo = wart3;
		NaprawianieVW[sellerid] = GetVehicleVirtualWorld(GetPlayerVehicleID(playerid));
		MalowanieKolor[sellerid][0] = wart1;
		MalowanieKolor[sellerid][1] = wart4;
		MalowanieKolor[sellerid][2] = wart3;
		MalowanieKolor[sellerid][3] = wart5;
		NaprawiaID[sellerid] = playerid;
		NaprawiaVeh[sellerid] = wart3;
		SetPVarInt(sellerid, "LakierujeID", playerid);
		SetPVarInt(sellerid, "LakierujeCena", cena);
		UpdateDynamic3DTextLabelText(Vopis[uidpo], 0xAAAAFFFF, "Rozpoczynanie lakierowania");
		GameTextForPlayer(sellerid,"~y~~h~Oferowanie:~n~~w~~2~Twoja oferta zostala akceptowana.",5000,3);
		PJ[sellerid] = 1;
	}
	if(type == OFEROWANIE_AKC_NAP)
	{
		new up = SprawdzCarUID(NaprawiaVeh[sellerid]);
		if(NaprawiaIUID[sellerid] == -1)
		{
		    if(PojazdInfo[up][pNaprawy] >= 15000)
			{
				GameTextForPlayer(playerid, "~r~Pojazd osiagnal limit zniszczen.", 3000, 5);
				return 0;
			}
			new grupa;
			if(NaprawianieVW[sellerid] == 0)
			{
				grupa = NaprawianieDUID[sellerid];
			}
			else
			{
				grupa = BudynekInfo[NaprawianieVW[sellerid]][nWlascicielD];
			}
			if(typp == 0)
			{
				Dodajkase( playerid, -cena );
				GrupaInfo[grupa][gSaldo] += NaprawianieCena[sellerid];
				ZapiszGracza(playerid);
				ZapiszSaldo(grupa);
			}
			else if(typp == 1)
			{
				DaneGracza[playerid][gSTAN_KONTA] -= cena;
				GrupaInfo[grupa][gSaldo] += NaprawianieCena[sellerid];
				ZapiszBankKasa(playerid);
				ZapiszSaldo(grupa);
			}
			new dla_nuba = NaprawianieCena[sellerid] / 10;
			Dodajkase( sellerid, dla_nuba );
			ACOFF[up] = 1;
			PojazdInfo[up][pNaprawy] += (1000 - PojazdInfo[up][pStan]);
   			PojazdInfo[up][pStan] = 1000;
			SetVehicleHealth(NaprawiaVeh[sellerid], PojazdInfo[up][pStan]);
			PojazdInfo[up][pStan] = 1000;
			if(DutyNR[sellerid] == 1) DaneGracza[sellerid][gPrzynaleznosci][3]++;
			else if(DutyNR[sellerid] == 2) DaneGracza[sellerid][gPrzynaleznosci][9]++;
			else if(DutyNR[sellerid] == 3) DaneGracza[sellerid][gPrzynaleznosci][15]++;
			else if(DutyNR[sellerid] == 4) DaneGracza[sellerid][gPrzynaleznosci][21]++;
			else if(DutyNR[sellerid] == 5) DaneGracza[sellerid][gPrzynaleznosci][27]++;
			else if(DutyNR[sellerid] == 6) DaneGracza[sellerid][gPrzynaleznosci][33]++;
			StatykujTransakcje(grupa, sellerid, playerid, "Naprawe pojazdu", cena);
		}
		else
		{
			new uzy = GetPVarInt(sellerid, "UzytyItem");
			if(PrzedmiotInfo[uzy][pOwner] != DaneGracza[sellerid][gUID])
			{
				NaprawiaODL[sellerid] = 0;
				NaprawiaID[sellerid] = 0;
				NaprawianieVW[sellerid] = 0;
				NaprawiaVeh[sellerid] = 0;
				NaprawiaIUID[sellerid] = 0;
				NaprawiaCzas[sellerid] = 0;
				DeletePVar(sellerid,"TypM");
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Komponent który zosta³ montowany{DEDEDE} nie znajduje siê w ekwipunku{DEDEDE} oferuj¹cego.", "Zamknij", "");
				return 0;
			}
			new grupa = BudynekInfo[NaprawianieVW[sellerid]][nWlascicielD];
			if(typp == 0)
			{
				Dodajkase( playerid, -cena );
				GrupaInfo[grupa][gSaldo] += cena;
				ZapiszGracza(playerid);
				ZapiszSaldo(grupa);
			}
			else if(typp == 1)
			{
				DaneGracza[playerid][gSTAN_KONTA] -= cena;
				GrupaInfo[grupa][gSaldo] += cena;
				ZapiszBankKasa(playerid);
				ZapiszSaldo(grupa);
			}
			new przedtyp = GetPVarInt(sellerid, "TypM");
			GetVehiclePos(PojazdInfo[up][pID],PojazdInfo[up][pOX],PojazdInfo[up][pOY],PojazdInfo[up][pOZ]);
			PojazdInfo[up][pOVW] = GetVehicleVirtualWorld(PojazdInfo[up][pID]);
			if(przedtyp == P_KOMPONENTY)
			{
				new uidt = SprawdzCarUID(NaprawiaVeh[sellerid]);
				new uid = NaprawiaIUID[sellerid];
				if(PrzedmiotInfo[uid][pWar1] == 1)
				{
					PojazdInfo[uidt][pTempomat] = 1;
					StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (tempomat)", cena);
				}
				if(PrzedmiotInfo[uid][pWar1] == 2)
				{
					PojazdInfo[uidt][pAudio] = 1;
					StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (system audio)", cena);
				}
				if(PrzedmiotInfo[uid][pWar1] == 3)
				{
					PojazdInfo[uidt][pAlarm] = 1;
					StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (system alarmowy)", cena);
				}
				if(PrzedmiotInfo[uid][pWar1] == 4)
				{
					PojazdInfo[uidt][pImmo] = 1;
					StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (immobilizer)", cena);
				}
				if(PrzedmiotInfo[uid][pWar1] == 5)
				{
					PojazdInfo[uidt][pCB] = 1;
					StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (CB-Radio)", cena);
				}
				if(PrzedmiotInfo[uid][pWar1] == 6)
				{
					PojazdInfo[uidt][pGaz] = 1;
					StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (gaz)", cena);
				}
				if(PrzedmiotInfo[uid][pWar1] == 7)
				{
					PojazdInfo[uidt][pPSzyba] = 1;
					StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (szyby przyciemnione)", cena);
				}
				if(PrzedmiotInfo[uid][pWar1] == 8)
				{
					PojazdInfo[uidt][pGPS] = 1;
					StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (koguta)", cena);
				}
			}
			if(przedtyp == P_TUNING)
			{
				AntyCheatWizualizacja[playerid] = 1;
				new uidt = SprawdzCarUID(NaprawiaVeh[sellerid]);
				new uid = NaprawiaIUID[sellerid];
				PrzedmiotInfo[uid][pX] = 0;
				PrzedmiotInfo[uid][pY] = 0;
				PrzedmiotInfo[uid][pZ] = 0;
				PrzedmiotInfo[uid][pVW] = 0;
				PrzedmiotInfo[uid][pTypWlas] = TYP_AUTO;
				PrzedmiotInfo[uid][pWar2] = 1;
				PrzedmiotInfo[uid][pOwner] = uidt;
				DeletePVar(playerid, "UzytyItem");
				ZapiszPrzedmiot(uid);
				Tuning(NaprawiaVeh[sellerid]);
				StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (tuning)", cena);
				KillTimer(AntyCheatWizualizacjaTimer[playerid]);
				AntyCheatWizualizacjaTimer[playerid] = SetTimerEx("WlaczAntyWizualizacje",2000,0,"d",playerid);
			}
			if(przedtyp == P_MASKA)
			{
				AntyCheatWizualizacja[playerid] = 1;
				new uidveh = SprawdzCarUID(NaprawiaVeh[sellerid]);
				GetVehiclePos(PojazdInfo[uidveh][pID],PojazdInfo[uidveh][pOX],PojazdInfo[uidveh][pOY],PojazdInfo[uidveh][pOZ]);
				PojazdInfo[uidveh][pOVW] = GetVehicleVirtualWorld(PojazdInfo[uidveh][pID]);
				GetVehicleZAngle(PojazdInfo[uidveh][pID], PojazdInfo[uidveh][pOA]);
				setDoor(NaprawiaVeh[sellerid],HOOD,FULL);
				SetTimerEx("Naprawa",3000,false,"dd",NaprawiaVeh[sellerid],GetVehicleVirtualWorld(NaprawiaVeh[sellerid]));
				SetVehicleVirtualWorld(NaprawiaVeh[sellerid],9999);
				StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (maska)", cena);
				KillTimer(AntyCheatWizualizacjaTimer[playerid]);
				AntyCheatWizualizacjaTimer[playerid] = SetTimerEx("WlaczAntyWizualizacje",2000,0,"d",playerid);
			}
			if(przedtyp == P_BAGAZNIK)
			{
				AntyCheatWizualizacja[playerid] = 1;
				new uidveh = SprawdzCarUID(NaprawiaVeh[sellerid]);
				GetVehiclePos(PojazdInfo[uidveh][pID],PojazdInfo[uidveh][pOX],PojazdInfo[uidveh][pOY],PojazdInfo[uidveh][pOZ]);
				PojazdInfo[uidveh][pOVW] = GetVehicleVirtualWorld(PojazdInfo[uidveh][pID]);
				GetVehicleZAngle(PojazdInfo[uidveh][pID], PojazdInfo[uidveh][pOA]);
				setDoor(NaprawiaVeh[sellerid],TRUNK,FULL);
				SetTimerEx("Naprawa",3000,false,"dd",NaprawiaVeh[sellerid],GetVehicleVirtualWorld(NaprawiaVeh[sellerid]));
				SetVehicleVirtualWorld(NaprawiaVeh[sellerid],9999);
				StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (baga¿nik)", cena);
				KillTimer(AntyCheatWizualizacjaTimer[playerid]);
				AntyCheatWizualizacjaTimer[playerid] = SetTimerEx("WlaczAntyWizualizacje",2000,0,"d",playerid);
			}
			if(przedtyp == P_ZDERZAKP)
			{
				AntyCheatWizualizacja[playerid] = 1;
				new uidveh = SprawdzCarUID(NaprawiaVeh[sellerid]);
				GetVehiclePos(PojazdInfo[uidveh][pID],PojazdInfo[uidveh][pOX],PojazdInfo[uidveh][pOY],PojazdInfo[uidveh][pOZ]);
				PojazdInfo[uidveh][pOVW] = GetVehicleVirtualWorld(PojazdInfo[uidveh][pID]);
				GetVehicleZAngle(PojazdInfo[uidveh][pID], PojazdInfo[uidveh][pOA]);
				setPanel(NaprawiaVeh[sellerid],FRONT_PANEL,FULL);
				SetTimerEx("Naprawa",3000,false,"dd",NaprawiaVeh[sellerid],GetVehicleVirtualWorld(NaprawiaVeh[sellerid]));
				SetVehicleVirtualWorld(NaprawiaVeh[sellerid],9999);
				StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (zderzak przedni)", cena);
				KillTimer(AntyCheatWizualizacjaTimer[playerid]);
				AntyCheatWizualizacjaTimer[playerid] = SetTimerEx("WlaczAntyWizualizacje",2000,0,"d",playerid);
			}
			if(przedtyp == P_ZDERZAKT)
			{
				AntyCheatWizualizacja[playerid] = 1;
				new uidveh = SprawdzCarUID(NaprawiaVeh[sellerid]);
				GetVehiclePos(PojazdInfo[uidveh][pID],PojazdInfo[uidveh][pOX],PojazdInfo[uidveh][pOY],PojazdInfo[uidveh][pOZ]);
				PojazdInfo[uidveh][pOVW] = GetVehicleVirtualWorld(PojazdInfo[uidveh][pID]);
				GetVehicleZAngle(PojazdInfo[uidveh][pID], PojazdInfo[uidveh][pOA]);
				setPanel(NaprawiaVeh[sellerid],BACK_PANEL,FULL);
				SetTimerEx("Naprawa",3000,false,"dd",NaprawiaVeh[sellerid],GetVehicleVirtualWorld(NaprawiaVeh[sellerid]));
				SetVehicleVirtualWorld(NaprawiaVeh[sellerid],9999);
				StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (zderzak tylni)", cena);
				KillTimer(AntyCheatWizualizacjaTimer[playerid]);
				AntyCheatWizualizacjaTimer[playerid] = SetTimerEx("WlaczAntyWizualizacje",2000,0,"d",playerid);
			}
			if(przedtyp == P_DRZWIP)
			{
				AntyCheatWizualizacja[playerid] = 1;
				new uidveh = SprawdzCarUID(NaprawiaVeh[sellerid]);
				GetVehiclePos(PojazdInfo[uidveh][pID],PojazdInfo[uidveh][pOX],PojazdInfo[uidveh][pOY],PojazdInfo[uidveh][pOZ]);
				PojazdInfo[uidveh][pOVW] = GetVehicleVirtualWorld(PojazdInfo[uidveh][pID]);
				GetVehicleZAngle(PojazdInfo[uidveh][pID], PojazdInfo[uidveh][pOA]);
				setDoor(NaprawiaVeh[sellerid],RIGHT_DOOR,FULL);
				SetTimerEx("Naprawa",3000,false,"dd",NaprawiaVeh[sellerid],GetVehicleVirtualWorld(NaprawiaVeh[sellerid]));
				SetVehicleVirtualWorld(NaprawiaVeh[sellerid],9999);
				StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (drzwi pasa¿era)", cena);
				KillTimer(AntyCheatWizualizacjaTimer[playerid]);
				AntyCheatWizualizacjaTimer[playerid] = SetTimerEx("WlaczAntyWizualizacje",2000,0,"d",playerid);
			}
			if(przedtyp == P_DRZWIK)
			{
				AntyCheatWizualizacja[playerid] = 1;
				new uidveh = SprawdzCarUID(NaprawiaVeh[sellerid]);
				GetVehiclePos(PojazdInfo[uidveh][pID],PojazdInfo[uidveh][pOX],PojazdInfo[uidveh][pOY],PojazdInfo[uidveh][pOZ]);
				PojazdInfo[uidveh][pOVW] = GetVehicleVirtualWorld(PojazdInfo[uidveh][pID]);
				GetVehicleZAngle(PojazdInfo[uidveh][pID], PojazdInfo[uidveh][pOA]);
				setDoor(NaprawiaVeh[sellerid],LEFT_DOOR,FULL);
				SetTimerEx("Naprawa",3000,false,"dd",NaprawiaVeh[sellerid],GetVehicleVirtualWorld(NaprawiaVeh[sellerid]));
				SetVehicleVirtualWorld(NaprawiaVeh[sellerid],9999);
				StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (drzwi kierowcy)", cena);
				KillTimer(AntyCheatWizualizacjaTimer[playerid]);
				AntyCheatWizualizacjaTimer[playerid] = SetTimerEx("WlaczAntyWizualizacje",2000,0,"d",playerid);
			}
			if(przedtyp == P_SWIATLOLP)
			{
				AntyCheatWizualizacja[playerid] = 1;
				setLight(NaprawiaVeh[sellerid],LEFT_LIGHT,FULL);
				StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (lewe œwiat³o)", cena);
				KillTimer(AntyCheatWizualizacjaTimer[playerid]);
				AntyCheatWizualizacjaTimer[playerid] = SetTimerEx("WlaczAntyWizualizacje",2000,0,"d",playerid);
			}
			if(przedtyp == P_SWIATLOPP)
			{
				AntyCheatWizualizacja[playerid] = 1;
				setLight(NaprawiaVeh[sellerid],RIGHT_LIGHT,FULL);
				StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (prawe œwiat³o)", cena);
				KillTimer(AntyCheatWizualizacjaTimer[playerid]);
				AntyCheatWizualizacjaTimer[playerid] = SetTimerEx("WlaczAntyWizualizacje",2000,0,"d",playerid);
			}
			if(przedtyp == P_OPONALP)
			{
				AntyCheatWizualizacja[playerid] = 1;
				setTire(NaprawiaVeh[sellerid],LEFT_F_TIRE,FULL);
				StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (Opona LP)", cena);
				KillTimer(AntyCheatWizualizacjaTimer[playerid]);
				AntyCheatWizualizacjaTimer[playerid] = SetTimerEx("WlaczAntyWizualizacje",2000,0,"d",playerid);
			}
			if(przedtyp == P_OPONAPP)
			{
				AntyCheatWizualizacja[playerid] = 1;
				setTire(NaprawiaVeh[sellerid],RIGHT_F_TIRE,FULL);
				StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (Opona PP)", cena);
				KillTimer(AntyCheatWizualizacjaTimer[playerid]);
				AntyCheatWizualizacjaTimer[playerid] = SetTimerEx("WlaczAntyWizualizacje",2000,0,"d",playerid);
			}
			if(przedtyp == P_OPONAPT)
			{
				AntyCheatWizualizacja[playerid] = 1;
				setTire(NaprawiaVeh[sellerid],RIGHT_B_TIRE,FULL);
				StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (Opona PT)", cena);
				KillTimer(AntyCheatWizualizacjaTimer[playerid]);
				AntyCheatWizualizacjaTimer[playerid] = SetTimerEx("WlaczAntyWizualizacje",2000,0,"d",playerid);
			}
			if(przedtyp == P_OPONALT)
			{
				AntyCheatWizualizacja[playerid] = 1;
				setTire(NaprawiaVeh[sellerid],LEFT_B_TIRE,FULL);
				StatykujTransakcje(grupa, sellerid, playerid, "Monta¿ (Opona LT)", cena);
				KillTimer(AntyCheatWizualizacjaTimer[playerid]);
				AntyCheatWizualizacjaTimer[playerid] = SetTimerEx("WlaczAntyWizualizacje",2000,0,"d",playerid);
			}
			if(DutyNR[sellerid] == 1) DaneGracza[sellerid][gPrzynaleznosci][3]++;
			else if(DutyNR[sellerid] == 2) DaneGracza[sellerid][gPrzynaleznosci][9]++;
			else if(DutyNR[sellerid] == 3) DaneGracza[sellerid][gPrzynaleznosci][15]++;
			else if(DutyNR[sellerid] == 4) DaneGracza[sellerid][gPrzynaleznosci][21]++;
			else if(DutyNR[sellerid] == 5) DaneGracza[sellerid][gPrzynaleznosci][27]++;
			else if(DutyNR[sellerid] == 6) DaneGracza[sellerid][gPrzynaleznosci][33]++;
			new dla_nuba = cena / 10;
			Dodajkase( sellerid, dla_nuba );
			if(przedtyp != P_TUNING)
			{
				UsunPrzedmiot(NaprawiaIUID[sellerid]);
			}
		}
		ZapiszPojazd(up, 1);
		SetTimerEx("Unfreeze_AC", 2000, 0, "i", up);
		ForeachEx(x, MAX_PLAYERS)
		{
			if(IsPlayerConnected(x))
			{
				if(zalogowany[x] == true)
				{
					if(PlayerObokPojazdu(x,	NaprawiaVeh[sellerid]) < 10.0)
					{
						PlayerPlaySound(x, 1133, 0.0, 0.0, 0.00);
					}
				}
			}
        }
		NaprawiaODL[sellerid] = 0;
        NaprawiaID[sellerid] = 0;
		NaprawianieVW[sellerid] = 0;
		NaprawiaVeh[sellerid] = 0;
		NaprawiaIUID[sellerid] = 0;
		NaprawiaCzas[sellerid] = 0;
		DeletePVar(sellerid,"TypM");
	}
	OfertaInfo[sellerid][oTyp] = 0;
	strmid(OfertaInfo[sellerid][oPowod],"", 0, 60, 60);
    OfertaInfo[sellerid][oKlient] = -1;
    OfertaInfo[sellerid][oCena] = 0;
    OfertaInfo[sellerid][oWar1] = 0;
    OfertaInfo[sellerid][oWar2] = 0;
    OfertaInfo[sellerid][oWar3] = 0;
    OfertaInfo[sellerid][oWar4] = 0;
	OfertaInfo[sellerid][oWar5] = 0;
    OfertaInfo[playerid][oSprzedajacy] = -1;
    return 1;
}
