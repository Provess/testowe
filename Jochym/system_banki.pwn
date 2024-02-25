AntiDeAMX();
/*CMD:bank(playerid, params[])
{
	//printf("U¿yta komenda bank");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
    new vw = GetPlayerVirtualWorld(playerid);
	if(vw == 0)
	{
	    return 0;
	}
	if(BudynekInfo[vw][nWlascicielP] != 0 && BudynekInfo[vw][nWlascicielD] == 0)
	{
	    return 0;
	}
	new uid = BudynekInfo[vw][nWlascicielD];
	if(GrupaInfo[uid][gTyp] != DZIALALNOSC_BANK)
	{
	    return 0;
	}
	if(DaneGracza[playerid][gKONTO_W_BANKU] == 0)
	{
	   	dShowPlayerDialog(playerid, DIALOG_BANK_KONTO, DIALOG_STYLE_MSGBOX, "• TIP :", "Witaj, czy chesz za³o¿yæ swoje konto osobiste w San Andreas Bank System?\n\n\t• Bêdziesz móg³ wtedy korzystaæ z naszych bankomatów w ca³ym stanie.\n\t• Wykonywac przelewy z urz¹dzeñ mobilinych.", "Tak", "Nie");
	    return 1;
	}
	else
	{
	    dShowPlayerDialog(playerid, DIALOG_BANKOMAT, DIALOG_STYLE_LIST, "• TIP :Los Santos Bank{FFFFFF}:", "{DEDEDE}»  Stan konta\n{DEDEDE}»  Wyp³aæ pieni¹dze\n{DEDEDE}»  Wp³aæ pieni¹dze\n{DEDEDE}»  Dokonaj przelewu\n{DEDEDE}»  Konta Firmowe\n{DEDEDE}»  Odbierz zasi³ek", "Wybierz", "Zamknij");
	}
	return 1;
}*/
CMD:bankinter(playerid, params[])
{
	//printf("U¿yta komenda bankomat");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	new find = GetPVarInt(playerid, "InterakcjaObiekt");
    
	if(ObiektInfo[find][objModel] == 2942 || ObiektInfo[find][objModel] == 2754 || ObiektInfo[find][objModel] == -2085)
	{
	    if(DaneGracza[playerid][gKONTO_W_BANKU] == 0)
		{
		   	dShowPlayerDialog(playerid, DIALOG_BANK_KONTO, DIALOG_STYLE_MSGBOX, "• TIP Bank:", "Witaj, czy chcesz za³o¿yæ swoje konto osobiste w San Andreas Bank System?\n\n\t• Bêdziesz móg³ wtedy korzystaæ z naszych bankomatów w ca³ym stanie.\n\t• Wykonywaæ przelewy z urz¹dzeñ mobilnych.", "Tak", "Nie");
		    return 1;
		}
		else
		{
			ZaladujZadluzenia();
			SetPVarInt(playerid, "DlugGracza", 0);
			ForeachEx(id, MAX_DLUG)
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
		    new string[512], naglowek[256];
		    format(string, sizeof(string), "%s\n{333333}1.\t{FFFFFF}Konto {63D075}($%d)", string, DaneGracza[playerid][gSTAN_KONTA]);
		    format(string, sizeof(string), "%s\n{333333}2.\t{444444}<{FFFFFF}Wyplata", string);
			format(string, sizeof(string), "%s\n{333333}3.\t{444444}>{FFFFFF}Wplata", string);
			format(string, sizeof(string), "%s\n{333333}4.\t{FFFFFF}Wykonaj przelew", string);
			format(string, sizeof(string), "%s\n{333333}5.\t{FFFFFF}Konta firmowe", string);
			format(string, sizeof(string), "%s\n{333333}6.\t{FFFFFF}Odbierz zasi³ek", string);
			format(string, sizeof(string), "%s\n{333333}7.\t{FFFFFF}Sp³aæ d³ug {63D075}($%d)", string, GetPVarInt(playerid, "DlugGracza"));
			format(string, sizeof(string), "%s\n{333333}8.\t{FFFFFF}Historia transakcji", string);
			format(naglowek, sizeof(naglowek), "Bankomat");
			dShowPlayerDialog(playerid, DIALOG_BANKOMAT, DIALOG_STYLE_LIST, naglowek, string, "Wybierz", "Zamknij");
		}
	}
	else
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Jesteœ zbyt daleko od modelu bankomatu (obiekt id: 2942, 2754 lub -2085).", "Zamknij", "");
	}
	return 1;
}
CMD:bank(playerid, params[])
{
	//printf("U¿yta komenda bankomat");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
    new find = 0;
	new uid_budynku = GetPlayerVirtualWorld(playerid);
    ForeachEx(h, BudynekInfo[uid_budynku][nStworzoneObiekty])
	{
	    if(Dystans(1.0, playerid, ObiektInfo[BudynekInfo[uid_budynku][nObiekty][h]][objPozX],ObiektInfo[BudynekInfo[uid_budynku][nObiekty][h]][objPozY],ObiektInfo[BudynekInfo[uid_budynku][nObiekty][h]][objPozZ]) && GetPlayerVirtualWorld(playerid) == ObiektInfo[BudynekInfo[uid_budynku][nObiekty][h]][objvWorld])
	    {
		    find = BudynekInfo[uid_budynku][nObiekty][h];
		    break;
		}
	}
	if(ObiektInfo[find][objModel] == 2942 || ObiektInfo[find][objModel] == 2754 || ObiektInfo[find][objModel] == -2085)
	{
	    if(DaneGracza[playerid][gKONTO_W_BANKU] == 0)
		{
		   	dShowPlayerDialog(playerid, DIALOG_BANK_KONTO, DIALOG_STYLE_MSGBOX, "• TIP Bank:", "Witaj, czy chcesz za³o¿yæ swoje konto osobiste w San Andreas Bank System?\n\n\t• Bêdziesz móg³ wtedy korzystaæ z naszych bankomatów w ca³ym stanie.\n\t• Wykonywaæ przelewy z urz¹dzeñ mobilnych.", "Tak", "Nie");
		    return 1;
		}
		else
		{
			ZaladujZadluzenia();
			SetPVarInt(playerid, "DlugGracza", 0);
			ForeachEx(id, MAX_DLUG)
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
		    new string[512], naglowek[256];
		    format(string, sizeof(string), "%s\n{333333}1.\t{FFFFFF}Konto {63D075}($%d)", string, DaneGracza[playerid][gSTAN_KONTA]);
		    format(string, sizeof(string), "%s\n{333333}2.\t{444444}<{FFFFFF}Wyplata", string);
			format(string, sizeof(string), "%s\n{333333}3.\t{444444}>{FFFFFF}Wplata", string);
			format(string, sizeof(string), "%s\n{333333}4.\t{FFFFFF}Wykonaj przelew", string);
			format(string, sizeof(string), "%s\n{333333}5.\t{FFFFFF}Konta firmowe", string);
			format(string, sizeof(string), "%s\n{333333}6.\t{FFFFFF}Odbierz zasi³ek", string);
			format(string, sizeof(string), "%s\n{333333}7.\t{FFFFFF}Sp³aæ d³ug {63D075}($%d)", string, GetPVarInt(playerid, "DlugGracza"));
			format(string, sizeof(string), "%s\n{333333}8.\t{FFFFFF}Historia transakcji", string);
			//format(string, sizeof(string), "%s\n{333333}9.\t{FFFFFF}Historia przelewów", string);
			format(naglowek, sizeof(naglowek), "Bankomat");
			dShowPlayerDialog(playerid, DIALOG_BANKOMAT, DIALOG_STYLE_LIST, naglowek, string, "Wybierz", "Zamknij");
		}
	}
	else
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Jesteœ zbyt daleko od modelu bankomatu (obiekt id: 2942).", "Zamknij", "");
	}
	return 1;
}
forward nrkontasprawdz(nr);
public nrkontasprawdz(nr)
{
	format(zapyt, sizeof(zapyt), "SELECT `NUMER_KONTA` FROM `jochym_bank` WHERE `NUMER_KONTA` = '%d'", nr);
	mysql_query(zapyt);
	mysql_store_result();
	if(mysql_num_rows() != 0)
	{
   		nr = 100000000 + random(899999999);
   		return nrkontasprawdz(nr);
	}
	else
	{
		return nr;
	}
}
forward DodajKontoWBanku(playerid, nazwa[], nrkonta, nrkarty, bic[], iban[], uidp, uidg);
public DodajKontoWBanku(playerid, nazwa[], nrkonta, nrkarty, bic[], iban[], uidp, uidg)
{
	new index = GetFreeSQLUID("jochym_bank", "ID");
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_bank` (`ID`, `NAZWA_BANKU`, `NUMER_KONTA`, `NUMER_KARTY`, `BIC`, `IBAN`, `UID_POSTACI`, `UID_DZIALALNOSCI`) VALUES ('%d','%s', '%d', '%d', '%s', '%s', '%d', '%d')",
	index, nazwa, nrkonta, nrkarty, bic, iban, uidp, uidg);
	mysql_check();
	mysql_query2(zapyt);
	mysql_free_result();
	DaneGracza[playerid][gKONTO_W_BANKU] = index;
	DaneGracza[playerid][gNUMER_KONTA] = nrkonta;
	DaneGracza[playerid][gNUMER_KARTY] = nrkarty;
	DaneGracza[playerid][gUID_BANKU] = uidg;
	DaneGracza[playerid][gSTAN_KONTA] = 0;
	format(DaneGracza[playerid][gBIC], 124, "%s", bic);
    format(DaneGracza[playerid][gIBAN], 124, "%s", iban);
    format(DaneGracza[playerid][gNAZWA_BANKU], 124, "%s", nazwa);
	DaneGracza[playerid][gKREDYT] = 0;
	return index;
}
forward ZapiszBankKasa(uid);
public ZapiszBankKasa(uid)
{
	if(zalogowany[uid] == true)
    {
		strdel(zapyt, 0, 1024);
		format(zapyt, sizeof(zapyt), "UPDATE `jochym_bank` SET `STAN_KONTA`=%d WHERE `UID_POSTACI`='%d'",
		DaneGracza[uid][gSTAN_KONTA],
		DaneGracza[uid][gUID]);
		mysql_query(zapyt);
	}
	return 1;
}
