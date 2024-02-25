AntiDeAMX();
forward UsunWyscig(uid, nazwa[],uidj);
public UsunWyscig(uid, nazwa[],uidj)
{
	format(zapyt, sizeof(zapyt), "DELETE FROM `jochym_wyscigi` WHERE `StworzylTrase` = '%d' AND `NazwaWyscigu` = '%s'", uid, nazwa);
	mysql_check();
	mysql_query2(zapyt);
	WyscigInfo[uidj][wUID] = 0;
	WyscigInfo[uidj][wX] = 0;
	WyscigInfo[uidj][wY] = 0;
	WyscigInfo[uidj][wZ] = 0;
	WyscigInfo[uidj][TrasaNR] = 0;
	WyscigInfo[uidj][StworzylTrase] = 0;
	WyscigInfo[uidj][wMiejsce] = 0;
	mysql_free_result();
	return 1;
}
forward DodajWyscig(Float: x, Float: y, Float: z, trasanr, stworzyl, nazwa[]);
public DodajWyscig(Float: x, Float: y, Float: z, trasanr, stworzyl, nazwa[])
{
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_wyscigi` (`X`, `Y`, `Z`, `TrasaNR`, `StworzylTrase`, `NazwaWyscigu`) VALUES ('%f', '%f', '%f', '%d', '%d', '%s')",
	x, y, z, trasanr, stworzyl, nazwa);
	mysql_check();
	mysql_query2(zapyt);
	new uid = mysql_insert_id();
	WyscigInfo[uid][wUID] = uid;
	WyscigInfo[uid][wX] = x;
	WyscigInfo[uid][wY] = y;
	WyscigInfo[uid][wZ] = z;
	WyscigInfo[uid][TrasaNR] = trasanr;
	format(WyscigInfo[uid][wNazwa], 32, "%s", nazwa);
	WyscigInfo[uid][StworzylTrase] = stworzyl;
	mysql_free_result();
    return uid;
}
forward ZaladujWyscigAll();
public ZaladujWyscigAll()
{
	new result[1024], i = 0;
    format(zapyt, sizeof(zapyt), "SELECT * FROM `jochym_wyscigi`");
    mysql_check();
	mysql_query2(zapyt);
    mysql_store_result();
    while(mysql_fetch_row_format(result, "|") == 1)
	{
	    new uid;
		sscanf(result,  "p<|>d", uid);
		sscanf(result,  "p<|>dfffdds[32]",		WyscigInfo[uid][wUID],
						WyscigInfo[uid][wX],
						WyscigInfo[uid][wY],
						WyscigInfo[uid][wZ],
						WyscigInfo[uid][TrasaNR],
						WyscigInfo[uid][StworzylTrase],
						WyscigInfo[uid][wNazwa]);
		i++;
	}
	mysql_free_result();
	//printf("Wyscigi       - %d", i);
}
forward ZaladujWyscig(nazwa[]);
public ZaladujWyscig(nazwa[])
{
	new result[150];
	format(zapyt, sizeof(zapyt), "SELECT * FROM `jochym_wyscigi` WHERE `NazwaWyscigu` = '%s'", nazwa);
	mysql_query2(zapyt);
	mysql_store_result();
	new found = mysql_num_rows();
	while(mysql_fetch_row_format(result, "|") == 1)
	{
		new uid;
		sscanf(result,  "p<|>d", uid);
		sscanf(result,  "p<|>dfffdds[32]",		WyscigInfo[uid][wUID],
						WyscigInfo[uid][wX],
						WyscigInfo[uid][wY],
						WyscigInfo[uid][wZ],
						WyscigInfo[uid][TrasaNR],
						WyscigInfo[uid][StworzylTrase],
						WyscigInfo[uid][wNazwa]);
	}
	return found;
}
CMD:wyscig(playerid, params[])
{
	//printf("U¿yta komenda wyscig");
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
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Aby skokorzystaæ z tej komendy{DEDEDE} musisz wejœæ na s³u¿be{DEDEDE} grupy.", "Zamknij", "");
		return 0;
	}
	new uidg = DaneGracza[playerid][gSluzba];
	if(GrupaInfo[uidg][gTyp] != DZIALALNOSC_ZMOTORYZOWANA)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "{DEDEDE}Aby skokorzystaæ z tej komendy{DEDEDE} musisz wejœæ na s³u¿be{DEDEDE} grupy.", "Zamknij", "");
		return 0;
	}
	strdel(tekst_global, 0, 2048);
	format(tekst_global, sizeof(tekst_global), "%s\n\t{DEDEDE}»  Lista stworzonych tras grupy", tekst_global);
	format(tekst_global, sizeof(tekst_global), "%s\n\t{DEDEDE}»  Stwórz now¹ trase", tekst_global);
	format(tekst_global, sizeof(tekst_global), "%s\n\t{DEDEDE}»  Rozpocznij wyœcig", tekst_global);
	if(DaneGracza[playerid][gWyscig] != 0) format(tekst_global, sizeof(tekst_global), "%s\n\t{DEDEDE}»  Lista uczestników", tekst_global);
	dShowPlayerDialog(playerid, DIALOG_WYSCIG_OPCJE, DIALOG_STYLE_LIST, "• Wyœcigi:", tekst_global, "Wybierz", "Zamknij");
	return 1;
}
forward WyladujWyscig(nazwa[]);
public WyladujWyscig(nazwa[])
{
	ForeachEx(i, MAX_WYSCIG)
	{
	    if(ComparisonString(WyscigInfo[i][wNazwa], nazwa))
		{
			WyscigInfo[i][wUID] = 0;
			WyscigInfo[i][wX] = 0;
			WyscigInfo[i][wY] = 0;
			WyscigInfo[i][wZ] = 0;
			WyscigInfo[i][TrasaNR] = 0;
			WyscigInfo[i][wMiejsce] = 0;
			WyscigInfo[i][StworzylTrase] = 0;
		}
	}
}
forward ZnajdzWyscig(nazwa[]);
public ZnajdzWyscig(nazwa[])
{
	new race = 0;
	ForeachEx(i, MAX_WYSCIG)
	{
		if(ComparisonString(WyscigInfo[i][wNazwa], nazwa))
		{
			race = i;
			break;
		}
	}
	return race;
}
forward SzukajCheckpointu(uid,uid2,ser[]);
public SzukajCheckpointu(uid,uid2,ser[])
{
	new race;
	ForeachEx(i, MAX_WYSCIG)
	{
		if(WyscigInfo[i][TrasaNR] == uid && WyscigInfo[i][StworzylTrase] == uid2 && ComparisonString(WyscigInfo[i][wNazwa], ser))
		{
			race = i;
			break;
		}
	}
	return race;
}
stock GetPlayedTimeSecZ(zmienna, &hours, &minutes, &second)
{
	hours 	= zmienna / 3600;
	minutes = (zmienna - hours * 3600) / 60;
	second 	= ((zmienna - (hours * 3600)) - (minutes * 60));
	return 1;
}
stock KomuninikatWyscig(playerid, powod[])
{
	ForeachEx(i, IloscGraczy)
	{
		if(DaneGracza[playerid][gWyscig] == DaneGracza[KtoJestOnline[i]][gWyscig] && playerid != KtoJestOnline[i])
		{
			SendClientMessage(KtoJestOnline[i], 0xFFb00000, powod);
		}
	}
	return 1;
}
CMD:opusc(playerid, params[])
{
	//printf("U¿yta komenda opusc");
	if(zalogowany[playerid] == false)
	{
		return 0;
	}
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	if(DaneGracza[playerid][gWyscig] == 0)
	{
		return 0;
	}
	if(Pracuje[playerid] == 0)
	{
		new texts[124];
		format(texts, sizeof(texts), "{DEDEDE}** Gracz: %s opuœci³ wyœcig.", ZmianaNicku(playerid));
		KomuninikatWyscig(playerid,texts);
	}
	TextDrawHideForPlayer(playerid, Wyscig[playerid]);
	DaneGracza[playerid][gWyscig] = 0;
	DaneGracza[playerid][gCheckopintID] = 0;
	DisablePlayerRaceCheckpoint(playerid);
	DaneGracza[playerid][gKoniecWyscigu] = 0;
	DaneGracza[playerid][gRaceTimeStart] = 0;
	DaneGracza[playerid][gSwp] = 0;
	CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
	if(Pracuje[playerid] == 0)
	{
		TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
		TextDrawSetString(TextNaDrzwi[playerid], "Opusciles wyscig.");
		TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
	}
	Frezuj(playerid, 1);
	return 1;
}
public OnPlayerEnterRaceCheckpoint(playerid)
{
    if(DaneGracza[playerid][gWyscig] != 0  && IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
        new str[128], str2[512], str3[512];
        DaneGracza[playerid][gCheckopintID]++;
		DaneGracza[playerid][gSwp] = 60;
		new numer = DaneGracza[playerid][gCheckopintID];
		if(numer == 1) format(str3, sizeof(str3), "~b~1~w~/21");
		if(numer == 2) format(str3, sizeof(str3), "~b~2~w~/21");
		if(numer == 3) format(str3, sizeof(str3), "~b~3~w~/21");
		if(numer == 4) format(str3, sizeof(str3), "~b~4~w~/21");
		if(numer == 5) format(str3, sizeof(str3), "~b~5~w~/21");
		if(numer == 6) format(str3, sizeof(str3), "~b~6~w~/21");
		if(numer == 7) format(str3, sizeof(str3), "~b~7~w~/21");
		if(numer == 8) format(str3, sizeof(str3), "~b~8~w~/21");
		if(numer == 9) format(str3, sizeof(str3), "~b~9~w~/21");
		if(numer == 10) format(str3, sizeof(str3), "~b~10~w~/21");
		if(numer == 11) format(str3, sizeof(str3), "~b~11~w~/21");
		if(numer == 12) format(str3, sizeof(str3), "~b~12~w~/21");
		if(numer == 13) format(str3, sizeof(str3), "~b~13~w~/21");
		if(numer == 14) format(str3, sizeof(str3), "~b~14~w~/21");
		if(numer == 15) format(str3, sizeof(str3), "~b~15~w~/21");
		if(numer == 16) format(str3, sizeof(str3), "~b~16~w~/21");
		if(numer == 17) format(str3, sizeof(str3), "~b~17~w~/21");
		if(numer == 18) format(str3, sizeof(str3), "~b~18~w~/21");
		if(numer == 19) format(str3, sizeof(str3), "~b~19~w~/21");
		if(numer == 20) format(str3, sizeof(str3), "~b~20~w~/21");
		if(numer == 21) format(str3, sizeof(str3), "~b~21~w~/21");
		GameTextForPlayer(playerid, str3, 2000, 4);
        new race = DaneGracza[playerid][gCheckopintID];
		new raceto = DaneGracza[playerid][gCheckopintID]+1;
        new next = SzukajCheckpointu(race, WyscigInfo[DaneGracza[playerid][gWyscig]][StworzylTrase],WyscigInfo[DaneGracza[playerid][gWyscig]][wNazwa]);
		new nextto = SzukajCheckpointu(raceto, WyscigInfo[DaneGracza[playerid][gWyscig]][StworzylTrase],WyscigInfo[DaneGracza[playerid][gWyscig]][wNazwa]);
        PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
		new minutes;
        new czas, minutes_last, second_last;
        if(next == 0)
        {
            DaneGracza[playerid][gKoniecWyscigu] = 1;
			DisablePlayerRaceCheckpoint(playerid);
			DaneGracza[playerid][gCzasKoniecW] = gettime()+CZAS_LETNI;
			WyscigInfo[DaneGracza[playerid][gWyscig]][wMiejsce]++;
			DaneGracza[playerid][gMiejsceW] = WyscigInfo[DaneGracza[playerid][gWyscig]][wMiejsce];
			if(Pracuje[playerid] != 0)
			{
				if(DaneGracza[playerid][gKoniecWyscigu])
				{
					AntyCheatWizualizacja[playerid] = 1;
					SetPVarInt(playerid, "Teleportacja", 1);
					new randkasa;
					randkasa = 3+random(13);
					CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
					TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
					new stra2[256];
					format(stra2, sizeof(stra2), "Ukonczyles zlecenie twoje wynagrodzenie to: ~g~%d$", randkasa);
					TextDrawSetString(TextNaDrzwi[playerid], stra2);
					TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
					RemovePlayerFromVehicle(playerid);
					PASY[playerid] = 0;
					RefreshNick(playerid);
					DaneGracza[playerid][gCheckopintID] = 0;
					new uid = SprawdzCarUID(Pracuje[playerid]);
					SetVehicleToRespawn(Pracuje[playerid]);
					PojazdInfo[uid][pStan] = 1000.0;
					PojazdInfo[uid][pPaliwo] = 100;
					SetVehicleHealth(Pracuje[playerid], PojazdInfo[uid][pStan] );
					RepairVehicle(Pracuje[playerid]);
					GetVehicleDamageStatus(Pracuje[playerid], PojazdInfo[uid][pUszkodzenie1], PojazdInfo[uid][pUszkodzenie2], PojazdInfo[uid][pUszkodzenie3], PojazdInfo[uid][pUszkodzenie4]);
					Pracuje[playerid] = 0;
					Dodajkase(playerid, randkasa);
					DaneGracza[playerid][gWyscig] = 0;
					DaneGracza[playerid][gCheckopintID] = 0;
					DisablePlayerRaceCheckpoint(playerid);
					DaneGracza[playerid][gKoniecWyscigu] = 0;
					DaneGracza[playerid][gRaceTimeStart] = 0;
					SetPVarInt(playerid, "Teleportacja", 0);
					DaneGracza[playerid][gSwp] = 0;
					KillTimer(AntyCheatWizualizacjaTimer[playerid]);
					AntyCheatWizualizacjaTimer[playerid] = SetTimerEx("WlaczAntyWizualizacje",2000,0,"d",playerid);
				}
			}
			else
			{
				ForeachEx(i, IloscGraczy)
				{
					if(DaneGracza[KtoJestOnline[i]][gWyscig] == DaneGracza[playerid][gWyscig])
					{
						ForeachEx(x, IloscGraczy)
						{
							if(DaneGracza[KtoJestOnline[x]][gKoniecWyscigu])
							{
								czas = DaneGracza[KtoJestOnline[x]][gCzasKoniecW] - DaneGracza[KtoJestOnline[x]][gWyscigCzasLast];
								minutes_last = (czas - 0 * 3600) / 60;
								second_last 	= ((czas - (0 * 3600)) - (minutes * 60));
								format(str2, sizeof(str2), "%s~n~(~g~~h~%d:%d ~w~sekund) ~r~~h~%d~w~. %s", str2, minutes_last, second_last, DaneGracza[KtoJestOnline[x]][gMiejsceW], ZmianaNicku(KtoJestOnline[x]));
								CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
								TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
								TextDrawSetString(TextNaDrzwi[playerid], "Wlasnie dotarles do mety, aby opuscic wyscig wpisz ~g~/opusc");
								TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
								DaneGracza[playerid][gCheckopintID] = 0;
								SetTimerEx("TDWyscig",40000,0,"i",playerid);
								}
							}
						format(str2, sizeof(str2), "%s~n~%s", str, str2);
						TextDrawSetString(Wyscig[KtoJestOnline[i]], str2);
						TextDrawShowForPlayer(KtoJestOnline[i], Wyscig[KtoJestOnline[i]]);
						format(str2, sizeof(str2), "");
					}
				}
			}
			return 1;
		}
		if(nextto == 0)
        {
			SetPlayerRaceCheckpoint(playerid,1,WyscigInfo[next][wX], WyscigInfo[next][wY], WyscigInfo[next][wZ],0,0,0,8);
		}
		else
		{
			SetPlayerRaceCheckpoint(playerid,0,WyscigInfo[next][wX], WyscigInfo[next][wY], WyscigInfo[next][wZ],WyscigInfo[nextto][wX], WyscigInfo[nextto][wY], WyscigInfo[nextto][wZ],8);
		}
		return 1;
	}
	return 1;
}
