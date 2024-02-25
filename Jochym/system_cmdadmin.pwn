stock lsQualityEkipa(playerid)
{
	if((DaneGracza[playerid][gAdmGroup] == 4 || DaneGracza[playerid][gAdmGroup] == 14|| DaneGracza[playerid][gAdmGroup] == 7 || DaneGracza[playerid][gAdmGroup] == 8) && DutyAdmina[playerid] == 1 || DaneGracza[playerid][gGUID] == 3)
	{
	    return true;
	}
	else
	{
		return false;
	}
}

stock UprawnieniaGMa(playerid, lvl)
{
	if((DaneGracza[playerid][gAdmGroup] == 4 || DaneGracza[playerid][gAdmGroup] == 14 || DaneGracza[playerid][gAdmGroup] == 7 || DaneGracza[playerid][gAdmGroup] == 8 && DaneGracza[playerid][gAdmLVL] >= lvl) && DutyAdmina[playerid] == 1 || DaneGracza[playerid][gGUID] == 3)
	{
	    return true;
	}
	else
	{
		return false;
	}
}
stock UprawnieniaCMa(playerid, lvl)
{
	if((DaneGracza[playerid][gAdmGroup] == 4 || DaneGracza[playerid][gAdmGroup] == 14 || DaneGracza[playerid][gAdmGroup] == 7 && DaneGracza[playerid][gAdmLVL] >= lvl) && DutyAdmina[playerid] == 1 || DaneGracza[playerid][gGUID] == 3)
	{
	    return true;
	}
	else
	{
		return false;
	}
}
stock UprawnieniaAdministratora(playerid, lvl)
{
	if((DaneGracza[playerid][gAdmGroup] == 4 || DaneGracza[playerid][gAdmGroup] == 14 || DaneGracza[playerid][gAdmGroup] == 7 && DaneGracza[playerid][gAdmLVL] >= lvl) && DutyAdmina[playerid] == 1 || DaneGracza[playerid][gGUID] == 3)
	{
	    return true;
	}
	else
	{
		return false;
	}
}
stock UprawnieniaCEO(playerid, lvl)
{
	if((DaneGracza[playerid][gAdmGroup] == 4 && DaneGracza[playerid][gAdmLVL] >= lvl) && DutyAdmina[playerid] == 1 || DaneGracza[playerid][gGUID] == 3)
	{
	    return true;
	}
	else
	{
		return false;
	}
}
CMD:vreset(playerid, cmdtext[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCMa(playerid, 2))
	{
		vreset = 60;
    }
    return 1;
}
CMD:prefix(playerid, cmdtext[])
{
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
        new playerid2;
		if(sscanf(cmdtext, "d",playerid2))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zrobiæ refresh prefixu w nicku gracza dt. kraju wpisz: /prefix [id]", "Zamknij", "");
			return 1;
		}
		new IP[30], str[300], pName[MAX_PLAYER_NAME];
		GetPlayerName(playerid2, pName, sizeof(pName));
		GetPlayerIp(playerid2, IP, sizeof(IP));
		format(str, sizeof(str),"api.ipinfodb.com/v3/ip-country/?key="APIKEY"&ip=%s", IP);
		HTTP(playerid2, HTTP_GET, str, "", "GetPlayerCountry");
		printf("%s", str);
	}
	return 1;
}
CMD:gmx(playerid, cmdtext[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
        new model;
		if(sscanf(cmdtext, "d", model))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zrestartowaæ serwer wpisz: /gmx [1 - aktualizacja skryptu, 0 - aktualizuje statystyki gracza (skill broni, si³e)]", "Zamknij", "");
			return 1;
		}
        if(ogmx == 0)
        {
	        ForeachEx(i, MAX_PLAYERS)
			{
				if(IsPlayerConnected(i))
				{
					if(zalogowany[i] == true)
					{
						if(IsPlayerConnected(i) && DaneGracza[i][gUID] != 0)
						{
							if(zalogowany[i] == true)
							{
								if(DaneGracza[i][gBW] == 0)
								{
									DaneGracza[i][gQS] = gettime()+1200;
									GetPlayerPos(i, DaneGracza[i][gX],DaneGracza[i][gY],DaneGracza[i][gZ]);
									DaneGracza[i][gVW] = GetPlayerVirtualWorld(i);
									DaneGracza[i][gINT] = GetPlayerInterior(i);
								}
								if(DaneGracza[i][gSluzba] != 0)
								{
									ZapiszDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
								}
								ZapiszGracza(i);
								ZapiszBankKasa(i);
								ZapiszGraczaGlobal(i, 1);
								CancelEdit(i);
							}
						}
					}
				}
			}
	    	ogmx = 15;
	    	/*new query[256];
			format(query, sizeof(query), "UPDATE `jochym_serwer` SET `gmx` = '%d' WHERE `x` = %d",model, 1);
			mysql_check();
			mysql_query(query);*/
	    	Transakcja(T_GMX, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, "GMX", gettime()+KOREKTA_CZASOWA);
    	}
    }
    return 1;
}
CMD:walkaoteren(playerid, cmdtext[])
{
	if(UprawnieniaCEO(playerid, 0))
	{
	    ForeachEx(teren, MAX_ZON)
		{
		    if(teren == Lokacja[teren][gUID] && Lokacja[teren][gWojna] != 0)
		    {
	    		new wlasciciel = Lokacja[teren][gOwner];
				new wrog = Lokacja[teren][gWojna];
				new tekst[124];
		        if(GrupaInfo[wrog][gWojna] <= GrupaInfo[wlasciciel][gWojna])//Wlasciciel obroni³ teren
		        {
		 			format(tekst, sizeof(tekst), "Organizacja %s obroni³a kontrolê nad terenem.", GrupaInfo[wlasciciel][gNazwa]);
					SendWrappedMessageToAll(0x660000FF, tekst);
					GrupaInfo[wlasciciel][gTeren] = 0;
					GrupaInfo[wlasciciel][gOrg] = 0;
					GrupaInfo[wlasciciel][gWojna] = 0;
					GrupaInfo[wrog][gTeren] = 0;
					GrupaInfo[wrog][gOrg] = 0;
					GrupaInfo[wrog][gWojna] = 0;
					ZapiszWojne(wlasciciel);
					ZapiszWojne(wrog);
					Lokacja[teren][gWojna] = 0;
					ZapiszTeren(teren);
					GangZoneStopFlashForAll(teren);
				}
			}
		}
	}
	return 1;
}
CMD:nazwa(playerid,cmdtext[])
{
	//printf("U¿yta komenda model");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(UprawnieniaCEO(playerid, 0))
    {
		new model[50], xs[50];
		if(sscanf(cmdtext, "s[50]", model))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zmieniæ nazwe serwera wpisz: /nazwa [tresc]", "Zamknij", "");
			return 1;
		}
		format(xs, sizeof(xs), "hostname %s", model);
		SendRconCommand(xs);
		return 1;
	}
	return 1;
}
CMD:posgracza(playerid, cmdtext[])
{
	if(UprawnieniaCEO(playerid, 0))
    {
		if(zalogowany[playerid] == false)
		{
			return 0;
		}
		new gracz;
		if(sscanf(cmdtext, "i", gracz))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Komenda pomocnicza /posgracza [id gracza]", "Zamknij", "");
			return 1;
		}
		new Float:x, Float:y, Float:z;
		GetPlayerPos(gracz, x, y, z);
		new msg[128];
		format(msg,128,"Pozycja gracza: %f,%f,%f", x, y, z);
		SendClientMessage(playerid,0xFFFFFFFF,msg);
		return 1;
	}
	return 1;
}
CMD:predkosc(playerid, cmdtext[])
{
	if(UprawnieniaCEO(playerid, 0))
    {
		if(zalogowany[playerid] == false)
		{
			return 0;
		}
		new gracz;
		if(sscanf(cmdtext, "i", gracz))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Komenda pomocnicza /velocity [id gracza]", "Zamknij", "");
			return 1;
		}
		new msg[128];
		format(msg,128,"Predkoœæ gracza: %d, %f", GetPlayerSpeed(gracz), GetPlayerSpeed(gracz));
		SendClientMessage(playerid,0xFFFFFFFF,msg);
		return 1;
	}
	return 1;
}
CMD:getpos(playerid,cmdtext[]) return cmd_pozycja(playerid, cmdtext);
CMD:pozycja(playerid, cmdtext[])
{
	if(UprawnieniaCEO(playerid, 0))
    {
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid,X,Y,Z);

		new msg[128];
		format(msg,128,"Twoja pozycja: X:%f Y:%f Z:%f",X,Y,Z);
		SendClientMessage(playerid,0xFFFFFFFF,msg);

		MapAndreas_FindZ_For2DCoord(X,Y,Z);
		format(msg,128,"Najwy¿sza pozycja Z: %f",Z);
		SendClientMessage(playerid,0xFFFFFFFF,msg);
		return 1;
	}
	return 1;
}
CMD:ab(playerid, cmdtext[])
{
    if(UprawnieniaCMa(playerid, 3))
	{
    	new	comm1[32], comm2[128];
		if(sscanf(cmdtext, "s[32]S()[128]", comm1, comm2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/ab [stowrz, usun, hp, pos, anim, typ, zaladuj, opis, skin, wysokosc, to]", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"stworz",true))
		{
		    new typ, nick[32], skin, anim;
			if(sscanf(comm2, "ds[32]dd", typ, nick, skin, anim))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By stworzyæ aktora wpisz: /ab stworz [typ] [nick] [skin] [anim]", "Zamknij", "");
				return 1;
			}
			StworzBota(playerid, typ, nick, skin, 100, anim);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Stowrzy³eœ aktora, sprawdŸ czy dzia³a on prawid³owo.", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"zaladuj",true))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Za³adowa³eœ poprawnie boty", "Zamknij", "");
            OdladujBoty();
			ZaladujBoty();
			return 1;
		}
		else if(!strcmp(comm1,"hp",true))
		{
		    new id, Float:hp;
			if(sscanf(comm2, "df", id, hp))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By nadaæ aktorowi HP wpisz: /ab hp [id] [hp]", "Zamknij", "");
				return 1;
			}
			SetDynamicActorHealth(Bot[id][bID], hp);
			Bot[id][bHP] = hp;
	    	ZapiszBota(id);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Nada³eœ aktorowi HP.", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"wysokosc",true))
		{
		    new id, Float:wysokosc;
			if(sscanf(comm2, "df", id, wysokosc))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By nadaæ aktorowi skin wpisz: /ab skin [id] [skin]", "Zamknij", "");
				return 1;
			}
			Bot[id][bWysokosc] = wysokosc;
	    	ZapiszBota(id);
	    	DestroyDynamic3DTextLabel(Text3D:Bot[id][bNickTag]);
	    	StatusAktora(id);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Nada³eœ wysokosc nicku aktorowi.", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"skin",true))
		{
		    new id, skin;
			if(sscanf(comm2, "dd", id, skin))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By nadaæ aktorowi wpisz: /ab skin [id] [skin]", "Zamknij", "");
				return 1;
			}
			Bot[id][bSkin] = skin;
	    	ZapiszBota(id);
	    	OdladujBoty();
			ZaladujBoty();
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Nada³eœ aktorowi nowy skin.", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"vw",true))
		{
		    new id, vw;
			if(sscanf(comm2, "dd", id, vw))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By nadaæ aktorowi wpisz: /ab vw [id] [vw]", "Zamknij", "");
				return 1;
			}
			SetDynamicActorVirtualWorld(Bot[id][bID], vw);
			Bot[id][bVW] = vw;
	    	ZapiszBota(id);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Zmieni³eœ VirtualWorld dla bota", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"status", true))
		{
		    new id, status[64];
			if(sscanf(comm2, "ds[64]", id, status))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By zmieniæ status aktora wpisz: /ab status [id] [status]", "Zamknij", "");
				return 1;
			}
			GameTextForPlayer(playerid, "~r~Niedostepne", 3000, 5);
			return 1;
		}
		else if(!strcmp(comm1,"opis", true))
		{
		    new id, opis[126];
			if(sscanf(comm2, "ds[126]", id, opis))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By zmieniæ opis aktora wpisz: /ab opis [id] [opis] /ab opis [id] usun", "Zamknij", "");
				return 1;
			}
   			if(Bot[id][bUkryty] != 0)
   			{
   			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Bot posiada ukryty opis, zmieñ opcjê ukrycia opisu!", "Zamknij", "");
   			    return 0;
   			}
			if(!strcmp(opis,"usun",true))
			{
                format(Bot[id][bOpis], 126, "%s", "");
				ZapiszBota(id);
				DestroyDynamic3DTextLabel(Text3D:Bot[id][bOpisTag]);
				new string[64];
	            format(string, sizeof(string), "%s", Bot[id][bOpis]);
	 			Bot[id][bOpisTag] = CreateDynamic3DTextLabel(string, 0xAAAAFFFF, Bot[id][bX], Bot[id][bY], Bot[id][bZ]+0.2, 3.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,Bot[id][bVW]);
	 			return 1;
			}
			else
			{
				format(Bot[id][bOpis], 126, "%s", opis);
				ZapiszBota(id);
				DestroyDynamic3DTextLabel(Text3D:Bot[id][bOpisTag]);
				new string[64];
	            format(string, sizeof(string), "%s", Bot[id][bOpis]);
	 			Bot[id][bOpisTag] = CreateDynamic3DTextLabel(string, 0xAAAAFFFF, Bot[id][bX], Bot[id][bY], Bot[id][bZ]+0.2, 3.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,Bot[id][bVW]);
	 			return 1;
			}
		}
		else if(!strcmp(comm1,"typ", true))
		{
		    new id, typ;
			if(sscanf(comm2, "dd", id, typ))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By ustawiæ animacje aktora wpisz: /ab typ [id] [typ]", "Zamknij", "");
				return 1;
			}
			Bot[id][bTyp] = typ;
			ZapiszBota(id);
			return 1;
		}
		else if(!strcmp(comm1,"anim", true))
		{
		    new id, anim;
			if(sscanf(comm2, "dd", id, anim))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By ustawiæ animacje aktora wpisz: /ab anim [id] [animacja 1-5]", "Zamknij", "");
				return 1;
			}
			Bot[id][bAnim] = anim;
			ZapiszBota(id);
			if(Bot[id][bAnim] == 1)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "RAPPING", "RAP_A_Loop", 4.1, 1, 1, 1, 1, 1);//Rap1
			}
			if(Bot[id][bAnim] == 2)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "COP_AMBIENT", "Coplook_loop", 4.1, 1, 1, 1, 1, 1);//ramiona
			}
			if(Bot[id][bAnim] == 3)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "GANGS", "leanIDLE", 4.1, 1, 1, 1, 1, 1);//opieraj
			}
			if(Bot[id][bAnim] == 4)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "CRACK", "crckdeth2", 4.1, 1, 1, 1, 1, 1);//crack
			}
			if(Bot[id][bAnim] == 5)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "ROB_BANK", "SHP_HandsUp_Scr", 4.1, 0, 1, 1, 1, 1);//rece
			}
			if(Bot[id][bAnim] == 6)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "FOOD", "FF_Sit_Loop", 4.1, 0, 1, 1, 1, 1);//krzeslo2
			}
			if(Bot[id][bAnim] == 7)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "PED", "KO_shot_front", 4.1, 0, 1, 1, 1, 1);//padnij
			}
			if(Bot[id][bAnim] == 8)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "BEACH", "batherr", 4.1, 0, 1, 1, 1, 1);//lez2
			}
			if(Bot[id][bAnim] == 9)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "BEACH", "ParkSit_M_loop", 4.1, 0, 1, 1, 1, 1);//siad
			}
			if(Bot[id][bAnim] == 10)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "DANCING", "DAN_left_A", 4.1, 1, 0, 0, 1, 0);//tancz7
			}
			if(Bot[id][bAnim] == 11)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "PED", "IDLE_HBHB", 4.1, 0, 1, 1, 1, 1);//koks
			}
			if(Bot[id][bAnim] == 12)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "GRAVEYARD", "mrnF_loop", 4.1, 0, 1, 1, 1, 1);//cry
			}
			if(Bot[id][bAnim] == 13)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "STRIP", "STR_Loop_A", 4.1, 1, 0, 0, 1, 0);
			}
			return 1;
		}
		else if(!strcmp(comm1,"usun", true))
		{
			if(UprawnieniaCEO(playerid, 0))
			{
				new id;
				if(sscanf(comm2, "d", id))
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By usun¹æ aktora wpisz: /ab usun [id]", "Zamknij", "");
					return 1;
				}
				if(id == 0)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Nie mo¿na usun¹æ tego bota, zablokowano!", "Zamknij", "");
					return 1;
				}
				UsunBota(id);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Bot zosta³ usuniêty!", "Zamknij", "");
				return 1;
			}
		}
		else if(!strcmp(comm1,"to",true))
		{
		    new id;
			if(sscanf(comm2, "d", id))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By teleportowaæ siê do aktora wpisz: /ab to [id]", "Zamknij", "");
				return 1;
			}
			Teleportuj(playerid, Bot[id][bX]+1, Bot[id][bY]+1, Bot[id][bZ]);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Zosta³eœ teleportowany do aktora o podanym ID.", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"pos",true))
		{
		    new id;
			if(sscanf(comm2, "d", id))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By przenieœæ aktora wpisz: /ab pos [id]", "Zamknij", "");
				return 1;
			}
			new Float:x, Float:y, Float:z, Float:ang;
			GetPlayerPos(playerid, x, y, z);
		    SetDynamicActorPos(Bot[id][bID], x, y, z);
		    GetPlayerFacingAngle(playerid, ang);
		    SetDynamicActorFacingAngle(Bot[id][bID], ang);
	    	SetDynamicActorVirtualWorld(Bot[id][bID], GetPlayerVirtualWorld(playerid));
	    	Bot[id][bX] = x;
	    	Bot[id][bY] = y;
	    	Bot[id][bZ] = z;
	    	Bot[id][bRot] = ang;
	    	Bot[id][bVW] = GetPlayerVirtualWorld(playerid);
	    	ZapiszBota(id);
			Teleportuj(playerid, x+1, y+1, z);
		    DestroyDynamic3DTextLabel(Text3D:Bot[id][bNickTag]);
		    DestroyDynamic3DTextLabel(Text3D:Bot[id][bOpisTag]);
		    StatusAktora(id);
		    new string[256];
			if(Bot[id][bUkryty] == 0)
			{
				format(string, sizeof(string), "%s", Bot[id][bOpis]);
			}
			else
			{
			    format(string, sizeof(string), "");
			}
 			Bot[id][bOpisTag] = CreateDynamic3DTextLabel(string, 0xAAAAFFFF, Bot[id][bX], Bot[id][bY], Bot[id][bZ]+0.2, 3.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0,Bot[id][bVW]);
			if(Bot[id][bAnim] == 1)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "RAPPING", "RAP_A_Loop", 4.1, 1, 1, 1, 1, 1);//Rap1
			}
			if(Bot[id][bAnim] == 2)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "COP_AMBIENT", "Coplook_loop", 4.1, 1, 1, 1, 1, 1);//ramiona
			}
			if(Bot[id][bAnim] == 3)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "GANGS", "leanIDLE", 4.1, 1, 1, 1, 1, 1);//opieraj
			}
			if(Bot[id][bAnim] == 4)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "CRACK", "crckdeth2", 4.1, 1, 1, 1, 1, 1);//crack
			}
			if(Bot[id][bAnim] == 5)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "ROB_BANK", "SHP_HandsUp_Scr", 4.1, 0, 1, 1, 1, 1);//rece
			}
			if(Bot[id][bAnim] == 6)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "FOOD", "FF_Sit_Loop", 4.1, 0, 1, 1, 1, 1);//krzeslo2
			}
			if(Bot[id][bAnim] == 7)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "PED", "KO_shot_front", 4.1, 0, 1, 1, 1, 1);//padnij
			}
			if(Bot[id][bAnim] == 8)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "BEACH", "batherr", 4.1, 0, 1, 1, 1, 1);//lez2
			}
			if(Bot[id][bAnim] == 9)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "BEACH", "ParkSit_M_loop", 4.1, 0, 1, 1, 1, 1);//siad
			}
			if(Bot[id][bAnim] == 10)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "DANCING", "DAN_left_A", 4.1, 1, 0, 0, 1, 0);//tancz7
			}
			if(Bot[id][bAnim] == 11)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "PED", "IDLE_HBHB", 4.1, 0, 1, 1, 1, 1);//koks
			}
			if(Bot[id][bAnim] == 12)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "GRAVEYARD", "mrnF_loop", 4.1, 0, 1, 1, 1, 1);//cry
			}
			if(Bot[id][bAnim] == 13)
			{
			    ApplyDynamicActorAnimation(Bot[id][bID], "STRIP", "STR_Loop_A", 4.1, 1, 0, 0, 1, 0);//tancz5
			}
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Przenios³eœ aktora w swoje miejsce, zosta³ on zapisany.", "Zamknij", "");
			return 1;
		}
	}
	return 1;
}
CMD:restelefon(playerid, cmdtext[])
{
    if(UprawnieniaCMa(playerid, 0))
	{
	    new playerid2;
		if(sscanf(cmdtext, "i", playerid2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By zrestartowaæ numer telefonu gracza wpisz /restelefon [ID Gracza]", "Zamknij", "");
			return 1;
		}
		DaneGracza[playerid2][gTelefon] = 0;
		ZapiszGracza(playerid2);
		dShowPlayerDialog(playerid2, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Administrator zrestwartowa³ twój numer telefonu na 0", "Zamknij", "");
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Zrestartowa³eœ numer telefonu gracza na 0", "Zamknij", "");
		return 1;
	}
	return 1;
}
CMD:debugmode(playerid, cmdtext[])
{
    if(UprawnieniaCEO(playerid, 0))
	{
	    if(GetPVarInt(playerid, "TrybDebugowania") == 0)
	    {
	    	SetPVarInt(playerid, "TrybDebugowania", 1);
	    	dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "Informacja", "DebugMode - ON", "Zamknij", "");
			return 1;
		}
		else
		{
		    SetPVarInt(playerid, "TrybDebugowania", 0);
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "Informacja", "DebugMode - ON", "Zamknij", "");
			return 1;
		}
	}
	return 1;
}
CMD:setpozwolenie(playerid, cmdtext[])
{
    if(UprawnieniaCMa(playerid, 0))
	{
	    new playerid2, pozwolenie;
		if(sscanf(cmdtext, "id", playerid2, pozwolenie))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By daæ graczu pozwolenie na stworzenie dzia³alnoœci u urzednika wpisz: /setpozwolenie [ID Gracza] [0 - brak pozwolenia, 1 - pozwolenie]", "Zamknij", "");
			return 1;
		}
		DaneGracza[playerid2][gPozwolenie] = pozwolenie;
		ZapiszGracza(playerid2);
		dShowPlayerDialog(playerid2, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Administrator przydzieli³ Ci pozwolenie na stworzenie dzia³alnoœci gospodarczej u Urzêdnika(Aktora)", "Zamknij", "");
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Przydzieli³eœ pozwolenie graczu na stworzenie dzia³anoœci gospodarczej u Urzêdnika(Aktora)", "Zamknij", "");
		return 1;
	}
	return 1;
}
CMD:budowanie(playerid, cmdtext[])
{
    if(UprawnieniaCMa(playerid, 0))
	{
	    new playerid2, pozwolenie;
		if(sscanf(cmdtext, "id", playerid2, pozwolenie))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By daæ graczu pozwolenie na budowanie interiorów oraz w VirtualWorld (0) wpisz: /budowanie [ID Gracza] [0 - brak uprawnien, 1 - uprawnienia]", "Zamknij", "");
			return 1;
		}
		DaneGracza[playerid2][gBudowanie] = pozwolenie;
		ZapiszGracza(playerid2);
		return 1;
	}
	return 1;
}
CMD:setnick(playerid, cmdtext[])
{
    if(UprawnieniaGMa(playerid, 5))
	{
	    new playerid2, nick[64];
		if(sscanf(cmdtext, "is[64]", playerid2, nick))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By zmieniæ graczu nick wpisz: /setnick [ID] [nowy nick Imie_Nazwisko]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Gracz jest nie zalogowany, aby zmieniæ jego nick.", "Zamknij", "");
			return 1;
		}
		SetPlayerName(playerid2, nick);
		return 1;
	}
	return 1;
}
CMD:setpos(playerid, cmdtext[])
{
    if(UprawnieniaCMa(playerid, 0))
	{
	    new playerid2, Float:x, Float:y, Float:z;
		if(sscanf(cmdtext, "ifff", playerid2, x, y, z))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By zmieniæ graczu pozycjê wpisz: /setpos [ID] [x] [y] [z]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Gracz jest nie zalogowany, aby zmieniæ jego pozycjê.", "Zamknij", "");
			return 1;
		}
		Teleportuj(playerid2, x, y, z);
		return 1;
	}
	return 1;
}
CMD:akcja(playerid, cmdtext[])
{
    if(UprawnieniaCEO(playerid, 0))
	{
	    new playerid2, akcja;
		if(sscanf(cmdtext, "id", playerid2, akcja))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By nadaæ akcjê graczu wpisz : /akcja [ID gracza] [akcja]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Gracz jest nie zalogowany, nie mo¿esz mu nic przypi¹æ.", "Zamknij", "");
			return 1;
		}
    	SetPlayerSpecialAction(playerid2, akcja);
    	return 1;
	}
	return 1;
}
CMD:przypnij(playerid, cmdtext[])
{
    if(UprawnieniaCEO(playerid, 0))
	{
	    new playerid2,index,modelid,boneid,Float:fOffsetX,Float:fOffsetY,Float:fOffsetZ,Float:fRotX,Float:fRotY,Float:fRotZ;
		if(sscanf(cmdtext, "idddfffffffff", playerid2,index,modelid,boneid,fOffsetX,fOffsetY,fOffsetZ,fRotX,fRotY,fRotZ))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By przypi¹æ coœ graczu wpisz : /przypnij [ID] [index] [modelid] [boneid] [fOffsetX] [fOffsetY] [fOffsetZ] [fRotX] [fRotY] [fRotZ]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Gracz jest nie zalogowany, nie mo¿esz mu nic przypi¹æ.", "Zamknij", "");
			return 1;
		}
		RemovePlayerAttachedObject(playerid2, index);
		SetPlayerAttachedObject(playerid2, index,modelid,boneid,fOffsetX,fOffsetY,fOffsetZ,fRotX,fRotY,fRotZ);
		///przypnij 0 7 18634 6 0.06 0.03 -0.10 90 -90 0
	    GameTextForPlayer(playerid, "~w~Przypieto obiekt!", 3000, 5);
	    GameTextForPlayer(playerid2, "~w~Przypieto Ci obiekt!", 3000, 5);
	    return 1;
	}
 	return 1;
}
CMD:kopiabudynku(playerid, cmdtext[])
{
 	new vw = GetPlayerVirtualWorld(playerid);
    WyzejIntek(vw);
    return 1;
}
CMD:setobiect(playerid, cmdtext[])
{
    if(UprawnieniaCMa(playerid, 0))
	{
	    new playerid2, wynik;
		if(sscanf(cmdtext, "id", playerid2, wynik))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By ustawiæ graczu dan¹ iloœæ obiektów wpisz : /setobiect [ID] [+/- Ilosc]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Gracz jest nie zalogowany, nie mo¿esz mu przypisaæ obiektów.", "Zamknij", "");
			return 1;
		}
		DaneGracza[playerid2][gObiekty] += wynik;
		ZapiszGracza(playerid2);
		ZapiszGraczaGlobal(playerid2, 10);
		return 1;
	}
	return 1;
}
CMD:seteuro(playerid, cmdtext[])
{
    if(UprawnieniaCEO(playerid, 0))
	{
	    new playerid2, wynik;
		if(sscanf(cmdtext, "id", playerid2, wynik))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By ustawiæ graczu dan¹ iloœæ euro wpisz : /seteuro [ID] [+/- Ilosc]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "TIP", "Gracz jest nie zalogowany, nie mo¿esz mu przypisaæ euro.", "Zamknij", "");
			return 1;
		}
		DaneGracza[playerid2][gEuro] += wynik;
		ZapiszGracza(playerid2);
		new euro[128];
		TextDrawHideForPlayer(playerid2, Euro[playerid2]);
		if(DaneGracza[playerid2][gEuro] <= 9)
		{
			format(euro, sizeof(euro),"~g~EUR~w~00000%d", DaneGracza[playerid2][gEuro]);
		}
		if(DaneGracza[playerid2][gEuro] <= 99 && DaneGracza[playerid2][gEuro] >= 10)
		{
			format(euro, sizeof(euro),"~g~EUR~w~0000%d", DaneGracza[playerid2][gEuro]);
		}
		if(DaneGracza[playerid2][gEuro] <= 999 && DaneGracza[playerid2][gEuro] >= 100)
		{
			format(euro, sizeof(euro),"~g~EUR~w~000%d", DaneGracza[playerid2][gEuro]);
		}
		if(DaneGracza[playerid2][gEuro] <= 9999 && DaneGracza[playerid2][gEuro] >= 1000)
		{
			format(euro, sizeof(euro),"~g~EUR~w~00%d", DaneGracza[playerid2][gEuro]);
		}
		if(DaneGracza[playerid2][gEuro] <= 99999 && DaneGracza[playerid2][gEuro] >= 10000)
		{
			format(euro, sizeof(euro),"~g~EUR~w~0%d", DaneGracza[playerid2][gEuro]);
		}
		if(DaneGracza[playerid2][gEuro] >= 100000)
		{
			format(euro, sizeof(euro),"~g~EUR~w~%d", DaneGracza[playerid2][gEuro]);
		}
		TextDrawSetString(Euro[playerid2], euro);
		TextDrawShowForPlayer(playerid2, Euro[playerid2]);
		return 1;
	}
	return 1;
}
CMD:setrep(playerid, cmdtext[])
{
    if(UprawnieniaCMa(playerid, 0))
    {
	    new playerid2, wynik;
		if(sscanf(cmdtext, "id", playerid2, wynik))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By ustawiæ graczu dan¹ iloœæ reputacji wpisz : /setrep [ID] [+/- Ilosc]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Reputacja", "Gracz jest nie zalogowany, nie mo¿esz daæ mu pozytywnego g³osu reputacji", "Zamknij", "");
			return 1;
		}
		CzasWyswietlaniaTextuNaDrzwiach[playerid2] = 15;
		TextDrawHideForPlayer(playerid2, TextNaDrzwi3[playerid2]);
		new str[128];
		format(str, sizeof(str), "~g~+~w~reputacja od %s", ImieGracza2(playerid));
		TextDrawSetString(TextNaDrzwi3[playerid2], str);
		TextDrawShowForPlayer(playerid2, TextNaDrzwi3[playerid2]);
		DaneGracza[playerid2][gReputacja] += wynik;
		ZapiszGracza(playerid2);
		RefreshNick(playerid2);
		return 1;
	}
	return 1;
}
CMD:model(playerid,cmdtext[])
{
	//printf("U¿yta komenda model");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(UprawnieniaCEO(playerid, 0))
    {
		return 0;
	}
	new Float:a,Float:b,Float:c, model;
	if(sscanf(cmdtext, "dfff", model, a,b,c))
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby u¿yæ komendy do tworzenia przyczepionych obiektów wpisz: /model [model] [x] [y] [z] nastêpnie wpisz parametry.", "Zamknij", "");
		return 1;
	}
	if(!IsPlayerInAnyVehicle(playerid))
	{
		return 0;
	}
	new vehid = GetPlayerVehicleID(playerid);
	new uidk = SprawdzCarUID(vehid);
	DestroyDynamicObject(PojazdInfo[uidk][pKogut]);
	PojazdInfo[uidk][pKogut] = 0;
	PojazdInfo[uidk][pKogut] = CreateDynamicObject(model,0,0,0,0,0,0,0);
	AttachDynamicObjectToVehicle(PojazdInfo[uidk][pKogut], vehid, a, b, c, 0.0, 0.0, 0.0);
	return 1;
}
CMD:barek(playerid,cmdtext[])
{
	//printf("U¿yta komenda barek");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(UprawnieniaCEO(playerid, 0))
    {
		new Float:a,Float:b,Float:w,strs[64];
		if(sscanf(cmdtext, "fffs[64]", a,b,w,strs))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby u¿yæ komendy tworzenia barów wpisz: /barek [x] [y] [width] [kolor html] nastêpnie wpisz parametry.", "Zamknij", "");
			return 1;
		}
		DestroyProgressBar(BarEdytor[playerid]);
		BarEdytor[playerid] = CreateProgressBar(a,b,w,_, HexToInt(strs), 100.0);
		SetProgressBarValue(Bar:BarEdytor[playerid], 50);
		ShowProgressBarForPlayer(playerid, BarEdytor[playerid]);
	    return 1;
	}
	return 1;
}
CMD:rc(playerid,cmdtext[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
    if(UprawnieniaGMa(playerid, 1))
    {
		new playerid2;
		if(sscanf(cmdtext, "i", playerid2))
		{
		    if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
		    {
				SpecUruchomiony[playerid] = 0;
				SpecCel[playerid] = -1;
		        TogglePlayerSpectating(playerid, 0);
				SetCameraBehindPlayer(playerid);
				SetPVarInt(playerid, "SpecujeID", 0);
				SetPVarInt(playerid, "SpecujeGracza", 0);
				TextDrawHideForPlayer(playerid, Tutorial[playerid]);
				//new id = GetPVarInt(playerid, "SpecujeIDGracza");
				//new Float: X, Float: Y, Float: Z;
				//GetPlayerPos(id, X, Y, Z);
				Teleportuj(playerid, GetPVarFloat(playerid, "SpecX"), GetPVarFloat(playerid, "SpecY"), GetPVarFloat(playerid, "SpecZ"));
				SetPlayerVirtualWorld(playerid, GetPVarInt(playerid, "SpecVW"));
				SetPlayerInterior(playerid, GetPVarInt(playerid, "SpecINT"));
				SetPVarInt(playerid, "ZablokujOnPlayerSpawn", 1);
				SetTimerEx("ZabezpieczenieOnPlayerSpawn",3000,0,"d",playerid);
			}
			return 1;
		}
		if(zalogowany[playerid2] == false || !IsPlayerConnected(playerid2))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz którego chcesz podgl¹daæ nie jest zalogowany.", "Zamknij", "");
			return 0;
		}
		if(SpecUruchomiony[playerid] == 0)
		{
			new Float:X, Float:Y, Float:Z;
			GetPlayerPos(playerid, X, Y, Z);
			SetPVarFloat(playerid, "SpecX", X);
			SetPVarFloat(playerid, "SpecY", Y);
			SetPVarFloat(playerid, "SpecZ", Z);
			SetPVarInt(playerid, "SpecVW", GetPlayerVirtualWorld(playerid));
			SetPVarInt(playerid, "SpecINT", GetPlayerInterior(playerid));
		}
		SpecUruchomiony[playerid] = 1;
		SpecCel[playerid] = playerid2;
		SetPlayerInterior(playerid, GetPlayerInterior(playerid2));
		SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(playerid2));
		SetPVarInt(playerid, "Teleportacja", 1);
		SetPVarInt(playerid, "SpecujeID", playerid2);
		SetPVarInt(playerid, "SpecujeGracza", 1);
		SetPVarInt(playerid, "SpecujeIDGracza", playerid2);
		new g, m, s;
		przelicznikonline(playerid2, g, m, s);
		new msg[254];
		format(msg,254,"~y~Specujesz %s (%d) %s~n~~n~~w~Godzin online: ~b~%d~w~h ~b~%d~w~min ~b~%d~w~sec~w~~n~HP: ~b~%0.1f%~w~~n~Gotowka: ~g~$~b~%d~w~~n~Stan konta: ~g~$~b~%d~w~~n~~n~~r~<~w~ LPM - PPM ~r~>.",ZmianaNicku(playerid2), playerid2, DaneGracza[playerid2][nickOOC], g,m,s, DaneGracza[playerid2][gZDROWIE], DaneGracza[playerid2][gPORTFEL], DaneGracza[playerid2][gSTAN_KONTA]);
		TextDrawSetString(Tutorial[playerid], msg);
		TextDrawShowForPlayer(playerid, Tutorial[playerid]);
		SetPlayerInterior(playerid, GetPlayerInterior(playerid2));
		SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(playerid2));
		SetPVarInt(playerid, "Teleportacja", 1);
		if(GetPlayerVehicleID(playerid2) != 0)
		{
		    TogglePlayerSpectating(playerid, 1);
		    PlayerSpectateVehicle(playerid, GetPlayerVehicleID(playerid2));
		}
		else
		{
		    TogglePlayerSpectating(playerid, 1);
		    PlayerSpectatePlayer(playerid, playerid2);
		}
        SetPVarInt(playerid, "Teleportacja", 0);
	}
	return 1;
}
CMD:klatwa(playerid,cmdtext[])
{
	//printf("U¿yta komenda klatwa");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaGMa(playerid, 4))
    {
		new playerid2, cash, tresc[124];
		if(sscanf(cmdtext, "ids[124]", playerid2, cash, tresc))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ kl¹twe wpisz: /klatwa [id gracza] [iloœæ dni 1-360] [treœæ]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ kl¹twe nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		if(playerid == playerid2) return 1;
		if(Klatwa(playerid2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ kl¹twe posiada tak¹ kare.", "Zamknij", "");
			return 0;
		}
		if(cash < -1 || cash > 361)
		{
		    return 0;
		}
		NadajKare(playerid2,playerid, 10, tresc, cash);
		if(cash == -1)
		{
			DaneGracza[playerid2][gKLATWA] = -1;
		}
		else
		{
			DaneGracza[playerid2][gKLATWA] = (gettime()+CZAS_LETNI)+(86400*cash);
		}
		ZapiszGraczaGlobal(playerid2, 7);
	}
	return 1;
}
CMD:polecenie(playerid, cmdtext[])
{
	if(UprawnieniaCEO(playerid, 0))
    {
		new tresc[124];
		if(sscanf(cmdtext, "s[124]", tresc))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Wydanie polecenia rcon /polecenie [tresc]", "Zamknij", "");
			return 1;
		}
		SendRconCommand(tresc);
	}
	return 1;
}
CMD:system(playerid, cmdtext[])
{
	if(UprawnieniaCEO(playerid, 0))
    {
		new playerid2, czas, tresc[124];
		if(sscanf(cmdtext, "ids[124]", playerid2, czas, tresc))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby kogoœ zbanowaæ jako system wpisz: /system [id gracza] [iloœæ dni] [treœæ]", "Zamknij", "");
			return 1;
		}
		if(playerid == playerid2) return 1;
		if(czas == -1)
		{
		    NadajKare(playerid2,-1, 2, tresc, czas);
			DaneGracza[playerid2][gBAN] = -1;
			ZapiszGraczaGlobal(playerid2, 4);
			Kick(playerid2);
		}
		else
		{
		    NadajKare(playerid2,-1, 2, tresc, czas);
			DaneGracza[playerid2][gBAN] = (gettime()+CZAS_LETNI)+(86400*czas);
			ZapiszGraczaGlobal(playerid2, 4);
			Kick(playerid2);
		}
	}
	return 1;
}
CMD:ban(playerid,cmdtext[])
{
	//printf("U¿yta komenda ban");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaGMa(playerid, 4))
    {
		new playerid2, czas, tresc[124];
		if(sscanf(cmdtext, "ids[124]", playerid2, czas, tresc))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby kogoœ zbanowaæ wpisz: /ban [id gracza] [iloœæ dni] [treœæ]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ bana nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		if(playerid == playerid2) return 1;
		if(DaneGracza[playerid2][gAdmGroup] == 4 || DaneGracza[playerid2][gAdmGroup] == 14)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Nie mo¿esz nadaæ bana osobie z zarz¹du lub administracji.", "Zamknij", "");
			return 0;
		}
		if(czas == -1)
		{
		    NadajKare(playerid2,playerid, 2, tresc, czas);
			DaneGracza[playerid2][gBAN] = -1;
			ZapiszGraczaGlobal(playerid2, 4);
			Kick(playerid2);
		}
		else
		{
		    NadajKare(playerid2,playerid, 2, tresc, czas);
			DaneGracza[playerid2][gBAN] = (gettime()+CZAS_LETNI)+(86400*czas);
			ZapiszGraczaGlobal(playerid2, 4);
			Kick(playerid2);
		}
	}
	return 1;
}
CMD:globdo(playerid,cmdtext[])
{
	//printf("U¿yta komenda oo");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(UprawnieniaCMa(playerid, 3))
	{
		strdel(tekst_global, 0, 2048);
		if(sscanf(cmdtext, "s[256]", tekst_global))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby wpisaæ akcjê globaln¹ wpisz: /globdo [treœæ].", "Zamknij", "");
			return 1;
		}
		format(tekst_global, sizeof(tekst_global), "** %s **", tekst_global);
		SendWrappedMessageToAll(KOLOR_DO, tekst_global);
	}
	return 1;
}
CMD:globme(playerid,cmdtext[])
{
	//printf("U¿yta komenda oo");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(UprawnieniaCMa(playerid, 3))
	{
		strdel(tekst_global, 0, 2048);
		if(sscanf(cmdtext, "s[256]", tekst_global))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby wpisaæ akcjê globaln¹ wpisz: /globme [treœæ].", "Zamknij", "");
			return 1;
		}
		format(tekst_global, sizeof(tekst_global), "* %s *", tekst_global);
		SendWrappedMessageToAll(FIOLETOWY, tekst_global);
	}
	return 1;
}
CMD:glob(playerid,cmdtext[])
{
	//printf("U¿yta komenda oo");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(UprawnieniaCMa(playerid, 3))
	{
		strdel(tekst_global, 0, 2048);
		if(sscanf(cmdtext, "s[256]", tekst_global))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby pisaæ na czacie do graczy wpisz: /glob [treœæ].", "Zamknij", "");
			return 1;
		}
		format(tekst_global, sizeof(tekst_global), "[[ %s: %s ]]", ImieGracza2(playerid), tekst_global);
		SendWrappedMessageToAll(0xff99ccFF, tekst_global);
	}
	return 1;
}
CMD:gs(playerid,cmdtext[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCMa(playerid, 0))
    {
		new playerid2, cash, tresc[256];
		if(sscanf(cmdtext, "ids[124]", playerid2, cash, tresc))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ gamescore wpisz: /gs [id gracza] [iloœæ] [treœæ]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    return 1;
		}
		if(cash!= 0)
		{
			if(cash > 0)
			{
				NadajKare(playerid2,playerid, 9, tresc, cash);
				DaneGracza[playerid2][gGAMESCORE] = DaneGracza[playerid2][gGAMESCORE]+cash;
				SetPlayerScore(playerid2,DaneGracza[playerid2][gGAMESCORE]);
				ZapiszGraczaGlobal(playerid2, 1);
			}
		}

	}
	return 1;
}
CMD:ungs(playerid,cmdtext[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCMa(playerid, 0))
    {
		new playerid2, cash, tresc[256];
		if(sscanf(cmdtext, "ids[124]", playerid2, cash, tresc))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby odj¹æ gamescore wpisz: /ungs [id gracza] [iloœæ] [treœæ]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    return 1;
		}
		if(cash!= 0)
		{
			if(cash > 0)
			{
				NadajKare(playerid2,playerid, 12, tresc, cash);
				DaneGracza[playerid2][gGAMESCORE] = DaneGracza[playerid2][gGAMESCORE]-cash;
				SetPlayerScore(playerid2,DaneGracza[playerid2][gGAMESCORE]);
				ZapiszGraczaGlobal(playerid2, 1);
			}
		}

	}
	return 1;
}
CMD:booc(playerid,cmdtext[])
{
	//printf("U¿yta komenda booc");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaGMa(playerid, 3))
    {
		new playerid2, cash, tresc[256];
		if(sscanf(cmdtext, "ids[124]", playerid2, cash, tresc))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ blokade czatu OOC wpisz: /booc [id gracza] [iloœæ dni] [treœæ]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ blokade czatu OOC nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		if(cash < -1 || cash > 361)
		{
		    return 0;
		}
		if(BlokadaOOC(playerid2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ blokade czatu OOC posiada tak¹ kare.", "Zamknij", "");
			return 0;
		}
		if(!Klatwa(playerid2))
		{
			if(cash == -1)
			{
			    NadajKare(playerid2,playerid, 7, tresc, cash);
				DaneGracza[playerid2][gOOC] = -1;
				ZapiszGraczaGlobal(playerid2, 2);
			}
			else
			{
			    NadajKare(playerid2,playerid, 7, tresc, cash);
				DaneGracza[playerid2][gOOC] = (gettime()+CZAS_LETNI)+(86400*cash);
				ZapiszGraczaGlobal(playerid2, 2);
			}
		}
		else
		{
		    NadajKare(playerid2,playerid, 11, tresc, (gettime()+CZAS_LETNI)+(86400*14));
			DaneGracza[playerid2][gBAN] = (gettime()+CZAS_LETNI)+(86400*14);
			ZapiszGraczaGlobal(playerid2, 4);
			Kick(playerid2);
		}
	}
	return 1;
}
CMD:aj(playerid,cmdtext[])
{
	//printf("U¿yta komenda aj");
	if(zalogowany[playerid] == false)
	{
		return 0;
	}
	if(UprawnieniaGMa(playerid, 2))
	{
		new playerid2, tresc[256],minut;
		if(sscanf(cmdtext, "ids[124]", playerid2, minut, tresc))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ admin jaila wpisz: /aj [id gracza] [minuty] [treœæ]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ admin jaila nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		if(DaneGracza[playerid2][gAdmGroup] == 4 || DaneGracza[playerid2][gAdmGroup] == 14)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Nie mo¿esz nadaæ bana osobie z zarz¹du lub administracji.", "Zamknij", "");
			return 0;
		}
		SetPlayerInAdminJail(playerid2, playerid, minut, tresc);
	}
	return 1;
}
CMD:pogoda(playerid,cmdtext[])
{
	if(zalogowany[playerid] == false)
	{
		return 0;
	}
	if(UprawnieniaCMa(playerid, 2))
	{
		new godziny;
		if(sscanf(cmdtext, "d", godziny))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/pogoda [pogoda]", "Zamknij", "");
			return 1;
		}
		ForeachEx(i, MAX_PLAYERS)
		{
			if(IsPlayerConnected(i))
			{
				if(zalogowany[i] == true)
				{
					SetPlayerWeather(i, godziny);
				}
			}
		}
	}
	return 1;
}
CMD:czas(playerid,cmdtext[]) return cmd_settime(playerid, cmdtext);
CMD:settime(playerid,cmdtext[])
{
	if(zalogowany[playerid] == false)
	{
		return 0;
	}
	if(UprawnieniaCMa(playerid, 0))
	{
		new godziny;
		if(sscanf(cmdtext, "d", godziny))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/settime [godzina]", "Zamknij", "");
			return 1;
		}
		ForeachEx(i, MAX_PLAYERS)
		{
			if(IsPlayerConnected(i))
			{
				if(zalogowany[i] == true)
				{
					SetPlayerTime(i, godziny, 0);
				}
			}
		}
	}
	return 1;
}
CMD:setvw(playerid, cmdtext[])
{
	if(UprawnieniaGMa(playerid, 3))
	{
		new playerid2, godziny;
		new str[64];
		if(sscanf(cmdtext, "id", playerid2, godziny))
		{
			format(str, sizeof str, "VirtualWorld %s to %d", ImieGracza2(playerid2), GetPlayerVirtualWorld(playerid2));
			SendClientMessage(playerid, -1, str);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zmieniæ Virtual World wpisz: /setvw [id gracza] [VW]", "Zamknij", "");
			return 1;
		}
		SetPlayerVirtualWorld(playerid2, godziny);
		format(str, sizeof str, "Twoj Virtual World zosta³ ustawiony na: %d przez %s", godziny, ImieGracza2(playerid));
		SendClientMessage(playerid2, -1, str);
		format(str, sizeof str, "Zmieni³eœ Virtual World %s na: %d", ImieGracza2(playerid2), godziny);
		SendClientMessage(playerid2, -1, str);
	}
	return 1;
}
CMD:setint(playerid, cmdtext[])
{
	if(UprawnieniaCMa(playerid, 0))
	{
		new playerid2, godziny;
		new str[64];
		if(sscanf(cmdtext, "id", playerid2, godziny))
		{
		    format(str, sizeof str, "Interior %s to %d", ImieGracza2(playerid2), GetPlayerInterior(playerid2));
			SendClientMessage(playerid, -1, str);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zmieniæ Interior wpisz: /setint [id gracza] [INT]", "Zamknij", "");
			return 1;
		}
		SetPlayerInterior(playerid2, godziny);
		format(str, sizeof str, "Twoj Interior zosta³ ustawiony na: %d przez %s", godziny, ImieGracza2(playerid));
		SendClientMessage(playerid2, -1, str);
	}
	return 1;
}
CMD:setonline(playerid,cmdtext[])
{
	if(zalogowany[playerid] == false)
	{
		return 0;
	}
	if(UprawnieniaCMa(playerid, 0))
	{
		new playerid2, godziny;
		if(sscanf(cmdtext, "id", playerid2, godziny))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ godziny wpisz: /setonline [id gracza] [godziny]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ godziny nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		if(godziny < 0) return 1;
		DaneGracza[playerid2][gCZAS_ONLINE] = godziny*3600;
		RefreshNick(playerid2);
		ZapiszGracza(playerid);
		new text[256], text2[256];
		format(text, sizeof(text), "Zmieni³eœ poprawnie godziny online graczu %s na %dh", ImieGracza2(playerid2), godziny);
		SendClientMessage(playerid, SZARY, text);
		format(text2, sizeof(text2), "%s zmieni³ poprawnie Twoje godziny online na %dh ", ImieGracza2(playerid), godziny);
		SendClientMessage(playerid2, SZARY, text2);
	}
	return 1;
}
CMD:setpistol(playerid,cmdtext[])
{
	if(zalogowany[playerid] == false)
	{
		return 0;
	}
	if(UprawnieniaCMa(playerid, 3))
	{
		new playerid2, sila;
		if(sscanf(cmdtext, "id", playerid2, sila))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zmieniæ skill graczu wpisz: /setpistol [id gracza] [ilosc]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ skilla nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		DaneGracza[playerid2][g0] = sila;
		DaneGracza[playerid2][g1] = sila;
		DaneGracza[playerid2][g2] = sila;
		ZapiszGracza(playerid2);
	}
	return 1;
}
CMD:setshotgun(playerid,cmdtext[])
{
	if(zalogowany[playerid] == false)
	{
		return 0;
	}
	if(UprawnieniaCMa(playerid, 3))
	{
		new playerid2, sila;
		if(sscanf(cmdtext, "id", playerid2, sila))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zmieniæ skill graczu wpisz: /setshotgun [id gracza] [ilosc]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ skilla nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		DaneGracza[playerid2][g3] = sila;
		DaneGracza[playerid2][g4] = sila;
		DaneGracza[playerid2][g5] = sila;
		ZapiszGracza(playerid2);
	}
	return 1;
}
CMD:setsmg(playerid,cmdtext[])
{
	if(zalogowany[playerid] == false)
	{
		return 0;
	}
	if(UprawnieniaCMa(playerid, 3))
	{
		new playerid2, sila;
		if(sscanf(cmdtext, "id", playerid2, sila))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zmieniæ skill graczu wpisz: /setsmg [id gracza] [ilosc]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ skilla nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		DaneGracza[playerid2][g6] = sila;
		DaneGracza[playerid2][g7] = sila;
		ZapiszGracza(playerid2);
	}
	return 1;
}
CMD:setautomat(playerid,cmdtext[])
{
	if(zalogowany[playerid] == false)
	{
		return 0;
	}
	if(UprawnieniaCMa(playerid, 3))
	{
		new playerid2, sila;
		if(sscanf(cmdtext, "id", playerid2, sila))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zmieniæ skill graczu wpisz: /setautomat [id gracza] [ilosc]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ skilla nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		DaneGracza[playerid2][g8] = sila;
		DaneGracza[playerid2][g9] = sila;
		ZapiszGracza(playerid2);
	}
	return 1;
}
CMD:setrifle(playerid,cmdtext[])
{
	if(zalogowany[playerid] == false)
	{
		return 0;
	}
	if(UprawnieniaCMa(playerid, 3))
	{
		new playerid2, sila;
		if(sscanf(cmdtext, "id", playerid2, sila))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zmieniæ skill graczu wpisz: /setrifle [id gracza] [ilosc]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ skilla nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		DaneGracza[playerid2][g10] = sila;
		ZapiszGracza(playerid2);
	}
	return 1;
}
CMD:setskin(playerid,cmdtext[])
{
	if(zalogowany[playerid] == false)
	{
		return 0;
	}
	if(UprawnieniaGMa(playerid, 3))
	{
		new playerid2, sila;
		if(sscanf(cmdtext, "id", playerid2, sila))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zmieniæ skin graczu wpisz: /setskin [id gracza] [id skina]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ skin nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		DaneGracza[playerid2][gLskin] = sila;
		DaneGracza[playerid2][gSKIN] = sila;
		SetPlayerSkin(playerid2, sila);
		ZapiszGracza(playerid2);
		new text[256], text2[256];
		format(text, sizeof(text), "Zmieni³eœ poprawnie graczu %s skin domyœlny na %d", ImieGracza2(playerid2), sila);
		SendClientMessage(playerid, SZARY, text);
		format(text2, sizeof(text2), "%s zmieni³ poprawnie Twój skin domyœlny na %d", ImieGracza2(playerid), sila);
		SendClientMessage(playerid2, SZARY, text2);
	}
	return 1;
}
CMD:premium(playerid,cmdtext[])
{
	if(zalogowany[playerid] == false)
	{
		return 0;
	}
	if(UprawnieniaCMa(playerid, 3))
	{
		new playerid2, sila;
		if(sscanf(cmdtext, "id", playerid2, sila))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ premium wpisz: /premium [id gracza] [dni]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ premium nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		DaneGracza[playerid2][gPREMIUM] = (gettime()+CZAS_LETNI)+(86400*sila);
		RefreshNick(playerid2);
		ZapiszGraczaGlobal(playerid2, 9);
		new text[256], text2[256];
		format(text, sizeof(text), "Nada³eœ poprawnie konto Premium graczu %s na %d dni", ImieGracza2(playerid2), sila);
		SendClientMessage(playerid, SZARY, text);
		format(text2, sizeof(text2), "%s nada³ Ci konto Premium na %d dni", ImieGracza2(playerid), sila);
		SendClientMessage(playerid2, SZARY, text2);
		return 1;
	}
	return 1;
}
CMD:setsila(playerid,cmdtext[])
{
	if(zalogowany[playerid] == false)
	{
		return 0;
	}
	if(UprawnieniaCMa(playerid, 3))
	{
		new playerid2, sila;
		if(sscanf(cmdtext, "id", playerid2, sila))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ si³e wpisz: /setsila [id gracza] [si³a w jednostkach]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ si³e nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		if(sila <= 99) return 1;
		DaneGracza[playerid2][gSILA] = sila;
		RefreshNick(playerid2);
		ZapiszGracza(playerid);
		new text[256], text2[256];
		format(text, sizeof(text), "Zmieni³eœ poprawnie si³ê graczu %s na %dj", ImieGracza2(playerid2), sila);
		SendClientMessage(playerid, SZARY, text);
		format(text2, sizeof(text2), "%s zmieni³ poprawnie Twoj¹ si³ê postaci na %dj", ImieGracza2(playerid), sila);
		SendClientMessage(playerid2, SZARY, text2);
	}
	return 1;
}
CMD:dajskradziony(playerid,cmdtext[])
{
	if(UprawnieniaCEO(playerid, 0))
	{
	    new playerid2, zuzycie;
		if(sscanf(cmdtext, "id", playerid2, zuzycie))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By daæ skradziony do pojazdu : /dajskradziony [id gracza] [0-1]", "Zamknij", "");
			return 1;
		}
		new vehicleid = GetPlayerVehicleID(playerid2);
		new uid = SprawdzCarUID(vehicleid);
		PojazdInfo[uid][pTempomat] = zuzycie;
		ZapiszPojazd(uid, 1);
		ZapiszPojazd(uid, 2);
		return 1;
	}
	return 1;
}
CMD:dajimmo(playerid,cmdtext[])
{
	if(UprawnieniaCEO(playerid, 0))
	{
	    new playerid2, zuzycie;
		if(sscanf(cmdtext, "id", playerid2, zuzycie))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By daæ immobiliser do pojazdu : /dajimmo [id gracza] [0-1]", "Zamknij", "");
			return 1;
		}
		new vehicleid = GetPlayerVehicleID(playerid2);
		new uid = SprawdzCarUID(vehicleid);
		PojazdInfo[uid][pImmo] = zuzycie;
		ZapiszPojazd(uid, 1);
		ZapiszPojazd(uid, 2);
		return 1;
	}
	return 1;
}
CMD:dajcb(playerid,cmdtext[])
{
	if(UprawnieniaCEO(playerid, 0))
	{
	    new playerid2, zuzycie;
		if(sscanf(cmdtext, "id", playerid2, zuzycie))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By daæ iloœc zu¿yæ pojazdu : /dajcb [id gracza] [0-1]", "Zamknij", "");
			return 1;
		}
		new vehicleid = GetPlayerVehicleID(playerid2);
		new uid = SprawdzCarUID(vehicleid);
		PojazdInfo[uid][pCB] = zuzycie;
		ZapiszPojazd(uid, 1);
		ZapiszPojazd(uid, 2);
		return 1;
	}
	return 1;
}
CMD:dajalarm(playerid,cmdtext[])
{
	if(UprawnieniaCEO(playerid, 0))
	{
	    new playerid2, zuzycie;
		if(sscanf(cmdtext, "id", playerid2, zuzycie))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/dajalarm [id gracza] [0-1]", "Zamknij", "");
			return 1;
		}
		new vehicleid = GetPlayerVehicleID(playerid2);
		new uid = SprawdzCarUID(vehicleid);
		PojazdInfo[uid][pAlarm] = zuzycie;
		ZapiszPojazd(uid, 1);
		ZapiszPojazd(uid, 2);
		return 1;
	}
	return 1;
}
CMD:dajaudio(playerid,cmdtext[])
{
	if(UprawnieniaCEO(playerid, 0))
	{
	    new playerid2, zuzycie;
		if(sscanf(cmdtext, "id", playerid2, zuzycie))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/dajaudio [id gracza] [0-1]", "Zamknij", "");
			return 1;
		}
		new vehicleid = GetPlayerVehicleID(playerid2);
		new uid = SprawdzCarUID(vehicleid);
		PojazdInfo[uid][pAudio] = zuzycie;
		ZapiszPojazd(uid, 1);
		ZapiszPojazd(uid, 2);
		return 1;
	}
	return 1;
}
CMD:dajszyby(playerid,cmdtext[])
{
	if(UprawnieniaCEO(playerid, 0))
	{
	    new playerid2, zuzycie;
		if(sscanf(cmdtext, "id", playerid2, zuzycie))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/dajszyby [id gracza] [0-1]", "Zamknij", "");
			return 1;
		}
		new vehicleid = GetPlayerVehicleID(playerid2);
		new uid = SprawdzCarUID(vehicleid);
		PojazdInfo[uid][pPSzyba] = zuzycie;
		ZapiszPojazd(uid, 1);
		ZapiszPojazd(uid, 2);
		return 1;
	}
	return 1;
}
CMD:zuzycie(playerid,cmdtext[])
{
	if(UprawnieniaCEO(playerid, 0))
	{
	    new uid, Float:zuzycie;
		if(sscanf(cmdtext, "df", uid, zuzycie))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/zuzycie [uid pojazdu] [iloœæ np. 15000]", "Zamknij", "");
			return 1;
		}
		PojazdInfo[uid][pNaprawy] += zuzycie;
		ZapiszPojazd(uid, 1);
		ZapiszPojazd(uid, 2);
		return 1;
	}
	return 1;
}
CMD:dajsilnik(playerid,cmdtext[])
{
	if(UprawnieniaCMa(playerid, 2))
	{
	    new playerid2;
		if(sscanf(cmdtext, "d", playerid2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/dajsilnik [id gracza]", "Zamknij", "");
			return 1;
		}
		new vehicleid = GetPlayerVehicleID(playerid2);
		new uid = SprawdzCarUID(vehicleid);
		PojazdInfo[uid][pStan] = 1000;
		SetVehicleHealth(vehicleid, 1000);
		ZapiszPojazd(uid, 1);
		new v = GetPlayerVehicleID(playerid2);
		PojazdInfo[uid][pUszkodzenie1] = 0;
        PojazdInfo[uid][pUszkodzenie2] = 0;
        PojazdInfo[uid][pUszkodzenie3] = 0;
        PojazdInfo[uid][pUszkodzenie4] = 0;
		GetVehicleDamageStatus(PojazdInfo[playerid2][pID], PojazdInfo[playerid2][pUszkodzenie1], PojazdInfo[playerid2][pUszkodzenie2], PojazdInfo[playerid2][pUszkodzenie3], PojazdInfo[playerid2][pUszkodzenie4]);
        KillTimer(AntyCheatWizualizacjaTimer[playerid2]);
		AntyCheatWizualizacjaTimer[playerid2] = SetTimerEx("WlaczAntyWizualizacje",4000,0,"d",playerid2);
		AntyCheatWizualizacja[playerid2] = 1;
		setDoor(v,HOOD,FULL);
		setDoor(v,TRUNK,FULL);
		setDoor(v,LEFT_DOOR,FULL);
		setDoor(v,RIGHT_DOOR,FULL);
		setPanel(v,FRONT_PANEL,FULL);
		setPanel(v,BACK_PANEL,FULL);
		setLight(v,LEFT_LIGHT,FULL);
		setLight(v,RIGHT_LIGHT,FULL);
		setTire(v,LEFT_F_TIRE,FULL);
		setTire(v,LEFT_B_TIRE,FULL);
		setTire(v,RIGHT_F_TIRE,FULL);
		setTire(v,RIGHT_B_TIRE,FULL);
		return 1;
	}
	return 1;
}
CMD:warn(playerid,cmdtext[])
{
	//printf("U¿yta komenda warn");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaGMa(playerid, 1))
    {
		new playerid2, tresc[256];
		if(sscanf(cmdtext, "is[124]", playerid2, tresc))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ warna wpisz: /warn [id gracza] [treœæ]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ warna nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		NadajKare(playerid2,playerid, 1, tresc, 0);
	}
	return 1;
}
CMD:setekran(playerid, cmdtext[])
{
    if(UprawnieniaGMa(playerid, 4))
	{
		new playerid2;
		if(sscanf(cmdtext, "i", playerid2))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby usun¹æ efekty ekranu u¿yj: /setekran [id gracza]", "Zamknij", "");
			return 1;
		}
		SetPlayerDrunkLevel(playerid2, 0);
		PlayerPlaySound(playerid, 1190, 0.0, 0.0, 0.0);
		PlayerPlaySound(playerid2, 1190, 0.0, 0.0, 0.0);
	}
	return 1;
}
CMD:setseat(playerid, cmdtext[])
{
    if(UprawnieniaCEO(playerid, 0))
	{
		new playerid2, vehid, seat;
		if(sscanf(cmdtext, "idd", playerid2, vehid, seat))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby umiesiciæ gracza w pojeŸdzie: /setseat [id gracza] [vehid] [miejsce]", "Zamknij", "");
			return 1;
		}
		PutPlayerInVehicle(playerid2, vehid, seat);
	}
	return 1;
}
CMD:seat(playerid, cmdtext[])
{
    BW1[playerid] = GetPlayerVehicleID(playerid);
	BW2[playerid] = GetPlayerVehicleSeat(playerid);
	new str[126];
	format(str,sizeof(str),"BW1 : %d, BW2: %d, Pozycja: %d - SEAT",BW1[playerid], BW2[playerid], GetPlayerVehicleSeat(playerid));
	SendClientMessage(playerid, SZARY,str);
	return 1;
}
CMD:setanim(playerid, cmdtext[])
{
	if(UprawnieniaCEO(playerid, 0))
	{
		new playerid2, animlib[32], animname[32], Float:delta, loop, lockx, locky, freeze, time, sync;
		if(sscanf(cmdtext, "is[32]s[32]fdddddd", playerid2, animlib, animname, delta, loop, lockx, locky, freeze, time, sync))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby ustawiæ now¹ animacje wpisz: /setanim [id gracza] [animlib] [animname] [delta] [loop] [lockx] [locky] [freeze] [time] [sync]", "Zamknij", "");
			return 1;
		}
		ApplyAnimation(playerid2, animlib, animname, delta, loop, lockx, locky, freeze, time, sync);
		SendClientMessage(playerid2, SZARY, "Animacja zosta³a u¿yta na Tobie przez Administratora.");
		return 1;
	}
	return 1;
}
CMD:bw(playerid,cmdtext[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaGMa(playerid, 1))
    {
		new playerid2;
		if(sscanf(cmdtext, "i", playerid2))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ lub usun¹c BW wpisz: /bw [id gracza]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ lub usun¹c BW nie jest zalogowany", "Zamknij", "");
			return 1;
		}
		if(DaneGracza[playerid2][gBW] == 0)
		{
			if(UprawnieniaGMa(playerid, 3))
			{
				Smierc(playerid2, 3);
				RefreshNick(playerid2);
				strdel(tekst_global, 0, 2048);
				format(tekst_global, sizeof(tekst_global), "%s nada³ Ci BW", ZmianaNicku(playerid));
				SendClientMessage(playerid2, KOLOR, tekst_global);
				TextDrawHideForPlayer(playerid2, TextNaDrzwi[playerid2]);
				ZapiszGracza(playerid2);
				new przelew[124];
				format(przelew, sizeof(przelew), "[BW] %s (ID:%d) da³ BW graczu: %s (ID:%d)",ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
				KomunikatAdmin(1, przelew);
			}
			else
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Nie mo¿esz z tym poziomem administracyjnym tego zrobiæ!", "Zamknij", "");
				return 1;
			}
		}
		else
		{
			strdel(tekst_global, 0, 2048);
			format(tekst_global, sizeof(tekst_global), "Twoje bw zosta³o usuniête przez: %s.", ZmianaNicku(playerid));
			SendClientMessage(playerid2, KOLOR, tekst_global);
			TextDrawHideForPlayer(playerid2, TextNaDrzwi[playerid2]);
			UstawHP(playerid2,9);
			DaneGracza[playerid2][gBW] = 0;
			BW1[playerid2] = 0;
			BW2[playerid2] = -1;
			ZapiszGracza(playerid2);
			RefreshNick(playerid2);
			TextDrawHideForPlayer(playerid2, pomoc[playerid2]);
			ClearAnimations(playerid2);
			new przelew[124];
			format(przelew, sizeof(przelew), "[UNBW] %s (ID:%d) da³ UnBW graczu: %s (ID:%d)",ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
			KomunikatAdmin(1, przelew);
			ApplyAnimation(playerid2, "CARRY", "crry_prtial", 4, 0, 0, 0, 0, 0, 0);
			ApplyAnimation(playerid2, "CARRY", "crry_prtial", 4, 0, 0, 0, 0, 0, 0);
			SetPlayerDrunkLevel(playerid2, 0);
			SetCameraBehindPlayer(playerid2);
			Frezuj(playerid2, 1);
			if(DaneGracza[playerid2][gWorek] == 0)
			{
				TextDrawHideForPlayer(playerid2, Worek);
			}
		}
	}
	return 1;
}
CMD:celebryta(playerid,cmdtext[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCMa(playerid, 0))
    {
    	new playerid2, pkt;
		if(sscanf(cmdtext, "id", playerid2, pkt))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ punkty reputacji wpisz: /celebryta [id gracza] [0 - brak statusu, 1 - status gwiazda]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ punkty nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		DaneGracza[playerid2][gWAGA] = pkt;
		ZapiszGracza(playerid2);
		RefreshNick(playerid2);
	}
	return 1;
}
CMD:kick(playerid,cmdtext[])
{
	//printf("U¿yta komenda kick");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaGMa(playerid, 1))
    {
		new playerid2, tresc[256];
		if(sscanf(cmdtext, "is[124]", playerid2, tresc))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ kicka wpisz: /kick [id gracza] [treœæ]", "Zamknij", "");
			return 1;
		}
		if(DaneGracza[playerid2][gAdmGroup] == 4 || DaneGracza[playerid2][gAdmGroup] == 14)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Nie mo¿esz nadaæ kicka osobie z zarz¹du lub administracji.", "Zamknij", "");
			return 0;
		}
		NadajKare(playerid2,playerid, 0, tresc, 0);
	}
	return 1;
}
CMD:brun(playerid,cmdtext[])
{
	//printf("U¿yta komenda brun");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaGMa(playerid, 3))
    {
		new playerid2, cash, tresc[256];
		if(sscanf(cmdtext, "ids[124]", playerid2, cash, tresc))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ blokade biegania wpisz: /brun [id gracza] [iloœæ dni] [treœæ]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ blokade biegania nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		if(cash < -1 || cash > 361)
		{
		    return 0;
		}
		if(BlokadaRUN(playerid2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ blokade biegania posiada tak¹ kare.", "Zamknij", "");
			return 0;
		}
		if(!Klatwa(playerid2))
		{
			if(cash == -1)
			{
				DaneGracza[playerid2][gRUN] = -1;
				NadajKare(playerid2,playerid, 5, tresc, cash);
				ZapiszGraczaGlobal(playerid2, 3);
			}
			else
			{
				DaneGracza[playerid2][gRUN] = (gettime()+CZAS_LETNI)+(86400*cash);
				NadajKare(playerid2,playerid, 5, tresc, cash);
				ZapiszGraczaGlobal(playerid2, 3);
			}
		}
		else
		{
		    NadajKare(playerid2,playerid, 11, tresc, (gettime()+CZAS_LETNI)+(86400*14));
			DaneGracza[playerid2][gBAN] = (gettime()+CZAS_LETNI)+(86400*14);
			ZapiszGraczaGlobal(playerid2, 4);
			Kick(playerid2);
		}
	}
	return 1;
}
CMD:bgun(playerid,cmdtext[])
{
	//printf("U¿yta komenda bgun");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaGMa(playerid, 3))
    {
		new playerid2, cash, tresc[256];
		if(sscanf(cmdtext, "ids[124]", playerid2, cash, tresc))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ blokade broni wpisz: /bgun [id gracza] [iloœæ dni] [treœæ]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ blokade broni nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		if(cash < -1 || cash > 361)
		{
		    return 0;
		}
		if(BlokadaGUN(playerid2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ blokade broni posiada tak¹ kare.", "Zamknij", "");
			return 0;
		}
		if(!Klatwa(playerid2))
		{
			if(cash == -1)
			{
				DaneGracza[playerid2][gGUN] = -1;
				ResetPlayerWeapons(playerid2);
				PrzedmiotInfo[DaneGracza[playerid2][gBronUID]][pUzywany] = 0;
				ZapiszPrzedmiot(DaneGracza[playerid2][gBronUID]);
				DaneGracza[playerid2][gBronUID] = 0;
				DaneGracza[playerid2][gBronAmmo] = 0;
				DeletePVar(playerid2, "UzywanaBron");
				NadajKare(playerid2,playerid, 8, tresc, cash);
				ZapiszGraczaGlobal(playerid2, 6);
			}
			else
			{
				DaneGracza[playerid2][gGUN] = (gettime()+CZAS_LETNI)+(86400*cash);
				ResetPlayerWeapons(playerid2);
				PrzedmiotInfo[DaneGracza[playerid2][gBronUID]][pUzywany] = 0;
				ZapiszPrzedmiot(DaneGracza[playerid2][gBronUID]);
				DaneGracza[playerid2][gBronUID] = 0;
				DaneGracza[playerid2][gBronAmmo] = 0;
				DeletePVar(playerid2, "UzywanaBron");
				NadajKare(playerid2,playerid, 8, tresc, cash);
				ZapiszGraczaGlobal(playerid2, 6);
			}
			ResetPlayerWeapons(playerid2);
			PrzedmiotInfo[DaneGracza[playerid2][gBronUID]][pUzywany] = 0;
			ZapiszPrzedmiot(DaneGracza[playerid2][gBronUID]);
			DaneGracza[playerid2][gBronUID] = 0;
			DaneGracza[playerid2][gBronAmmo] = 0;
			DeletePVar(playerid2, "UzywanaBron");
		}
		else
		{
			NadajKare(playerid2,playerid, 11, tresc, (gettime()+CZAS_LETNI)+(86400*14));
			DaneGracza[playerid2][gBAN] = (gettime()+CZAS_LETNI)+(86400*14);
			ZapiszGraczaGlobal(playerid2, 4);
			Kick(playerid2);
		}
	}
	return 1;
}
CMD:benefit(playerid, cmdtext[])
{
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
		new playerid2;
		if(sscanf(cmdtext, "i", playerid2))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby sprawdzic benefit gracza wpisz /benefit [id gracza]", "Zamknij", "");
			return 1;
		}
		new tekst[256];
		format(tekst, sizeof(tekst), "Gracz %s (%d) obecnie posiada %dmin z 60min, by otrzymaæ benefit godzinny.", ZmianaNicku(playerid2), playerid2, DaneGracza[playerid2][gDoPelnejGodziny]);
		SendClientMessage(playerid, SZARY, tekst);
		return 1;
	}
	return 1;
}
CMD:setbenefit(playerid, cmdtext[])
{
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
		new playerid2, ilosc;
		if(sscanf(cmdtext, "id", playerid2, ilosc))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby ustawic benefit gracza wpisz /setbenefit [id gracza] [ilosc]", "Zamknij", "");
			return 1;
		}
		DaneGracza[playerid2][gDoPelnejGodziny] = ilosc;
		ZapiszGracza(playerid2);
		new tekst[256];
		format(tekst, sizeof(tekst), "Ustawi³eœ graczu %s (%d) benefit na %dmin z 60min.", ZmianaNicku(playerid2), playerid2, DaneGracza[playerid2][gDoPelnejGodziny]);
		SendClientMessage(playerid, SZARY, tekst);
		return 1;
	}
	return 1;
}
CMD:resduty(playerid, cmdtext[])
{
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
		new playerid2;
		if(sscanf(cmdtext, "i", playerid2))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zrestartowaæ limit duty wpisz /resduty [id gracza]", "Zamknij", "");
			return 1;
		}
		new Rok, Miesiac, Dzien;
		getdate(Rok, Miesiac, Dzien);
		DaneGracza[playerid2][gPayDay] = 0;
		DaneGracza[playerid2][gPayDay2] = 0;
		DaneGracza[playerid2][gPayDay3] = 0;
		DaneGracza[playerid2][gPayDay4] = 0;
		DaneGracza[playerid2][gPayDay5] = 0;
		DaneGracza[playerid2][gPayDay6] = 0;
		DaneGracza[playerid2][gAntyPayDay] = Dzien;
		ZapiszGracza(playerid2);
		new logtekst[256];
		format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] restart all group payday limit for admins command %s. (1: %d, 2: %d, 3: %d, 4: %d, 5: %d, 6: %d) Day: (Anty: %d - Day: %d)", ZmianaNicku(playerid2), playerid2, DaneGracza[playerid2][gPayDay], DaneGracza[playerid2][gPayDay2], DaneGracza[playerid2][gPayDay3], DaneGracza[playerid2][gPayDay4], DaneGracza[playerid2][gPayDay5], DaneGracza[playerid2][gPayDay6], DaneGracza[playerid2][gAntyPayDay], Dzien, ZmianaNicku(playerid));
		Transakcja(T_CDRZWI, DaneGracza[playerid2][gUID], -1, DaneGracza[playerid2][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Zrestartowa³eœ limit duty graczu.", "Zamknij", "");
		return 1;
	}
	return 1;
}
CMD:restrening(playerid, cmdtext[])
{
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
		new playerid2, czas, typ[24];
		if(sscanf(cmdtext, "ids[24]", playerid2, czas, typ))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zrestartowaæ czas treningu wpisz /restrening [id gracza] [czas] [typ: m - minut, h - godzin, d - dni]", "Zamknij", "");
			return 1;
		}
		if(czas < 0)
		{
			return 0;
		}
		if(ComparisonString(typ, "m") || ComparisonString(typ, "h") || ComparisonString(typ, "d") || ComparisonString(typ, "M") || ComparisonString(typ, "H") || ComparisonString(typ, "D"))
		{
			if(zalogowany[playerid2] == false)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz nie jest zalogowany, wiêc nie mo¿esz tego zrobiæ.", "Zamknij", "");
				return 0;
			}
			new okres = 0;
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
			DaneGracza[playerid2][gOstatniTrening] = okres;
			new rok, miesiac, dzien, godzina, minuta, sekunda, tekst[256];
			sekundytodata(DaneGracza[playerid][gOstatniTrening], rok, miesiac, dzien, godzina, minuta, sekunda);
			format(tekst, sizeof(tekst), "Ostatni trening bêdziê mo¿liwy dla tego gracza: %02d.%02d,%dr %02dh, %02dm, %02ds.", dzien, miesiac, rok, godzina, minuta, sekunda);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Reset treningu:", tekst, "Zamknij", "");
			return 1;
		}
	}
	return 1;
}
CMD:bveh(playerid,cmdtext[])
{
	//printf("U¿yta komenda bveh");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaGMa(playerid, 3))
    {
		new playerid2, cash, tresc[256];
		if(sscanf(cmdtext, "ids[124]", playerid2, cash, tresc))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ blokade pojazdów wpisz: /bveh [id gracza] [iloœæ dni] [treœæ]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ blokade pojazdów nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		if(cash < -1 || cash > 361)
		{
		    return 0;
		}
		if(BlokadaVEH(playerid2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ blokade posiada ju¿ blokadê prowadzenia pojazdów.", "Zamknij", "");
			return 0;
		}
		if(!Klatwa(playerid2))
		{
			if(cash == -1)
			{
				DaneGracza[playerid2][gVEH] = -1;
				NadajKare(playerid2,playerid, 6, tresc, cash);
				RemovePlayerFromVehicle(playerid2);
				RemovePlayerFromVehicle(playerid2);
				ZapiszGraczaGlobal(playerid2, 5);
				}
			else
			{
				DaneGracza[playerid2][gVEH] = (gettime()+CZAS_LETNI)+(86400*cash);
				NadajKare(playerid2,playerid, 6, tresc, cash);
				RemovePlayerFromVehicle(playerid2);
				RemovePlayerFromVehicle(playerid2);
				ZapiszGraczaGlobal(playerid2, 5);
			}
		}
		else
		{
			NadajKare(playerid2,playerid, 11, tresc, (gettime()+CZAS_LETNI)+(86400*14));
			DaneGracza[playerid2][gBAN] = (gettime()+CZAS_LETNI)+(86400*14);
			ZapiszGraczaGlobal(playerid2, 4);
			Kick(playerid2);
		}
	}
	return 1;
}
CMD:zablokuj(playerid,cmdtext[])
{
	//printf("U¿yta komenda bkonta");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaGMa(playerid, 4))
    {
		new playerid2, cash, tresc[256];
		strdel(tresc, 0, 256);
		if(sscanf(cmdtext, "ids[256]", playerid2, cash, tresc))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ blokade postaci wpisz: /zablokuj [id gracza] [iloœæ dni] [treœæ]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ blokade postaci nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		if(DaneGracza[playerid2][gAdmGroup] == 4 || DaneGracza[playerid2][gAdmGroup] == 14)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Nie mo¿esz nadaæ blokady postaci osobie z zarz¹du lub administracji.", "Zamknij", "");
			return 0;
		}
		if(cash < -1 || cash > 361)
		{
		    return 0;
  		}
		if(cash == -1)
		{
			DaneGracza[playerid2][gAKTYWNE] = -1;
			NadajKare(playerid2,playerid, 4, tresc, -1);
			ZapiszGracza(playerid2);
			Kick(playerid2);
		}
		else
		{
			DaneGracza[playerid2][gAKTYWNE] = (gettime()+CZAS_LETNI)+(86400*cash);
			NadajKare(playerid2,playerid, 4, tresc, cash);
			ZapiszGracza(playerid2);
			Kick(playerid2);
		}
	}
	return 1;
}
CMD:amaska(playerid,params[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
	    new chusta[10], find = -1, str[256];
		if(sscanf(params, "s[10]", chusta))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby sprawdziæ maske nieznajomego wpisz: /amaska [kod]", "Zamknij", "");
			return 1;
		}
		ForeachEx(i, MAX_PLAYERS)
		{
			if(IsPlayerConnected(i))
			{
				if(zalogowany[i] == true)
				{
					strtoupper(chusta);
					if(ComparisonString(Maska(i), chusta))
					{
						find = i;
						break;
					}
				}
			}
		}
		if(find == -1)
		{
        	dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Przepisany kod jest nieprawid³owy.", "Zamknij", "");
			return 1;
		}
		format(str, sizeof(str), "Gracz: %s (ID: %d) KOD: %s", ImieGracza2(find), find, chusta);
		SendClientMessage(playerid, 0xFFFFFFFF, str);
	}
	return 1;
}
CMD:reload(playerid,params[])
{
	//printf("U¿yta komenda reload");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(UprawnieniaCEO(playerid, 0))
	{
	    new chusta;
		if(sscanf(params, "d", chusta))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby prze³adowaæ obiekty w budynku wpisz: /reload [uid budynku]", "Zamknij", "");
			return 1;
		}
	    new str[256];
	    UnloadObject(chusta);
	    LoadObject(chusta);
		format(str, sizeof(str), "Przeladowa³eœ %d obiektów", reload);
		SendClientMessage(playerid, 0xFFFFFFFF, str);
		reload = 0;
	}
	return 1;
}
CMD:afotoradar(playerid,params[])
{
	//printf("U¿yta komenda afotoradar");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(UprawnieniaCMa(playerid, 3))
	{
		dShowPlayerDialog(playerid,DIALOG_MAIN,DIALOG_STYLE_LIST,GUIOPIS "Fotoradary:","» Stwórz fotoradar\n» Edycja fotoradaru.\n» Usuniêcie fotoradaru.","Akceptuj","Zamknij");
	}
	return 1;
}
CMD:asay(playerid, params[])
{
	//printf("U¿yta komenda asay");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	new id;
	new tresc[80];
	if(UprawnieniaCMa(playerid, 3))
	{
		if(sscanf(params, "ds[80]", id, tresc)) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby naœladowaæ gracza wpisz: /asay [id gracza] [treœæ]", "Zamknij", "");
		if(zalogowany[id] == false)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz którego chcesz naœladowaæ nie jest zalogowany.", "Zamknij", "");
			return 0;
		}
		OnPlayerText(id, tresc);
	}
	return 1;
}
CMD:gm(playerid, params[])
{
	//printf("U¿yta komenda ac");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(UprawnieniaGMa(playerid, 0))
	{
		new info[256];
		if(sscanf(params, "s[256]", info)) dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby pisaæ na czacie ekipy serwisu wpisz: /gm [treœæ].", "Zamknij", "");
	 else
		{
			if(DaneGracza[playerid][gAdmGroup] == 4)//CEO
			{
				format(info, sizeof(info), "{FFFFFF}[CZAT] {ff7a7a}Zarz¹d %s:{A9C4E4} %s", ZmianaNicku(playerid), info);
			}
			else if(DaneGracza[playerid][gAdmGroup] == 14)//Administrator
			{
				format(info, sizeof(info), "{FFFFFF}[CZAT] {ff7a7a}Administrator %s:{A9C4E4} %s", ZmianaNicku(playerid), info);
			}
			else if(DaneGracza[playerid][gAdmGroup] == 7)//SGM
			{
				format(info, sizeof(info), "{FFFFFF}[CZAT] {61cc73}Starszy Gamemaster %s:{A9C4E4} %s", ZmianaNicku(playerid), info);
			}
			else if(DaneGracza[playerid][gAdmGroup] == 8)//GM
			{
				format(info, sizeof(info), "{FFFFFF}[CZAT] {a95bb7}Gamemaster %s:{A9C4E4} %s", ZmianaNicku(playerid), info);
			}
			ForeachEx(i, MAX_PLAYERS)
			{
				if(IsPlayerConnected(i))
				{
					if(zalogowany[i] == true)
					{
						if((DaneGracza[i][gAdmGroup] == 4 ||
						DaneGracza[i][gAdmGroup] == 14 ||
						 DaneGracza[i][gAdmGroup] == 7 ||
						 DaneGracza[i][gAdmGroup] == 8) && DutyAdmina[i] == 1)
						{
							DGCZAT(i, "A9C4E4", 0xA9C4E4AA, info);
						}
					}
				}
			}
		}
	}
	return 1;
}
CMD:toautobus(playerid, params[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
		Teleportuj(playerid, 2022.0, 2236.7, 2102.9);
		SetPlayerInterior(playerid, 0);
	}
	return 1;
}
CMD:topokoj(playerid, params[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
		Teleportuj(playerid, 244.411987,305.032989,999.148437);
		SetPlayerInterior(playerid, 1);
	}
	return 1;
}
// CMD:rockstar(playerid, params[])
// {
//     dShowPlayerDialog(playerid, DIALOG_DRZWI_ROCKSTAR, DIALOG_STYLE_LIST, GUIOPIS "Zakup wenetrza Rockstar", "Budget inn motel room\nDenise room\nKatie room\nMichelle room\nB Dups crack pad\nCJ house\nRyders house\nSweet house\nGang house\nColonel Furhberger\nCrack den\nUnused safe house", "Wybierz", "Zamknij");
// 	return 1;
// }
CMD:topokoj2(playerid, params[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
		Teleportuj(playerid, 271.884979,306.631988,999.148437);
		SetPlayerInterior(playerid, 2);
	}
	return 1;
}
CMD:tobank(playerid, params[])
{
	//printf("U¿yta komenda top");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
		Teleportuj(playerid, 2315.952880,-1.618174,26.742187);
		SetPlayerInterior(playerid, 0);
	}
	return 1;
}
CMD:tohotel2(playerid, params[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
		Teleportuj(playerid, 2215.454833,-1147.475585,1025.796875);
		SetPlayerInterior(playerid, 15);
	}
	return 1;
}
CMD:tohotel(playerid, params[])
{
	//printf("U¿yta komenda top");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
		Teleportuj(playerid, 1710.433715,-1669.379272,20.225049);
		SetPlayerInterior(playerid, 18);
	}
	return 1;
}
CMD:tobowl(playerid, params[])
{
	//printf("U¿yta komenda top");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
		Teleportuj(playerid, -1398.103515,937.631164,1036.479125);
		SetPlayerInterior(playerid, 15);
	}
	return 1;
}
CMD:totrack(playerid, params[])
{
	//printf("U¿yta komenda top");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
		Teleportuj(playerid, -1398.065307,-217.028900,1051.115844);
		SetPlayerInterior(playerid, 7);
	}
	return 1;
}
CMD:tocarschool(playerid, params[])
{
	//printf("U¿yta komenda top");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
		Teleportuj(playerid, -2029.798339,-106.675910,1035.171875);
		SetPlayerInterior(playerid, 3);
	}
	return 1;
}
CMD:tozip(playerid, params[])
{
	//printf("U¿yta komenda top");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
		Teleportuj(playerid, 161.391006,-93.159156,1001.804687);
		SetPlayerInterior(playerid, 18);
	}
	return 1;
}
CMD:toprolaps(playerid, params[])
{
	//printf("U¿yta komenda top");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
		Teleportuj(playerid, 207.054992,-138.804992,1003.507812);
		SetPlayerInterior(playerid, 3);
	}
	return 1;
}
CMD:tovictim(playerid, params[])
{
	//printf("U¿yta komenda top");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
		Teleportuj(playerid, 226.293991,-7.431529,1002.210937);
		SetPlayerInterior(playerid, 5);
	}
	return 1;
}
CMD:tobinco(playerid, params[])
{
	//printf("U¿yta komenda top");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
		Teleportuj(playerid, 207.737991,-109.019996,1005.132812);
		SetPlayerInterior(playerid, 15);
	}
	return 1;
}
CMD:tobus(playerid, params[])
{
	//printf("U¿yta komenda top");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
		Teleportuj(playerid, 1.808619,32.384357,1199.593750);
		SetPlayerInterior(playerid, 1);
	}
	return 1;
}
CMD:to24(playerid, params[])
{
	//printf("U¿yta komenda top");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
		Teleportuj(playerid, 6.091179,-29.271898,1003.549438);
		SetPlayerInterior(playerid, 10);
	}
	return 1;
}
CMD:tosmoke(playerid, params[])
{
	//printf("U¿yta komenda top");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
		Teleportuj(playerid, 2527.654052,-1679.388305,1015.498596);//6.091179,-29.271898,1003.549438
		SetPlayerInterior(playerid, 1);
	}
	return 1;
}
CMD:top(playerid, params[])
{
	//printf("U¿yta komenda top");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
	    new playerid2;
		if(sscanf(params, "i", playerid2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby teleportowaæ siê do pojazdu wpisz: /top [uid pojazdu]", "Zamknij", "");
			return 1;
		}
		if(PojazdInfo[playerid2][pSpawn] == 0)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Pojazd do którego chcesz siê teleportowaæ nie jest zespawnowany.", "Zamknij", "");
			return 0;
		}
		new Float:X, Float:Y, Float:Z;
		GetVehiclePos(PojazdInfo[playerid2][pID], X, Y, Z);
		Teleportuj(playerid, X, Y, Z);
		SetPlayerVirtualWorld(playerid, GetVehicleVirtualWorld(PojazdInfo[playerid2][pID]));
	}
	return 1;
}
CMD:too(playerid, params[])
{
	//printf("U¿yta komenda too");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
	    new playerid2;
		if(sscanf(params, "i", playerid2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby teleportowaæ siê do obiektu wpisz: /too [uid obiektu]", "Zamknij", "");
			return 1;
		}
		Teleportuj(playerid, ObiektInfo[playerid2][objPozX]+2, ObiektInfo[playerid2][objPozY], ObiektInfo[playerid2][objPozZ]);
		SetPlayerVirtualWorld(playerid, ObiektInfo[playerid2][objvWorld]);
		SetPlayerInterior(playerid, ObiektInfo[playerid2][objInterior]);
	}
	return 1;
}
CMD:tod(playerid, params[])
{
	//printf("U¿yta komenda tod");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
    {
	    new playerid2;
		if(sscanf(params, "i", playerid2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby teleportowaæ siê do drzwi wpisz: /tod [uid drzwi]", "Zamknij", "");
			return 1;
		}
		SetPlayerVirtualWorld(playerid, BudynekInfo[playerid2][nVW]);
		TogglePlayerSpectating(playerid, 0);
		SetCameraBehindPlayer(playerid);
		if(IsPlayerInAnyVehicle(playerid))
		{
			SetVehiclePos(GetPlayerVehicleID(playerid), BudynekInfo[playerid2][nX], BudynekInfo[playerid2][nY], BudynekInfo[playerid2][nZ]);
		}
		else
		{
			Teleportuj(playerid, BudynekInfo[playerid2][nX], BudynekInfo[playerid2][nY], BudynekInfo[playerid2][nZ]);
		}
		SetPlayerVirtualWorld(playerid, BudynekInfo[playerid2][nVW]);
		SetPlayerInterior(playerid, BudynekInfo[playerid2][nINT]);
	}
	return 1;
}
CMD:tm(playerid, params[])
{
	//printf("U¿yta komenda tm");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(UprawnieniaGMa(playerid, 2))
    {
	    new playerid2;
		if(sscanf(params, "i", playerid2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby teleportowaæ gracza do siebie wpisz: /tm [id gracza]", "Zamknij", "");
			return 1;
		}
		if(playerid == playerid2) return 1;
		if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz którego chcesz teleportowaæ do siebie nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		new vw = GetPlayerVirtualWorld(playerid);
		SetPlayerVirtualWorld(playerid2, vw);
		new Float: x, Float: y, Float: z;
		new Float: x2, Float: y2, Float: z2, Float: a2;
		GetPlayerPos(playerid, x, y, z);
		GetPlayerPos(playerid2, x2, y2, z2);
		GetPlayerFacingAngle(playerid2, a2);
		TogglePlayerSpectating(playerid2, 0);
		SetCameraBehindPlayer(playerid2);
		if(IsPlayerInAnyVehicle(playerid2))
		{
			SetVehiclePos(GetPlayerVehicleID(playerid2), x, y + 2, z);
		}
		else Teleportuj(playerid2, x, y + 2, z);
		SetPlayerVirtualWorld(playerid2, GetPlayerVirtualWorld(playerid));
		SetPlayerInterior(playerid2, GetPlayerInterior(playerid2));
		new przelew[124];
		format(przelew, sizeof(przelew), "[TM] Gracz: %s (ID:%d) teleportuje do siebie gracza: %s (ID:%d)",ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
		KomunikatAdmin(1, przelew);
		Transakcja(T_TM, DaneGracza[playerid][gUID], DaneGracza[playerid2][gUID], DaneGracza[playerid][gGUID], DaneGracza[playerid2][gGUID], -1, -1, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
	}
	return 1;
}
CMD:toto(playerid, params[])
{
	//printf("U¿yta komenda to");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaGMa(playerid, 2))
    {
	    new playerid2, gracz;
		if(sscanf(params, "ii", gracz, playerid2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby teleportowaæ gracza do gracza wpisz: /to [id gracza którego telepoertujemy] [id gracza do któego teleportujemy]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[gracz] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz którego chcesz teleportowaæ nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz do którego chcesz teleportowaæ gracza nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		new vw = GetPlayerVirtualWorld(playerid2);
		SetPlayerVirtualWorld(gracz, vw);
		new Float: x, Float: y, Float: z;
		new Float: x2, Float: y2, Float: z2, Float: a2;
		GetPlayerPos(playerid2, x, y, z);
		GetPlayerPos(gracz, x2, y2, z2);
		GetPlayerFacingAngle(gracz, a2);
		TogglePlayerSpectating(gracz, 0);
		SetCameraBehindPlayer(gracz);
		if(IsPlayerInAnyVehicle(gracz))
		{
			SetVehiclePos(GetPlayerVehicleID(gracz), x, y + 2, z);
		}
		else
		{
			y+=2;
			Teleportuj(gracz, x, y, z);
		}
		SetPlayerVirtualWorld(gracz, GetPlayerVirtualWorld(playerid2));
		SetPlayerInterior(gracz, GetPlayerInterior(playerid2));
		new przelew[124];
		format(przelew, sizeof(przelew), "[TO] Gracz: %s (ID:%d) teleportuje siê do gracza: %s (ID:%d)",ZmianaNicku(gracz), gracz, ZmianaNicku(playerid2), playerid2);
		KomunikatAdmin(1, przelew);
	}
	return 1;
}
CMD:to(playerid, params[])
{
	//printf("U¿yta komenda to");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaGMa(playerid, 1))
    {
	    new playerid2;
		if(sscanf(params, "i", playerid2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby teleportowaæ siê do gracza wpisz: /to [id gracza]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz do którego chcesz siê teleportowaæ nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		new vw = GetPlayerVirtualWorld(playerid2);
		SetPlayerVirtualWorld(playerid, vw);
		new Float: x, Float: y, Float: z;
		new Float: x2, Float: y2, Float: z2, Float: a2;
		GetPlayerPos(playerid2, x, y, z);
		GetPlayerPos(playerid, x2, y2, z2);
		GetPlayerFacingAngle(playerid, a2);
		TogglePlayerSpectating(playerid, 0);
		SetCameraBehindPlayer(playerid);
		if(IsPlayerInAnyVehicle(playerid))
		{
			SetVehiclePos(GetPlayerVehicleID(playerid), x, y + 2, z);
		}
		else
		{
			y+=2;
			Teleportuj(playerid, x, y, z);
		}
		SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(playerid2));
		SetPlayerInterior(playerid, GetPlayerInterior(playerid2));
		new przelew[124];
		format(przelew, sizeof(przelew), "[TO] Gracz: %s (ID:%d) teleportuje siê do gracza: %s (ID:%d)",ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
		KomunikatAdmin(1, przelew);
	}
	return 1;
}
CMD:apomoc(playerid, params[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if((DaneGracza[playerid][gAdmGroup] == 4 || DaneGracza[playerid][gAdmGroup] == 7 || DaneGracza[playerid][gAdmGroup] == 14 || DaneGracza[playerid][gAdmGroup] == 8 || DaneGracza[playerid][gAdmGroup] == 11) && DutyAdmina[playerid] == 1)
    {
	    KomendyAdmina(playerid);
	}
	return 1;
}
CMD:stworz(playerid, params[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(UprawnieniaCEO(playerid, 0))
	{
		new	comm1[32], comm2[128];
		if(sscanf(params, "s[32]S()[128]", comm1, comm2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Drzwi:\t[przeniesdrzwi, drzwi, wyjsciedrzwi, udrzwi, oplata]\n\nPrzedmioty:\t[przedmiot]\n\nPojazdy:\t[pojazd]\n\nHurtownia:\t[hurtownia]\n\nObiekty:\t[owlasciciel]", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"hurtownia",true))
		{
		    if(DaneGracza[playerid][gGUID] == 1)
		    {
			    new typ, cena, typp, war1, war2, war5, nazwa[256];
				if(sscanf(comm2, "dddddds[50]", typ, cena, typp, war1, war2, war5, nazwa) != 0)
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "B³¹d", "Nieprawid³owy format komendy. U¿yj: /stworz hurtownia [typ] [cena] [typ przedmiotu] [wartosc1] [wartosc2] [wartosc5] [nazwa]", "Zamknij", "");
					return 1;
				}
				if(antyst(nazwa))
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "W nazwie u¿y³eœ niedowolonych znaków takich jak:\n{FF0000}; : ' *\nZmieñ je i¿ s¹ one niedowozolone.", "Zamknij", "");
					return 1;
				}
				DodajDoHurtowni(typ, nazwa, cena, typp, war1, war2, war5);
			}
			return 1;
		}
		else if(!strcmp(comm1,"uhurtownia",true))
		{
		    if(DaneGracza[playerid][gGUID] == 1)
		    {
			    new typ;
				if(sscanf(comm2, "d", typ))
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby usun¹æ produkt w hurtowni wpisz: /stworz uhurtownia [uid]", "Zamknij", "");
					return 1;
				}
				UsunHurtownie(typ);
			}
			return 1;
		}
		else if(!strcmp(comm1,"pojazd",true))
		{
		    new typ, war1, war2, paliwo;
			if(sscanf(comm2, "dddd", typ, war1, war2, paliwo))
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby stworzyæ pojazd wpisz: /stworz pojazd [model] [kolor1] [kolor2] [paliwo]", "Zamknij", "");
				return 1;
			}
			new Float:x,Float:y,Float:z;
			GetPlayerPos(playerid,x,y,z);
			new typ_poj = 0;
			DodajPojazd(DaneGracza[playerid][gUID], typ, war1, war2, x, y, z, paliwo, 0, typ_poj);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Stworzy³eœ w³aœnie pojazd, który znajduje siê na twojej liœcie pojazdów!/nWpisz /v by zrespawnowaæ pojazd.", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"przedmiot",true))
		{
		    new typ, war1, war2, name[32], waga;
			if(sscanf(comm2, "dddfs[32]", typ, war1, war2, waga, name))
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby stworzyæ przedmiot wpisz: /stworz przedmiot [rodzaj] [wartosc1] [wartosc2] [waga] [nazwa]", "Zamknij", "");
				return 1;
			}
			if(antyst(name))
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "W nazwie u¿y³eœ niedowolonych znaków takich jak:\n{FF0000}; : ' *\nZmieñ je i¿ s¹ one niedowozolone.", "Zamknij", "");
				return 1;
			}
			DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, typ, war1, war2, name, DaneGracza[playerid][gUID], waga, -1, 0, 0, 0, 0, "");
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Stworzy³eœ w³aœnie przedmiot, który znajduje siê na twojej liœcie przedmiotów!/nWpisz /p by wybraæ przedmiot z listy.", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"oplata",true))
		{
			new uids, playerid2;
			if(sscanf(comm2, "dd", uids, playerid2))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby oferowaæ op³ate budynku graczu wpisz: /stworz oplata [uid budynku] [id gracza]", "Zamknij", "");
				return 1;
			}
			if(zalogowany[playerid2] == false)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz oferowaæ op³ate budynku jest zbyt daleko od ciebie.", "Zamknij", "");
				return 0;
			}
			Oferuj(playerid, playerid2, uids, DaneGracza[playerid][gSluzba], 0, 0, OFEROWANIE_OPLATY, 1,"", 0);
			return 1;
		}
		else if(!strcmp(comm1,"udrzwi",true))
		{
		   	if(DaneGracza[playerid][gGUID] == 1)
		    {
				new doorid;
				if(sscanf(comm2, "d", doorid))
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby usun¹æ budynek wpisz: /stworz udrzwi [id drzwi]", "Zamknij", "");
					return 1;
				}
				if(BudynekInfo[doorid][nMapa] == 1)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "W³aœciciel budynku w³aœnie wgrywa mape obiektów do budynku.\nTa opcja jest niedostêpna do czasu zakoñczenia tej operacji.", "Zamknij", "");
					return 0;
				}
				UsunNieruchomosc(doorid);
			}
			return 1;
		}
		else if(!strcmp(comm1,"przeniesdrzwi",true))
		{
		    new doorid;
			if(sscanf(comm2, "d", doorid))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby przenieœ pickup budynku wpisz: /stworz przeniesdrzwi [id drzwi]", "Zamknij", "");
				return 1;
			}
			if(BudynekInfo[doorid][nMapa] == 1)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "W³aœciciel budynku w³aœnie wgrywa mape obiektów do budynku.\nTa opcja jest niedostêpna do czasu zakoñczenia tej operacji.", "Zamknij", "");
				return 0;
			}
			new Float:X, Float:Y, Float:Z, Float:Ang;
	  		GetPlayerPos(playerid, X, Y, Z);
	  		GetPlayerFacingAngle(playerid, Ang);
	  		BudynekInfo[doorid][nX] = X;
	  		BudynekInfo[doorid][nY] = Y;
	  		BudynekInfo[doorid][nZ] = Z;
	  		BudynekInfo[doorid][na] = Ang;
	  		BudynekInfo[doorid][nINT] = GetPlayerInterior(playerid);
	  		BudynekInfo[doorid][nVW] = GetPlayerVirtualWorld(playerid);
			ZapiszNieruchomosc(doorid);
			DestroyDynamicPickup(BudynekInfo[doorid][nID]);
			BudynekInfo[doorid][nID] = CreateDynamicPickup(BudynekInfo[doorid][nPickup], 1, BudynekInfo[doorid][nX], BudynekInfo[doorid][nY], BudynekInfo[doorid][nZ], BudynekInfo[doorid][nVW]);
			return 1;
		}
		else if(!strcmp(comm1,"owlasciciel",true))
		{
			new doorid,owner;
			if(sscanf(comm2, "dd", doorid, owner))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby przenieœæ obiekt wpisz: /stworz owlascieil [uid obiektu] [owner]", "Zamknij", "");
				return 1;
			}
			ObiektInfo[doorid][objOwnerDz] = owner;
			ZapiszObiekt(doorid);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Obiekt podpisany", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"wyjsciedrzwi",true))
		{
		    new doorid;
			if(sscanf(comm2, "d", doorid))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby przenieœæ drzwi wejœciowe wpisz: /stworz wyjsciedrzwi [id drzwi]", "Zamknij", "");
				return 1;
			}
			if(BudynekInfo[doorid][nMapa] == 1)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "W³aœciciel budynku w³aœnie wgrywa mape obiektów do budynku.\nTa opcja jest niedostêpna do czasu zakoñczenia tej operacji.", "Zamknij", "");
				return 0;
			}
			new Float:X, Float:Y, Float:Z, Float:Ang;
	  		GetPlayerPos(playerid, X, Y, Z);
	  		GetPlayerFacingAngle(playerid, Ang);
	  		BudynekInfo[doorid][nXW] = X;
	  		BudynekInfo[doorid][nYW] = Y;
	  		BudynekInfo[doorid][nZW] = Z;
	  		BudynekInfo[doorid][naw] = Ang;
	  		BudynekInfo[doorid][nINTW] = GetPlayerInterior(playerid);
	  		BudynekInfo[doorid][nVWW] = GetPlayerVirtualWorld(playerid);
			ZapiszNieruchomosc(doorid);
			return 1;
		}
		else if(!strcmp(comm1,"drzwi",true))
		{
		    new typ, name[32];
			if(sscanf(comm2, "ds[32]", typ, name))
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby stworzyæ drzwi wpisz: /stworz drzwi [typ] [nazwa]", "Zamknij", "");
				return 1;
			}
			if(antyst(name))
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "W nazwie u¿y³eœ niedowolonych znaków takich jak:\n{FF0000}; : ' *\nZmieñ je i¿ s¹ one niedowozolone.", "Zamknij", "");
				return 1;
			}
			if(createddoor[playerid] == 0)
			{
			    createddoor[playerid] = 1;
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Tworzenie budynku:", "{DEDEDE}W³aœnie zacz¹³eœ tworzenie budynku, udaj siê do miejsca gdzie postaæ ma siê spawnowaæ po wejsciu do budynku\nPo udaniu siê w to miejsce u¿yj ponownie komendy.", "Zamknij", "");
			}
			else if(createddoor[playerid] == 1)
			{
			    new Float:x, Float:y, Float:z;
			    GetPlayerPos(playerid, x, y, z);
			    createdareax[playerid] = x;
			    createdareay[playerid] = y;
			    createdareah[playerid] = z;
			    createddoor[playerid] = 2;
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Tworzenie budynku:", "{DEDEDE}W³asnie wyznaczy³eœ gdzie postaæ ma siê spawnowaæ po wejsciu do budynku\nNastêpny krok pozwoli Ci na wyznaczenie miejsca gdzie bêdzie znajdowa³ siê Pickup tzw. wejscie do budnku.", "Zamknij", "");
			}
			else if(createddoor[playerid] == 2)
			{
			    new Float:x, Float:y, Float:z;
			    GetPlayerPos(playerid, x, y, z);
			    createdareaxx[playerid] = x;
			    createdareayy[playerid] = y;
			    createdareahh[playerid] = z;
			    createddoor[playerid] = 3;
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Tworzenie budynku:", "{DEDEDE}W³asnie wyznaczy³eœ miejsce wejsciowe do budynku gdzie bêdzie znajdowa³ siê Pickup\nU¿yj ponownie komendy by potwierdziæ stworzony budynek.", "Zamknij", "");
			}
			else if(createddoor[playerid] == 3)
			{
				new text[124], typp;
				if(typ == 0)
				{
					typp = 1273;
				}
				else
				{
					typp = 1239;
				}
				new uid = StworzDrzwi(playerid, DaneGracza[playerid][gUID], 0, name, typ, typp, createdareax[playerid], createdareay[playerid], createdareah[playerid], createdareaxx[playerid], createdareayy[playerid], createdareahh[playerid], 0);
				format(text, sizeof(text), "Nowe drzwi stworzone pomyœlnie. (uid %d) (%s)", uid, name);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", text, "Zamknij", "");
				createdareax[playerid] = 0;
			    createdareay[playerid] = 0;
			    createdareah[playerid] = 0;
			    createdareaxx[playerid] = 0;
			    createdareayy[playerid] = 0;
			    createdareahh[playerid] = 0;
			    createddoor[playerid] = 0;
			    BudynekInfo[uid][nOplata] = gettime()+(7*24*60*60);
			    BudynekInfo[uid][nPowieszchnia] = 400.00;
				ZapiszNieruchomosc(uid);
			}
		}
		return 1;
	}
	return 1;
}
CMD:aduty(playerid, params[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(ComparisonString(params, "i") || ComparisonString(params, "incognito"))
	{
	    SetPVarInt(playerid, "Incognito", 1);
	}
    if(DaneGracza[playerid][gTeam] == 1)
    {
		if(DutyAdmina[playerid] != 0 && DutyDZ[playerid] != 0 && DutyNR[playerid] != 0 && DaneGracza[playerid][gSluzba] != 0)
		{
			ZapiszDuty(DaneGracza[playerid][gSluzba], playerid, DutyNR[playerid]);
			DutyAdmina[playerid] = 0;
			DutyDZ[playerid] = 0;
			DutyNR[playerid] = 0;
			DaneGracza[playerid][gSluzba] = 0;
			RefreshNick(playerid);
			GameTextForPlayer(playerid, "Schodzisz z sluzby", 3000, 5);
			new msg[254];
			format(msg,254,"%s",ImieGracza2(playerid));
			TextDrawSetString(Duty[playerid], msg);
			TextDrawShowForPlayer(playerid, Duty[playerid]);
			SetPVarInt(playerid, "Incognito", 0);
		}
	    if(DaneGracza[playerid][gAdmGroup] == 4)
		{
		    if(DutyAdmina[playerid] == 1)
		    {
		        if(GetPVarInt(playerid, "SpecujeID") != 0)
		        {
		            return 0;
		        }
		        DutyAdmina[playerid] = 0;
		        DutyDZ[playerid] = 0;
		        DutyNR[playerid] = 0;
		    	DaneGracza[playerid][gSluzba] = 0;
		        RefreshNick(playerid);
				GameTextForPlayer(playerid, "Schodzisz ze sluzby Zarzadu", 3000, 5);
				new msg[254];
				format(msg,254,"%s",ImieGracza2(playerid));
				TextDrawSetString(Duty[playerid], msg);
				TextDrawShowForPlayer(playerid, Duty[playerid]);
				ZapiszGraczaGlobal(playerid, 8);
				SetPVarInt(playerid, "Incognito", 0);
			}else{
				DutyDZ[playerid] = 0;
		        DutyNR[playerid] = 0;
		    	DaneGracza[playerid][gSluzba] = 0;
				DutyAdmina[playerid] = 1;
				GameTextForPlayer(playerid, "Wchodzisz na sluzbe Zarzadu", 3000, 5);
				new msg[254];
				format(msg,254,"%s (Zarzad)",ImieGracza2(playerid));
				TextDrawSetString(Duty[playerid], msg);
				TextDrawShowForPlayer(playerid, Duty[playerid]);
			    RefreshNick(playerid);
			}
		}
		else if(DaneGracza[playerid][gAdmGroup] == 14)
		{
		    if(DutyAdmina[playerid] == 1)
		    {
		        if(GetPVarInt(playerid, "SpecujeID") != 0)
		        {
		            return 0;
		        }
		        DutyAdmina[playerid] = 0;
		        DutyDZ[playerid] = 0;
		        DutyNR[playerid] = 0;
		    	DaneGracza[playerid][gSluzba] = 0;
		        RefreshNick(playerid);
				GameTextForPlayer(playerid, "Schodzisz ze sluzby Administratora", 3000, 5);
				new msg[254];
				format(msg,254,"%s",ImieGracza2(playerid));
				TextDrawSetString(Duty[playerid], msg);
				TextDrawShowForPlayer(playerid, Duty[playerid]);
				ZapiszGraczaGlobal(playerid, 8);
				SetPVarInt(playerid, "Incognito", 0);
			}else{
				DutyDZ[playerid] = 0;
		        DutyNR[playerid] = 0;
		    	DaneGracza[playerid][gSluzba] = 0;
				DutyAdmina[playerid] = 1;
				GameTextForPlayer(playerid, "Wchodzisz na sluzbe Administratora", 3000, 5);
				new msg[254];
				format(msg,254,"%s (Administrator)",ImieGracza2(playerid));
				TextDrawSetString(Duty[playerid], msg);
				TextDrawShowForPlayer(playerid, Duty[playerid]);
			    RefreshNick(playerid);
			}
		}
	    else if(DaneGracza[playerid][gAdmGroup] == 7)
		{
		    if(DutyAdmina[playerid] == 1)
		    {
		        if(GetPVarInt(playerid, "SpecujeID") != 0)
		        {
		            return 0;
		        }
		        DutyAdmina[playerid] = 0;
		        DutyDZ[playerid] = 0;
		        DutyNR[playerid] = 0;
		    	DaneGracza[playerid][gSluzba] = 0;
		        RefreshNick(playerid);
				GameTextForPlayer(playerid, "Schodzisz ze sluzby Starszy Gamemaster", 3000, 5);
				new msg[254];
				format(msg,254,"%s",ImieGracza2(playerid));
				TextDrawSetString(Duty[playerid], msg);
				TextDrawShowForPlayer(playerid, Duty[playerid]);
				ZapiszGraczaGlobal(playerid, 8);
				SetPVarInt(playerid, "Incognito", 0);
			}else{
				DutyDZ[playerid] = 0;
		        DutyNR[playerid] = 0;
		    	DaneGracza[playerid][gSluzba] = 0;
				DutyAdmina[playerid] = 1;
			    RefreshNick(playerid);
				GameTextForPlayer(playerid, "Wchodzisz na sluzbe Starszy Gamemaster", 3000, 5);
				new msg[254];
				format(msg,254,"%s (Starszy Gamemaster)",ImieGracza2(playerid));
				TextDrawSetString(Duty[playerid], msg);
				TextDrawShowForPlayer(playerid, Duty[playerid]);
			}
		}
		else if(DaneGracza[playerid][gAdmGroup] == 8)
		{
	        if(DutyAdmina[playerid] == 1)
		    {
		        if(GetPVarInt(playerid, "SpecujeID") != 0)
		        {
		            return 0;
		        }
		        DutyAdmina[playerid] = 0;
		        DutyDZ[playerid] = 0;
		        DutyNR[playerid] = 0;
		    	DaneGracza[playerid][gSluzba] = 0;
		        RefreshNick(playerid);
				GameTextForPlayer(playerid, "Schodzisz ze sluzby Gamemastera", 3000, 5);
				new msg[254];
				format(msg,254,"%s",ImieGracza2(playerid));
				TextDrawSetString(Duty[playerid], msg);
				TextDrawShowForPlayer(playerid, Duty[playerid]);
				ZapiszGraczaGlobal(playerid, 8);
				SetPVarInt(playerid, "Incognito", 0);
			}else{
				DutyDZ[playerid] = 0;
		        DutyNR[playerid] = 0;
		    	DaneGracza[playerid][gSluzba] = 0;
				DutyAdmina[playerid] = 1;
			    RefreshNick(playerid);
				GameTextForPlayer(playerid, "Wchodzisz na sluzbe Gamemastera", 3000, 5);
				new msg[254];
				format(msg,254,"%s (Gamemaster)",ImieGracza2(playerid));
				TextDrawSetString(Duty[playerid], msg);
				TextDrawShowForPlayer(playerid, Duty[playerid]);
			}
		}
		RefreshNick(playerid);
	}
	return 1;
}
CMD:apaczka( playerid, params[ ] )
{
	if(UprawnieniaCMa(playerid, 1))
    {
		if(zalogowany[playerid] == false)
		{
			return 0;
		}
		if(DaneGracza[playerid][gBW] != 0)
		{
			return 0;
		}
		if(DaneGracza[playerid][gPaczkaM] == 0)
		{
			new item_list[2048],find;
			strdel(item_list, 0, 2048);
			ForeachEx(i, 200)
			{
				if(PaczkaInfo[i][xUID] != 0)
				{
					format(item_list, sizeof(item_list), "%s\n%d\t\t%s", item_list, PaczkaInfo[i][xUID], BudynekInfo[PaczkaInfo[i][xMIEJSCED]][nAdres]);
					find++;
				}
			}
			if(find == 0) dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aktualnie brak dostêpnych paczek.", "Zamknij", "");
			else dShowPlayerDialog(playerid, DIALOG_WEZ_PACZKE, DIALOG_STYLE_LIST, GUIOPIS "Paczki:", item_list, "Wybierz", "Zamknij");
			return 1;
		}
		else if(DaneGracza[playerid][gPaczkaM] == 1)
		{
			new is = DaneGracza[playerid][gPaczkaUID];
			DodajDoMagazynu(PaczkaInfo[is][xUIDG], PaczkaInfo[is][xTYP], PaczkaInfo[is][xWAR1], PaczkaInfo[is][xWAR2], PaczkaInfo[is][xWAR5], PaczkaInfo[is][xNAZWA],PaczkaInfo[is][xCENA], PaczkaInfo[is][xILOSC]);
			Dodajkase( playerid, 50 );
			ZapiszGracza(playerid);
			UsunPaczke(is);
			DaneGracza[playerid][gPaczkaM] = 0;
			DaneGracza[playerid][gPaczkaUID] = 0;
			DisablePlayerCheckpoint(playerid);
			TextDrawHideForPlayer(playerid, OBJ[playerid]);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Paczka dostarczona do dzia³alnoœci gospodarczej.", "Zamknij", "");
			return 1;
		}
		DaneGracza[playerid][gPaczkaT] = gettime()+60;
	}
	return 1;
}
CMD:res(playerid, params[])
{
	//printf("U¿yta komenda reset");
	if(UprawnieniaGMa(playerid, 2))
    {
		new playerid2;
		if(sscanf(params, "i", playerid2))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zresetowaæ gracza na spawn wpisz: /res [id gracza]", "Zamknij", "");
			return 1;
		}
		if(DaneGracza[playerid2][gBronUID] != 0)
		{
			UsunBronieGracza(playerid2);
			PrzedmiotInfo[DaneGracza[playerid2][gBronUID]][pUzywany] = 0;
			ZapiszPrzedmiot(DaneGracza[playerid2][gBronUID]);
			DaneGracza[playerid2][gBronUID] = 0;
			DaneGracza[playerid2][gBronAmmo] = 0;
			DeletePVar(playerid2, "UzywanaBron");
		}
		ResetPlayerWeapons(playerid2);
		SetPVarInt(playerid2, "Teleportacja", 1);
		SpawnPlayer(playerid2);
		SetPVarInt(playerid2, "Teleportacja", 0);
		PlayerPlaySound(playerid, 1190, 0.0, 0.0, 0.0);
		PlayerPlaySound(playerid2, 1190, 0.0, 0.0, 0.0);
		new kom[256], przelew[256];
		format(przelew, sizeof(przelew), "[RESET] Gracz: %s (ID:%d) zresetowa³ gracza: %s (ID:%d)",ZmianaNicku(playerid), playerid, ZmianaNicku(playerid2), playerid2);
		KomunikatAdmin(1, przelew);
		format(kom, sizeof(kom), "Gracz: %s (ID:%d) zresetowa³ ciê na spawnpoint.",ZmianaNicku(playerid), playerid);
		SendClientMessage(playerid2, 0xDEDEDEFF, kom);
	}
    return 1;
}
CMD:aktualizacja(playerid, params[])
{
	if(UprawnieniaCEO(playerid, 0))
    {
		new tekst[256];
		if(sscanf(params, "s[256]", tekst))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby wykonaæ na wszystkich graczach aktualizacjê wpisz: /aktualizacja [tresc]", "Zamknij", "");
			return 1;
		}
		format(tekst, sizeof(tekst), "[[ %s: %s ]]", ImieGracza2(playerid), tekst);
		SendWrappedMessageToAll(0xff99ccFF, tekst);
		new przeladowanograczy = 0;
		aktualizacja = 60;
		ForeachEx(id, MAX_PLAYERS)
		{
			if(IsPlayerConnected(id))
			{
				if(zalogowany[id] == true)
				{
					SendClientMessage(id, 0xff99ccFF, "System zapisze twoj¹ pozycjê za pomoc¹ /qs - wiêcej informacji znajdziesz w zak³adce Zmiany na forum ls-life.pl");
					przeladowanograczy++;
				}
			}
		}
		printf("System aktualizacji przeladowal %d graczy oraz zapisal ich pozycje.", przeladowanograczy);
	}
	return 1;
}
CMD:azabierz(playerid, params[])
{
	if(UprawnieniaGMa(playerid, 4))
	{
		new playerid2;
		if(sscanf(params, "d", playerid2))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "{DEDEDE}Aby zabraæ graczu{DEDEDE} przedmiot wpisz: /azabierz [id gracza]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "{DEDEDE}Gracz któremu chcesz zabraæ przedmiot{DEDEDE} nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		if(playerid == playerid2) return 1;
		SetPVarInt(playerid, "IDZAB", playerid2);
		Przedmioty(playerid, playerid2, DIALOG_ZABIERZ, GUIOPIS "Przedmioty:", TYP_WLASCICIEL, 0);
		return 1;
	}
	return 1;
}
CMD:setcash(playerid, params[])
{
    if(UprawnieniaCEO(playerid, 0))
	{
		new playerid2, ilosc;
		if(sscanf(params, "id", playerid2, ilosc))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ graczu dan¹ iloœæ pieni¹dzy wpisz: /setcash [id gracza] [iloœæ]", "Zamknij", "");
			return 1;
		}
	    if(zalogowany[playerid2] == false)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz nadaæ pieni¹dze nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
		Dodajkase(playerid2, ilosc);
		PlayerPlaySound(playerid, 1190, 0.0, 0.0, 0.0);
		PlayerPlaySound(playerid2, 1190, 0.0, 0.0, 0.0);
		return 1;
	}
    return 1;
}
CMD:sethp(playerid, params[])
{
    if(UprawnieniaGMa(playerid, 1))
	{
		new playerid2, ilosc;
		if(sscanf(params, "id", playerid2, ilosc))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "{DEDEDE}Aby nadaæ graczu{DEDEDE} HP wpisz: /sethp [id gracza] [iloœæ]", "Zamknij", "");
			return 1;
		}
	    if(ilosc <= 100)
		{
			UstawHP(playerid2, ilosc);
			SetPlayerDrunkLevel(playerid2, 0);
			PlayerPlaySound(playerid, 1190, 0.0, 0.0, 0.0);
			PlayerPlaySound(playerid2, 1190, 0.0, 0.0, 0.0);
		}
	}
    return 1;
}
CMD:freeze(playerid, params[])
{
    if(UprawnieniaGMa(playerid, 4))
	{
		new playerid2, ilosc, kom[124];
		if(sscanf(params, "id", playerid2, ilosc))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ graczu Freeze wpisz: /freeze [id gracza] [0 - daje Freeze, 1 - daje UnFreeze]", "Zamknij", "");
			return 1;
		}
		RefreshNick(playerid2);
		Frezuj(playerid2, ilosc);
		if(ilosc == 1)
		{
		    format(kom, sizeof(kom), "Gracz %s dosta³ UnFreeze",ZmianaNicku(playerid2));
			SendClientMessage(playerid, 0xDEDEDEFF, kom);
			format(kom, sizeof(kom), "Dosta³eœ UnFreeze od %s",ZmianaNicku(playerid));
			SendClientMessage(playerid2, 0xDEDEDEFF, kom);
			return 1;
		}
		else if(ilosc == 0)
		{
		    format(kom, sizeof(kom), "Gracz %s dosta³ Freeze",ZmianaNicku(playerid2));
			SendClientMessage(playerid, 0xDEDEDEFF, kom);
			format(kom, sizeof(kom), "Dosta³eœ Freeze od %s",ZmianaNicku(playerid));
			SendClientMessage(playerid2, 0xDEDEDEFF, kom);
			return 1;
		}
	}
    return 1;
}

CMD:an(playerid, cmdtext[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
	{
		new	comm1[32], comm2[128];
		if(sscanf(cmdtext, "s[32]S()[128]", comm1, comm2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/an [stworz, usun]", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"stworz",true))
		{
		    new Typ, Model, Stan;
			if(sscanf(comm2, "ddd", Typ, Model, Stan))
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby stworzyæ nasiono wpisz: /an stworz [typ] [model] [stan]", "Zamknij", "");
				return 1;
			}
			new Float: X, Float: Y, Float: Z;
			GetPlayerPos(playerid, X, Y, Z);
			new IleDni = 2;
			new Czas = (gettime()+CZAS_LETNI)+(86400*IleDni);
			ZasadzNasiono(playerid, X, Y, Z, Typ, Czas, Model, Stan);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Stworzy³eœ w³aœnie nasiono, dbaj o nie podlewaj¹c je!", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"usun",true))
		{
		    new id;
			if(sscanf(comm2, "d", id))
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby usun¹æ nasiono wpisz: /an usun [ID]", "Zamknij", "");
				return 1;
			}
			UsunNasiono(id);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Usun¹³eœ nasiono!", "Zamknij", "");
			return 1;
		}
	}
	return 1;
}
CMD:dodajkopie(playerid, cmdtext[])
{
	new wersja;
	if(sscanf(cmdtext, "d", wersja))
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "By dodaæ interior wpisz /dodajkopie [wersja]", "Zamknij", "");
		return 1;
	}
	new uid = GetPlayerVirtualWorld(playerid);
	if(uid != 0)
	{
		DodajInterior(playerid, wersja, uid);
	}
	else
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Nie mo¿esz tego zrobiæ na zewn¹trz budynku!", "Zamknij", "");
		return 0;
	}
	return 1;
}
CMD:kopiuj(playerid, cmdtext[])
{
	new uid = GetPlayerVirtualWorld(playerid);
	if(uid != 0)
	{
		KopiujInteror(uid, playerid);
	}
	else
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Nie mo¿esz tego zrobiæ na zewn¹trz budynku!", "Zamknij", "");
		return 0;
	}
	return 1;
}
CMD:ap(playerid, cmdtext[])
{
	//printf("U¿yta komenda duty");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCMa(playerid, 3))
	{
		new	comm1[32], comm2[128];
		if(sscanf(cmdtext, "s[32]S()[128]", comm1, comm2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/ap [stworz, zabierz]", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"stworz",true))
		{
		    new typ, war1, war2, name[32], waga;
			if(sscanf(comm2, "dddds[32]", typ, war1, war2, waga, name))
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby stworzyæ przedmiot wpisz: /ap stworz [rodzaj] [wartosc1] [wartosc2] [wartosc4] [nazwa]", "Zamknij", "");
				return 1;
			}
			if(antyst(name))
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "W nazwie u¿y³eœ niedowolonych znaków takich jak:\n{FF0000}; : ' *\n{DEDEDE}Zmieñ je i¿ s¹ one niedowozolone.", "Zamknij", "");
				return 1;
			}
			DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, typ, war1, war2, name, DaneGracza[playerid][gUID], waga, -1, 0, 0, 0, 0, "");
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Stworzy³eœ w³aœnie przedmiot, który znajduje siê na twojej liœcie przedmiotów!/nWpisz /p by wybraæ przedmiot z listy.", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"zabierz", true))
		{
			new playerid2;
			if(sscanf(comm2, "d", playerid2))
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zabraæ graczu przedmiot wpisz /ap zabierz [id gracza]", "Zamknij", "");
				return 1;
			}
			if(zalogowany[playerid2] == false)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz zabraæ przedmiot nie jest zalogowany.", "Zamknij", "");
				return 1;
			}
			if(playerid == playerid2) return 1;
			SetPVarInt(playerid, "IDZAB", playerid2);
			Przedmioty(playerid, playerid2, DIALOG_ZABIERZ, GUIOPIS "Przedmioty:", TYP_WLASCICIEL, 0);
			return 1;
		}
		else if(!strcmp(comm1,"usun", true))
		{
			new uid;
			if(sscanf(comm2, "d", uid))
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby usun¹æ przedmiot wpisz: /ap usun [uid przedmiotu]", "Zamknij", "");
				return 1;
			}
			new tekst[256];
			format(tekst, sizeof(tekst), "Usun¹³eœ przedmiot %s (%d)",PrzedmiotInfo[uid][pNazwa], PrzedmiotInfo[uid][pUID]);
			SendClientMessage(playerid, SZARY, tekst);
			UsunPrzedmiot(uid);
			return 1;
		}
	}
	return 1;
}

CMD:jochym(playerid, cmdtext[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCEO(playerid, 0))
	{
	    new	comm1[32], comm2[128];
		if(sscanf(cmdtext, "s[32]S()[128]", comm1, comm2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/jochym [kamera, sms, postac]", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"kamera",true))
		{
		    new Float: x, Float: y, Float: z, Float: lx, Float: ly, Float: lz, vw, interior;
			if(sscanf(comm2, "ffffffdd", x, y, z, lx, ly, lz, vw, interior))
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby stworzyæ widok /jochym kamera [x] [y] [z] [lx] [ly] [lz] [vw] [interior]", "Zamknij", "");
				return 1;
			}
			//spawn korty
			//720.815673, -1278.987670, 18.9
			//837.484130, -1373.533935, 12.546875
			//0 0
			SetPlayerCameraPos(playerid, x, y, z);
			SetPlayerCameraLookAt(playerid, lx, ly, lz);
			SetPlayerVirtualWorld(playerid, vw);
			SetPlayerInterior(playerid, interior);
			return 1;
		}
		else if(!strcmp(comm1,"sms",true))
		{
			ZaladujSMS();
			new found = 0;
			strdel(tekst_global, 0, 2048);
			format(tekst_global, sizeof(tekst_global), "ID\tNumer\tTresc\tOtrzymano", tekst_global);
		    ForeachEx(i, MAX_TATO)
			{
				if(SMSY[i][sNUMER2] == DaneGracza[playerid][gTelefon])
				{
					format(tekst_global, sizeof(tekst_global), "%s\n%d\t%d\t%s\t%d.%d.%dr %d:%d", tekst_global, SMSY[i][sID], SMSY[i][sNUMER1], SMSY[i][sTRESC], SMSY[i][sDzien], SMSY[i][sMiesiac], SMSY[i][sRok], SMSY[i][sGodzina], SMSY[i][sMinuta]);
					found++;
				}
			}
			if(found != 0) dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_TABLIST_HEADERS, GUIOPIS "Skrynka odbiorcza:", tekst_global, "Zamknij", "");
			else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Twoja skrzynka odbiorcza jest pusta.", "Rozumiem", "Zamknij");
			return 1;
		}
		else if(!strcmp(comm1,"opisy",true))
		{
		    ZaladujOpisy();
			new found = 0;
			strdel(tekst_global, 0, 2048);
			format(tekst_global, sizeof(tekst_global), "ID\tOpis gracza");
		    ForeachEx(i, MAX_OPISY)
			{
				if(Opisy[i][opUID] == DaneGracza[playerid][gUID])
				{
					format(tekst_global, sizeof(tekst_global), "%s\n%d\t%s", tekst_global, Opisy[i][opID], Opisy[i][opOpis]);
					found++;
				}
			}
			if(found != 0) dShowPlayerDialog(playerid, DIALOG_OPISY, DIALOG_STYLE_TABLIST_HEADERS, GUIOPIS "Lista opisów:", tekst_global, "Wybierz", "Anuluj");
			else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Nie posiadasz ¿adnego opisu.", "Rozumiem", "");
			return 1;
		}
		else if(!strcmp(comm1,"postac", true))
		{
			DaneGracza[playerid][gLogin] = 1;
			ZapiszGracza(playerid);
			Relog[playerid] = 1;
		    new IP[16], sql1[370];
			GetPlayerIp(playerid, IP, sizeof(IP));
		    new found = 0;
			strdel(tekst_global, 0, 4048);
			format(tekst_global, sizeof(tekst_global), "UID\tImie i nazwisko\tCzas gry", tekst_global);
		    ForeachEx(i, MAX_POSTACI)
			{
			    new IPI[16], namei[100], online;
				format(sql1, sizeof(sql1), "SELECT `IP`, `name`, `CZAS_ONLINE` FROM `jochym_postacie` WHERE `ID` = '%d' LIMIT 1", i);
				mysql_query(sql1);
				mysql_store_result();
			    mysql_fetch_row(sql1);
			    sscanf(sql1, "p<|>s[16]s[100]d", IPI, namei, online);
			    new imien[50], nazwisko[50], tekst_global1[50];
				sscanf(namei, "p<_>s[50]s[50]",imien,nazwisko);
				imien[0] = toupper(imien[0]);
				nazwisko[0] = toupper(nazwisko[0]);
				format(tekst_global1, sizeof(tekst_global1), "%s %s", imien,nazwisko);
				if(!strcmp(IP, IPI, true))
				{
				    new hours, minutes;
				    hours 	= online / 3600;
					minutes = (online - (hours * 3600)) / 60;
					format(tekst_global, sizeof(tekst_global), "%s\n%d\t%s\t%dh %dmin", tekst_global, i, tekst_global1, hours, minutes);
					found++;
				}
			}
			format(tekst_global, sizeof(tekst_global), "%s\n----", tekst_global);
			format(tekst_global, sizeof(tekst_global), "%s\n	Powy¿sze postacie moga byæ Twoje. Wybierz t¹, któr¹ chcesz graæ", tekst_global);
			format(tekst_global, sizeof(tekst_global), "%s\n	lub naciœnij drugi przycisk by przejœ do menu zmiany nicku.", tekst_global);
			format(tekst_global, sizeof(tekst_global), "%s\n\n•            Nie masz jeszcze w³aœnej postaci na "STRONAWWW"!", tekst_global);
			format(tekst_global, sizeof(tekst_global), "%s\n\n•            Zminimalizuj grê i wejdŸ na forum "STRONAWWW"!", tekst_global);
			if(found != 0)
			{
				dShowPlayerDialog(playerid, DIALOG_NICK2, DIALOG_STYLE_TABLIST_HEADERS, "Czy któraœ z tych postaci jest Twoja?", tekst_global, "Zaloguj", "Zmien nick");
			}
			else
			{
			    new str2[512];
				format(str2, sizeof(str2), "{9DB6D3}Witaj na "PROJEKT", nowym innowacyjnym w pe³ni rozwijaj¹cym siê serwerze!\nOd 2016 roku pracowaliœmy nad stworzeniem miejsca dla graczy na serwerze oraz forum, od tamtego czasu..\n[...] zdo³aliœmy zakodowaæ o wiele wiêcej ni¿ konkurencja a to dopiero pocz¹tek naszej przygody!\n\n");
				format(str2, sizeof(str2), "%s\t{9DB6D3}Poni¿ej wpisz inny nick postaci, by póŸniej zalogowaæ siê na ni¹!\n\tPamiêtaj o formacie: {FFFFFF}Imie_Nazwisko{9DB6D3}!\n\tJe¿eli nie posiadasz postaci to za³ó¿ j¹ na forum {FFFFFF}"STRONAWWW"{9DB6D3}.", str2);
				dShowPlayerDialog(playerid, DIALOG_NICK, DIALOG_STYLE_INPUT, GUIOPIS "Informacja", str2, "Zmien", "Wyjdz");
			}
		}
	}
	return 1;
}
CMD:adrzwi(playerid, cmdtext[])
{
	if(UprawnieniaCMa(playerid, 3))
	{
		if(zalogowany[playerid] == false)
		{
			return 0;
		}
		if(DaneGracza[playerid][gBW] != 0)
		{
			return 0;
		}
		if(IsPlayerInAnyVehicle(playerid))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "TIP:", "Nie mo¿esz u¿yæ tej komendy, gdy znajdujesz siê w samochodzie!", "Rozumiem", "");
			return 1;
		}
		new	id;
		if(sscanf(cmdtext, "d", id))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/adrzwi [UID Drzwi] lub tworzenie drzwi /adrzwi -1", "Zamknij", "");
			return 1;
		}
		strdel(tekst_global, 0, 2048);
		strdel(tekst_globals, 0, 2048);
		if(id == -1)
		{
			strdel(tekst_global, 0, 2048);
			format(tekst_global, sizeof(tekst_global), "{a9c4e4}Podaj rodzaj.\n\tRodzaj: 0/1, gdzie 0 to dom, a 1 to biznes.\n\nPAMIÊTAJ, musisz stac twarz¹ do budynku - miejsce, w którym stoisz stanie siê wejœciem.\nFormat: (rodzaj - 0/1)\n{FF0000}Uwaga: Tworzenie budynków w miejsach, w których nie ma drzwi,\nbêdzie karane skasowaniem budynku bez zwrotu pieniêdzy.");
			dShowPlayerDialog(playerid,DIALOG_DRZWI_STWORZ_ADM,DIALOG_STYLE_INPUT,"• Drzwi:",tekst_global,"Stworz","Anuluj");
			return 1;
		}
		else
		{
			if(ZarzadzanieBudynkiem(id, playerid))
			{
				strdel(tekst_global, 0, 2048);
				SetPVarInt(playerid, "uiddrzwi", id);
				new rok, miesiac, dzien, godzina, minuta, sekunda;
				sekundytodata(BudynekInfo[id][nOplata], rok, miesiac, dzien, godzina, minuta, sekunda);
				format(tekst_global, sizeof(tekst_global), "Meble: %d/%d    Metry: %.2f m2    Op³ata do: %02d-%02d-%d, %02d:%02d\n", BudynekInfo[id][nStworzoneObiekty],BudynekInfo[id][nLiczbaMebli]+BudynekInfo[id][nStworzoneObiekty], BudynekInfo[id][nPowieszchnia], dzien, miesiac, rok, godzina, minuta);
				format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}P{FFFFFF}oka¿ informacje", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}P{FFFFFF}rzypisz obiekty do budynku", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}Z{FFFFFF}mieñ wyœwietlan¹ nazwe budynku", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}E{FFFFFF}dytuj wewnêtrzn¹ pozycje budynku", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}E{FFFFFF}dytuj wymiary wnêtrza", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}D{FFFFFF}okup metra¿ do budynku {FF0000}(NOWE)", tekst_global);
				if(BudynekInfo[id][nPrzejazd] == 0)
					format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}W{FFFFFF}³¹cz przejazd pojazdami", tekst_global);
				else
					format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}W{FFFFFF}y³¹cz przejazd pojazdami", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}P{FFFFFF}rzepisz budynek pod grupê", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{000000}-------------------------------------------------------", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}S{FFFFFF}przedaj budynek graczu", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}U{FFFFFF}suñ wszystkie obiekty", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}U{FFFFFF}suñ ostatnio stworzony obiekt", tekst_global);
				if(BudynekInfo[id][nLiczbaNapisow] == 0)
				{
					format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}Z{FFFFFF}a³ó¿ licznik energii elektrycznej", tekst_global);
				}
				else
				{
					format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}T{FFFFFF}en budynek posiada licznik energii", tekst_global);
				}
				format(tekst_global, sizeof(tekst_global), "%s\n{000000}-------------------------------------------------------", tekst_global);
				if(BudynekInfo[id][nAudio] == -1)
				{
					format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}Z{FFFFFF}akup system audio do budynku (2500$)", tekst_global);
				}
				else if(BudynekInfo[id][nAudio] == 0)
				{
					format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}W{FFFFFF}³ó¿ p³yte do systemu audio", tekst_global);
				}
				else if(BudynekInfo[id][nAudio] == 1)
				{
					format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}W{FFFFFF}y³¹cz p³ytê w systemie audio", tekst_global);
				}
				if(BudynekInfo[id][nSzafa] == -1)
				{
					format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}Z{FFFFFF}akup szafê do budynku (2000$)", tekst_global);
				}
				else if(BudynekInfo[id][nSzafa] == 0)
				{
					format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}Z{FFFFFF}ajrzyj do szafy", tekst_global);
				}
				format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}U{FFFFFF}kryj pickup budynku", tekst_global);
				if(BudynekInfo[id][nTyp] == 0)
				{
					format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}W{FFFFFF}ynajmij mieszkanie", tekst_global);
				}
				else
				{
					if(GrupaInfo[BudynekInfo[id][nWlascicielD]][gTyp] == DZIALALNOSC_HOTEL || BudynekInfo[id][nTyp] == 20)
					{
						format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}Z{FFFFFF}staw cene wynajmu pokoju", tekst_global);
					}
				}
				if(BudynekInfo[id][nTyp] == 0)
				{
					format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}L{FFFFFF}ista najemców", tekst_global);
				}
				strdel(tekst_globals, 0, 2048);
				format(tekst_globals, sizeof(tekst_globals), GUIOPIS"%s", BudynekInfo[id][nAdres]);

				dShowPlayerDialog(playerid, DIALOG_DRZWI_OPCJE, DIALOG_STYLE_TABLIST_HEADERS, tekst_globals, tekst_global, "Wybierz", "Zamknij");
				return 1;
			}
			else
			{
				SetPVarInt(playerid, "uiddrzwi", id);
				format(tekst_global, sizeof(tekst_global), "%s\n»  {FFE5B4}P{FFFFFF}oka¿ informacje", tekst_global);
				if(BudynekInfo[id][nUkryty] == 0)
				{
					format(tekst_global, sizeof(tekst_global), "%s\n»  {FFE5B4}O{FFFFFF}chrona: Brak", tekst_global);
				}
				else
				{
					format(tekst_global, sizeof(tekst_global), "%s\n»  {FFE5B4}O{FFFFFF}chrona: %s", tekst_global, GrupaInfo[BudynekInfo[id][nUkryty]][gNazwa]);
				}
				if(GetPlayerVirtualWorld(playerid) == 0)
				{
					format(tekst_global, sizeof(tekst_global), "%s\n»  {FFE5B4}Z{FFFFFF}adzwoñ do drzwi", tekst_global);
				}
				if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_MAFIE || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_GANGI)
				{
					format(tekst_global, sizeof(tekst_global), "%s\n»  {FFE5B4}W{FFFFFF}ywa¿ drzwi budynku", tekst_global);
				}
				new rok, miesiac, dzien, godzina, minuta, sekunda;
				sekundytodata(BudynekInfo[id][nOplata], rok, miesiac, dzien, godzina, minuta, sekunda);
				format(tekst_globals, sizeof(tekst_globals), "• Drzwi %s (%.2f m2) : (Op³ata do: %02d-%02d-%d, %02d:%02d)", BudynekInfo[id][nAdres], BudynekInfo[id][nPowieszchnia], dzien, miesiac, rok, godzina, minuta);
				dShowPlayerDialog(playerid, DIALOG_DRZWI_OPCJE2, DIALOG_STYLE_LIST, tekst_globals, tekst_global, "Wybierz", "Zamknij");
			}
		}
	}
	else
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "TIP:", "Nie masz uprawnieñ do tej komendy!", "Rozumiem", "");
		return 1;
	}
    return 1;
}
CMD:av(playerid, cmdtext[])
{
	//printf("U¿yta komenda duty");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCMa(playerid, 0))
	{
		new	comm1[32], comm2[128];
		if(sscanf(cmdtext, "s[32]S()[128]", comm1, comm2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/av [stworz, spawn, usun, tuning, kolor, paliwo, przypisz, reset, unspawn, goto, kierowca, blokada]", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"stworz",true))
		{
		    new typ, war1, war2, paliwo;
			if(sscanf(comm2, "dddd", typ, war1, war2, paliwo))
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby stworzyæ pojazd wpisz: /av stworz [model] [kolor1] [kolor2] [paliwo]", "Zamknij", "");
				return 1;
			}
			if(typ >= 400 || typ <= 611)
			{
				new Float:x,Float:y,Float:z;
				GetPlayerPos(playerid,x,y,z);
				new typ_poj = 0;
				DodajPojazd(DaneGracza[playerid][gUID], typ, war1, war2, x, y, z, paliwo, 0, typ_poj);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Stworzy³eœ w³aœnie pojazd, który znajduje siê na twojej liœcie pojazdów!\nWpisz /v by zespawnowaæ pojazd.", "Zamknij", "");
				return 1;
			}
			else
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Niepoprawy model pojazdu, sprawdŸ listê pojazdów SA:MP Wiki", "Zamknij", "");
				return 0;
			}
		}
		else if(!strcmp(comm1,"usun",true))
		{
			if(UprawnieniaAdministratora(playerid, 0))
			{
				new uid;
				if(sscanf(comm2, "d", uid))
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "{DEDEDE}/av usun [UID pojazdu]", "Zamknij", "");
					return 1;
				}
				UsunPojazd(uid);
				return 1;
			}
		}
		else if(!strcmp(comm1,"tuning",true))
		{
		    new id;
			if(sscanf(comm2, "d", id))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby usun¹æ graczu tuning: /av tuning [ID nie UID!] ", "Zamknij", "");
				return 1;
			}
		    UsunCalyTuningZPojazdu(id);
		    Tuning(id);
			return 1;
		}
		else if(!strcmp(comm1,"blokada",true))
		{
			new uid, ilosc;
			if(sscanf(comm2, "dd", uid, ilosc))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ graczu blokade: /av blokada [UID] [Cena za blokade lub 0 by j¹ zdj¹æ!]", "Zamknij", "");
				return 1;
			}
			PojazdInfo[uid][pBlokada] = ilosc;
			ZapiszPojazd(uid, 1);
			return 1;
		}
		else if(!strcmp(comm1,"nitro",true))
		{
			new uid, Float:ilosc;
			if(sscanf(comm2, "df", uid, ilosc))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ graczu nitro: /av nitro [UID] [Iloœæ nitra]", "Zamknij", "");
				return 1;
			}
			PojazdInfo[uid][pPaliwoGaz] = ilosc;
			ZapiszPojazd(uid, 1);
			return 1;
		}
		else if(!strcmp(comm1,"boost",true))
		{
			new uid, Float:ilosc;
			if(sscanf(comm2, "df", uid, ilosc))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ graczu boosta dla pojazdu: /av boost [UID] [Iloœæ boosta]", "Zamknij", "");
				return 1;
			}
			if(ilosc > 100 && ilosc < 0)
			{
			    return 0;
			}
			PojazdInfo[uid][pBoost] = ilosc;
			ZapiszPojazd(uid, 1);
			return 1;
		}
		else if(!strcmp(comm1,"paliwo",true))
		{
			new uid, ilosc;
			if(sscanf(comm2, "dd", uid, ilosc))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ graczu paliwo: /av paliwo [UID] [Iloœæ paliwa]", "Zamknij", "");
				return 1;
			}
			if(ilosc > 100 && ilosc < 0)
			{
			    return 0;
			}
			PojazdInfo[uid][pPaliwo] = ilosc;
			ZapiszPojazd(uid, 1);
			return 1;
		}
		else if(!strcmp(comm1,"reset",true))
		{
		    new id;
			if(sscanf(comm2, "d", id))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ graczu reset: /av reset [UID] ", "Zamknij", "");
				return 1;
			}
			PojazdInfo[id][pSpawn] = 0;
			UsunPojazdUID(id);
			return 1;
		}
		else if(!strcmp(comm1,"kolor",true))
		{
		    new uid, kolor1, kolor2;
			if(sscanf(comm2, "ddd", uid, kolor1, kolor2))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ pojazdu kolor: /av kolor [UID] [kolor1] [kolor2]", "Zamknij", "");
				return 1;
			}
			PojazdInfo[uid][pKolor] = kolor1;
			PojazdInfo[uid][pKolor2] = kolor2;
			ZapiszPojazd(uid, 1);
			ZapiszPojazd(uid, 2);
		    ChangeVehicleColor(PojazdInfo[uid][pUID], PojazdInfo[uid][pKolor], PojazdInfo[uid][pKolor2]);
		}
		else if(!strcmp(comm1,"unspawn",true))
		{
		    new id;
			if(sscanf(comm2, "d", id))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ graczu unspawn: /av unspawn [UID] ", "Zamknij", "");
				return 1;
			}
			if(PojazdInfo[id][pSpawn] == 0)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Ten pojazd jest ju¿ odspawnowany!", "Zamknij", "");
				return 0;
			}
		    PojazdInfo[id][pPrzepchany] = 1;
			PojazdInfo[id][pSpawn] = 0;
			UsunPojazdUID(id);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Pojazd zosta³ odspawnowany poprawnie!", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"spawn",true))
		{
		    new id;
			if(sscanf(comm2, "d", id))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ graczu unspawn: /av spawn [UID] ", "Zamknij", "");
				return 1;
			}
			if(PojazdInfo[id][pSpawn] == 1)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Ten pojazd jest ju¿ zespawnowany!", "Zamknij", "");
				return 0;
			}
			PojazdInfo[id][pSpawn] = 1;
			StworzPojazdUID(id);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Pojazd zosta³ zespawnowany poprawnie!", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"goto",true))
		{
		    new uid;
			if(sscanf(comm2, "d", uid))
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby teleportowaæ siê do pojazdu wpisz: /av goto [uid pojazdu]", "Zamknij", "");
				return 1;
			}
			if(PojazdInfo[uid][pSpawn] == 0)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Ten pojazd nie zosta³ zespawnowany, wiêc nie mo¿esz siê do niego teleportowaæ!", "Zamknij", "");
				return 0;
			}
			new Float:X, Float:Y, Float:Z;
			GetVehiclePos(PojazdInfo[uid][pID], X, Y, Z);
			Teleportuj(playerid, X, Y, Z);
			SetPlayerVirtualWorld(playerid, GetVehicleVirtualWorld(PojazdInfo[uid][pID]));
			return 1;
		}
		else if(!strcmp(comm1,"kierowca",true))
		{
		    new uid;
			if(sscanf(comm2, "d", uid))
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby teleportowaæ siê do pojazdu ma miejsce kierowcy wpisz: /av kierowca [uid pojazdu]", "Zamknij", "");
				return 1;
			}
			if(PojazdInfo[uid][pSpawn] == 0)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Ten pojazd nie zosta³ zespawnowany, wiêc nie mo¿esz siê do niego teleportowaæ!", "Zamknij", "");
				return 0;
			}
			PutPlayerInVehicle(playerid, PojazdInfo[uid][pID], 0);
			return 1;
		}
	}
	return 1;
}
CMD:az(playerid, cmdtext[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCMa(playerid, 0))
	{
		new	comm1[32], comm2[128];
		if(sscanf(cmdtext, "s[32]S()[128]", comm1, comm2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/az [stworz, usun]", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"usun",true))
		{
			if(UprawnieniaCEO(playerid, 0))
			{
				new id;
				if(sscanf(comm2, "d", id))
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby usun¹æ zlom wpisz: /az usun [ID Zlomu]", "Zamknij", "");
					return 1;
				}
				UsunZlom(id);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Miejsce dla pracy z³omiarza o podanym ID zosta³o poprawnie usuniête.", "Zamknij", "");
				return 1;
			}
		}
		else if(!strcmp(comm1,"stworz",true))
		{
			if(UprawnieniaCEO(playerid, 0))
			{
				new Float:X, Float:Y, Float:Z;
				GetPlayerPos(playerid, X, Y, Z);
				StworzZlom(playerid, X, Y, Z);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Miejsce dla pracy z³omiarza zosta³o stworzone poprawnie.", "Zamknij", "");
				return 1;
			}
		}
	}
	return 1;
}
CMD:ar(playerid, cmdtext[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCMa(playerid, 0))
	{
		new	comm1[32], comm2[128];
		if(sscanf(cmdtext, "s[32]S()[128]", comm1, comm2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/ar [stworz, usun]", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"usun",true))
		{
			if(UprawnieniaCEO(playerid, 0))
			{
				new id;
				if(sscanf(comm2, "d", id))
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby usun¹æ rybaka wpisz: /ar usun [ID Rybak]", "Zamknij", "");
					return 1;
				}
				UsunRybak(id);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Miejsce dla pracy rybaka o podanym ID zosta³o poprawnie usuniête.", "Zamknij", "");
				return 1;
			}
		}
		else if(!strcmp(comm1,"stworz",true))
		{
			if(UprawnieniaCEO(playerid, 0))
			{
				new Float:X, Float:Y, Float:Z;
				GetPlayerPos(playerid, X, Y, Z);
				StworzRybak(playerid, X, Y, Z);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Miejsce dla pracy rybaka zosta³o stworzone poprawnie.", "Zamknij", "");
				return 1;
			}
		}
	}
	return 1;
}
CMD:ad(playerid, cmdtext[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCMa(playerid, 0))
	{
		new	comm1[32], comm2[128];
		if(sscanf(cmdtext, "s[32]S()[128]", comm1, comm2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/ad [usun, pickup, move, owner, oplac, oplacever, wyjscie, rabunek, goto, typ, usunintek]", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"usun",true))
		{
			if(UprawnieniaCEO(playerid, 0))
			{
				new doorid;
				if(sscanf(comm2, "d", doorid))
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby usun¹æ budynek wpisz: /ad usun [ID drzwi]", "Zamknij", "");
					return 1;
				}
				UsunNieruchomosc(doorid);
				return 1;
			}
		}
		else if(!strcmp(comm1,"usunintek",true))
		{
			if(UprawnieniaCEO(playerid, 0))
			{
				new doorid;
				if(sscanf(comm2, "d", doorid))
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby usun¹æ interior wpisz: /ad usunintek [ID drzwi]", "Zamknij", "");
					return 1;
				}
				SkasujIntek(doorid);
				return 1;
			}
		}
		else if(!strcmp(comm1,"rabunek",true))
		{
	        new uid, rabunek;
			if(sscanf(comm2, "dd", uid, rabunek))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zmieniæ Pickup budynku wpisz : /ad rabunek [UID] [0 - Brak mo¿liwoœci rabunku, 1 - Mo¿liwoœæ rabunku]", "Zamknij", "");
				return 1;
			}
			BudynekInfo[uid][nMapa] = rabunek;
			ZapiszNieruchomosc(uid);
			return 1;
		}
		else if(!strcmp(comm1,"metraz",true))
		{
	        new uid, Float:metraz;
			if(sscanf(comm2, "df", uid, metraz))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zmieniæ metraz budynku wpisz : /ad metraz [UID] [Metraz]", "Zamknij", "");
				return 1;
			}
            BudynekInfo[uid][nPowieszchnia] += metraz;
			ZapiszNieruchomosc(uid);
			return 1;
		}
		else if(!strcmp(comm1,"pickup",true))
		{
	        new uid, pickup;
			if(sscanf(comm2, "dd", uid, pickup))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zmieniæ Pickup budynku wpisz : /ad pickup [UID] [PICKUP]", "Zamknij", "");
				return 1;
			}
		    DestroyDynamicPickup(BudynekInfo[uid][nID]);
			BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = pickup;
			BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
            BudynekInfo[uid][nPickup] = pickup;
			ZapiszNieruchomosc(uid);
			return 1;
		}
		else if(!strcmp(comm1,"move",true))
		{
			new doorid;
			if(sscanf(comm2, "d", doorid))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby przenieœ pickup budynku wpisz: /ad move [id drzwi]", "Zamknij", "");
				return 1;
			}
			new Float:X, Float:Y, Float:Z, Float:Ang;
	  		GetPlayerPos(playerid, X, Y, Z);
	  		GetPlayerFacingAngle(playerid, Ang);
	  		BudynekInfo[doorid][nX] = X;
	  		BudynekInfo[doorid][nY] = Y;
	  		BudynekInfo[doorid][nZ] = Z;
	  		BudynekInfo[doorid][na] = Ang;
	  		BudynekInfo[doorid][nINT] = GetPlayerInterior(playerid);
	  		BudynekInfo[doorid][nVW] = GetPlayerVirtualWorld(playerid);
			BudynekInfo[doorid][nArea] = GraczNaTerenie(playerid);
			ZapiszNieruchomosc(doorid);
			DestroyDynamicPickup(BudynekInfo[doorid][nID]);
			BudynekInfo[doorid][nID] = CreateDynamicPickup(BudynekInfo[doorid][nPickup], 1, BudynekInfo[doorid][nX], BudynekInfo[doorid][nY], BudynekInfo[doorid][nZ], BudynekInfo[doorid][nVW]);
			return 1;
		}
		else if(!strcmp(comm1,"owner",true))
		{
	        new gracz, uid;
			if(sscanf(comm2, "di", uid, gracz))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zmieniæ Ownera budynku wpisz: /ad owner [uid budynku] [ID Gracza]", "Zamknij", "");
				return 1;
			}
			if(zalogowany[gracz] == false)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz daæ Ownera budynku jest Offline.", "Zamknij", "");
				return 0;
			}
		    BudynekInfo[uid][nWlascicielP] = DaneGracza[gracz][gUID];
			BudynekInfo[uid][nWlascicielD] = 0;
			ZapiszNieruchomosc(uid);
			return 1;
		}
		else if(!strcmp(comm1,"oplac",true))
		{
			new uid;
			if(sscanf(comm2, "d", uid))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby oferowaæ op³ate budynku graczu wpisz: /ad oplac [uid budynku]", "Zamknij", "");
				return 1;
			}
			BudynekInfo[uid][nOplata] = gettime()+(7*24*60*60);
			ZapiszNieruchomosc(uid);
			return 1;
		}
		else if(!strcmp(comm1,"oplacever",true))
		{
			new uid;
			if(sscanf(comm2, "d", uid))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby oferowaæ op³ate budynku graczu wpisz: /ad oplac [uid budynku]", "Zamknij", "");
				return 1;
			}
			BudynekInfo[uid][nOplata] = gettime()+(356*24*60*60);
			ZapiszNieruchomosc(uid);
			return 1;
		}
		else if(!strcmp(comm1,"wyjscie",true))
		{
			new doorid;
			if(sscanf(comm2, "d", doorid))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby przenieœæ drzwi wyjœciowe (wew.) budynku wpisz: /ad wyjscie [UID]", "Zamknij", "");
				return 1;
			}
   			new Float:X, Float:Y, Float:Z, Float:Ang;
	  		GetPlayerPos(playerid, X, Y, Z);
	  		GetPlayerFacingAngle(playerid, Ang);
	  		BudynekInfo[doorid][nXW] = X;
     		BudynekInfo[doorid][nYW] = Y;
	  		BudynekInfo[doorid][nZW] = Z;
	  		BudynekInfo[doorid][naw] = Ang;
	  		BudynekInfo[doorid][nINTW] = GetPlayerInterior(playerid);
	  		BudynekInfo[doorid][nVWW] = GetPlayerVirtualWorld(playerid);
			ZapiszNieruchomosc(doorid);
			return 1;
		}
		else if(!strcmp(comm1,"typ",true))
		{
			new doorid, typ;
			if(sscanf(comm2, "dd", doorid, typ))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zmieniæ typ drzwi: /ad typ [UID] [Typ]", "Zamknij", "");
				return 1;
			}
	  		BudynekInfo[doorid][nTyp] = typ;
			ZapiszNieruchomosc(doorid);
			return 1;
		}
		else if(!strcmp(comm1,"goto",true))
		{
		    new playerid2;
			if(sscanf(comm2, "i", playerid2))
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby teleportowaæ siê do budynku wpisz: /ad goto [uid budynku]", "Zamknij", "");
				return 1;
			}
			SetPlayerVirtualWorld(playerid, BudynekInfo[playerid2][nVW]);
			TogglePlayerSpectating(playerid, 0);
			SetCameraBehindPlayer(playerid);
			if(IsPlayerInAnyVehicle(playerid))
			{
				SetVehiclePos(GetPlayerVehicleID(playerid), BudynekInfo[playerid2][nX], BudynekInfo[playerid2][nY], BudynekInfo[playerid2][nZ]);
			}
			else
			{
				Teleportuj(playerid, BudynekInfo[playerid2][nX], BudynekInfo[playerid2][nY], BudynekInfo[playerid2][nZ]);
			}
			SetPlayerVirtualWorld(playerid, BudynekInfo[playerid2][nVW]);
			SetPlayerInterior(playerid, BudynekInfo[playerid2][nINT]);
			return 1;
		}
	}
	return 1;
}
/*CMD:dynamicarea(playerid, params[])
{
       	new Float:minx = 300;
        new Float:miny = 400;
        new Float:maxx = 3000;
        new Float:maxy = 3000, i, areaid, y = 0, z = 0, f = 0, d = 1, g = 1;

        for(new x; x != 729; x++)
        {
                if(y == 27)
                {
                    z++;
                    g++;
                    d = 1;
                    f = 0;
                    y = 0;
                }
                minx = 300+(f*100);
                maxx = 3000+(f*100);
                miny = 400+(z*100);
                maxy = 3000+(z*100);
                y++;
                f++;
                CreateDynamicRectangle(minx, miny, maxx, maxy, -1, -1, -1);
                areaid = GangZoneCreate(minx, miny, maxx, maxy);
                GangZoneShowForPlayer(playerid, areaid, 0xFFFF0096);
                new astr[1048];
				format(astr, sizeof(astr), "INSERT INTO `jochym_tereny`(`X`, `XX`, `Y`, `YY`) VALUES ('%f', '%f', '%f', '%f')", minx, maxx, miny, maxy);
				mysql_check();
				mysql_query2(astr);
				mysql_free_result();
                i++;
                d++;
        }
        printf("Utworzono %d stref.", i);
        return 1;
}*/
CMD:ag(playerid, cmdtext[])
{
	//printf("U¿yta komenda duty");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCMa(playerid, 3))
    {
		new	comm1[32], comm2[128], kom[256];
		if(sscanf(cmdtext, "s[32]S()[128]", comm1, comm2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/ag [stworz, lider, dodaj]", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"stworz",true))
		{
			new playerid2, typ, nazwa[32];
			if(sscanf(comm2, "ids[32]", playerid2, typ, nazwa))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby stworzyæ grupê wpisz /ag stworz [ID lidera] [typ] [nazwa (32 znaki)]", "Zamknij", "");
				return 1;
			}
			DodajGrupeLD(playerid2, nazwa, typ);
			if(DaneGracza[playerid2][gDzialalnosc1] == DaneGracza[playerid2][gGrupas] || DaneGracza[playerid2][gDzialalnosc2] == DaneGracza[playerid2][gGrupas] || DaneGracza[playerid2][gDzialalnosc3] == DaneGracza[playerid2][gGrupas] || DaneGracza[playerid2][gDzialalnosc4] == DaneGracza[playerid2][gGrupas] || DaneGracza[playerid2][gDzialalnosc5] == DaneGracza[playerid2][gGrupas] || DaneGracza[playerid2][gDzialalnosc6] == DaneGracza[playerid2][gGrupas])
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Ten gracz nale¿y ju¿ do tej grupy!", "Zamknij", "");
				return 1;
			}
			if(DaneGracza[playerid2][gDzialalnosc1] == 0)
			{
			    DaneGracza[playerid2][gDzialalnosc1] = DaneGracza[playerid2][gGrupas];
			    DodajPracownika(DaneGracza[playerid2][gUID], DaneGracza[playerid2][gGrupas], 0, -1);
			    DodajLidera(DaneGracza[playerid2][gUID], DaneGracza[playerid2][gGrupas], -1);
				kolorchatu(playerid2, DaneGracza[playerid2][gGrupas], 1);
				return 1;
			}
			else if(DaneGracza[playerid2][gDzialalnosc2] == 0)
			{
			    DaneGracza[playerid2][gDzialalnosc2] = DaneGracza[playerid2][gGrupas];
				DodajPracownika(DaneGracza[playerid2][gUID], DaneGracza[playerid2][gGrupas], 0, -1);
				DodajLidera(DaneGracza[playerid2][gUID], DaneGracza[playerid2][gGrupas], -1);
				kolorchatu(playerid2, DaneGracza[playerid2][gGrupas], 2);
				return 1;
			}
			else if(DaneGracza[playerid2][gDzialalnosc3] == 0)
			{
	            DaneGracza[playerid2][gDzialalnosc3] = DaneGracza[playerid2][gGrupas];
				DodajPracownika(DaneGracza[playerid2][gUID], DaneGracza[playerid2][gGrupas], 0, -1);
				DodajLidera(DaneGracza[playerid2][gUID], DaneGracza[playerid2][gGrupas], -1);
				kolorchatu(playerid2, DaneGracza[playerid2][gGrupas], 3);
				return 1;
			}
			else if(DaneGracza[playerid2][gDzialalnosc4] == 0)
			{
	            DaneGracza[playerid2][gDzialalnosc4] = DaneGracza[playerid2][gGrupas];
				DodajPracownika(DaneGracza[playerid2][gUID], DaneGracza[playerid2][gGrupas], 0, -1);
				DodajLidera(DaneGracza[playerid2][gUID], DaneGracza[playerid2][gGrupas], -1);
				kolorchatu(playerid2, DaneGracza[playerid2][gGrupas], 4);
				return 1;
			}
			else if(DaneGracza[playerid2][gDzialalnosc5] == 0)
			{
	            DaneGracza[playerid2][gDzialalnosc5] = DaneGracza[playerid2][gGrupas];
				DodajPracownika(DaneGracza[playerid2][gUID], DaneGracza[playerid2][gGrupas], 0, -1);
				DodajLidera(DaneGracza[playerid2][gUID], DaneGracza[playerid2][gGrupas], -1);
				kolorchatu(playerid2, DaneGracza[playerid2][gGrupas], 5);
				return 1;
			}
			format(kom, sizeof(kom), "Stworzy³eœ grupê %s typu %d i nada³eœ lidera %s",nazwa, typ, ZmianaNicku(playerid2));
			SendClientMessage(playerid, 0xDEDEDEFF, kom);
			format(kom, sizeof(kom), "Nadano Ci grupê %s, od teraz jesteœ jej liderem!",nazwa);
			SendClientMessage(playerid2, 0xDEDEDEFF, kom);
			cmd_login(playerid2, "");
			return 1;
		}
		else if(!strcmp(comm1,"lider",true))
		{
			new playerid2, uid;
			if(sscanf(comm2, "id", playerid2, uid))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ lidera danej grupy wpisz /ag lider [ID lidera] [UID Grupy]", "Zamknij", "");
				return 1;
			}
			if(DaneGracza[playerid2][gDzialalnosc1] == uid || DaneGracza[playerid2][gDzialalnosc2] == uid || DaneGracza[playerid2][gDzialalnosc3] == uid || DaneGracza[playerid2][gDzialalnosc4] == uid || DaneGracza[playerid2][gDzialalnosc5] == uid)
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Ten gracz nale¿y ju¿ do tej grupy!", "Zamknij", "");
				return 1;
			}
			GrupaInfo[uid][gOwner] = DaneGracza[playerid2][gGUID];
			GrupaInfo[uid][gOwnerUID] = DaneGracza[playerid2][gUID];
			ZapiszLidera(uid);
			if(DaneGracza[playerid2][gDzialalnosc1] == 0)
			{
			    DaneGracza[playerid2][gDzialalnosc1] = uid;
			    DodajPracownika(DaneGracza[playerid2][gUID], uid, 0, -1);
			    DodajLidera(DaneGracza[playerid2][gUID], uid, -1);
				kolorchatu(playerid2, uid, 1);
				return 1;
			}
			else if(DaneGracza[playerid2][gDzialalnosc2] == 0)
			{
			    DaneGracza[playerid2][gDzialalnosc2] = uid;
				DodajPracownika(DaneGracza[playerid2][gUID], uid, 0, -1);
				DodajLidera(DaneGracza[playerid2][gUID], uid, -1);
				kolorchatu(playerid2, uid, 2);
				return 1;
			}
			else if(DaneGracza[playerid2][gDzialalnosc3] == 0)
			{
	            DaneGracza[playerid2][gDzialalnosc3] = uid;
				DodajPracownika(DaneGracza[playerid2][gUID], uid, 0, -1);
				DodajLidera(DaneGracza[playerid2][gUID], uid, -1);
				kolorchatu(playerid2, uid, 3);
				return 1;
			}
			else if(DaneGracza[playerid2][gDzialalnosc4] == 0)
			{
	            DaneGracza[playerid2][gDzialalnosc4] = uid;
				DodajPracownika(DaneGracza[playerid2][gUID], uid, 0, -1);
				DodajLidera(DaneGracza[playerid2][gUID], uid, -1);
				kolorchatu(playerid2, uid, 4);
				return 1;
			}
			else if(DaneGracza[playerid2][gDzialalnosc5] == 0)
			{
	            DaneGracza[playerid2][gDzialalnosc5] = uid;
				DodajPracownika(DaneGracza[playerid2][gUID], uid, 0, -1);
				DodajLidera(DaneGracza[playerid2][gUID], uid, -1);
				kolorchatu(playerid2, uid, 5);
				return 1;
			}
			format(kom, sizeof(kom), "Nada³eœ lidera %s, UID: %d", ZmianaNicku(playerid2), uid);
			SendClientMessage(playerid, 0xDEDEDEFF, kom);
			format(kom, sizeof(kom), "Nadano Ci lidera grupy UID: %d",uid);
			SendClientMessage(playerid2, 0xDEDEDEFF, kom);
			return 1;
		}
		else if(!strcmp(comm1,"dodaj",true))
		{
			new uid, gracz;
			if(sscanf(comm2, "dd", uid, gracz))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby dodaæ gracza do grupy wpisz: /ag dodaj [UID] [Id Gracza]", "Zamknij", "");
				return 1;
			}
			if(DaneGracza[gracz][gKONTO_W_BANKU] == 0)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz którego chcesz zaprosiæ nie posiada konta w banku.", "Zamknij", "");
				return 1;
			}
			Oferuj(playerid, gracz, DaneGracza[gracz][gUID], uid, DaneGracza[playerid][gPrzynaleznosci][0], -1, OFEROWANIE_INVITE, 0, "0|0", 0);
			return 1;
		}
		/*else if(!strcmp(comm1,"usun",true))
		{
			new uid, gracz;
			if(sscanf(comm2, "dd", uid, gracz))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby usun¹æ gracza z grupy wpisz: /ag usun [UID] [UID POSTACI]", "Zamknij", "");
				return 1;
			}
			UsunPracownika(uid, gracz, playerid);
			return 1;
		}*/
		else if(!strcmp(comm1,"lista",true))
		{
			new gracz;
			if(sscanf(comm2, "d", gracz))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby dodaæ gracza do grupy wpisz: /ag dodaj [UID] [Id Gracza]", "Zamknij", "");
				return 1;
			}
			if(DaneGracza[gracz][gKONTO_W_BANKU] == 0)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Gracz którego chcesz sprawdziæ nie posiada konta w banku!", "Zamknij", "");
				return 1;
			}
			new	dzg_lista[350], find;
			format(dzg_lista, sizeof(dzg_lista), "{848484}Slot\t{848484}UID\t{848484}Nazwa grupy\t{848484}Czas na s³u¿bie");
			if(DaneGracza[gracz][gDzialalnosc1] != 0)
			{
				new uid = DaneGracza[gracz][gDzialalnosc1];
				new wynik;
				wynik = GetPVarInt(gracz, "w1")+DaneGracza[gracz][gPrzynaleznosci][1];
				find = 1;
				if(DaneGracza[gracz][gSluzba] == uid)
				{
					format(dzg_lista, sizeof(dzg_lista), "%s\n{FF0033}%d{FFFFFF}\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
				}
				else
				{
					format(dzg_lista, sizeof(dzg_lista), "%s\n{FFFFFF}%d\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
				}
			}
			if(DaneGracza[gracz][gDzialalnosc2] != 0)
			{
				new uid = DaneGracza[gracz][gDzialalnosc2];
				new wynik;
				wynik = GetPVarInt(gracz, "w2")+DaneGracza[gracz][gPrzynaleznosci][7];
				find = 2;
				if(DaneGracza[gracz][gSluzba] == uid)
				{
					format(dzg_lista, sizeof(dzg_lista), "%s\n{FF0033}%d{FFFFFF}\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
				}
				else
				{
					format(dzg_lista, sizeof(dzg_lista), "%s\n{FFFFFF}%d\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
				}
			}
			if(DaneGracza[gracz][gDzialalnosc3] != 0)
			{
				new uid = DaneGracza[gracz][gDzialalnosc3];
				new wynik;
				wynik = GetPVarInt(gracz, "w3")+DaneGracza[gracz][gPrzynaleznosci][13];
				find = 3;
				if(DaneGracza[gracz][gSluzba] == uid)
				{
					format(dzg_lista, sizeof(dzg_lista), "%s\n{FF0033}%d{FFFFFF}\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
				}
				else
				{
					format(dzg_lista, sizeof(dzg_lista), "%s\n{FFFFFF}%d\t%d\t%s\t%dmin", dzg_lista, find, GrupaInfo[uid][gUID], GrupaInfo[uid][gNazwa], wynik / 60);
				}
			}
			if(DaneGracza[gracz][gDzialalnosc4] != 0)
			{
				new uid = DaneGracza[gracz][gDzialalnosc4];
				new wynik;
				wynik = GetPVarInt(gracz, "w4")+DaneGracza[gracz][gPrzynaleznosci][19];
				find = 4;
				if(GraczPremium(gracz))
				{
					if(DaneGracza[gracz][gSluzba] == uid)
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
			if(DaneGracza[gracz][gDzialalnosc5] != 0)
			{
				new uid = DaneGracza[gracz][gDzialalnosc5];
				new wynik;
				wynik = GetPVarInt(gracz, "w5")+DaneGracza[gracz][gPrzynaleznosci][25];
				find = 5;
				if(GraczPremium(gracz))
				{
					if(DaneGracza[gracz][gSluzba] == uid)
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
			if(DaneGracza[gracz][gDzialalnosc6] != 0)
			{
				new uid = DaneGracza[gracz][gDzialalnosc6];
				new wynik;
				wynik = GetPVarInt(gracz, "w6")+DaneGracza[gracz][gPrzynaleznosci][31];
				find = 6;
				if(GraczPremium(gracz))
				{
					if(DaneGracza[gracz][gSluzba] == uid)
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
			if(find > 0) dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_TABLIST_HEADERS, "• Grupy gracza:", dzg_lista, "", "Wyjdz");
			else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Grupy:", "Gracz nie posiada ¿adnych grup!", "Zamknij", "");
			return 1;
		}
	}
	return 1;
}
CMD:slap(playerid, params[])
{
    if(UprawnieniaGMa(playerid, 2))
	{
	    if(zalogowany[playerid] == false)
	    {
	        return 0;
	    }
		new playerid2;
		if(sscanf(params, "i", playerid2))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby zeslapowaæ gracza wpisz /slap [id gracza]", "Zamknij", "");
			return 1;
		}
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid2, x, y, z);
		SetPlayerPos(playerid2, x, y, z+5);
		PlayerPlaySound(playerid2, 1130, x, y, z+5);
		GameTextForPlayer(playerid2, "~r~Dostales slapa od Administracji!", 3000, 5);
		GameTextForPlayer(playerid, "~g~Dales slapa graczowi!", 3000, 5);
		return 1;
	}
	return 1;
}
CMD:protekcja(playerid, params[])
{
	//printf("U¿yta komenda dajpasek");
    if(UprawnieniaGMa(playerid, 4))
	{
		new playerid2;
		if(sscanf(params, "i", playerid2))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ graczu mo¿liwoœæ bicia po BW : /protekcja [id gracza]", "Zamknij", "");
			return 1;
		}
        DaneGracza[playerid2][gBetaTester] = (gettime()+CZAS_LETNI);
	}
    return 1;
}
CMD:amagazyn(playerid,cmdtext[])
{
	if(zalogowany[playerid] == false)
	{
		return 0;
	}
	if(UprawnieniaCEO(playerid, 0))
	{
		new playerid2, index, bone, model, Float:x,Float:y,Float:z,Float:rx,Float:ry,Float:rz;
		if(sscanf(cmdtext, "idddffffff", playerid2, index, model, bone, x, y, z, rx, ry, rz))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby nadaæ graczu przyczepiony obiekt /amagazyn [ID Gracza] [INDEX] [CZESC CIALA] [X] [Y] [Z] [ROT:X] [ROT:Y] [ROT:Z]", "Zamknij", "");
			return 1;
		}
		if(zalogowany[playerid2] == false)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Gracz któremu chcesz przyczepiæ obiekt nie jest zalogowany.", "Zamknij", "");
			return 1;
		}
    	SetPlayerAttachedObject(playerid2,index,model,bone,x,y,z,rx,ry,rz);
    	SendClientMessage(playerid2, 0xC2A2DAAA, "Obiekt przyczepiony");
    	return 1;
	}
	return 1;
}
