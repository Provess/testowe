AntiDeAMX();

forward ZaladujElektryke();
public ZaladujElektryke()
{
	new result[1024], i = 0;
    format(zapyt, sizeof(zapyt), "SELECT * FROM `jochym_elektryka`");
    mysql_check();
	mysql_query2(zapyt);
    mysql_store_result();
    while(mysql_fetch_row_format(result, "|") == 1)
	{
	    new uid;
    	sscanf(result, "p<|>{d}d", uid);
		sscanf(result,  "p<|>{dd}ds[500]",BudynekInfo[uid][nBezpiecznik], BudynekInfo[uid][nElektryka]);
		i++;
	}
	mysql_free_result();
	//printf("Elektryka       - %d", i);
}
forward ZapiszElektryke(uid);
public ZapiszElektryke(uid)
{
	strdel(zapyt, 0, 1024);
	format(zapyt, sizeof(zapyt), "UPDATE `jochym_elektryka` SET `INSTALACJA` = '%s', `BEZPIECZNIK` = '%d' WHERE `ID_NIERUCHOMOSCI` = '%d'",
	BudynekInfo[uid][nElektryka],
	BudynekInfo[uid][nBezpiecznik],
	uid);
	mysql_check();
	mysql_query2(zapyt);
	mysql_free_result();
	return 1;
}
CMD:swiatlo(playerid, params[])
{
	if(AntySpam[playerid][0] == 1)
	{
		return 0;
	}
	AntySpam[playerid][0] = 1;
	SetTimerEx("SpamKomend1",10000,0,"d",playerid);
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(GetPlayerVirtualWorld(playerid) != 0)
	{
		if(PrzyObiekcie(playerid, 364, 3) != 0)
		{
		    dShowPlayerDialog(playerid, DIALOG_SWIATLODOM, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby w³¹czyæ lub wy³¹czyæ œwiat³o, wciœnij 'prze³¹cz':", "Prze³¹cz", "");
		    return 1;
		}
	}
	return 1;
}
CMD:bezpiecznik(playerid, params[])
{
	//printf("U¿yta komenda bezpiecznik");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	if(GetPlayerVirtualWorld(playerid) != 0)
	{
		new vw = GetPlayerVirtualWorld(playerid);
		if(!SwiatloBudynku(vw, playerid))
		{
			if(!MontowanieElektryki(playerid))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Nie masz uprawnieñ do W³¹czania/Wy³¹czania{DEDEDE} Bezpieczników w tym Budynku!", "Zamknij", "");
				return 0;
			}
		}
		if(DaneGracza[playerid][gZarzadzajElektryka] != vw && MontowanieElektryki(playerid) && DaneGracza[playerid][gUID] != BudynekInfo[vw][nWlascicielP] && !SwiatloBudynku(vw, playerid))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Aby zarz¹dzaæ elektryk¹{DEDEDE} w tym budynku, oferuj wlaœcicielowi \"Zarz¹dzanie instalacja elektryczna{DEDEDE}\"", "Zamknij", "");
			return 0;
		}
		if(PrzyObiekcie(playerid, 1958, 3) != 0)
		{
			dShowPlayerDialog(playerid, DIALOG_BEZPIECZNIK, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Wybierz jedn¹ z poni¿szych opcji aby w³¹czyæ/wy³¹czyæ bezpiecznik", "W³¹cz", "Wy³¹cz");
			return 1;
		}
	}
	return 1;
}
