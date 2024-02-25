AntiDeAMX();
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    A_CHAR(inputtext); //Zamienia % na # w tekscie GUI
////////////////////////////////////////////////////////////////////////////////
    if(dialogid == DIALOG_MAIN)
    {
        switch(listitem)
        {
			case 0: 
			{
				if(!response)
				{
					return 1;
				}
				dShowPlayerDialog(playerid,DIALOG_LIMIT,DIALOG_STYLE_INPUT,"• Fotoradary:","Podaj ograniczenie prêdkoœci w kilometrach.","Dalej","Zamknij");
			}
			case 1:
			{
				new cam = GetClosestCamera(playerid);
				if(cam == -1) return 1;
				SetPVarInt(playerid,"selected",cam);
				dShowPlayerDialog(playerid,DIALOG_EDIT,DIALOG_STYLE_LIST,"• Fotoradary:","Zmiany k¹ta\nZmiany zakresu\nZmiena limitu szybkoœci","Akceptuj","Zamknij");
			}
			case 2:
			{
				new cam = GetClosestCamera(playerid);
				if(cam == -1) return 1;
				UsunFotoradar(cam);
			 	SendClientMessage(playerid,COLOR_GREEN,"Fotoradar zosta³ usuniêty.");
			 	DeletePVar(playerid,"selected");
			}
	    }
	    if(!response) {
		DeletePVar(playerid,"Zakres");
		DeletePVar(playerid,"Limit");
		DeletePVar(playerid,"Kara pieniê¿na");
		DeletePVar(playerid,"Dobieranie");
		return 1;
		}
	}
	if(dialogid == DIALOG_AKTOR_UBRANIE)
	{
	    new bot = GetPVarInt(playerid, "BOT");
	    if(strlen(inputtext) <= 1 || strlen(inputtext) >= 20035)
		{
      		new tekst[256];
  			format(tekst,sizeof(tekst),"Wpisz numer ubrania (ID), jakie chcesz ndaæ aktorowi,\n> Przyk³ad: 195\nPamiêtaj aby wybraæ ubranie z przedzia³u 1-299 lub 20001-20035.\nID ubrania mo¿esz znaleŸæ na wiki.sa-mp.com.");
			dShowPlayerDialog(playerid, DIALOG_AKTOR_UBRANIE, DIALOG_STYLE_INPUT, "• Zmieñ tryb interakcji:", tekst, "Zmieñ", "Zamknij");
			return 1;
		}
		Bot[bot][bSkin] = strval(inputtext);
		ZapiszBota(bot);
		OdladujBoty();
		ZaladujBoty();
		return 1;
	}
	if(dialogid == DIALOG_AKTOR_INTERAKCJA)
	{
	    new bot = GetPVarInt(playerid, "BOT");
	    if(strlen(inputtext) == 0 || strlen(inputtext) == 2)
		{
      		new tekst[256];
  			format(tekst,sizeof(tekst),"Wpisz numer typu, jakie chcesz nadaæ aktorowi,\n> Przyk³ad: 2\n0 - Aktor bez interakcji\n2 - Sprzedawaca w biznesie (/kup).");
			dShowPlayerDialog(playerid, DIALOG_AKTOR_INTERAKCJA, DIALOG_STYLE_INPUT, "• Zmieñ tryb interakcji:", tekst, "Zmieñ", "Zamknij");
			return 1;
		}
		Bot[bot][bTyp] = strval(inputtext);
		ZapiszBota(bot);
		OdladujBoty();
		ZaladujBoty();
		return 1;
	}
	if(dialogid == DIALOG_AKTOR_NICK)
	{
	    new bot = GetPVarInt(playerid, "BOT");
	    if(strlen(inputtext) > 32 || strlen(inputtext) < 3)
		{
      		new tekst[256];
		    format(tekst,sizeof(tekst),"Wpisz nick postaci, jaki chcesz nadaæ aktorowi,\n> Przyk³ad: Imie_Nazwisko\n> Przyk³ad: Sprzedawca");
			dShowPlayerDialog(playerid, DIALOG_AKTOR_NICK, DIALOG_STYLE_INPUT, "• Zmieñ imie aktora:", tekst, "Zmieñ", "Zamknij");
			return 1;
		}
		if(antyst(inputtext))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "W nazwie u¿y³eœ niedowolonych znaków takich jak:\n{FF0000}; : ' *\nZmieñ je i¿ s¹ one niedowozolone.", "Zamknij", "");
			return 1;
		}
		format(Bot[bot][bNick], 32, "%s", inputtext);
		ZapiszBota(bot);
		OdladujBoty();
		ZaladujBoty();
		return 1;
	}
	if(dialogid == DIALOG_AKTOR_ANIMACJA)
	{
	    new bot = GetPVarInt(playerid, "BOT");
	    if(strlen(inputtext) < 0 || strlen(inputtext) > 13)
		{
      		new tekst[256];
  			format(tekst,sizeof(tekst),"Wybierz typy animacji dla aktora z listy poni¿ej:\n\n1 - rap1\n2 - ramiona\n3 - opieraj\n4 - crack\n5 - rece\n6 - krzeslo2\n7 - padnij\n8 - lez2\n9 - siad\n10 - tancz7\n11 - koks\n12 - cry");
			dShowPlayerDialog(playerid, DIALOG_AKTOR_ANIMACJA, DIALOG_STYLE_INPUT, "• Zmieñ tryb interakcji:", tekst, "Zmieñ", "Zamknij");
			return 1;
		}
		Bot[bot][bAnim] = strval(inputtext);
		ZapiszBota(bot);
		OdladujBoty();
		ZaladujBoty();
		if(Bot[bot][bAnim] == 1)
		{
		    ApplyDynamicActorAnimation(Bot[bot][bID], "RAPPING", "RAP_A_Loop", 4.1, 1, 1, 1, 1, 1);//Rap1
		}
		if(Bot[bot][bAnim] == 2)
		{
		    ApplyDynamicActorAnimation(Bot[bot][bID], "COP_AMBIENT", "Coplook_loop", 4.1, 1, 1, 1, 1, 1);//ramiona
		}
		if(Bot[bot][bAnim] == 3)
		{
		    ApplyDynamicActorAnimation(Bot[bot][bID], "GANGS", "leanIDLE", 4.1, 1, 1, 1, 1, 1);//opieraj
		}
		if(Bot[bot][bAnim] == 4)
		{
		    ApplyDynamicActorAnimation(Bot[bot][bID], "CRACK", "crckdeth2", 4.1, 1, 1, 1, 1, 1);//crack
		}
		if(Bot[bot][bAnim] == 5)
		{
		    ApplyDynamicActorAnimation(Bot[bot][bID], "ROB_BANK", "SHP_HandsUp_Scr", 4.1, 0, 1, 1, 1, 1);//rece
		}
		if(Bot[bot][bAnim] == 6)
		{
		    ApplyDynamicActorAnimation(Bot[bot][bID], "FOOD", "FF_Sit_Loop", 4.1, 0, 1, 1, 1, 1);//krzeslo2
		}
		if(Bot[bot][bAnim] == 7)
		{
		    ApplyDynamicActorAnimation(Bot[bot][bID], "PED", "KO_shot_front", 4.1, 0, 1, 1, 1, 1);//padnij
		}
		if(Bot[bot][bAnim] == 8)
		{
		    ApplyDynamicActorAnimation(Bot[bot][bID], "BEACH", "batherr", 4.1, 0, 1, 1, 1, 1);//lez2
		}
		if(Bot[bot][bAnim] == 9)
		{
		    ApplyDynamicActorAnimation(Bot[bot][bID], "BEACH", "ParkSit_M_loop", 4.1, 0, 1, 1, 1, 1);//siad
		}
		if(Bot[bot][bAnim] == 10)
		{
		    ApplyDynamicActorAnimation(Bot[bot][bID], "DANCING", "DAN_left_A", 4.1, 0, 1, 1, 1, 1);//tancz7
		}
		if(Bot[bot][bAnim] == 11)
		{
		    ApplyDynamicActorAnimation(Bot[bot][bID], "PED", "IDLE_HBHB", 4.1, 0, 1, 1, 1, 1);//koks
		}
		if(Bot[bot][bAnim] == 12)
		{
		    ApplyDynamicActorAnimation(Bot[bot][bID], "GRAVEYARD", "mrnF_loop", 4.1, 0, 1, 1, 1, 1);//cry
		}
		return 1;
	}
	if(dialogid == DIALOG_EDYCJA_AKTORA)
	{
		new bot = GetPVarInt(playerid, "BOT");
		if(!response)
	        return 1;
	    switch(listitem)
        {
	    	case 0://Zakoñcz edycjê tego aktora
	    	{
	    	    if(Bot[bot][bStworzyl] == DaneGracza[playerid][gUID] || (DaneGracza[playerid][gAdmGroup] == 4 || DaneGracza[playerid][gAdmGroup] == 7) && DutyAdmina[playerid] == 1)
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zakoñcz edycjê tego aktora", "Pomyœlnie zakoñczono edycjê aktora.", "Zamknij", "");
				    DeletePVar(playerid, "BOTPOS");
				    return 1;
				}
				return 1;
	    	}
	    	case 1://Zmieñ ubranie aktora
	    	{
	    	    if(Bot[bot][bStworzyl] == DaneGracza[playerid][gUID] || (DaneGracza[playerid][gAdmGroup] == 4 || DaneGracza[playerid][gAdmGroup] == 7) && DutyAdmina[playerid] == 1)
				{
				    new tekst[256];
				    format(tekst,sizeof(tekst),"Wpisz numer ubrania (ID), jakie chcesz ndaæ aktorowi,\n> Przyk³ad: 195\nPamiêtaj aby wybraæ ubranie z przedzia³u 1-299 lub 20001-20035.\nID ubrania mo¿esz znaleŸæ na wiki.sa-mp.com.");
				    dShowPlayerDialog(playerid,DIALOG_AKTOR_UBRANIE,DIALOG_STYLE_INPUT,"• Zmieñ ubranie aktora:", tekst,"Zmieñ","Anuluj");
				    return 1;
				}
				return 1;
	    	}
	    	case 2://Zmieñ tryb interakcji
	    	{
	    	    if(Bot[bot][bStworzyl] == DaneGracza[playerid][gUID] || (DaneGracza[playerid][gAdmGroup] == 4 || DaneGracza[playerid][gAdmGroup] == 7) && DutyAdmina[playerid] == 1)
				{
				    new tekst[256];
				    format(tekst,sizeof(tekst),"Wpisz numer typu, jakie chcesz nadaæ aktorowi,\n> Przyk³ad: 2\n0 - Aktor bez interakcji\n2 - Sprzedawaca w biznesie (/kup).");
				    dShowPlayerDialog(playerid,DIALOG_AKTOR_INTERAKCJA,DIALOG_STYLE_INPUT,"• Zmieñ tryb aktora:", tekst,"Zmieñ","Anuluj");
				    return 1;
				}
	    	    return 1;
	    	}
	    	case 3://Zmieñ imiê aktora
	    	{
	    	    if(Bot[bot][bStworzyl] == DaneGracza[playerid][gUID] || (DaneGracza[playerid][gAdmGroup] == 4 || DaneGracza[playerid][gAdmGroup] == 7) && DutyAdmina[playerid] == 1)
				{
				    new tekst[256];
				    format(tekst,sizeof(tekst),"Wpisz nick postaci, jaki chcesz nadaæ aktorowi,\n> Przyk³ad: Imie_Nazwisko\n> Przyk³ad: Sprzedawca");
				    dShowPlayerDialog(playerid,DIALOG_AKTOR_NICK,DIALOG_STYLE_INPUT,"• Zmieñ imie aktora:", tekst,"Zmieñ","Anuluj");
				    return 1;
				}
	    	    return 1;
	    	}
	    	case 4://Dezaktywuj opis aktora
	    	{
	    	    if(Bot[bot][bStworzyl] == DaneGracza[playerid][gUID] || (DaneGracza[playerid][gAdmGroup] == 4 || DaneGracza[playerid][gAdmGroup] == 7) && DutyAdmina[playerid] == 1)
				{
				    if(Bot[bot][bUkryty] == 0)
				    {
				        Bot[bot][bUkryty] = 1;
				        ZapiszBota(bot);
				        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Dezaktuj opis aktora", "Opis aktora dezaktywowany", "Zamknij", "");
				        return 1;
				    }
				    else
				    {
				        Bot[bot][bUkryty] = 0;
				        ZapiszBota(bot);
				        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Aktywuj opis aktora", "Opis aktora aktywowany", "Zamknij", "");
				        return 1;
				    }
				}
	    	    return 1;
	    	}
			case 5://Zmieñ animacjê aktora
	    	{
	    	    if(Bot[bot][bStworzyl] == DaneGracza[playerid][gUID] || (DaneGracza[playerid][gAdmGroup] == 4 || DaneGracza[playerid][gAdmGroup] == 7) && DutyAdmina[playerid] == 1)
				{
				    new tekst[256];
				    format(tekst,sizeof(tekst),"Wybierz typy animacji dla aktora z listy poni¿ej:\n\n1 - rap1\n2 - ramiona\n3 - opieraj\n4 - crack\n5 - rece\n6 - krzeslo2\n7 - padnij\n8 - lez2\n9 - siad\n10 - tancz7\n11 - koks\n12 - cry");
				    dShowPlayerDialog(playerid,DIALOG_AKTOR_ANIMACJA,DIALOG_STYLE_INPUT,"• Zmieñ animacjê aktora:", tekst,"Zmieñ","Anuluj");
				    return 1;
				}
	    	    return 1;
	    	}
	    	case 6://Zmieñ pozycjê aktora
	    	{
	    	    if(Bot[bot][bStworzyl] == DaneGracza[playerid][gUID] || (DaneGracza[playerid][gAdmGroup] == 4 || DaneGracza[playerid][gAdmGroup] == 7) && DutyAdmina[playerid] == 1)
				{
				    new tekst[256];
				    format(tekst,sizeof(tekst),"Aby zmieniæ pozycjê tego aktora udaj siê w miejsce gdzie dok³adnie aktor ma siê przemiesiæ,\nnastêpnie u¿yj komendy /apos.");
				    dShowPlayerDialog(playerid,DIALOG_INFO, DIALOG_STYLE_MSGBOX,"• Zmieñ pozycjê aktora:", tekst,"Rozumiem","Anuluj");
				    SetPVarInt(playerid, "BOTPOS", bot);
				    return 1;
				}
	    	    return 1;
	    	}
	    	case 7://Usuñ permamentnie aktora
	    	{
	    	    if(Bot[bot][bStworzyl] == DaneGracza[playerid][gUID] || (DaneGracza[playerid][gAdmGroup] == 4 || DaneGracza[playerid][gAdmGroup] == 7) && DutyAdmina[playerid] == 1)
				{
				    UsunBota(bot);
				    OdladujBoty();
					ZaladujBoty();
					DestroyDynamic3DTextLabel(Text3D:Bot[bot][bNickTag]);
					DestroyDynamic3DTextLabel(Text3D:Bot[bot][bOpisTag]);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "• Usuñ aktora", "Aktor zosta³ usuniêty permamentnie!", "Zamknij", "");
				}
	    	    return 1;
	    	}
		}
	}
	if(dialogid == DIALOG_UEDYTOR)
	{
	    if(!response)
	        return 1;
	    switch(listitem)
        {
	    	case 0:
	    	{
	    	    DaneGracza[playerid][gEdytor] = 1;
	    	    ZapiszGracza(playerid);
				dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Ustawienia postaci:","W³¹czy³eœ edytor typu SAMP.", "Zamknij", "" );
				return 1;
	    	}
	    	case 1:
	    	{
	    	    DaneGracza[playerid][gEdytor] = 0;
	    	    ZapiszGracza(playerid);
				dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Ustawienia postaci:","W³¹czy³eœ edytor typu MTA.", "Zamknij", "" );
				return 1;
	    	}
		}
	}
	if(dialogid == DIALOG_EDYTOR)
	{
	    if(!response)
		{
			DaneGracza[playerid][gEdytor] = 1;
			dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:","W³¹czy³eœ edytor typu SAMP.", "Zamknij", "" );
			return 1;
		}else{
			DaneGracza[playerid][gEdytor] = 0;
			dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:","W³¹czy³eœ edytor typu MTA.", "Zamknij", "" );
		}
		ZapiszGracza(playerid);
	}
	if(dialogid == DIALOG_LIMIT)
	{
	    if(!response) {
		DeletePVar(playerid,"Zakres");
		DeletePVar(playerid,"Limit");
		DeletePVar(playerid,"Kara pieniê¿na");
		DeletePVar(playerid,"Dobieranie");
		return 1;
		}
		if(!strlen(inputtext)) return dShowPlayerDialog(playerid,DIALOG_LIMIT,DIALOG_STYLE_INPUT,"• Fotoradary:","Podaj ograniczenie prêdkoœci w kilometrach.","Dalej","Zamknij");
		SetPVarInt(playerid,"range",12);
		SetPVarInt(playerid,"limit",strval(inputtext));
	    SetPVarInt(playerid,"fine",strval(inputtext));
		new Float:x,Float:y,Float:z,Float:angle;
		GetPlayerPos(playerid,x,y,z);
		GetPlayerFacingAngle(playerid,angle);
		angle = angle + 180;if(angle > 360){angle = angle - 360;}
		new id = CreateSpeedCam(x,y,z -3,angle,GetPVarInt(playerid,"range"),GetPVarInt(playerid,"limit"),GetPVarInt(playerid,"fine"),0);
		Teleportuj(playerid,x,y+2,z);
		DeletePVar(playerid,"range");
		DeletePVar(playerid,"limit");
		DeletePVar(playerid,"fine");
		SetPVarInt(playerid,"selected",id);
	}
	if(dialogid == DIALOG_VCARD_ZAPISZ_TELEFON)
	{
		if(response)
		{
            if(antyst(inputtext))
			{
			    cmd_me(playerid, "odrzuca vCard w swoim smartfonie.");
			    new akcja[126];
				format(akcja,sizeof(akcja),"*odrzuca vCard w swoim smartfonie*");
				SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
				new akcja2[126];
				format(akcja2,sizeof(akcja2),"odrzuca vCard w swoim smartfonie");
				TextDrawSetString(AkcjaTD[playerid], akcja2);
				TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
				CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "W nazwie u¿y³eœ niedowolonych znaków takich jak:\n{FF0000}; : ' *\nTen v-card zosta³ anulowany!", "Zamknij", "");
				return 1;
			}
			new sellerid;
		    sellerid = GetPVarInt(playerid, "Kontakt");
		    DodajKontakty(playerid, sellerid, inputtext);
			cmd_me(playerid, "akceptuje vCard w swoim smartfonie.");
			new akcja[126];
			format(akcja,sizeof(akcja),"*akceptuje vCard w swoim smartfonie*");
			SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
			new akcja2[126];
			format(akcja2,sizeof(akcja2),"akceptuje vCard w swoim smartfonie");
			TextDrawSetString(AkcjaTD[playerid], akcja2);
			TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
			CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
		}
	}
	/*if(dialogid == DIALOG_DRZWI_STWORZ)
	{
		if(response)
		{
			strdel(tekst_global, 0, 2048);
			format(tekst_global, sizeof(tekst_global), "{a9c4e4}Podaj rodzaj.\n\tRodzaj: 0/1, gdzie 0 to dom, a 1 to biznes.\n\nPAMIÊTAJ, musisz stac twarz¹ do budynku - miejsce, w którym stoisz stanie siê wejœciem.\nFormat: (rodzaj - 0/1)\n{FF0000}Uwaga: Tworzenie budynków w miejsach, w których nie ma drzwi,\nbêdzie karane skasowaniem budynku bez zwrotu pieniêdzy.");
			dShowPlayerDialog(playerid,DIALOG_DRZWI_STWORZ,DIALOG_STYLE_INPUT,"• Drzwi:",tekst_global,"Stworz","Anuluj");
		}
	}*/
	if(dialogid == DIALOG_DRZWI_STWORZ_ADM)
	{
	    if(response)
		{
		    new typ = strval(inputtext);
		    new id = GraczNaTerenie(playerid);
		    if(typ == 0 || typ == 1)
		    {
			    SetPVarInt(playerid,"typbudynku", typ);
			    strdel(tekst_global, 0, 2048);
				format(tekst_global, sizeof(tekst_global), "{a9c4e4}Podaj metra¿ (minimum %dm2) wnêtrza.\n\tMetra¿: iloœæ metrów kwadratowych - %d USD/m2.\n\nPAMIÊTAJ, musisz stac twarz¹ do budynku - miejsce, w którym stoisz stanie siê wejœciem.\nFormat: (metra¿)\n{FF0000}Uwaga: Tworzenie budynków w miejsach, w których nie ma drzwi,\nbêdzie karane skasowaniem budynku bez zwrotu pieniêdzy.", Lokacja[id][gMetr], Lokacja[id][gCena]);
				dShowPlayerDialog(playerid,DIALOG_DRZWI_STWORZ2_ADM,DIALOG_STYLE_INPUT,"• Drzwi:",tekst_global,"Stworz","Anuluj");
			}
		}
	}
	if(dialogid == DIALOG_DRZWI_STWORZ)
	{
	    if(response)
		{
		    new typ = strval(inputtext);
		    new id = GraczNaTerenie(playerid);
		    if(typ == 0 || typ == 1)
		    {
			    SetPVarInt(playerid,"typbudynku", typ);
			    strdel(tekst_global, 0, 2048);
				format(tekst_global, sizeof(tekst_global), "{a9c4e4}Podaj metra¿ (minimum %dm2) wnêtrza.\n\tMetra¿: iloœæ metrów kwadratowych - %d USD/m2.\n\nPAMIÊTAJ, musisz stac twarz¹ do budynku - miejsce, w którym stoisz stanie siê wejœciem.\nFormat: (metra¿)\n{FF0000}Uwaga: Tworzenie budynków w miejsach, w których nie ma drzwi,\nbêdzie karane skasowaniem budynku bez zwrotu pieniêdzy.", Lokacja[id][gMetr], Lokacja[id][gCena]);
				dShowPlayerDialog(playerid,DIALOG_DRZWI_STWORZ2,DIALOG_STYLE_INPUT,"• Drzwi:",tekst_global,"Stworz","Anuluj");
			}
		}
	}
	if(dialogid == DIALOG_UBRANIE_WYBIERZ)
	{
        if(response)
		{
		    switch(listitem)
        	{
        	    case 0:
        	    {
					if(GetPVarInt(playerid, "WybieraUbranie") == 1)
					{
						return 0;
					}
					new Float:Pos[3];
					GetPlayerPos(playerid, Pos[0],Pos[1],Pos[2]);
					SkinIDM[playerid] = 0;
					SkinIDW[playerid] = 0;
					SetPVarInt(playerid, "UbranieNa", GetPlayerSkin(playerid));
					if(DaneGracza[playerid][gPLEC] == 0)
					{
						strdel(tekst_global, 0, 200);
						SetPVarInt(playerid, "WybieraUbranie", 1);
						format(tekst_global, sizeof(tekst_global), "~r~~h~Zakup ubrania~n~~g~~h~Cena:~w~ $%d  ~g~~h~Ubranie:~w~ %d~n~W celu zakupu nacisnij ~y~~k~~VEHICLE_ENTER_EXIT~~w~.~n~W celu anulowania zakupu nacisnij ~y~~k~~PED_FIREWEAPON~~w~.",SkinPlayerM[SkinIDM[playerid]][cena4],SkinPlayerM[SkinIDM[playerid]][id4]);
						TextDrawSetString(OBJ[playerid], tekst_global);
						TextDrawShowForPlayer(playerid, OBJ[playerid]);
						SetPlayerSkin(playerid, SkinPlayerM[SkinIDM[playerid]][id4]);
						Frezuj(playerid,0);
				   		SetPlayerCameraPos(playerid, Pos[0]-3,Pos[1],Pos[2]);
					  	SetPlayerCameraLookAt(playerid, Pos[0],Pos[1],Pos[2]);
						return 1;
					}
				 	if(DaneGracza[playerid][gPLEC] == 1)
					{
						strdel(tekst_global, 0, 200);
						SetPVarInt(playerid, "WybieraUbranie", 1);
						format(tekst_global, sizeof(tekst_global), "~r~~h~Zakup ubrania~n~~g~~h~Cena:~w~ $%d  ~g~~h~Ubranie:~w~ %d~n~W celu zakupu nacisnij ~y~~k~~VEHICLE_ENTER_EXIT~~w~.~n~W celu anulowania zakupu nacisnij ~y~~k~~PED_FIREWEAPON~~w~.",SkinPlayerM[SkinIDW[playerid]][cena4],SkinPlayerM[SkinIDW[playerid]][id4]);
						TextDrawSetString(OBJ[playerid], tekst_global);
						TextDrawShowForPlayer(playerid, OBJ[playerid]);
						SetPlayerSkin(playerid, SkinPlayerW[SkinIDW[playerid]][id4]);
						Frezuj(playerid,0);
						SetPlayerCameraPos(playerid, Pos[0]-3,Pos[1],Pos[2]);
					  	SetPlayerCameraLookAt(playerid, Pos[0],Pos[1],Pos[2]);
						return 1;
					}
					SetPlayerFacingAngle( playerid, 90 );
					return 1;
				}
				case 1:
				{
				    dShowPlayerDialog(playerid, DIALOG_ATTACH_INDEX_SELECTION, DIALOG_STYLE_LIST, "• Dodatki:", "»  Slot 1\n»  Slot 2", "Wybierz", "Zamknij");
					return 1;
				}
			}
		}
	}
	if(dialogid == DIALOG_DRZWI_NAJEMNICY_WYPROS)
	{
	    if(response)
		{
		    if(zalogowany[playerid] == false)
		    {
		        return 0;
		    }
			if(DaneGracza[playerid][gBW] != 0)
			{
				return 0;
			}
			new gracz = strval(inputtext);
            new drzwi = GetPVarInt(playerid, "uiddrzwi");
			new uid = 0;
			ForeachEx(i, MAX_WYNAJEM)
			{
				if(Wynajem[i][wDrzwi] == drzwi && Wynajem[i][wDostal] == gracz)
				{
					uid = i;
				}
			}
			strdel(zapyt, 0, 1024);
			format(zapyt, sizeof(zapyt),"UPDATE `jochym_postacie` SET `WYNAJEM`='%d' WHERE `ID`='%d'", 0, gracz);
			mysql_query(zapyt);
			format(zapyt, sizeof(zapyt), "DELETE FROM `jochym_wynajem` WHERE `dostal` = '%d' AND `drzwi` = '%d'", gracz, drzwi);
			mysql_check();
			mysql_query2(zapyt);
			Wynajem[uid][wID] = 0;
			Wynajem[uid][wUID] = 0;
			Wynajem[uid][wCzas] = 0;
			Wynajem[uid][wDostal] = 0;
			Wynajem[uid][wDrzwi] = 0;
			Wynajem[uid][wKoszt] = 0;
			Wynajem[uid][wNick] = 0;
			GameTextForPlayer(playerid, "~r~Gracz zostal wyproszony.", 3000, 5);
   			return 1;
		}
	}
	if(dialogid == DIALOG_HARACZ)
	{
	    if(response)
		{
		    if(zalogowany[playerid] == false)
		    {
		        return 0;
		    }
			if(DaneGracza[playerid][gBW] != 0)
			{
				return 0;
			}
			TextDrawHideForPlayer(playerid, Tutorial[playerid]);
		}
		else
		{
		    TextDrawHideForPlayer(playerid, Tutorial[playerid]);
		    return 1;
		}
	}
	if(dialogid == DIALOG_DRZWI_OPCJE_WNAJEM)
	{
	    if(response)
		{
      		new uids = GetPVarInt(playerid, "uiddrzwi");
 			Oferuj(playerid, strval(inputtext), 0, 0, uids, 0, OFEROWANIE_WYNAJMU, 0, "", 0);
   		}
		else
		{
			return 0;
		}
	}
	if(dialogid == DIALOG_PROJEKT_WNETRZA)
	{
		if(response)
		{
			new uids = GetPVarInt(playerid, "uiddrzwi");
			KopiujInteror(uids, playerid);
		}
		else
		{
			return 0;
		}
	}
	if(dialogid == DIALOG_DOKUP_M2)
	{
		new uids = GetPVarInt(playerid, "uiddrzwi");
	    new metraz = strval(inputtext);
		if(metraz <= 0 || metraz >= 10000)
		{
			new tekst[256];
			format(tekst, sizeof(tekst), "Nie mo¿esz dokupiæ do budynku tyle metrów!");
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Dokup metraz:", tekst, "Rozumiem", "");
			return 0;
		}
	    SetPVarInt(playerid, "M2", metraz);
	    SetPVarFloat(playerid, "DOKUPM2", strval(inputtext));
	    new id = BudynekNaTerenie(uids);
	    if(response)
		{
	        if(DaneGracza[playerid][gPORTFEL] <= Lokacja[id][gCena]*metraz)
    		{
    		    new tekst[256];
		        format(tekst, sizeof(tekst), "Nie posiadasz przy sobie $%d, by dokupiæ metra¿u do tego budynku. Udaj siê do banku po pieni¹dze i wykonaj te czynnoœæ ponownie.", Lokacja[id][gCena]*metraz);
		        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Dokup metraz:", tekst, "Rozumiem", "");
    		}
    		else
    		{
    		    new cena = Lokacja[id][gCena]*metraz;
    			new tekstmetrazu[512];
			    format(tekstmetrazu, sizeof(tekstmetrazu), "Je¿eli chcesz dokupiæ %dm2 do tego budynku za %d, potwierdŸ transakcjê.", metraz, cena);
			    dShowPlayerDialog(playerid, DIALOG_DOKUP_M2_ACCEPT, DIALOG_STYLE_MSGBOX, "• Dokup metraz:", tekstmetrazu, "Potwierdzam", "Anuluj");
    		}
		}
	}
	if(dialogid == DIALOG_DOKUP_M2_ACCEPT)
	{
	    new Float:metraz = GetPVarFloat(playerid, "DOKUPM2");
		new uids = GetPVarInt(playerid, "uiddrzwi");
	    new id = BudynekNaTerenie(uids);
	    new m2 = GetPVarInt(playerid, "M2");
	    if(response)
		{
		    BudynekInfo[uids][nPowieszchnia] += metraz;
		    ZapiszNieruchomosc(uids);
		    Dodajkase(playerid, -(m2*Lokacja[id][gCena]));
		    ZapiszGracza(playerid);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[DOOR] [%s] [ID: %d] Buy meters to the %s value %.2f end meters building value %.2f", ZmianaNicku(playerid), playerid, BudynekInfo[uids][nAdres], metraz, BudynekInfo[uids][nPowieszchnia]);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Dokup metraz:","Gratulacje! Zakupi³eœ metry do budynku, od teraz mozesz powiêkszyæ swoje wnêtrze o parê metrów.", "Rozumiem", "");
	        return 1;
		}
	}
	if(dialogid == DIALOG_DRZWI_STWORZ2_ADM)
	{
        new typ = GetPVarInt(playerid,"typbudynku");
        new id = GraczNaTerenie(playerid);
	    new metraz = strval(inputtext);
	    if(Lokacja[id][gMetr] == 0)
	    {
	        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Tworzenie drzwi:","Nie mo¿na postawiæ tutaj budynku, dlatego ¿e nie zosta³ ustalony minimalny metra¿.\nSkontaktuj siê z Administracj¹ w celu ustalenia metra¿u!", "Rozumiem", "");
	        return 1;
	    }
	    if(Lokacja[id][gCena] == 0)
	    {
	        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Tworzenie drzwi:","Nie mo¿na postawiæ tutaj budynku, dlatego ¿e nie zosta³a ustalona cena za m2.\nSkontaktuj siê z Administracj¹ w celu ustalenia ceny za m2!", "Rozumiem", "");
	        return 1;
	    }
	    /*if(DaneGracza[playerid][gPORTFEL] <= Lokacja[id][gCena]*metraz)
	    {
	        new tekst[256];
	        format(tekst, sizeof(tekst), "Nie posiadasz przy sobie $%d, by stworzyæ tutaj budynek. Udaj siê do banku po pieni¹dze, nastêpnie ponownie stwórz budynek o tych samych paramterach.", Lokacja[id][gCena]*metraz);
	        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Tworzenie drzwi:", tekst, "Rozumiem", "");
	        return 1;
	    }*/
		if(metraz <= 0 || metraz >= 10000)
		{
			new tekst[256];
	        format(tekst, sizeof(tekst), "Nie mo¿esz postawiæ budynku z takim metra¿em!");
	        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Tworzenie drzwi:", tekst, "Rozumiem", "");
			return 0;
		}
	    if(metraz <= Lokacja[id][gMetr])
	    {
	        new tekst[256];
	        format(tekst, sizeof(tekst), "Na tym terenie nie mo¿na stworzyæ takiego metra¿u, minimalna powierzchnia budynku powinna wynosiæ %dm2.", Lokacja[id][gMetr]);
	        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Tworzenie drzwi:", tekst, "Rozumiem", "");
	        return 0;
	    }
	    if(metraz >= Lokacja[id][gMetr])
	    {
		    //if(GetPlayerMoney(playerid) >= Lokacja[id][gCena]*metraz)
		    //{
		        new typp;
		        new Float:x, Float:y, Float:z;
		        new Float:xx, Float:yx, Float:zx;
		        new Float:xx1, Float:yx1, Float:zx1;
		        new Float:xy, Float:yy, Float:zy;
		        new Float:xy1, Float:yy1, Float:zy1;
		        GetPlayerPos(playerid, x, y, z);
                GetPlayerPos(playerid, xx, yx, zx);
                GetPlayerPos(playerid, xx1, yx1, zx1);
                GetPlayerPos(playerid, xy, yy, zy);
                GetPlayerPos(playerid, xy1, yy1, zy1);
                MapAndreas_FindZ_For2DCoord(xx+10,yx,zx);
                MapAndreas_FindZ_For2DCoord(xx1-10,yx1,zx1);
                MapAndreas_FindZ_For2DCoord(xy,yy+10,zy);
                MapAndreas_FindZ_For2DCoord(xy1,yy1-10,zy1);
				if(zx > zx1 && zx > zy && zx > zy1)
				{
				    //Gdzie stoi interior
				    createdareaxx[playerid] = x;
				    createdareayy[playerid] = y;
				    createdareahh[playerid] = z;
				    //Œrodek interioru
				    createdareax[playerid] = xx+10;
				    createdareay[playerid] = yx;
				    createdareah[playerid] = zx;
				    //
				    if(typ == 0)
					{
						typp = 1273;
						new uid = StworzDrzwi(playerid, DaneGracza[playerid][gUID], 0, "Dom", typ, typp, createdareax[playerid], createdareay[playerid], createdareah[playerid], createdareaxx[playerid], createdareayy[playerid], createdareahh[playerid], 0);
						BudynekInfo[uid][nPowieszchnia] = metraz;
						BudynekInfo[uid][nOplata] = gettime()+CZAS_LETNI+(7*24*60*60);
						ZapiszNieruchomosc(uid);
						createdareax[playerid] = 0;
					    createdareay[playerid] = 0;
					    createdareah[playerid] = 0;
					    createdareaxx[playerid] = 0;
					    createdareayy[playerid] = 0;
					    createdareahh[playerid] = 0;
					    DeletePVar(playerid,"typbudynku");
					    Dodajkase(playerid, -(metraz*Lokacja[id][gCena]));
					    return 1;
					}
					else
					{
						typp = 1239;
						new uid = StworzDrzwi(playerid, DaneGracza[playerid][gUID], 0, "Budynek", typ, typp, createdareax[playerid], createdareay[playerid], createdareah[playerid], createdareaxx[playerid], createdareayy[playerid], createdareahh[playerid], 0);
						BudynekInfo[uid][nPowieszchnia] = metraz;
						BudynekInfo[uid][nOplata] = gettime()+CZAS_LETNI+(7*24*60*60);
						ZapiszNieruchomosc(uid);
						createdareax[playerid] = 0;
					    createdareay[playerid] = 0;
					    createdareah[playerid] = 0;
					    createdareaxx[playerid] = 0;
					    createdareayy[playerid] = 0;
					    createdareahh[playerid] = 0;
					    DeletePVar(playerid,"typbudynku");
					    Dodajkase(playerid, -(metraz*Lokacja[id][gCena]));
					    return 1;
					}
				}
				if(zx1 > zx && zx1 > zy && zx1 > zy1)
				{
				    //Gdzie stoi interior
				    createdareaxx[playerid] = x;
				    createdareayy[playerid] = y;
				    createdareahh[playerid] = z;
				    //Œrodek interioru
				    createdareax[playerid] = xx1-10;
				    createdareay[playerid] = yx1;
				    createdareah[playerid] = zx1;
				    //
				    if(typ == 0)
					{
						typp = 1273;
						new uid = StworzDrzwi(playerid, DaneGracza[playerid][gUID], 0, "Dom", typ, typp, createdareax[playerid], createdareay[playerid], createdareah[playerid], createdareaxx[playerid], createdareayy[playerid], createdareahh[playerid], 0);
						BudynekInfo[uid][nPowieszchnia] = metraz;
						BudynekInfo[uid][nOplata] = gettime()+CZAS_LETNI+(7*24*60*60);
						ZapiszNieruchomosc(uid);
						createdareax[playerid] = 0;
					    createdareay[playerid] = 0;
					    createdareah[playerid] = 0;
					    createdareaxx[playerid] = 0;
					    createdareayy[playerid] = 0;
					    createdareahh[playerid] = 0;
					    DeletePVar(playerid,"typbudynku");
					    Dodajkase(playerid, -(metraz*Lokacja[id][gCena]));
					    return 1;
					}
					else
					{
						typp = 1239;
						new uid = StworzDrzwi(playerid, DaneGracza[playerid][gUID], 0, "Budynek", typ, typp, createdareax[playerid], createdareay[playerid], createdareah[playerid], createdareaxx[playerid], createdareayy[playerid], createdareahh[playerid], 0);
						BudynekInfo[uid][nPowieszchnia] = metraz;
						BudynekInfo[uid][nOplata] = gettime()+CZAS_LETNI+(7*24*60*60);
						ZapiszNieruchomosc(uid);
						createdareax[playerid] = 0;
					    createdareay[playerid] = 0;
					    createdareah[playerid] = 0;
					    createdareaxx[playerid] = 0;
					    createdareayy[playerid] = 0;
					    createdareahh[playerid] = 0;
					    DeletePVar(playerid,"typbudynku");
					    Dodajkase(playerid, -(metraz*Lokacja[id][gCena]));
					    return 1;
					}
				}
				if(zy > zx && zy > zx1 && zy > zy1)
				{
				    //Gdzie stoi interior
				    createdareaxx[playerid] = x;
				    createdareayy[playerid] = y;
				    createdareahh[playerid] = z;
				    //Œrodek interioru
				    createdareax[playerid] = xy;
				    createdareay[playerid] = yy+10;
				    createdareah[playerid] = zy;
				    //
				    if(typ == 0)
					{
						typp = 1273;
						new uid = StworzDrzwi(playerid, DaneGracza[playerid][gUID], 0, "Dom", typ, typp, createdareax[playerid], createdareay[playerid], createdareah[playerid], createdareaxx[playerid], createdareayy[playerid], createdareahh[playerid], 0);
						BudynekInfo[uid][nPowieszchnia] = metraz;
						BudynekInfo[uid][nOplata] = gettime()+CZAS_LETNI+(7*24*60*60);
						ZapiszNieruchomosc(uid);
						createdareax[playerid] = 0;
					    createdareay[playerid] = 0;
					    createdareah[playerid] = 0;
					    createdareaxx[playerid] = 0;
					    createdareayy[playerid] = 0;
					    createdareahh[playerid] = 0;
					    DeletePVar(playerid,"typbudynku");
					    Dodajkase(playerid, -(metraz*Lokacja[id][gCena]));
					    return 1;
					}
					else
					{
						typp = 1239;
						new uid = StworzDrzwi(playerid, DaneGracza[playerid][gUID], 0, "Budynek", typ, typp, createdareax[playerid], createdareay[playerid], createdareah[playerid], createdareaxx[playerid], createdareayy[playerid], createdareahh[playerid], 0);
						BudynekInfo[uid][nPowieszchnia] = metraz;
						BudynekInfo[uid][nOplata] = gettime()+CZAS_LETNI+(7*24*60*60);
						ZapiszNieruchomosc(uid);
						createdareax[playerid] = 0;
					    createdareay[playerid] = 0;
					    createdareah[playerid] = 0;
					    createdareaxx[playerid] = 0;
					    createdareayy[playerid] = 0;
					    createdareahh[playerid] = 0;
					    DeletePVar(playerid,"typbudynku");
					    Dodajkase(playerid, -(metraz*Lokacja[id][gCena]));
					    return 1;
					}
				}
				if(zy1 > zx && zy1 > zx1 && zy1 > zy)
				{
				    //Gdzie stoi interior
				    createdareaxx[playerid] = x;
				    createdareayy[playerid] = y;
				    createdareahh[playerid] = z;
				    //Œrodek interioru
				    createdareax[playerid] = xy1;
				    createdareay[playerid] = yy1-10;
				    createdareah[playerid] = zy1;
				    //
				    if(typ == 0)
					{
						typp = 1273;
						new uid = StworzDrzwi(playerid, DaneGracza[playerid][gUID], 0, "Dom", typ, typp, createdareax[playerid], createdareay[playerid], createdareah[playerid], createdareaxx[playerid], createdareayy[playerid], createdareahh[playerid], 0);
						BudynekInfo[uid][nPowieszchnia] = metraz;
						BudynekInfo[uid][nOplata] = gettime()+CZAS_LETNI+(7*24*60*60);
						ZapiszNieruchomosc(uid);
						createdareax[playerid] = 0;
					    createdareay[playerid] = 0;
					    createdareah[playerid] = 0;
					    createdareaxx[playerid] = 0;
					    createdareayy[playerid] = 0;
					    createdareahh[playerid] = 0;
					    DeletePVar(playerid,"typbudynku");
					    Dodajkase(playerid, -(metraz*Lokacja[id][gCena]));
					    return 1;
					}
					else
					{
						typp = 1239;
						new uid = StworzDrzwi(playerid, DaneGracza[playerid][gUID], 0, "Budynek", typ, typp, createdareax[playerid], createdareay[playerid], createdareah[playerid], createdareaxx[playerid], createdareayy[playerid], createdareahh[playerid], 0);
						BudynekInfo[uid][nPowieszchnia] = metraz;
						BudynekInfo[uid][nOplata] = gettime()+CZAS_LETNI+(7*24*60*60);
						ZapiszNieruchomosc(uid);
						createdareax[playerid] = 0;
					    createdareay[playerid] = 0;
					    createdareah[playerid] = 0;
					    createdareaxx[playerid] = 0;
					    createdareayy[playerid] = 0;
					    createdareahh[playerid] = 0;
					    DeletePVar(playerid,"typbudynku");
					    Dodajkase(playerid, -(metraz*Lokacja[id][gCena]));
					    return 1;
					}
				}
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Tworzenie drzwi:","\nNie da siê tutaj postawiæ interioru?\n\nJe¿eli uwa¿asz ¿e miejsce jest jak najbardziej prawid³owe to:\n\tSkontaktuj siê z Administracj¹.\n\tZrób screen'a i wyœlij go do kogoœ z Community Mebagerów lub CEO na Discord albo na forumowe PW.\n", "Rozumiem", "");
			//}
		}
	}
	if(dialogid == DIALOG_DRZWI_STWORZ2)
	{
        new typ = GetPVarInt(playerid,"typbudynku");
        new id = GraczNaTerenie(playerid);
	    new metraz = strval(inputtext);
	    if(Lokacja[id][gMetr] == 0)
	    {
	        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Tworzenie drzwi:","Nie mo¿na postawiæ tutaj budynku, dlatego ¿e nie zosta³ ustalony minimalny metra¿.\nSkontaktuj siê z Administracj¹ w celu ustalenia metra¿u!", "Rozumiem", "");
	        return 1;
	    }
	    if(Lokacja[id][gCena] == 0)
	    {
	        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Tworzenie drzwi:","Nie mo¿na postawiæ tutaj budynku, dlatego ¿e nie zosta³a ustalona cena za m2.\nSkontaktuj siê z Administracj¹ w celu ustalenia ceny za m2!", "Rozumiem", "");
	        return 1;
	    }
	    if(DaneGracza[playerid][gPORTFEL] <= Lokacja[id][gCena]*metraz)
	    {
	        new tekst[256];
	        format(tekst, sizeof(tekst), "Nie posiadasz przy sobie $%d, by stworzyæ tutaj budynek. Udaj siê do banku po pieni¹dze, nastêpnie ponownie stwórz budynek o tych samych paramterach.", Lokacja[id][gCena]*metraz);
	        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Tworzenie drzwi:", tekst, "Rozumiem", "");
	        return 1;
	    }
		if(metraz <= 0 || metraz >= 10000)
		{
			new tekst[256];
	        format(tekst, sizeof(tekst), "Nie mo¿esz postawiæ budynku z takim metra¿em!");
	        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Tworzenie drzwi:", tekst, "Rozumiem", "");
			return 0;
		}
	    if(metraz < Lokacja[id][gMetr])
	    {
	        new tekst[256];
	        format(tekst, sizeof(tekst), "Na tym terenie nie mo¿na stworzyæ takiego metra¿u, minimalna powierzchnia budynku powinna wynosiæ %dm2.", Lokacja[id][gMetr]);
	        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Tworzenie drzwi:", tekst, "Rozumiem", "");
	        return 0;
	    }
	    if(metraz >= Lokacja[id][gMetr])
	    {
		    if(GetPlayerMoney(playerid) >= Lokacja[id][gCena]*metraz)
		    {
		        new typp;
		        new Float:x, Float:y, Float:z;
		        new Float:xx, Float:yx, Float:zx;
		        new Float:xx1, Float:yx1, Float:zx1;
		        new Float:xy, Float:yy, Float:zy;
		        new Float:xy1, Float:yy1, Float:zy1;
		        GetPlayerPos(playerid, x, y, z);
                GetPlayerPos(playerid, xx, yx, zx);
                GetPlayerPos(playerid, xx1, yx1, zx1);
                GetPlayerPos(playerid, xy, yy, zy);
                GetPlayerPos(playerid, xy1, yy1, zy1);
                MapAndreas_FindZ_For2DCoord(xx+10,yx,zx);
                MapAndreas_FindZ_For2DCoord(xx1-10,yx1,zx1);
                MapAndreas_FindZ_For2DCoord(xy,yy+10,zy);
                MapAndreas_FindZ_For2DCoord(xy1,yy1-10,zy1);
				if(zx > zx1 && zx > zy && zx > zy1)
				{
				    //Gdzie stoi interior
				    createdareaxx[playerid] = x;
				    createdareayy[playerid] = y;
				    createdareahh[playerid] = z;
				    //Œrodek interioru
				    createdareax[playerid] = xx+10;
				    createdareay[playerid] = yx;
				    createdareah[playerid] = zx;
				    //
				    if(typ == 0)
					{
						typp = 1273;
						new uid = StworzDrzwi(playerid, DaneGracza[playerid][gUID], 0, "Dom", typ, typp, createdareax[playerid], createdareay[playerid], createdareah[playerid], createdareaxx[playerid], createdareayy[playerid], createdareahh[playerid], 0);
						BudynekInfo[uid][nPowieszchnia] = metraz;
						BudynekInfo[uid][nOplata] = gettime()+CZAS_LETNI+(7*24*60*60);
						ZapiszNieruchomosc(uid);
						createdareax[playerid] = 0;
					    createdareay[playerid] = 0;
					    createdareah[playerid] = 0;
					    createdareaxx[playerid] = 0;
					    createdareayy[playerid] = 0;
					    createdareahh[playerid] = 0;
					    DeletePVar(playerid,"typbudynku");
					    Dodajkase(playerid, -(metraz*Lokacja[id][gCena]));
					    return 1;
					}
					else
					{
						typp = 1239;
						new uid = StworzDrzwi(playerid, DaneGracza[playerid][gUID], 0, "Budynek", typ, typp, createdareax[playerid], createdareay[playerid], createdareah[playerid], createdareaxx[playerid], createdareayy[playerid], createdareahh[playerid], 0);
						BudynekInfo[uid][nPowieszchnia] = metraz;
						BudynekInfo[uid][nOplata] = gettime()+CZAS_LETNI+(7*24*60*60);
						ZapiszNieruchomosc(uid);
						createdareax[playerid] = 0;
					    createdareay[playerid] = 0;
					    createdareah[playerid] = 0;
					    createdareaxx[playerid] = 0;
					    createdareayy[playerid] = 0;
					    createdareahh[playerid] = 0;
					    DeletePVar(playerid,"typbudynku");
					    Dodajkase(playerid, -(metraz*Lokacja[id][gCena]));
					    return 1;
					}
				}
				if(zx1 > zx && zx1 > zy && zx1 > zy1)
				{
				    //Gdzie stoi interior
				    createdareaxx[playerid] = x;
				    createdareayy[playerid] = y;
				    createdareahh[playerid] = z;
				    //Œrodek interioru
				    createdareax[playerid] = xx1-10;
				    createdareay[playerid] = yx1;
				    createdareah[playerid] = zx1;
				    //
				    if(typ == 0)
					{
						typp = 1273;
						new uid = StworzDrzwi(playerid, DaneGracza[playerid][gUID], 0, "Dom", typ, typp, createdareax[playerid], createdareay[playerid], createdareah[playerid], createdareaxx[playerid], createdareayy[playerid], createdareahh[playerid], 0);
						BudynekInfo[uid][nPowieszchnia] = metraz;
						BudynekInfo[uid][nOplata] = gettime()+CZAS_LETNI+(7*24*60*60);
						ZapiszNieruchomosc(uid);
						createdareax[playerid] = 0;
					    createdareay[playerid] = 0;
					    createdareah[playerid] = 0;
					    createdareaxx[playerid] = 0;
					    createdareayy[playerid] = 0;
					    createdareahh[playerid] = 0;
					    DeletePVar(playerid,"typbudynku");
					    Dodajkase(playerid, -(metraz*Lokacja[id][gCena]));
					    return 1;
					}
					else
					{
						typp = 1239;
						new uid = StworzDrzwi(playerid, DaneGracza[playerid][gUID], 0, "Budynek", typ, typp, createdareax[playerid], createdareay[playerid], createdareah[playerid], createdareaxx[playerid], createdareayy[playerid], createdareahh[playerid], 0);
						BudynekInfo[uid][nPowieszchnia] = metraz;
						BudynekInfo[uid][nOplata] = gettime()+CZAS_LETNI+(7*24*60*60);
						ZapiszNieruchomosc(uid);
						createdareax[playerid] = 0;
					    createdareay[playerid] = 0;
					    createdareah[playerid] = 0;
					    createdareaxx[playerid] = 0;
					    createdareayy[playerid] = 0;
					    createdareahh[playerid] = 0;
					    DeletePVar(playerid,"typbudynku");
					    Dodajkase(playerid, -(metraz*Lokacja[id][gCena]));
					    return 1;
					}
				}
				if(zy > zx && zy > zx1 && zy > zy1)
				{
				    //Gdzie stoi interior
				    createdareaxx[playerid] = x;
				    createdareayy[playerid] = y;
				    createdareahh[playerid] = z;
				    //Œrodek interioru
				    createdareax[playerid] = xy;
				    createdareay[playerid] = yy+10;
				    createdareah[playerid] = zy;
				    //
				    if(typ == 0)
					{
						typp = 1273;
						new uid = StworzDrzwi(playerid, DaneGracza[playerid][gUID], 0, "Dom", typ, typp, createdareax[playerid], createdareay[playerid], createdareah[playerid], createdareaxx[playerid], createdareayy[playerid], createdareahh[playerid], 0);
						BudynekInfo[uid][nPowieszchnia] = metraz;
						BudynekInfo[uid][nOplata] = gettime()+CZAS_LETNI+(7*24*60*60);
						ZapiszNieruchomosc(uid);
						createdareax[playerid] = 0;
					    createdareay[playerid] = 0;
					    createdareah[playerid] = 0;
					    createdareaxx[playerid] = 0;
					    createdareayy[playerid] = 0;
					    createdareahh[playerid] = 0;
					    DeletePVar(playerid,"typbudynku");
					    Dodajkase(playerid, -(metraz*Lokacja[id][gCena]));
					    return 1;
					}
					else
					{
						typp = 1239;
						new uid = StworzDrzwi(playerid, DaneGracza[playerid][gUID], 0, "Budynek", typ, typp, createdareax[playerid], createdareay[playerid], createdareah[playerid], createdareaxx[playerid], createdareayy[playerid], createdareahh[playerid], 0);
						BudynekInfo[uid][nPowieszchnia] = metraz;
						BudynekInfo[uid][nOplata] = gettime()+CZAS_LETNI+(7*24*60*60);
						ZapiszNieruchomosc(uid);
						createdareax[playerid] = 0;
					    createdareay[playerid] = 0;
					    createdareah[playerid] = 0;
					    createdareaxx[playerid] = 0;
					    createdareayy[playerid] = 0;
					    createdareahh[playerid] = 0;
					    DeletePVar(playerid,"typbudynku");
					    Dodajkase(playerid, -(metraz*Lokacja[id][gCena]));
					    return 1;
					}
				}
				if(zy1 > zx && zy1 > zx1 && zy1 > zy)
				{
				    //Gdzie stoi interior
				    createdareaxx[playerid] = x;
				    createdareayy[playerid] = y;
				    createdareahh[playerid] = z;
				    //Œrodek interioru
				    createdareax[playerid] = xy1;
				    createdareay[playerid] = yy1-10;
				    createdareah[playerid] = zy1;
				    //
				    if(typ == 0)
					{
						typp = 1273;
						new uid = StworzDrzwi(playerid, DaneGracza[playerid][gUID], 0, "Dom", typ, typp, createdareax[playerid], createdareay[playerid], createdareah[playerid], createdareaxx[playerid], createdareayy[playerid], createdareahh[playerid], 0);
						BudynekInfo[uid][nPowieszchnia] = metraz;
						BudynekInfo[uid][nOplata] = gettime()+CZAS_LETNI+(7*24*60*60);
						ZapiszNieruchomosc(uid);
						createdareax[playerid] = 0;
					    createdareay[playerid] = 0;
					    createdareah[playerid] = 0;
					    createdareaxx[playerid] = 0;
					    createdareayy[playerid] = 0;
					    createdareahh[playerid] = 0;
					    DeletePVar(playerid,"typbudynku");
					    Dodajkase(playerid, -(metraz*Lokacja[id][gCena]));
					    return 1;
					}
					else
					{
						typp = 1239;
						new uid = StworzDrzwi(playerid, DaneGracza[playerid][gUID], 0, "Budynek", typ, typp, createdareax[playerid], createdareay[playerid], createdareah[playerid], createdareaxx[playerid], createdareayy[playerid], createdareahh[playerid], 0);
						BudynekInfo[uid][nPowieszchnia] = metraz;
						BudynekInfo[uid][nOplata] = gettime()+CZAS_LETNI+(7*24*60*60);
						ZapiszNieruchomosc(uid);
						createdareax[playerid] = 0;
					    createdareay[playerid] = 0;
					    createdareah[playerid] = 0;
					    createdareaxx[playerid] = 0;
					    createdareayy[playerid] = 0;
					    createdareahh[playerid] = 0;
					    DeletePVar(playerid,"typbudynku");
					    Dodajkase(playerid, -(metraz*Lokacja[id][gCena]));
					    return 1;
					}
				}
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Tworzenie drzwi:","\nNie da siê tutaj postawiæ interioru?\n\nJe¿eli uwa¿asz ¿e miejsce jest jak najbardziej prawid³owe to:\n\tSkontaktuj siê z Administracj¹.\n\tZrób screen'a i wyœlij go do kogoœ z Community Mebagerów lub CEO na Discord albo na forumowe PW.\n", "Rozumiem", "");
			}
		}
	}
	if(dialogid == DIALOG_WB)
	{
	    if(!response) {
		return 1;
		}
		new uid = GetPVarInt(playerid, "UIDPB");
		if(IsPlayerInAnyVehicle(playerid))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Nie mo¿esz tego wykonaæ bêd¹c w pojeŸdzie!", "Zamknij", "");
			return 0;
		}
		if(LakierujeCzas[playerid] != 0 && PrzedmiotInfo[uid][pWar1] == 41)
		{
			PoziomLakieru[playerid] = PrzedmiotInfo[uid][pWar2];
		}
		//legalna, nielegalna
		if(PrzedmiotInfo[uid][pWar4] == 0 && PrzedmiotInfo[uid][pWar1] >= 22 && PrzedmiotInfo[uid][pWar1] <= 31)
		{
		    SendClientMessage(playerid, 0xFFFF00FF,"Ta broñ jest niezarejestrowana, udaj siê na komisariat LSPD i zarejestruj broñ by móc j¹ u¿ywaæ!");
			return 1;
		}
		if(PrzedmiotInfo[uid][pWar4] == -2)
		{
		    SendClientMessage(playerid, 0xFFFF00FF,"Broñ ASG nie zadaje obra¿eñ, pamiêtaj by strzelaæ ni¹ wy³¹cznie do tarczy na strzelnicy!");
		    SendClientMessage(playerid, 0xFFFF00FF,"Pamiêtaj ¿e strzelanie do graczy t¹ broni¹ bêdzie karane!");
		}
		if(PrzedmiotInfo[uid][pWar4] == -1 || PrzedmiotInfo[uid][pWar4] == DaneGracza[playerid][gUID] || PrzedmiotInfo[uid][pWar4] == -2 || PrzedmiotInfo[uid][pWar1] <= 22 || PrzedmiotInfo[uid][pWar1] >= 32)
		{
			MozeBanowac[playerid] = 1;
			AntyCheatBroni[playerid] = 1;
			KillTimer(TimerAntyCheat[playerid]);
			TimerAntyCheat[playerid] = SetTimerEx("WlaczAntyCheata",5000,0,"d",playerid);
			DaneGracza[playerid][gBronUID] = uid;
			DaneGracza[playerid][gBronAmmo] = PrzedmiotInfo[uid][pWar1];
		    PrzedmiotInfo[uid][pUzywany] = 1;
			PosiadanaBron[playerid] = PrzedmiotInfo[uid][pWar1];
			SetPVarInt(playerid, "UzywanaBron", PrzedmiotInfo[uid][pWar1]);
			SetPVarInt(playerid, "UzywanaBronUID", uid);
			dDajBron(playerid, PrzedmiotInfo[uid][pWar1], PrzedmiotInfo[uid][pWar2]);
			ZapiszGracza(playerid);
			strdel(tekst_global, 0, 2048);
			format(tekst_global, sizeof(tekst_global), "wyci¹ga %s %s.", PrzedmiotInfo[uid][pNazwa], inputtext);
			cmd_fasdasfdfive(playerid, tekst_global);
			new akcja[126];
			format(akcja,sizeof(akcja),"*wyci¹ga %s %s*", PrzedmiotInfo[uid][pNazwa], inputtext);
			SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
			new akcja2[126];
			format(akcja2,sizeof(akcja2),"wyciaga %s %s", PrzedmiotInfo[uid][pNazwa], inputtext);
			TextDrawSetString(AkcjaTD[playerid], akcja2);
			TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
			CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
		}
	}
	if(dialogid == DIALOG_TATUAZ)
	{
	    if(!response)
		{
			dShowPlayerDialog(playerid, DIALOG_TATUAZ, DIALOG_STYLE_INPUT, "• Informacja:", "Rozpocz¹³eœ proces tatuowania poni¿ej wpisz treœæ tatua¿u", "Zatwierdz", "");
			return 1;
		}
	    if(strlen(inputtext) < 3)
		{
			dShowPlayerDialog(playerid, DIALOG_TATUAZ, DIALOG_STYLE_INPUT, "• Informacja:", "Rozpocz¹³eœ proces tatuowania poni¿ej wpisz treœæ tatua¿u", "Zatwierdz", "");
			return 1;
		}
		if(antyst(inputtext))
		{
		    dShowPlayerDialog(playerid, DIALOG_TATUAZ, DIALOG_STYLE_INPUT, "• Informacja:", "Rozpocz¹³eœ proces tatuowania poni¿ej wpisz treœæ tatua¿u\n{FF0000)/ ; : ' * - Te znaki s¹ niedozwolone!", "Zatwierdz", "");
			return 1;
		}
		UsunPLZnaki(inputtext);
		new tatuazysta;
		tatuazysta = GetPVarInt(playerid, "TATUAZ");
		new astr[512];
		format(astr, sizeof(astr), "INSERT INTO `jochym_tatuaze` (`UID`, `GUID`, `UIDT`, `GUIDT`, `Tatuaz`) VALUES ('%d', '%d', '%d', '%d', '%s')", DaneGracza[playerid][gUID], DaneGracza[playerid][gGUID], DaneGracza[tatuazysta][gUID], DaneGracza[tatuazysta][gGUID], inputtext);
		mysql_check();
		mysql_query2(astr);
		mysql_free_result();
		new maszynka;
		maszynka = GetPVarInt(tatuazysta, "MaszynkaTATO");
		PrzedmiotInfo[maszynka][pWar1] = 0;
		PrzedmiotInfo[maszynka][pWar2] = 0;
		ZapiszPrzedmiot(maszynka);
		DaneGracza[playerid][gTatuaze] += 1;
		ZapiszGracza(playerid);
		GameTextForPlayer(tatuazysta,"~g~Wytatuowano",5000,3);
		GameTextForPlayer(playerid,"~g~Wytatuowano.",5000,3);
	}
	if(dialogid == DIALOG_OPISY)
	{
		if(response)
		{
			SetPVarInt(playerid, "OpcjeOpis", strval(inputtext));
			new opcje[256];
			format(opcje, sizeof(opcje), "%s\n» Ustaw opis", opcje);
			format(opcje, sizeof(opcje), "%s\n» Usuñ opis", opcje);
			dShowPlayerDialog(playerid, DIALOG_OPISY_OPCJE, DIALOG_STYLE_LIST, "• Opcje opisów::", opcje, "Wybierz", "Zamknij");
		}
	}
	if(dialogid == DIALOG_OPISY_OPCJE)
	{
	    if(!response) 
		{
			return 1;
		}
	    switch(listitem)
	    {
	        case 0: 
			{
				new uid = GetPVarInt(playerid, "OpcjeOpis");
				DestroyDynamic3DTextLabel(Text3D:Opisek[playerid]);
				new string[256];
				format(string, sizeof(string), "Opis twojej postaci zosta³ ustawiony na:\n%s\nAby usun¹æ opis swojej postaci wpisz: /opis", Opisy[uid][opOpis]);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", string, "Zamknij", "");
				strdel(tekst_globals, 0, 200);
				format(tekst_globals, sizeof(tekst_globals), "%s", BreakLines(Opisy[uid][opOpis], "\n", 32));
				UpdateDynamic3DTextLabelText(DaneGracza[playerid][gOpisPostaci], 0xAAAAFFFF, tekst_globals);
				return 1;
			}
			case 1:
			{
				new uid = GetPVarInt(playerid, "OpcjeOpis");
				Opisy[uid][opID] = 0;
				Opisy[uid][opGUID] = 0;
				Opisy[uid][opUID] = 0;
				format(zapyt, sizeof(zapyt), "DELETE FROM `jochym_opisy` WHERE `ID` = '%d' AND `GUID` = '%d'", uid, DaneGracza[playerid][gGUID]);
				mysql_query(zapyt);
				new string[256];
				format(string, sizeof(string), "Opis zosta³ usuniêty z listy poprawnie.");
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", string, "Zamknij", "");
				return 1;
			}
		}
	}
	if(dialogid == DIALOG_TAG)
	{
		new find = Tag[playerid];
		if(!response) 
		{
			ObiektInfo[find][gZajety] = 0;
			return 1;
		}
		if(strlen(inputtext) < 10)
		{
			dShowPlayerDialog(playerid, DIALOG_TAG, DIALOG_STYLE_INPUT, "• Informacja:", "Rozpocz¹³eœ proces tagowania poni¿ej wpisz tag jaki ma siê pokazaæ po zakoñczeniu tego procesu.\nTag powinien zawieraæ przynajmniej 10 znaków.", "Zatwierdz", "Zamknij");
			return 1;
		}
		SetPVarString(playerid,"tagnapis",inputtext);
		new bron_uid = GetPVarInt(playerid, "UzywanaBronUID");
		PoziomLakieru[playerid] = PrzedmiotInfo[bron_uid][pWar2];
		LakierujeCzas[playerid] = 1;
		PJ[playerid] = 0;
		SetPVarInt(playerid, "TAGDUTY", DaneGracza[playerid][gSluzba]);
		UpdateDynamic3DTextLabelText(ObiektInfo[find][objNapis], 0xC2A2DAFF, "Rozpoczynanie tagowania");
	}
	if(dialogid == DIALOG_KAMERA)
	{
	    if(response == 1)
	    {
	        new uid = strval(inputtext);
	        if(SpecUruchomiony[playerid])
			{
		        SetCameraBehindPlayer(playerid);
			    SpecUruchomiony[playerid] = 0;
			    TextDrawHideForPlayer(playerid, OBJ[playerid]);
			    return 1;
			}
			else
			{
			    SpecUruchomiony[playerid] = 1;
			    SetPlayerCameraPos(playerid, ObiektInfo[uid][objPozX], ObiektInfo[uid][objPozY], ObiektInfo[uid][objPozZ]);
			    SetPlayerCameraLookAt(playerid, ObiektInfo[uid][objPosX], ObiektInfo[uid][objPosY], ObiektInfo[uid][objPosZ]);
                new vw = GetPlayerVirtualWorld(playerid);
				strdel(tekst_global, 0, 2048);
			    format(tekst_global, sizeof(tekst_global), "~p~UID Kamery: ~w~%d,~p~ Model: ~w~%d~n~~r~Pozycja:~w~ %0.01f, %0.01f, %0.01f~n~~r~Rotacja:~w~ %0.01f, %0.01f, %0.01f~n~~r~VW:~w~ %d",
				ObiektInfo[uid][objUID], ObiektInfo[uid][objModel], ObiektInfo[uid][objPozX], ObiektInfo[uid][objPozY], ObiektInfo[uid][objPozZ], ObiektInfo[uid][objRotX], ObiektInfo[uid][objRotY], ObiektInfo[uid][objRotZ], vw);
				TextDrawSetString(OBJ[playerid], tekst_global);
				TextDrawShowForPlayer(playerid, OBJ[playerid]);
			}
	    }
	}
	if(dialogid == DIALOG_ZLOMUJ)
	{
	    if(response == 1)
	    {
	        new text[512];
		    new uid = GetPVarInt(playerid, "zlomuj");
		    new cena = GetPVarInt(playerid, "zlomujc");
			PojazdInfo[uid][pOwnerPostac] = 0;
			PojazdInfo[uid][pOwnerDzialalnosc] = 13;//Grupa zlomowiska
			PojazdInfo[uid][pMoc] = cena*2;
			PojazdInfo[uid][pPrzepchany] = 0;
			PojazdInfo[uid][pHolowany] = 0;
			PojazdInfo[uid][pSpawn] = 0;
			KillTimer(PojazdInfo[uid][pTimer]);
			UsunPojazdUID(uid);
			ZapiszPojazd(uid, 1);
			ZapiszPojazd(uid, 2);
			Dodajkase(playerid, cena);
			format(text, sizeof(text), "Zez³omowa³eœ swój pojazd (%d) za $%d", uid, cena);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Z³omowisko:", text, "Rozumiem", "");
			return 1;
		}
		else
  		{
  		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Z³omowisko:", "Anulowa³eœ z³omowanie swojego pojazdu.", "Rozumiem", "");
			return 1;
		}
	}
	if(dialogid == DIALOG_WYSCIG_OPCJE)
	{
		if(!response) {
			return 1;
		}
	    switch(listitem)
	    {
	        case 0: 
			{
				if(DaneGracza[playerid][gSluzba] == 0)
				{
					GameTextForPlayer(playerid, "~r~Nie znajdujesz sie na sluzbie organizacji.", 3000, 5);
					return 0;
				}
				new find, list_race[256];
				ForeachEx(i, MAX_WYSCIG)
				{
					if(WyscigInfo[i][StworzylTrase] == DaneGracza[playerid][gSluzba] && WyscigInfo[i][TrasaNR] == 0)
					{
						format(list_race, sizeof(list_race), "%s\n%d\t%s", list_race, WyscigInfo[i][wUID], WyscigInfo[i][wNazwa]);
						find++;
					}
				}
				if(find > 0) dShowPlayerDialog(playerid, DIALOG_WYSCIG_DOLACZ, DIALOG_STYLE_LIST, "• Trasy Grupy:", list_race, "Do³¹cz", "Zamknij");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ta Grupa nie posiada stworzonych tras wyœcigowych.", "Zamknij", "");
			}
	        case 1:
			{
				if(!ZarzadzanieSWyscig(playerid) && GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA)
				{
					GameTextForPlayer(playerid, "~r~Brak uprawnien.", 3000, 5);
					return 0;
				}
				dShowPlayerDialog(playerid, DIALOG_WYSCIG_STWORZ, DIALOG_STYLE_INPUT, "• Tworzenie trasy wyœcigowej:", "Podaj nazwe trasy, któr¹ chcesz stworzyæ nastêpnie wciœnij ''Dalej''\n", "Dalej", "Zamknij");
			}
			case 2:
			{
    			if(!ZarzadzanieSWyscig(playerid) && GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA)
				{
					GameTextForPlayer(playerid, "~r~Brak uprawnien.", 3000, 5);
					return 0;
				}
				if(DaneGracza[playerid][gWyscig] == 0)
				{
					GameTextForPlayer(playerid, "~r~Aktualnie nie uczestniczysz w zadnym wyscigu.", 3000, 5);
					return 0;
				}
				new race = DaneGracza[playerid][gWyscig];
				WyscigInfo[race][wMiejsce] = 0;
				ForeachEx(i, MAX_PLAYERS)
				{
				    if(IsPlayerConnected(i))
				    {
					    if(zalogowany[i] == true)
						{
							if(DaneGracza[i][gWyscig] == DaneGracza[playerid][gWyscig])
							{
								new str[256];
								format(str, sizeof(str), "~g~Organizator:~w~~n~ %s ~r~rozpoczal wyscig: ~w~%s~n~zacznie sie za 10 sekund.", ZmianaNicku(playerid), WyscigInfo[race][wNazwa]);
								CzasWyswietlaniaTextuNaDrzwiach[i] = 20;
								TextDrawHideForPlayer(i, TextNaDrzwi[i]);
								TextDrawSetString(TextNaDrzwi[i], str);
								TextDrawShowForPlayer(i, TextNaDrzwi[i]);

								DaneGracza[playerid][gCheckopintID] = 0;
								//SetPlayerCheckpoint(i, WyscigInfo[race][wX], WyscigInfo[race][wY], WyscigInfo[race][wZ], 8);
								new nextto = SzukajCheckpointu(1, WyscigInfo[DaneGracza[i][gWyscig]][StworzylTrase],WyscigInfo[DaneGracza[i][gWyscig]][wNazwa]);
								SetPlayerRaceCheckpoint(i,0,WyscigInfo[race][wX], WyscigInfo[race][wY], WyscigInfo[race][wZ],WyscigInfo[nextto][wX], WyscigInfo[nextto][wY], WyscigInfo[nextto][wZ],8);

								DaneGracza[i][gKoniecWyscigu] = 0;
								DaneGracza[i][gRaceTimeStart] = 10;
								Frezuj(i, 0);
								format(str, sizeof(str), "~w~%d", DaneGracza[i][gRaceTimeStart]);
								GameTextForPlayer(i, str, 1000, 4);
							}
						}
					}
				}
			}
			case 3: 
			{
				if(DaneGracza[playerid][gSluzba] == 0)
				{
					GameTextForPlayer(playerid, "~r~Nie znajdujesz sie na sluzbie organizacji.", 3000, 5);
					return 0;
				}
				new find, list_race[256];
				ForeachEx(i, MAX_PLAYERS)
				{
				    if(IsPlayerConnected(i))
				    {
					    if(zalogowany[i] == true)
						{
							if(DaneGracza[i][gWyscig] == DaneGracza[playerid][gWyscig] && playerid != i)
							{
								format(list_race, sizeof(list_race), "%s\n%d\t%s", list_race, i, ZmianaNicku(i));
								find++;
							}
						}
					}
				}
				if(find > 0) dShowPlayerDialog(playerid, DIALOG_WYSCIG_WYRZUC, DIALOG_STYLE_LIST, "• Lista uczestników:", list_race, "Wyrzuc", "Zamknij");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aktualnie nikt nie nale¿y do tego wyœcigu.", "Zamknij", "");
			}
	    }
	}
	if(dialogid == DIALOG_WYSCIG_DOLACZ)
	{
		if(!response) {
		return 1;
		}
		if(Pracuje[playerid] != 0)
		{
			GameTextForPlayer(playerid, "~r~Aktualnie sprzatasz ulice. Anuluj zlecenie, aby dolaczyc do wyscigu.", 3000, 5);
			return 0;
		}
		if(DaneGracza[playerid][gSluzba] == 0)
		{
			GameTextForPlayer(playerid, "~r~Nie znajdujesz sie na sluzbie organizacji.", 3000, 5);
			return 0;
		}
		if(!ZarzadzanieDolaczanieWys(playerid) && GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA)
		{
			GameTextForPlayer(playerid, "~r~Brak uprawnien.", 3000, 5);
			return 0;
		}
		if(DaneGracza[playerid][gTworzyWyscig] != 0) 
		{
			GameTextForPlayer(playerid, "~r~Aktualnie tworzysz jakis wyscig.", 3000, 5);
			return 1;
		}
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aby do³¹czyæ do trasy musisz siê znajdowaæ w pojezdzie.", "Zamknij", "");
		if(DaneGracza[playerid][gWyscig] != 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aktualnie uczestniczysz ju¿ w jakimœ wyœcigu", "Zamknij", "");
		new uid = strval(inputtext);
		//ZaladujWyscig(WyscigInfo[uid][wNazwa]);
		new str[256];
		if(uid <= 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "System nie zarejestrowa³ takiej trasy wyœcigowej.", "Zamknij", "");
		format(str, sizeof(str), "~g~Dolaczyles do wyscigu: ~w~%s~n~Teraz mozesz zapraszac uczestnikow.", WyscigInfo[uid][wNazwa]);
		CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
		TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
		TextDrawSetString(TextNaDrzwi[playerid], str);
		TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
		DaneGracza[playerid][gWyscig] = WyscigInfo[uid][wUID];
		new texts[124];
		format(texts, sizeof(texts), "** Gracz: %s do³¹czy³ do wyœcigu.", ZmianaNicku(playerid));
		KomuninikatWyscig(playerid,texts);
	}
	if(dialogid == DIALOG_REJBRONI)//rejestracja broni
	{
		if(!response) {
		return 1;
		}
		new uid = strval(inputtext);
		new playerid2 = GetPVarInt(playerid, "REJBRONI");
		if(PrzedmiotInfo[uid][pUzywany] != 0)
		{
			UzywanieItemu(GetPVarInt(playerid, "REJBRONI"), uid);
		}
		PrzedmiotInfo[uid][pWar4] = DaneGracza[playerid2][gUID];
		ZapiszPrzedmiot(uid);
		new akcjarp[126];
		format(akcjarp,sizeof(akcjarp),"rejestruje %s na %s w bazie danych LSPD.", PrzedmiotInfo[uid][pNazwa], ZmianaNicku(playerid2));
		cmd_me(playerid, akcjarp);
	    new akcja[126];
		format(akcja,sizeof(akcja),"*rejestruje %s na %s w bazie danych LSPD*", PrzedmiotInfo[uid][pNazwa], ZmianaNicku(playerid2));
		SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
		new akcja2[126];
		format(akcja2,sizeof(akcja2),"rejestruje %s na %s w bazie danych LSPD", PrzedmiotInfo[uid][pNazwa], ZmianaNicku(playerid2));
		TextDrawSetString(AkcjaTD[playerid], akcja2);
		TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
		CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
	}
	if(dialogid == DIALOG_KAJDANKI)
	{
	    if(response)
		{
		    cmd_skuj(playerid, inputtext);
		    return 1;
		}
	}
	if(dialogid == DIALOG_SZNUR)
	{
	    if(response)
		{
		    cmd_zwiaz(playerid, inputtext);
		    return 1;
		}
	}
	if(dialogid == DIALOG_WOREK)
	{
	    if(response)
		{
		    cmd_worek(playerid, inputtext);
		    return 1;
		}
	}
	if(dialogid == DIALOG_ZABIERZ)
	{
		if(!response) {
		return 1;
		}
		new uid = strval(inputtext);
		if(PrzedmiotInfo[uid][pUzywany] != 0)
		{
			GameTextForPlayer(playerid, "~r~Gracz uzywa tego przedmiotu!", 3000, 5);
			return 0;
		}
		PrzedmiotInfo[uid][pOwner] = DaneGracza[playerid][gUID];
		ZapiszPrzedmiot(uid);
		new przelew[124];
		format(przelew, sizeof(przelew), "[ZABIERZ] Gracz: %s (ID:%d) zabra³ przedmiot graczu: %s (ID:%d, %s)",ZmianaNicku(playerid), playerid, ZmianaNicku(GetPVarInt(playerid, "IDZAB")), GetPVarInt(playerid, "IDZAB"), PrzedmiotInfo[uid][pNazwa]);
		KomunikatAdmin(1, przelew);
		new akcjarp[126];
		format(akcjarp,sizeof(akcjarp),"zabiera przedmiot %s od %s.", PrzedmiotInfo[uid][pNazwa], ZmianaNicku(GetPVarInt(playerid, "IDZAB")));
		cmd_me(playerid, akcjarp);
	    new akcja[126];
		format(akcja,sizeof(akcja),"*zabiera przedmiot %s od %s*", PrzedmiotInfo[uid][pNazwa], ZmianaNicku(GetPVarInt(playerid, "IDZAB")));
		SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
		new akcja2[126];
		format(akcja2,sizeof(akcja2),"zabiera przedmiot %s od %s", PrzedmiotInfo[uid][pNazwa], ZmianaNicku(GetPVarInt(playerid, "IDZAB")));
		TextDrawSetString(AkcjaTD[playerid], akcja2);
		TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
		CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
	}
	if(dialogid == DIALOG_WYSCIG_WYRZUC)
	{
		if(!response) {
		return 1;
		}
		if(DaneGracza[playerid][gSluzba] == 0)
		{
			GameTextForPlayer(playerid, "~r~Nie znajdujesz sie na sluzbie organizacji.", 3000, 5);
			return 0;
		}
		if(!ZarzadzanieSWyscig(playerid) && GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA)
		{
			GameTextForPlayer(playerid, "~r~Brak uprawnien.", 3000, 5);
			return 0;
		}
		new uid = strval(inputtext);
		new texts[256];
		format(texts, sizeof(texts), "** Zosta³eœ wyproszony z wyœcigu przez gracza: %s.", ZmianaNicku(playerid));
		SendClientMessage(uid, 0xFFb00000, texts);
		cmd_opusc(uid, "");
	}
	if(dialogid == DIALOG_WYSCIG_STWORZ)
	{
		if(!response) {
		return 1;
		}
		if(DaneGracza[playerid][gSluzba] == 0)
		{
			GameTextForPlayer(playerid, "~r~Nie znajdujesz sie na sluzbie organizacji.", 3000, 5);
			return 0;
		}
		//if(GrupaInfo[DaneGracza[playerid][gSluzba]][gSaldo] < 1000)
		//{
		//	GameTextForPlayer(playerid, "~r~Brak potrzebnych srodkow na koncie grupy.", 3000, 5);
		//	return 0;
		//}
		if(DaneGracza[playerid][gTworzyWyscig] != 0) 
		{
			GameTextForPlayer(playerid, "~r~Aktualnie tworzysz juz jakis wyscig.", 3000, 5);
			return 1;
		}
		if(!strlen(inputtext))
		{
			dShowPlayerDialog(playerid, DIALOG_WYSCIG_STWORZ, DIALOG_STYLE_INPUT, "• Tworzenie trasy wyœcigowej:", "Podaj nazwe trasy, któr¹ chcesz stworzyæ nastêpnie wciœnij ''Dalej''\n", "Dalej", "Zamknij");
			return 0;
		}
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aby stworzyænow¹ trase musisz siê znajdowaæ w pojezdzie.", "Zamknij", "");
		if(DaneGracza[playerid][gWyscig] != 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aktualnie {88b7711}uczestniczysz ju¿ w jakimœ wyœcigu", "Zamknij", "");
		new zroc = 0;
		if(zroc != 0)
		{
			dShowPlayerDialog(playerid, DIALOG_WYSCIG_STWORZ, DIALOG_STYLE_INPUT, "• Tworzenie trasy wyœcigowej:", "Podaj nazwe trasy, któr¹ chcesz stworzyæ nastêpnie wciœnij ''Dalej''\n\n{CC0000}Trasa o takiej nazwie ju¿ istnieje.", "Dalej", "Zamknij");
			return 0;
		}
		new Float: x, Float: y, Float: z;
		GetVehiclePos(GetPlayerVehicleID(playerid), x, y, z);
		strtolower(inputtext);
		inputtext[0] = toupper(inputtext[0]);
		ForeachEx(i, MAX_WYSCIG)
		{
			if(ComparisonString(WyscigInfo[i][wNazwa], inputtext))
			{
				zroc = i;
				break;
			}
		}
		format(DaneGracza[playerid][gTworzyWyscigNazwa], 124, "%s", inputtext);
		new dz;
		switch(DutyNR[playerid])
		{
			case 1: 
				dz = DaneGracza[playerid][gDzialalnosc1];
			case 2: 
				dz = DaneGracza[playerid][gDzialalnosc2];
			case 3: 
				dz = DaneGracza[playerid][gDzialalnosc3];
			case 4: 
				dz = DaneGracza[playerid][gDzialalnosc4];
			case 5: 
				dz = DaneGracza[playerid][gDzialalnosc5];
			case 6: 
				dz = DaneGracza[playerid][gDzialalnosc6];
		}
		TrasaDuty[playerid] = dz;
		DaneGracza[playerid][gTworzyWyscig] = DodajWyscig(x, y, z, DaneGracza[playerid][gTworzyWyscigCP], dz, DaneGracza[playerid][gTworzyWyscigNazwa]);
		TrasaDutyNr[playerid] = DaneGracza[playerid][gTworzyWyscig];
		new str[256];
		format(str, sizeof(str), "Tworzenie wyscigu zostalo rozpoczete. Jedz po mapie i tworz CheckPointy za pomoca spacji.~n~~n~~r~CheckPoint: ~w~%d/20~n~~n~~b~~h~Nazwa: ~n~~w~%s", DaneGracza[playerid][gTworzyWyscigCP], DaneGracza[playerid][gTworzyWyscigNazwa]);
		CzasWyswietlaniaTextuNaDrzwiach[playerid] = 60;
		TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
		TextDrawSetString(TextNaDrzwi[playerid], str);
		TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
		//GrupaInfo[DaneGracza[playerid][gSluzba]][gSaldo] -= 1000;
		//ZapiszSaldo(DaneGracza[playerid][gSluzba]);
		return 1;
	}
	if(dialogid == DIALOG_EDIT)
	{
	    switch(listitem)
	    {
	        case 0: dShowPlayerDialog(playerid,DIALOG_EANGLE,DIALOG_STYLE_INPUT,"•» Fotoradary","Proszê wpisaæ nowy k¹t","Akceptuj","Zamknij");
	        case 1: dShowPlayerDialog(playerid,DIALOG_ERANGE,DIALOG_STYLE_INPUT,"•» Fotoradary","Wpisz nowy zakres","Akceptuj","Zamknij");
	        case 2: dShowPlayerDialog(playerid,DIALOG_ELIMIT,DIALOG_STYLE_INPUT,"•» Fotoradary","Wpisz nowy limit prêdkoœci","Akceptuj","Zamknij");
			case 6:
			{
				UsunFotoradar(GetPVarInt(playerid,"selected"));
			 	SendClientMessage(playerid,COLOR_GREEN,"Fotoradar zosta³ usuniêty.");
			 	DeletePVar(playerid,"selected");
			}
	    }
	    if(!response) {
		DeletePVar(playerid,"Zakres");
		DeletePVar(playerid,"Limit");
		DeletePVar(playerid,"Kara pieniê¿na");
		DeletePVar(playerid,"Dobieranie");
		return 1;
		}
	}
	if(dialogid == DIALOG_EANGLE)
	{
	    if(!strlen(inputtext)) return dShowPlayerDialog(playerid,DIALOG_EANGLE,DIALOG_STYLE_INPUT,"•» Fotoradary","Proszê wpisaæ nowy k¹t","Akceptuj","Zamknij");
	    new id = GetPVarInt(playerid,"selected");
	    new rot = strval(inputtext);
	    rot = rot + 180;
	    if (rot > 360)
	    {
	        rot = rot - 360;
	    }
        FotoInfo[id][_rot] = rot;
        SetDynamicObjectRot(FotoInfo[id][_objectid],0,0,rot);
        ZapiszFotoradary(id);
	    SendClientMessageEx(playerid,COLOR_GREEN,"sisis","K¹t fotoradaruID ",id," zosta³o pomyœlnie zaktualizowane do ",strval(inputtext),".");
	    if(!response) {
		DeletePVar(playerid,"Zakres");
		DeletePVar(playerid,"Limit");
		DeletePVar(playerid,"Kara pieniê¿na");
		DeletePVar(playerid,"Dobieranie");
		return 1;
		}
	}
	if(dialogid == DIALOG_ERANGE)
	{
	    if(!strlen(inputtext)) return dShowPlayerDialog(playerid,DIALOG_ERANGE,DIALOG_STYLE_INPUT,"•» Fotoradary","Wpisz nowy zakres","Akceptuj","Zamknij");
	    new id = GetPVarInt(playerid,"selected");
		FotoInfo[id][_range] = strval(inputtext);
		ZapiszFotoradary(id);
	    SendClientMessageEx(playerid,COLOR_GREEN,"sisis","Zakres fotoradaruID ",id," zosta³o pomyœlnie zaktualizowane do ",strval(inputtext),".");
	    if(!response) {
		DeletePVar(playerid,"Zakres");
		DeletePVar(playerid,"Limit");
		DeletePVar(playerid,"Kara pieniê¿na");
		DeletePVar(playerid,"Dobieranie");
		return 1;
		}
	}
	if(dialogid == DIALOG_ELIMIT)
	{
	    if(!response) {
		DeletePVar(playerid,"Zakres");
		DeletePVar(playerid,"Limit");
		DeletePVar(playerid,"Kara pieniê¿na");
		DeletePVar(playerid,"Dobieranie");
		return 1;
		}
	    if(!strlen(inputtext)) return dShowPlayerDialog(playerid,DIALOG_ELIMIT,DIALOG_STYLE_INPUT,"•» Fotoradary","Wpisz nowy limit prêdkoœci","Akceptuj","Zamknij");
	    new id = GetPVarInt(playerid,"selected");
		FotoInfo[id][_limit] = strval(inputtext);
		ZapiszFotoradary(id);
	    SendClientMessageEx(playerid,COLOR_GREEN,"sisis","Limit prêdkoœci fotoradaruID ",id," zosta³o pomyœlnie zaktualizowane do ",strval(inputtext),".");
	}
////////////////////////////////////////////////////////////////////////////////
	if(dialogid == DIALOG_ANIM)
	{
       	if(response)
		{
			new found = 0;
			ForeachEx(i, MAX_ANIM)
			{
				if(!isnull(AnimInfo[i][CMD]))
				{
					if(!strcmp(inputtext, AnimInfo[i][CMD], true))
					{
						if(AnimInfo[i][Toggle] == 2) SetPlayerSpecialAction(playerid, AnimInfo[i][Loop]);
						else
						{
							ApplyAnimation(playerid, AnimInfo[i][Lib], AnimInfo[i][Name], AnimInfo[i][Speed], AnimInfo[i][Loop], AnimInfo[i][Lock][0], AnimInfo[i][Lock][1], AnimInfo[i][Freeze], AnimInfo[i][aTime], 1);
							SetPVarInt(playerid, "PlayAnim", 0);
							animacja[playerid] = 1;
							if(AnimInfo[i][Toggle] == 1) SetPVarInt(playerid, "PlayAnim", 1);
						}
						found++;
					}
				}
			}
			if(found == 0) PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
		}
		return 1;
	}
	if(dialogid == DIALOG_FIRSTPERSON)
	{
	    if(response)
		{
		    switch(listitem)
        	{
			    case 0:
			    {
			        SetPVarInt(playerid, "FirstPerson", 1);
			        guyfps[playerid]=1;
					FPSMode(playerid);
			        GameTextForPlayer(playerid, "~w~First Person ~g~ON.", 3000, 5);
			        return 1;
				}
				case 1:
				{
				    SetPVarInt(playerid, "FirstPerson", 0);
				    SetCameraBehindPlayer(playerid);
		    		guyfps[playerid] = 0;
				    GameTextForPlayer(playerid, "~w~First Person ~r~OFF.", 3000, 5);
				    return 0;
				}
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_ANIM_PRZYCISK)
	{
	    if(response)
		{
		    if(DaneGracza[playerid][gAnim] == 0)
		    {
				new found = 0;
				ForeachEx(i, MAX_ANIM)
				{
					if(!isnull(AnimInfo[i][CMD]))
					{
						if(!strcmp(inputtext, AnimInfo[i][CMD], true))
						{
							if(AnimInfo[i][Toggle] == 2) SetPlayerSpecialAction(playerid, AnimInfo[i][Loop]);
							else
							{
								ApplyAnimation(playerid, AnimInfo[i][Lib], AnimInfo[i][Name], AnimInfo[i][Speed], AnimInfo[i][Loop], AnimInfo[i][Lock][0], AnimInfo[i][Lock][1], AnimInfo[i][Freeze], AnimInfo[i][aTime], 1);
								SetPVarInt(playerid, "PlayAnim", 0);
								animacja[playerid] = 1;
								format(DaneGracza[playerid][gAnimacja], 64, "%s", AnimInfo[i][CMD]);
								DaneGracza[playerid][gAnim] = 1;
								ZapiszGracza(playerid);
								if(AnimInfo[i][Toggle] == 1) SetPVarInt(playerid, "PlayAnim", 1);
							}
							found++;
						}
					}
				}
				if(found == 0) PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
				return 1;
			}
			else
			{
			    DaneGracza[playerid][gAnim] = 0;
			    ZapiszGracza(playerid);
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Animacja na przycisk:", "Animacja zosta³a wy³¹czona.", "Zamknij", "");
				return 1;
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_ITEM_NOTES)
    {
        new uz = GetPVarInt(playerid, "UzytyItem");
        if(response)
        {
            if(strlen(inputtext)<3||strlen(inputtext)>124)
			{
                dShowPlayerDialog(playerid, DIALOG_ITEM_NOTES, DIALOG_STYLE_INPUT, "• Informacja:", "Wpisz treœæ jaka ma zostaæ ukazana na karteczce:\nOd 3 do 124 znaków.", "Zapisz", "Anuluj");
			}
			else
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Karteczka znajduje siê w twoim ekwipunku.", "Zamknij", "");
				DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_KARTECZKA, 0, 0, "Karteczka", DaneGracza[playerid][gUID], 0, gettime()+CZAS_LETNI+(24*60*60*2), 0, 0, 0, 0, inputtext);
				PrzedmiotInfo[uz][pWar1]--;
				if(PrzedmiotInfo[uz][pWar1] == 0)
				{
					UsunPrzedmiot(uz);
				}
				else
				{
					ZapiszPrzedmiot(uz);
				}
			}
		}
        else
        {
            return 1;
        }
        return 1;
    }
    if(dialogid == DIALOG_OPCJE_OPC)
    {
        if(response)
		{
		    new vehicleid = GetPlayerVehicleID(playerid);
			new veh = SprawdzCarUID(vehicleid);
		    if(listitem == 0)//Otwórz maskê
		    {
		        strdel(tekst_global, 0, 2048);
				if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER)
				{
				    format(tekst_global, sizeof(tekst_global), "%s\n» Otwórz maskê", tekst_global);
				    format(tekst_global, sizeof(tekst_global), "%s\n» Zamknij maskê", tekst_global);
				    dShowPlayerDialog(playerid, DIALOG_MASKA_CAR, DIALOG_STYLE_LIST, "• Maska:", tekst_global, "Wybierz", "Zamknij");
				}
				else
				{
				    CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
					TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
					TextDrawSetString(TextNaDrzwi[playerid], "To moze zrobic kierowca pojazdu");
					TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
				}
		    }
		    if(listitem == 1)//Otwórz baga¿nik
		    {
		        strdel(tekst_global, 0, 2048);
				if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER)
				{
				    format(tekst_global, sizeof(tekst_global), "%s\n» Otwórz baga¿nik", tekst_global);
				    format(tekst_global, sizeof(tekst_global), "%s\n» Zamknij baga¿nik", tekst_global);
				    dShowPlayerDialog(playerid, DIALOG_BAGAZNIK_CAR, DIALOG_STYLE_LIST, "• Baga¿nik:", tekst_global, "Wybierz", "Zamknij");
				}
				else
				{
				    CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
					TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
					TextDrawSetString(TextNaDrzwi[playerid], "To moze zrobic kierowca pojazdu");
					TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
				}
		    }
		    if(listitem == 2)//Otwórz drzwi
		    {
		        //
		    }
		    if(listitem == 3)//Otwórz szyby
		    {
		        if(!Wlascicielpojazdu(vehicleid, playerid))
				{
					return 0;
				}
				if(!SzybyBrak(vehicleid))
				{
					strdel(tekst_global, 0, 2048);
					new siedzi = GetPlayerVehicleSeat(playerid);
	 				if(siedzi == 0)
	 				{
						if(PojazdInfo[veh][pSzyba] == 0)
						{
		                    format(tekst_global, sizeof(tekst_global), "%s\n» Zamknij szybê kierowcy", tekst_global);
						}
						else
						{
							format(tekst_global, sizeof(tekst_global), "%s\n» Otwórz szybê kierowcy", tekst_global);
						}
						if(PojazdInfo[veh][pSzyba2] == 0)
						{
		                    format(tekst_global, sizeof(tekst_global), "%s\n» Zamknij szybê pasa¿era", tekst_global);
						}
						else
						{
							format(tekst_global, sizeof(tekst_global), "%s\n» Otwórz szybê pasa¿era", tekst_global);
						}
						if(PojazdInfo[veh][pSzyba3] == 0)
						{
		                    format(tekst_global, sizeof(tekst_global), "%s\n» Zamknij szybê tyln¹ lew¹", tekst_global);
						}
						else
						{
							format(tekst_global, sizeof(tekst_global), "%s\n» Otwórz szybê tyln¹ lew¹", tekst_global);
						}
						if(PojazdInfo[veh][pSzyba4] == 0)
						{
		                    format(tekst_global, sizeof(tekst_global), "%s\n» Zamknij szybê tyln¹ praw¹", tekst_global);
						}
						else
						{
							format(tekst_global, sizeof(tekst_global), "%s\n» Otwórz szybê tyln¹ praw¹", tekst_global);
						}
						format(tekst_global, sizeof(tekst_global), "%s\n» Otwórz wszystkie szyby", tekst_global);
						format(tekst_global, sizeof(tekst_global), "%s\n» Zamknij wszystkie szyby", tekst_global);
						dShowPlayerDialog(playerid, DIALOG_SZYBY_OPCJE, DIALOG_STYLE_LIST, "• Szyby samochodowe:", tekst_global, "Wybierz", "Zamknij");
					}
					if(siedzi == 1)
	 				{
	 				    if(PojazdInfo[veh][pSzyba2] == 0)
						{
		                    format(tekst_global, sizeof(tekst_global), "%s\n» Zamknij szybê", tekst_global);
						}
						else
						{
							format(tekst_global, sizeof(tekst_global), "%s\n» Otwórz szybê", tekst_global);
						}
						dShowPlayerDialog(playerid, DIALOG_SZYBY_OPCJE3, DIALOG_STYLE_LIST, "• Szyby samochodowe:", tekst_global, "Wybierz", "Zamknij");
					}
					if(siedzi == 2)
					{
					    if(PojazdInfo[veh][pSzyba3] == 0)
						{
		                    format(tekst_global, sizeof(tekst_global), "%s\n» Zamknij szybê", tekst_global);
						}
						else
						{
							format(tekst_global, sizeof(tekst_global), "%s\n» Otwórz szybê", tekst_global);
						}
					    dShowPlayerDialog(playerid, DIALOG_SZYBY_OPCJE3, DIALOG_STYLE_LIST, "• Szyby samochodowe:", tekst_global, "Wybierz", "Zamknij");
					}
					if(siedzi == 3)
					{
					    if(PojazdInfo[veh][pSzyba4] == 0)
						{
		                    format(tekst_global, sizeof(tekst_global), "%s\n» Zamknij szybê", tekst_global);
						}
						else
						{
							format(tekst_global, sizeof(tekst_global), "%s\n» Otwórz szybê", tekst_global);
						}
					    dShowPlayerDialog(playerid, DIALOG_SZYBY_OPCJE4, DIALOG_STYLE_LIST, "• Szyby samochodowe:", tekst_global, "Wybierz", "Zamknij");
					}
				}
				else
				{
				    //Brak szyb w pojeŸdzie
				}
		    }
			if(listitem == 4)
			{
			    if(!Wlascicielpojazdu(vehicleid, playerid))
				{
					return 0;
				}
				if(GetPlayerState(playerid) == PLAYER_STATE_PASSENGER)
				{
				    return 0;
				}
				new vehid = GetPlayerVehicleID(playerid);
				new vehuid = SprawdzCarUID(vehid);
			    if(PojazdInfo[vehuid][pNitro] == 0)
			    {
					if(GetVehicleComponentInSlot(GetPlayerVehicleID(playerid), GetVehicleComponentType(1010)) == 1010)
					{
						RemoveVehicleComponent(vehid, 1010);
						PojazdInfo[vehuid][pNitro] = 1;
						ZapiszPojazd(vehuid, 1);
						SetPVarInt(playerid, "NitroPojazd", 0);
						SetPVarInt(playerid, "NitroDezaktywuj", vehid);
						GameTextForPlayer(playerid, "~r~Nitro dezaktywowane!", 3000, 5);
						return 1;
					}
					else
					{
					    GameTextForPlayer(playerid, "~r~Brak nitro, lub brak podtlenku azotu!", 3000, 5);
					    return 1;
					}
				}
				else
				{
				    UsunCalyTuningZPojazdu(vehid);
	    			Tuning(vehid);
	    			SetPVarInt(playerid, "NitroDezaktywuj", 0);
	    			PojazdInfo[vehuid][pNitro] = 0;
	    			ZapiszPojazd(vehuid, 1);
	    			GameTextForPlayer(playerid, "~g~Nitro aktywowane!", 3000, 5);
	    			if(GetVehicleComponentInSlot(GetPlayerVehicleID(playerid), GetVehicleComponentType(1010)) == 1010)
					{
						if(PojazdInfo[vehuid][pPaliwoGaz] != 0)
						{
							DestroyProgressBar(PasekNitro[playerid]);
							PasekNitro[playerid] = CreateProgressBar(527.0,432.0,106.0,_, 0x00FF00FF, 100.0);
							SetProgressBarValue(Bar:PasekNitro[playerid], PojazdInfo[vehuid][pPaliwoGaz]);
							ShowProgressBarForPlayer(playerid, PasekNitro[playerid]);
						}
					}
	    			return 1;
				}
			}
		}
    }
    if(dialogid == DIALOG_RADIO_OPC)
	{
	    if(response)
		{
		    new vehicleid = GetPlayerVehicleID(playerid);
			new veh = SprawdzCarUID(vehicleid);
		    if(listitem == 0)
		    {
			    strdel(tekst_global, 0, 2048);
			    format(tekst_global, sizeof(tekst_global), "%s\nWy³¹cz/W³¹cz system audio", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\nZmieñ p³ytê w napêdzie", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\nZmieñ poziom g³osników", tekst_global);
		        dShowPlayerDialog(playerid, DIALOG_RADIO_OPCJE, DIALOG_STYLE_LIST, "• Radio samochodowe:", tekst_global, "Wybierz", "Zamknij");
		        return 1;
			}
			if(listitem == 1)
			{
			    strdel(tekst_global, 0, 2048);
			    format(tekst_global, sizeof(tekst_global), "%s\n»Wy³¹cz/W³¹cz CB radio", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\nCzêstotliwoœæ %d", tekst_global, PojazdInfo[veh][pKanal]);
				format(tekst_global, sizeof(tekst_global), "%s\nPrzeka¿ wiadomoœæ", tekst_global);
		        dShowPlayerDialog(playerid, DIALOG_CBRADIO_OPCJE, DIALOG_STYLE_LIST, "• CB Radio:", tekst_global, "Wybierz", "Zamknij");
	            return 1;
			}
			if(listitem == 2)
			{
			    if(vehicleid == INVALID_VEHICLE_ID)
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aby przeprakowaæ pojazd musisz znajdowaæ siê w pojezdzie.", "Zamknij", "");
				    return 1;
				}
				if(GetPlayerState(playerid)!=PLAYER_STATE_DRIVER)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aby przeprakowaæ pojazd musisz znajdowaæ siê za kierownic¹ pojazdu.", "Zamknij", "");
					return 1;
				}
				if(PojazdInfo[veh][pOwnerPostac] == DaneGracza[playerid][gUID] && PojazdInfo[veh][pOwnerDzialalnosc] == 0 || WlascicielpojazduBezWYP(vehicleid, playerid))
				{
					GetVehiclePos(vehicleid, PojazdInfo[veh][pX], PojazdInfo[veh][pY], PojazdInfo[veh][pZ]);
					GetVehicleZAngle(vehicleid, PojazdInfo[veh][pAngle]);
					PojazdInfo[veh][pVw] = GetVehicleVirtualWorld(vehicleid);
					ZapiszPojazd(veh, 1);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Twój pojazd zosta³ przeparkowany w nowe miejsce.", "Zamknij", "");
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ten pojazd nie nale¿y do ciebie - b¹dz nie jesteœ ownerem grupy do której nale¿y pojazd.", "Zamknij", "");
				}
				return 1;
			}
			if(listitem == 3)
			{
			    if(GetPlayerState(playerid)!=PLAYER_STATE_DRIVER)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aby wyrzuciæ kogoœ z pojazdu musisz znajdowaæ siê za kierownic¹ pojazdu.", "Zamknij", "");
					return 1;
				}
			    if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER)
				{
				    new found = 0;
					strdel(tekst_global, 0, 2048);
					ForeachEx(i, MAX_PLAYERS)
					{
					    if(IsPlayerConnected(i))
					    {
						    if(zalogowany[i] == true)
							{
								if(DaneGracza[i][gUID] && PlayerObokPlayera(playerid, i, 5) && i != playerid)
								{
									format(tekst_global, sizeof(tekst_global), "%s\n%d\t%s", tekst_global, i, ZmianaNicku(i));
									found++;
								}
							}
						}
					}
					if(found != 0) dShowPlayerDialog(playerid, DIALOG_WYRZUCZVEH, DIALOG_STYLE_LIST, "• Wyrzuc pasa¿era z pojazdu:", tekst_global, "Wyrzuc", "Zamknij");
					else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Wyrzuc pasa¿era z pojazdu:", "Aby kogoœ wyrzuciæ z pojazdu, ktoœ musi siê z nim znajdowaæ.", "Okej", "Zamknij");
                }
				else
				{
				    GameTextForPlayer(playerid, "~r~Dostepne tylko dla kierowcy", 3000, 5);
				}
			}
		}
	}
	if(dialogid == DIALOG_MANIPULATION_VEH)
	{
	    if(response)
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			new veh = SprawdzCarUID(vehicleid);
            if(listitem == 0)//Poka¿ informacje
			{
			    cmd_v(playerid, "info");
			}
			if(listitem == 1)//Przepisz pojazd pod grupê
			{
			    if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER)
				{
					if(!WlascicielpojazduBezWYP(vehicleid, playerid))
					{
						GameTextForPlayer(playerid, "~r~Nie posiadasz grupy do podpisania pojazdu", 3000, 5);
						return 0;
					}
					if(PojazdInfo[veh][pAukcja] != 0)
					{
						GameTextForPlayer(playerid, "~r~Ten pojazd jest wystawiony na aukcji.", 3000, 5);
						return 0;
					}
					POD_DZIALALNOSC(playerid, DIALOG_PODPISZ_VEH);
				}
			}
			if(listitem == 2)//Zobacz komponenty pojazdu
			{
			    if(!WlascicielpojazduBezWYP(vehicleid, playerid))
				{
					return 0;
				}
				new items_list[256], item_list[256], find;
				ForeachEx(itemid, MAX_PRZEDMIOT)
				{
					if(PrzedmiotInfo[itemid][pTyp] == P_TUNING && PrzedmiotInfo[itemid][pTypWlas] == TYP_AUTO && PrzedmiotInfo[itemid][pOwner] == SprawdzCarUID(GetPlayerVehicleID(playerid)) && PrzedmiotInfo[itemid][pWar2] == 1)
					{
						format(item_list, sizeof(item_list), "%d\t%s", PrzedmiotInfo[itemid][pUID], PrzedmiotInfo[itemid][pNazwa]);
						format(items_list, sizeof(items_list), "%s\n%s", items_list, item_list);
						find++;
					}
				}
				if(find == 0) dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie znaleziono ¿adnych komponentów.", "Zamknij", "");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Komponenty pojazdu:", items_list, "Zamknij", "");
			}
			if(listitem == 3)//Zarz¹dzanie pojazdem
			{
			    new tekst[512];
                format(tekst, sizeof(tekst), "%s\nOtwórz maskê", tekst);
                format(tekst, sizeof(tekst), "%s\nOtwórz baga¿nik", tekst);
                format(tekst, sizeof(tekst), "%s\nOtwórz drzwi(brak)", tekst);
                format(tekst, sizeof(tekst), "%s\nOtwórz szyby", tekst);
                format(tekst, sizeof(tekst), "%s\nDezaktywuj uk³ad nitro", tekst);
	        	dShowPlayerDialog(playerid, DIALOG_OPCJE_OPC, DIALOG_STYLE_LIST, "• Zarz¹dzanie pojazdem:", tekst, "Wybierz", "Zamknij");
	        	return 1;
			}
			if(listitem == 4)//Dodatkowe opcje
			{
			    new tekst[512];
                format(tekst, sizeof(tekst), "%s\nZarz¹dzaj radiem", tekst);
                format(tekst, sizeof(tekst), "%s\nZarz¹dzaj CB radiem", tekst);
                format(tekst, sizeof(tekst), "%s\nZaparkuj pojazd", tekst);
                format(tekst, sizeof(tekst), "%s\nWyrzuc gracza z pojazdu", tekst);
                dShowPlayerDialog(playerid, DIALOG_RADIO_OPC, DIALOG_STYLE_LIST, "• Dodatkowe opcje:", tekst, "Wybierz", "Zamknij");
                return 1;
			}
			if(listitem == 5)//Puste pole
			{
				//
			}
			if(listitem == 6)//Sprzedaj pojazd graczowi
			{
			    new found = 0;
				strdel(tekst_global, 0, 2048);
				ForeachEx(i, MAX_PLAYERS)
				{
				    if(IsPlayerConnected(i))
				    {
					    if(zalogowany[i] == true)
						{
						    if(DaneGracza[i][gUID] && PlayerObokPlayera(playerid, i, 10) && i != playerid && GetPlayerState(i) != PLAYER_STATE_SPECTATING && Nieznajomy[i] == 0)
						    {
								format(tekst_global, sizeof(tekst_global), "%s\n%d\t%s", tekst_global, i, ZmianaNicku(i));
								found++;
							}
						}
					}
				}
				if(found != 0) dShowPlayerDialog(playerid, DIALOG_SPRZEDAJPOJAZDOFF, DIALOG_STYLE_LIST, "• Sprzedaj pojazd graczu:", tekst_global, "Wybierz", "Zamknij");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Sprzedaj pojazd graczu:", "Nikt nie znajduje siê obok Ciebie, musisz znajdowaæ siê bli¿ej tej osoby", "Okej", "Zamknij");
			}
			if(listitem == 7)//Wymieñ siê pojazdem z graczem
			{
				new found = 0;
				strdel(tekst_global, 0, 2048);
				ForeachEx(i, MAX_PLAYERS)
				{
				    if(IsPlayerConnected(i))
				    {
					    if(zalogowany[i] == true)
						{
							if(DaneGracza[i][gUID] && PlayerObokPlayera(playerid, i, 10) && i != playerid && GetPlayerState(i) != PLAYER_STATE_SPECTATING && Nieznajomy[i] == 0)
						    {
								format(tekst_global, sizeof(tekst_global), "%s\n%d\t%s", tekst_global, i, ZmianaNicku(i));
								found++;
							}
						}
					}
				}
				if(found != 0) dShowPlayerDialog(playerid, DIALOG_WYMIENPOJAZDOFF, DIALOG_STYLE_LIST, "• Wymieñ siê pojazdem z graczem:", tekst_global, "Wybierz", "Zamknij");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Wymieñ siê pojazdem z graczem:", "Nikt nie znajduje siê obok Ciebie, musisz znajdowaæ siê bli¿ej tej osoby", "Okej", "Zamknij");
			}

		}
	    return 1;
	}
 	if(dialogid == DIALOG_TRUCIZNA)
 	{
 	    SetPVarInt(playerid, "TruciznaID", strval(inputtext));
 	    dShowPlayerDialog(playerid, DIALOG_TRUCIZNA2, DIALOG_STYLE_INPUT, "• Trucizna:", "Wpisz powód trucizny, który bêdzie wyœwietlony w profilu gracza:", "Dalej", "Zamknij");
 	    return 1;
 	}
 	if(dialogid == DIALOG_TRUCIZNA2)
 	{
		new id = GetPVarInt(playerid, "TruciznaID");
		new uid = GetPVarInt(playerid, "UIDTrucizny");
		new czas = PrzedmiotInfo[uid][pWar1];
		if(czas == -1)
		{
		    UsunPrzedmiot(uid);
		    strdel(tekst_global, 0, 2048);
			format(tekst_global, sizeof(tekst_global), "Cia³o %s",ZmianaNicku(id));
			DodajPrzedmiot(DaneGracza[id][gUID], TYP_WLASCICIEL, P_TRUP, 0, 0, tekst_global, DaneGracza[id][gUID], 0, -1, 0, 0, 0, 0, "");
			format(tekst_global, sizeof(tekst_global),"** %s umiera. Wszystkie jego przedmioty, które posiada³ obecnie przy sobie zosta³y przy jego martwym ciele. **",ZmianaNicku(id));
			SendWrappedMessageToPlayerRange(id, KOLOR_DO, tekst_global, 10);
			ForeachEx(i, MAX_PRZEDMIOT)
			{
				if(PrzedmiotInfo[i][pOwner] == DaneGracza[id][gUID] && PrzedmiotInfo[i][pUID] != 0 && PrzedmiotInfo[i][pTypWlas] == TYP_WLASCICIEL)
				{
					if(PrzedmiotInfo[i][pUzywany] != 0)
					{
						PrzedmiotInfo[i][pUzywany] = 0;
					}
		            OdkladanieItemuFCJ(id, i);
				}
			}
			DaneGracza[id][gAKTYWNE] = -1;
			NadajKare(id,playerid, 13, inputtext, -1);
			ZapiszGracza(id);
			Kick(id);
			return 1;
		}
		else
		{
		    UsunPrzedmiot(uid);
		    strdel(tekst_global, 0, 2048);
			format(tekst_global, sizeof(tekst_global), "Cia³o %s",ZmianaNicku(id));
			DodajPrzedmiot(DaneGracza[id][gUID], TYP_WLASCICIEL, P_TRUP, 0, 0, tekst_global, DaneGracza[id][gUID], 0, -1, 0, 0, 0, 0, "");
			format(tekst_global, sizeof(tekst_global),"** %s umiera. Wszystkie jego przedmioty, które posiada³ obecnie przy sobie zosta³y przy jego martwym ciele. **",ZmianaNicku(id));
			SendWrappedMessageToPlayerRange(id, KOLOR_DO, tekst_global, 10);
			ForeachEx(i, MAX_PRZEDMIOT)
			{
				if(PrzedmiotInfo[i][pOwner] == DaneGracza[id][gUID] && PrzedmiotInfo[i][pUID] != 0 && PrzedmiotInfo[i][pTypWlas] == TYP_WLASCICIEL)
				{
					if(PrzedmiotInfo[i][pUzywany] != 0)
					{
						PrzedmiotInfo[i][pUzywany] = 0;
					}
		            OdkladanieItemuFCJ(id, i);
				}
			}
		    DaneGracza[id][gAKTYWNE] = (gettime()+CZAS_LETNI)+(86400*czas);
		    NadajKare(id,playerid, 13, inputtext, czas);
			ZapiszGracza(id);
			Kick(id);
			return 1;
		}
 	}
	if(dialogid == DIALOG_SPRZEDAJPOJAZDOFF)
	{
	    if(response)
		{
		    SetPVarInt(playerid,"SprzedajGraczuP", strval(inputtext));
		    dShowPlayerDialog(playerid, DIALOG_SPRZEDAJPOJAZDOFF2, DIALOG_STYLE_INPUT, "• Sprzedaj pojazd graczu:", "Podaj kwotê za jak¹ chcesz sprzedaæ pojazd graczu:", "Dalej", "Zamknij");
		    return 1;
		}
	}
	if(dialogid == DIALOG_SPRZEDAJPOJAZDOFF2)
	{
	    if(response)
		{
		    new vehicleid = GetPlayerVehicleID(playerid);
			new uid = SprawdzCarUID(vehicleid);
			new playerid2 = GetPVarInt(playerid,"SprzedajGraczuP");
			new war1 = strval(inputtext);
			if(war1 >= 9000000)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Cena pojazdu jest niepoprawna!.", "Zamknij", "");
		        return 0;
			}
		    if(!IsPlayerInAnyVehicle(playerid))
		    {
		        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aby oferowaæ pojazd musisz siê w nim znajdowaæ.", "Zamknij", "");
		        return 0;
		    }
			if(PojazdInfo[uid][pOwnerDzialalnosc] != 0 || PojazdInfo[uid][pOwnerPostac] != DaneGracza[playerid][gUID])
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Pojazd, który chcesz sprzedaæ musi nale¿eæ do Ciebie.", "Zamknij", "");
			    return 0;
			}
			if(PojazdInfo[uid][pAukcja] != 0)
			{
				GameTextForPlayer(playerid, "~r~Ten pojazd jest wystawiony na aukcji.", 3000, 5);
				return 0;
			}
			GameTextForPlayer(playerid, "~y~Oferta:~n~~w~Zostala wyslana czekaj na reakcje gracza.", 3000, 5);
			Oferuj(playerid, playerid2, 0, 0, uid, 0, OFEROWANIE_POJAZDU, war1, "", 0);
			new vehc1 = SprawdzCarUID(vehicleid);
	     	new Audiotxt[10], Alarmtxt[10], Immotxt[10], CBtxt[10], szyby2[32], gpstxt[10], skradziony[10];
			if(PojazdInfo[vehc1][pImmo] == 0) Immotxt="N"; else Immotxt="T";
			if(PojazdInfo[vehc1][pCB] == 0) CBtxt="N"; else CBtxt="T";
			if(PojazdInfo[vehc1][pAlarm] == 0) Alarmtxt="N"; else Alarmtxt="T";
			if(PojazdInfo[vehc1][pAudio] == 0) Audiotxt="N"; else Audiotxt="T";
			if(PojazdInfo[vehc1][pGPS] == 0) gpstxt="N"; else gpstxt="T";
			if(PojazdInfo[vehc1][pPSzyba] == 0) szyby2="Nieprzyciemnione"; else szyby2="Przyciemnione";
			if(PojazdInfo[vehc1][pTempomat] == 0) skradziony="N"; else skradziony="T";
			strdel(tekst_global, 0, 512);
		    format(tekst_global, sizeof(tekst_global), "~p~UID:~w~ %d  ~p~Owner:~w~ %d:%d  ~p~Model:~w~ %s~n~~p~ID:~w~ %d  ~p~Kolor:~w~ %d:%d~n~~b~Przebieg:~w~ %0.01f  ~b~HP:~w~ %0.01f  ~b~Paliwo:~w~ %0.01f~n~~n~~y~Alarm: ~w~%s  ~y~Immobiliser: ~w~%s  ~y~CB Radio: ~w~%s (K: %d)~n~~y~Audio: ~w~%s ~y~Koguty: ~w~%s ~y~Skradziony: ~w~%s~n~~y~Szyby: ~w~%s ~y~Zuzycie pojazdu: ~w~%0.01f ~y~Nitro: ~w~%0.01f",
			PojazdInfo[vehc1][pUID], PojazdInfo[vehc1][pOwnerPostac], PojazdInfo[vehc1][pOwnerDzialalnosc], GetVehicleModelName(PojazdInfo[vehc1][pModel]), PojazdInfo[vehc1][pID], PojazdInfo[vehc1][pKolor], PojazdInfo[vehc1][pKolor2], PojazdInfo[vehc1][pPrzebieg]/1000, PojazdInfo[vehc1][pStan], PojazdInfo[vehc1][pPaliwo], Alarmtxt, Immotxt, CBtxt, PojazdInfo[vehc1][pKanal], Audiotxt, gpstxt, skradziony, szyby2, PojazdInfo[vehc1][pNaprawy], PojazdInfo[vehc1][pPaliwoGaz]);
			TextDrawSetString(OBJ[playerid], tekst_global);
			TextDrawShowForPlayer(playerid, OBJ[playerid]);
			SetTimerEx("NapisUsunsV",15000,0,"d",playerid);
			return 1;
		}
	}
	if(dialogid == DIALOG_WYMIENPOJAZDOFF)
	{
	    if(response)
		{
		    SetPVarInt(playerid,"WymienGraczuP", strval(inputtext));
		    dShowPlayerDialog(playerid, DIALOG_WYMIENPOJAZDOFF2, DIALOG_STYLE_INPUT, "• Wymieñ pojazd z graczem:", "Podaj kwotê jak¹ gracz bêdzie musia³ dop³aciæ przy wymianie pojazdu:", "Dalej", "Zamknij");
		    return 1;
		}
	}
	if(dialogid == DIALOG_WYMIENPOJAZDOFF2)
	{
	    if(response)
		{
  			new playerid2 = GetPVarInt(playerid,"WymienGraczuP");
		    new vehicleid = GetPlayerVehicleID(playerid);
		    new vehicleid2 = GetPlayerVehicleID(playerid2);
			new uid = SprawdzCarUID(vehicleid);
			new uid2 = SprawdzCarUID(vehicleid2);
			new war1 = strval(inputtext);
			if(war1 >= 9000000)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Cena pojazdu jest niepoprawna!.", "Zamknij", "");
		        return 0;
			}
		    //dShowPlayerDialog(playerid, DIALOG_SPRZEDAJPOJAZDOFF2, DIALOG_STYLE_INPUT, "• Sprzedaj pojazd graczu:", "Podaj kwotê za jak¹ chcesz sprzedaæ pojazd graczu:", "Dalej", "Zamknij");
		    if(!IsPlayerInAnyVehicle(playerid))
		    {
		        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aby oferowaæ pojazd musisz siê w nim znajdowaæ.", "Zamknij", "");
		        return 0;
		    }
		    if(!IsPlayerInAnyVehicle(playerid2))
		    {
		        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aby oferowaæ wymianê pojazdów drugi gracz musi siedzieæ w samochodzie.", "Zamknij", "");
		        return 0;
		    }
			if(PojazdInfo[uid][pOwnerDzialalnosc] != 0 || PojazdInfo[uid][pOwnerPostac] != DaneGracza[playerid][gUID])
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Pojazd, który chcesz sprzedaæ musi nale¿eæ do Ciebie.", "Zamknij", "");
			    return 0;
			}
			if(PojazdInfo[uid2][pOwnerDzialalnosc] != 0 || PojazdInfo[uid2][pOwnerPostac] != DaneGracza[playerid2][gUID])
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Pojazd tamtego gracza musi nale¿eæ do niego.", "Zamknij", "");
			    return 0;
			}
			if(PojazdInfo[uid][pAukcja] != 0)
			{
				GameTextForPlayer(playerid, "~r~Ten pojazd jest wystawiony na aukcji.", 3000, 5);
				return 0;
			}if(PojazdInfo[uid2][pAukcja] != 0)
			{
				GameTextForPlayer(playerid, "~r~Tamten pojazd jest wystawiony na aukcji.", 3000, 5);
				return 0;
			}
			GameTextForPlayer(playerid, "~y~Oferta:~n~~w~Zostala wyslana czekaj na reakcje gracza.", 3000, 5);
			Oferuj(playerid, playerid2, uid2, 0, uid, 0, OFEROWANIE_POJAZDU2, war1, "", 0);
			new vehc1 = SprawdzCarUID(vehicleid);
	     	new Audiotxt[10], Alarmtxt[10], Immotxt[10], CBtxt[10], szyby2[32], gpstxt[10], skradziony[10];
			if(PojazdInfo[vehc1][pImmo] == 0) Immotxt="N"; else Immotxt="T";
			if(PojazdInfo[vehc1][pCB] == 0) CBtxt="N"; else CBtxt="T";
			if(PojazdInfo[vehc1][pAlarm] == 0) Alarmtxt="N"; else Alarmtxt="T";
			if(PojazdInfo[vehc1][pAudio] == 0) Audiotxt="N"; else Audiotxt="T";
			if(PojazdInfo[vehc1][pGPS] == 0) gpstxt="N"; else gpstxt="T";
			if(PojazdInfo[vehc1][pPSzyba] == 0) szyby2="Nieprzyciemnione"; else szyby2="Przyciemnione";
			if(PojazdInfo[vehc1][pTempomat] == 0) skradziony="N"; else skradziony="T";
			strdel(tekst_global, 0, 512);
		    format(tekst_global, sizeof(tekst_global), "~p~UID:~w~ %d  ~p~Owner:~w~ %d:%d  ~p~Model:~w~ %s~n~~p~ID:~w~ %d  ~p~Kolor:~w~ %d:%d~n~~b~Przebieg:~w~ %0.01f  ~b~HP:~w~ %0.01f  ~b~Paliwo:~w~ %0.01f~n~~n~~y~Alarm: ~w~%s  ~y~Immobiliser: ~w~%s  ~y~CB Radio: ~w~%s (K: %d)~n~~y~Audio: ~w~%s ~y~Kogut: ~w~%s ~y~Skradziony: ~w~%s~n~~y~Szyby: ~w~%s ~y~Zuzycie pojazdu: ~w~%0.01f ~y~Nitro: ~w~%0.01f",
			PojazdInfo[vehc1][pUID], PojazdInfo[vehc1][pOwnerPostac], PojazdInfo[vehc1][pOwnerDzialalnosc], GetVehicleModelName(PojazdInfo[vehc1][pModel]), PojazdInfo[vehc1][pID], PojazdInfo[vehc1][pKolor], PojazdInfo[vehc1][pKolor2], PojazdInfo[vehc1][pPrzebieg]/1000, PojazdInfo[vehc1][pStan], PojazdInfo[vehc1][pPaliwo], Alarmtxt, Immotxt, CBtxt, PojazdInfo[vehc1][pKanal], Audiotxt, gpstxt, skradziony, szyby2, PojazdInfo[vehc1][pNaprawy], PojazdInfo[vehc1][pPaliwoGaz]);
			TextDrawSetString(OBJ[playerid2], tekst_global);
			TextDrawShowForPlayer(playerid2, OBJ[playerid]);
			SetTimerEx("NapisUsunsV",15000,0,"d",playerid2);
			new vehc2 = SprawdzCarUID(vehicleid2);
			if(PojazdInfo[vehc2][pImmo] == 0) Immotxt="N"; else Immotxt="T";
			if(PojazdInfo[vehc2][pCB] == 0) CBtxt="N"; else CBtxt="T";
			if(PojazdInfo[vehc2][pAlarm] == 0) Alarmtxt="N"; else Alarmtxt="T";
			if(PojazdInfo[vehc2][pAudio] == 0) Audiotxt="N"; else Audiotxt="T";
			if(PojazdInfo[vehc2][pGPS] == 0) gpstxt="N"; else gpstxt="T";
			if(PojazdInfo[vehc2][pPSzyba] == 0) szyby2="Nieprzyciemnione"; else szyby2="Przyciemnione";
			if(PojazdInfo[vehc2][pTempomat] == 0) skradziony="N"; else skradziony="T";
			strdel(tekst_global, 0, 512);
		    format(tekst_global, sizeof(tekst_global), "~p~UID:~w~ %d  ~p~Owner:~w~ %d:%d  ~p~Model:~w~ %s~n~~p~ID:~w~ %d  ~p~Kolor:~w~ %d:%d~n~~b~Przebieg:~w~ %0.01f  ~b~HP:~w~ %0.01f  ~b~Paliwo:~w~ %0.01f~n~~n~~y~Alarm: ~w~%s  ~y~Immobiliser: ~w~%s  ~y~CB Radio: ~w~%s (K: %d)~n~~y~Audio: ~w~%s ~y~Kogut: ~w~%s ~y~Skradziony: ~w~%s~n~~y~Szyby: ~w~%s ~y~Zuzycie pojazdu: ~w~%0.01f ~y~Nitro: ~w~%0.01f",
			PojazdInfo[vehc2][pUID], PojazdInfo[vehc2][pOwnerPostac], PojazdInfo[vehc2][pOwnerDzialalnosc], GetVehicleModelName(PojazdInfo[vehc2][pModel]), PojazdInfo[vehc2][pID], PojazdInfo[vehc2][pKolor], PojazdInfo[vehc2][pKolor2], PojazdInfo[vehc2][pPrzebieg]/1000, PojazdInfo[vehc2][pStan], PojazdInfo[vehc2][pPaliwo], Alarmtxt, Immotxt, CBtxt, PojazdInfo[vehc1][pKanal], Audiotxt, gpstxt, skradziony, szyby2, PojazdInfo[vehc2][pNaprawy], PojazdInfo[vehc2][pPaliwoGaz]);
			TextDrawSetString(OBJ[playerid], tekst_global);
			TextDrawShowForPlayer(playerid, OBJ[playerid]);
			SetTimerEx("NapisUsunsV",15000,0,"d",playerid);
			return 1;
		}
	}
	if(dialogid == DIALOG_RADIO)
	{
	    if(response)
		{
		    //Radio opcje
		    format(tekst_global, sizeof(tekst_global), "%s\n» Wy³¹cz/W³¹cz system audio", tekst_global);
			format(tekst_global, sizeof(tekst_global), "%s\n» Zmieñ p³ytê w napêdzie", tekst_global);
			format(tekst_global, sizeof(tekst_global), "%s\nZmieñ poziom g³osników", tekst_global);
	        dShowPlayerDialog(playerid, DIALOG_RADIO_OPCJE, DIALOG_STYLE_LIST, "• Radio samochodowe:", tekst_global, "Wybierz", "Zamknij");
	        return 1;
		}
	}
	if(dialogid == DIALOG_DYSTRYBUTOR)
	{
		new veh = strval(inputtext);
		SetPVarInt(playerid, "DystrybutorPojazd", veh);
		new dystrybutor[512];
		format(dystrybutor, sizeof(dystrybutor), "Podaj ile litrów chcesz zatankowaæ do pojazdu %s (UID: %d)", GetVehicleModelName(PojazdInfo[veh][pModel]), PojazdInfo[veh][pUID]);
		dShowPlayerDialog(playerid, DIALOG_DYSTRYBUTOR_TANKUJ, DIALOG_STYLE_INPUT, "• Dystrybutor:", dystrybutor, "Zatankuj", "Anuluj");
		return 1;
	}
	if(dialogid == DIALOG_PROJEKT_ZAKONCZ)
	{
		if(response)
		{
			new wersja = GetPVarInt(playerid, "ProjektWersja");
			new uid = GetPVarInt(playerid, "ProjektVW");
			new limit = GetPVarInt(playerid, "ProjektLimit");
			GameTextForPlayer(playerid, "~r~Wgrywam tekstury!", 3000, 5);
			PrzeladujInteriorPodTekstury(playerid, wersja, uid);
			BudynekInfo[uid][nLiczbaMebli] -= limit;
			ZapiszNieruchomosc(uid);
			UnloadObject(uid);
			LoadObject(uid);
			return 1;
		}
		else
		{
			return 0;
		}
	}
	if(dialogid == DIALOG_PROJEKT)
	{
		if(response)
		{
			new wersja = GetPVarInt(playerid, "ProjektWersja");
			new vw = GetPVarInt(playerid, "ProjektVW");
			new limit = GetPVarInt(playerid, "ProjektLimit");
			if(BudynekInfo[vw][nLiczbaMebli] >= limit)
			{
				dShowPlayerDialog(playerid, DIALOG_PROJEKT_ZAKONCZ, DIALOG_STYLE_MSGBOX, "Projekt wnêtrza", "Musisz zatwierdziæ opcjê wgrania projektu wnêtrza", "Potwierdzam", "Zamknij");
				GameTextForPlayer(playerid, "~r~Wgrywam obiekty!", 3000, 5);
				DodajInterior(playerid, wersja, vw);
			}
			else
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "Projekt wnêtrza", "Nie posiadasz wystarczaj¹cej iloœci mebli w tym budynku by wgraæ projekt wnêtrza!", "Rozumiem", "Zamknij");
				return 0;
			}
			return 1;
		}
		else
		{
			return 0;
		}
	}
	if(dialogid == DIALOG_DYSTRYBUTOR_TANKUJ)
	{
		if(response)
		{
			new litry = strval(inputtext);
			new veh = GetPVarInt(playerid, "DystrybutorPojazd");
			new vec = PojazdInfo[veh][pID];
			if(litry < 1 || litry >= 100)
			{
				GameTextForPlayer(playerid, "~r~Niepoprawna ilosc litrow!", 3000, 5);
				return 0;
			}
			if(!Wlascicielpojazdu(vec, playerid))
			{
				GameTextForPlayer(playerid, "~r~Nie posiadasz uprawnien do otwierania tego pojazdu!", 3000, 5);
				return 1;
			}
			if(PojazdInfo[veh][pSilnik]==1)
			{
				GameTextForPlayer(playerid, "~r~Pojazd ktory chcesz zatankowac ma zapalony silnik!", 3000, 5);
				return 0;
			}
			new Float:pal = PojazdInfo[veh][pPaliwo];
			if(pal + litry >= 101)
			{
				GameTextForPlayer(playerid, "~r~Nie posiadasz tyle wolnego miejsca w baku!", 3000, 5);
				return 0;
			}
			if(DaneGracza[playerid][gPORTFEL] < litry*2)
			{
				GameTextForPlayer(playerid, "~r~Nie posiadasz takiej gotowki przy sobie!", 3000, 5);
				return 0;
			}
			if(Dostal[playerid] != 0)
			{
				return 0;
			}
			if(Dostal2[playerid] != 0)
			{
				return 0;
			}
			if(Rowery(vec))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "Tankowanie:", "Nie mo¿esz zatankowaæ roweru!", "Zamknij", "");
				return 0;
			}
			new Float:ilosc = litry;
			PojazdInfo[veh][pPaliwo] += ilosc;
			ZapiszPojazd(veh, 1);
			Dodajkase(playerid, -litry*2);
			ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.1,0,0,0,0,0);
			cmd_fasdasfdfive(playerid, "wk³ada pistolet do baku.");
			new akcja[126];
			format(akcja,sizeof(akcja),"*wk³ada pistolet do baku*");
			SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
			new akcja2[126];
			format(akcja2,sizeof(akcja2),"wklada pistolet do baku");
			TextDrawSetString(AkcjaTD[playerid], akcja2);
			TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
			CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
			return 1;
		}
		else
		{
			return 0;
		}
	}
	if(dialogid == DIALOG_WYRZUCZVEH)
	{
	    if(response)
		{
		    new playerid2 = strval(inputtext);
		    if(playerid == playerid2) return 0;
		    RemovePlayerFromVehicle(playerid2);
			RemovePlayerFromVehicle(playerid2);
			GameTextForPlayer(playerid2, "~y~Zostales wyrzucony z pojazdu.", 3000, 5);
			GameTextForPlayer(playerid, "~y~Wyrzuciles pasazera z pojazdu.", 3000, 5);
		}
	}
	if(dialogid == DIALOG_SZYBY_OPCJE)
	{
	    if(response)
	    {
	        new vehicleid = GetPlayerVehicleID(playerid);
	        new veh = SprawdzCarUID(vehicleid);
			if(listitem == 0)
			{
			    if(PojazdInfo[veh][pSzyba] == 1)
				{
					PojazdInfo[veh][pSzyba] = 0;
					SetVehicleParamsCarWindows(vehicleid, 0, PojazdInfo[veh][pSzyba2], PojazdInfo[veh][pSzyba3], PojazdInfo[veh][pSzyba4]);
					ForeachEx(is, MAX_PLAYERS)
					{
					    if(IsPlayerConnected(is))
					    {
						    if(zalogowany[is] == true)
							{
							    new vehicleide = GetPlayerVehicleID(playerid);
								new vehicleide2 = GetPlayerVehicleID(is);
							    new uid = SprawdzCarUID(vehicleide2);
								if(GetPlayerVehicleID(is) == vehicleide)
								{
		       						if(GetPlayerVehicleSeat(is) == 0)
									{
										if(PojazdInfo[uid][pPSzyba] == 1)
									 	{
									 	    SetPVarInt(is, "UkrytyN", 1);
											RefreshNick(is);
									 	}
									}
								}
							}
						}
					}
				}
				else
				{
					PojazdInfo[veh][pSzyba] = 1;
					SetVehicleParamsCarWindows(vehicleid, 1, PojazdInfo[veh][pSzyba2], PojazdInfo[veh][pSzyba3], PojazdInfo[veh][pSzyba4]);
					ForeachEx(is, MAX_PLAYERS)
					{
					    if(IsPlayerConnected(is))
					    {
						    if(zalogowany[is] == true)
							{
							    new vehicleide = GetPlayerVehicleID(playerid);
							    new vehicleide2 = GetPlayerVehicleID(is);
							    new uid = SprawdzCarUID(vehicleide2);
								if(GetPlayerVehicleID(is) == vehicleide)
								{
		       						if(GetPlayerVehicleSeat(is) == 0)
									{
										if(PojazdInfo[uid][pPSzyba] == 1)
									 	{
									 	    SetPVarInt(is, "UkrytyN", 1);
											RefreshNick(is);
									 	}
									}
								}
							}
						}
					}
				}
				ZapiszPojazd(veh, 1);
			}
			if(listitem == 1)
			{
			    if(PojazdInfo[veh][pSzyba2] == 1)
				{
					PojazdInfo[veh][pSzyba2] = 0;
					SetVehicleParamsCarWindows(vehicleid, PojazdInfo[veh][pSzyba], 0, PojazdInfo[veh][pSzyba3], PojazdInfo[veh][pSzyba4]);
					ForeachEx(is, MAX_PLAYERS)
					{
						if(IsPlayerConnected(is))
						{
							if(zalogowany[is] == true)
							{
								new vehicleide = GetPlayerVehicleID(playerid);
								new vehicleide2 = GetPlayerVehicleID(is);
								new uid = SprawdzCarUID(vehicleide2);
								if(GetPlayerVehicleID(is) == vehicleide)
								{
									if(GetPlayerVehicleSeat(is) == 1)
									{
										if(PojazdInfo[uid][pPSzyba] == 1)
										{
											SetPVarInt(is, "UkrytyN", 0);
											RefreshNick(is);
										}
									}
								}
							}
						}
					}
				}
				else
				{
					PojazdInfo[veh][pSzyba2] = 1;
					SetVehicleParamsCarWindows(vehicleid, PojazdInfo[veh][pSzyba], 1, PojazdInfo[veh][pSzyba3], PojazdInfo[veh][pSzyba4]);
					ForeachEx(is, MAX_PLAYERS)
					{
						if(IsPlayerConnected(is))
						{
							if(zalogowany[is] == true)
							{
								new vehicleide = GetPlayerVehicleID(playerid);
								new vehicleide2 = GetPlayerVehicleID(is);
								new uid = SprawdzCarUID(vehicleide2);
								if(GetPlayerVehicleID(is) == vehicleide)
								{
									if(GetPlayerVehicleSeat(is) == 1)
									{
										if(PojazdInfo[uid][pPSzyba] == 1)
										{
											SetPVarInt(is, "UkrytyN", 1);
											RefreshNick(is);
										}
									}
								}
							}
						}
					}
				}
				ZapiszPojazd(veh, 1);
			}
			if(listitem == 2)
			{
			    if(PojazdInfo[veh][pSzyba3] == 1)
				{
					PojazdInfo[veh][pSzyba3] = 0;
					SetVehicleParamsCarWindows(vehicleid, PojazdInfo[veh][pSzyba], PojazdInfo[veh][pSzyba2], 0, PojazdInfo[veh][pSzyba4]);
					ForeachEx(is, MAX_PLAYERS)
					{
						if(IsPlayerConnected(is))
						{
							if(zalogowany[is] == true)
							{
								new vehicleide = GetPlayerVehicleID(playerid);
								new vehicleide2 = GetPlayerVehicleID(is);
								new uid = SprawdzCarUID(vehicleide2);
								if(GetPlayerVehicleID(is) == vehicleide)
								{
									if(GetPlayerVehicleSeat(is) == 2)
									{
										if(PojazdInfo[uid][pPSzyba] == 1)
										{
											SetPVarInt(is, "UkrytyN", 0);
											RefreshNick(is);
										}
									}
								}
							}
						}
					}
				}
				else
				{
					PojazdInfo[veh][pSzyba3] = 1;
					SetVehicleParamsCarWindows(vehicleid, PojazdInfo[veh][pSzyba], PojazdInfo[veh][pSzyba2], 1, PojazdInfo[veh][pSzyba4]);
					ForeachEx(is, MAX_PLAYERS)
					{
						if(IsPlayerConnected(is))
						{
							if(zalogowany[is] == true)
							{
								new vehicleide = GetPlayerVehicleID(playerid);
								new vehicleide2 = GetPlayerVehicleID(is);
								new uid = SprawdzCarUID(vehicleide2);
								if(GetPlayerVehicleID(is) == vehicleide)
								{
									if(GetPlayerVehicleSeat(is) == 2)
									{
										if(PojazdInfo[uid][pPSzyba] == 1)
										{
											SetPVarInt(is, "UkrytyN", 1);
											RefreshNick(is);
										}
									}
								}
							}
						}
					}
				}
				ZapiszPojazd(veh, 1);
			}
			if(listitem == 3)
			{
			    if(PojazdInfo[veh][pSzyba4] == 1)
				{
					PojazdInfo[veh][pSzyba4] = 0;
					SetVehicleParamsCarWindows(vehicleid, PojazdInfo[veh][pSzyba], PojazdInfo[veh][pSzyba2], PojazdInfo[veh][pSzyba3], 0);
					ForeachEx(is, MAX_PLAYERS)
					{
						if(IsPlayerConnected(is))
						{
							if(zalogowany[is] == true)
							{
								new vehicleide = GetPlayerVehicleID(playerid);
								new vehicleide2 = GetPlayerVehicleID(is);
								new uid = SprawdzCarUID(vehicleide2);
								if(GetPlayerVehicleID(is) == vehicleide)
								{
									if(GetPlayerVehicleSeat(is) == 3)
									{
										if(PojazdInfo[uid][pPSzyba] == 1)
										{
											SetPVarInt(is, "UkrytyN", 0);
											RefreshNick(is);
										}
									}
								}
							}
						}
					}
				}
				else
				{
					PojazdInfo[veh][pSzyba4] = 1;
					SetVehicleParamsCarWindows(vehicleid, PojazdInfo[veh][pSzyba], PojazdInfo[veh][pSzyba2], PojazdInfo[veh][pSzyba3], 1);
					ForeachEx(is, MAX_PLAYERS)
					{
						if(IsPlayerConnected(is))
						{
							if(zalogowany[is] == true)
							{
								new vehicleide = GetPlayerVehicleID(playerid);
								new vehicleide2 = GetPlayerVehicleID(is);
								new uid = SprawdzCarUID(vehicleide2);
								if(GetPlayerVehicleID(is) == vehicleide)
								{
									if(GetPlayerVehicleSeat(is) == 3)
									{
										if(PojazdInfo[uid][pPSzyba] == 1)
										{
											SetPVarInt(is, "UkrytyN", 1);
											RefreshNick(is);
										}
									}
								}
							}
						}
					}
				}
				ZapiszPojazd(veh, 1);
			}
			if(listitem == 4)
			{
		        PojazdInfo[veh][pSzyba] = 0;
		        PojazdInfo[veh][pSzyba2] = 0;
		        PojazdInfo[veh][pSzyba3] = 0;
				PojazdInfo[veh][pSzyba4] = 0;
				SetVehicleParamsCarWindows(vehicleid, 0, 0, 0, 0);
				ForeachEx(is, MAX_PLAYERS)
				{
					if(IsPlayerConnected(is))
					{
						if(zalogowany[is] == true)
						{
							new vehicleide = GetPlayerVehicleID(playerid);
							new vehicleide2 = GetPlayerVehicleID(is);
							new uid = SprawdzCarUID(vehicleide2);
							if(GetPlayerVehicleID(is) == vehicleide)
							{
								if(GetPlayerVehicleSeat(is) == 0)
								{
									if(PojazdInfo[uid][pPSzyba] == 1)
									{
										SetPVarInt(is, "UkrytyN", 0);
										RefreshNick(is);
									}
								}
								if(GetPlayerVehicleSeat(is) == 1)
								{
									if(PojazdInfo[uid][pPSzyba] == 1)
									{
										SetPVarInt(is, "UkrytyN", 0);
										RefreshNick(is);
									}
								}
								if(GetPlayerVehicleSeat(is) == 2)
								{
									if(PojazdInfo[uid][pPSzyba] == 1)
									{
										SetPVarInt(is, "UkrytyN", 0);
										RefreshNick(is);
									}
								}
								if(GetPlayerVehicleSeat(is) == 3)
								{
									if(PojazdInfo[uid][pPSzyba] == 1)
									{
										SetPVarInt(is, "UkrytyN", 0);
										RefreshNick(is);
									}
								}
							}
						}
					}
				}
				ZapiszPojazd(veh, 1);
			}
			if(listitem == 5)
			{
			    PojazdInfo[veh][pSzyba] = 1;
		        PojazdInfo[veh][pSzyba2] = 1;
		        PojazdInfo[veh][pSzyba3] = 1;
				PojazdInfo[veh][pSzyba4] = 1;
				SetVehicleParamsCarWindows(vehicleid, 1, 1, 1, 1);
				ForeachEx(is, MAX_PLAYERS)
				{
					if(IsPlayerConnected(is))
					{
						if(zalogowany[is] == true)
						{
							new vehicleide = GetPlayerVehicleID(playerid);
							new vehicleide2 = GetPlayerVehicleID(is);
							new uid = SprawdzCarUID(vehicleide2);
							if(GetPlayerVehicleID(is) == vehicleide)
							{
								if(GetPlayerVehicleSeat(is) == 0)
								{
									if(PojazdInfo[uid][pPSzyba] == 1)
									{
										SetPVarInt(is, "UkrytyN", 1);
										RefreshNick(is);
									}
								}
								if(GetPlayerVehicleSeat(is) == 1)
								{
									if(PojazdInfo[uid][pPSzyba] == 1)
									{
										SetPVarInt(is, "UkrytyN", 1);
										RefreshNick(is);
									}
								}
								if(GetPlayerVehicleSeat(is) == 2)
								{
									if(PojazdInfo[uid][pPSzyba] == 1)
									{
										SetPVarInt(is, "UkrytyN", 1);
										RefreshNick(is);
									}
								}
								if(GetPlayerVehicleSeat(is) == 3)
								{
									if(PojazdInfo[uid][pPSzyba] == 1)
									{
										SetPVarInt(is, "UkrytyN", 1);
										RefreshNick(is);
									}
								}
							}
						}
					}
				}
				ZapiszPojazd(veh, 1);
			}
		}
	}
	if(dialogid == DIALOG_SZYBY_OPCJE2)
	{
	    if(response)
	    {
	        new vehicleid = GetPlayerVehicleID(playerid);
	        new veh = SprawdzCarUID(vehicleid);
			if(listitem == 0)
			{
			    if(PojazdInfo[veh][pSzyba2] == 1)
				{
					PojazdInfo[veh][pSzyba2] = 0;
					SetVehicleParamsCarWindows(vehicleid, PojazdInfo[veh][pSzyba], 0, PojazdInfo[veh][pSzyba3], PojazdInfo[veh][pSzyba4]);
					ForeachEx(is, MAX_PLAYERS)
					{
						if(IsPlayerConnected(is))
						{
							if(zalogowany[is] == true)
							{
								new vehicleide = GetPlayerVehicleID(playerid);
								new vehicleide2 = GetPlayerVehicleID(is);
								new uid = SprawdzCarUID(vehicleide2);
								if(GetPlayerVehicleID(is) == vehicleide)
								{
									if(GetPlayerVehicleSeat(is) == 1)
									{
										if(PojazdInfo[uid][pPSzyba] == 1)
										{
											SetPVarInt(is, "UkrytyN", 0);
											RefreshNick(is);
										}
									}
								}
							}
						}
					}
				}
				else
				{
					PojazdInfo[veh][pSzyba2] = 1;
					SetVehicleParamsCarWindows(vehicleid, PojazdInfo[veh][pSzyba], 1, PojazdInfo[veh][pSzyba3], PojazdInfo[veh][pSzyba4]);
					ForeachEx(is, MAX_PLAYERS)
					{
						if(IsPlayerConnected(is))
						{
							if(zalogowany[is] == true)
							{
								new vehicleide = GetPlayerVehicleID(playerid);
								new vehicleide2 = GetPlayerVehicleID(is);
								new uid = SprawdzCarUID(vehicleide2);
								if(GetPlayerVehicleID(is) == vehicleide)
								{
									if(GetPlayerVehicleSeat(is) == 1)
									{
										if(PojazdInfo[uid][pPSzyba] == 1)
										{
											SetPVarInt(is, "UkrytyN", 1);
											RefreshNick(is);
										}
									}
								}
							}
						}
					}
				}
				ZapiszPojazd(veh, 1);
			}
		}
	}
	if(dialogid == DIALOG_SZYBY_OPCJE3)
	{
	    if(response)
	    {
	        new vehicleid = GetPlayerVehicleID(playerid);
	        new veh = SprawdzCarUID(vehicleid);
	        if(listitem == 0)
			{
			    if(PojazdInfo[veh][pSzyba3] == 1)
				{
					PojazdInfo[veh][pSzyba3] = 0;
					SetVehicleParamsCarWindows(vehicleid, PojazdInfo[veh][pSzyba], PojazdInfo[veh][pSzyba2], 0, PojazdInfo[veh][pSzyba3]);
					ForeachEx(is, MAX_PLAYERS)
					{
						if(IsPlayerConnected(is))
						{
							if(zalogowany[is] == true)
							{
								new vehicleide = GetPlayerVehicleID(playerid);
								new vehicleide2 = GetPlayerVehicleID(is);
								new uid = SprawdzCarUID(vehicleide2);
								if(GetPlayerVehicleID(is) == vehicleide)
								{
									if(GetPlayerVehicleSeat(is) == 2)
									{
										if(PojazdInfo[uid][pPSzyba] == 1)
										{
											SetPVarInt(is, "UkrytyN", 0);
											RefreshNick(is);
										}
									}
								}
							}
						}
					}
				}
				else
				{
					PojazdInfo[veh][pSzyba3] = 1;
					SetVehicleParamsCarWindows(vehicleid, PojazdInfo[veh][pSzyba], PojazdInfo[veh][pSzyba2], 1, PojazdInfo[veh][pSzyba3]);
					ForeachEx(is, MAX_PLAYERS)
					{
						if(IsPlayerConnected(is))
						{
							if(zalogowany[is] == true)
							{
								new vehicleide = GetPlayerVehicleID(playerid);
								new vehicleide2 = GetPlayerVehicleID(is);
								new uid = SprawdzCarUID(vehicleide2);
								if(GetPlayerVehicleID(is) == vehicleide)
								{
									if(GetPlayerVehicleSeat(is) == 2)
									{
										if(PojazdInfo[uid][pPSzyba] == 1)
										{
											SetPVarInt(is, "UkrytyN", 1);
											RefreshNick(is);
										}
									}
								}
							}
						}
					}
				}
				ZapiszPojazd(veh, 1);
			}
		}
	}
	if(dialogid == DIALOG_SZYBY_OPCJE4)
	{
	    if(response)
	    {
	        new vehicleid = GetPlayerVehicleID(playerid);
	        new veh = SprawdzCarUID(vehicleid);
	        if(listitem == 0)
			{
			    if(PojazdInfo[veh][pSzyba4] == 1)
				{
					PojazdInfo[veh][pSzyba4] = 0;
					SetVehicleParamsCarWindows(vehicleid, PojazdInfo[veh][pSzyba], PojazdInfo[veh][pSzyba2], PojazdInfo[veh][pSzyba4], 0);
					ForeachEx(is, MAX_PLAYERS)
					{
						if(IsPlayerConnected(is))
						{
							if(zalogowany[is] == true)
							{
								new vehicleide = GetPlayerVehicleID(playerid);
								new vehicleide2 = GetPlayerVehicleID(is);
								new uid = SprawdzCarUID(vehicleide2);
								if(GetPlayerVehicleID(is) == vehicleide)
								{
									if(GetPlayerVehicleSeat(is) == 3)
									{
										if(PojazdInfo[uid][pPSzyba] == 1)
										{
											SetPVarInt(is, "UkrytyN", 0);
											RefreshNick(is);
										}
									}
								}
							}
						}
					}
				}
				else
				{
					PojazdInfo[veh][pSzyba4] = 1;
					SetVehicleParamsCarWindows(vehicleid, PojazdInfo[veh][pSzyba], PojazdInfo[veh][pSzyba2], PojazdInfo[veh][pSzyba3], 1);
					ForeachEx(is, MAX_PLAYERS)
					{
						if(IsPlayerConnected(is))
						{
							if(zalogowany[is] == true)
							{
								new vehicleide = GetPlayerVehicleID(playerid);
								new vehicleide2 = GetPlayerVehicleID(is);
								new uid = SprawdzCarUID(vehicleide2);
								if(GetPlayerVehicleID(is) == vehicleide)
								{
									if(GetPlayerVehicleSeat(is) == 3)
									{
										if(PojazdInfo[uid][pPSzyba] == 1)
										{
											SetPVarInt(is, "UkrytyN", 1);
											RefreshNick(is);
										}
									}
								}
							}
						}
					}
				}
				ZapiszPojazd(veh, 1);
			}
		}
	}
	if(dialogid == DIALOG_MASKA_CAR_INTER)//interkacja
	{
	    if(response)
	    {
	        new
		    engine,
		    lights,
		    alarm,
		    doors,
		    bonnet,
		    boot,
		    objective;
		    new id = GetPVarInt(playerid, "pojazduid");
			if(listitem == 0)
			{
			    GetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, boot, objective);
			    SetVehicleParamsEx(id, engine, lights, alarm, doors, 1, boot, objective);
			}
			if(listitem == 1)
			{
			    GetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, boot, objective);
			    SetVehicleParamsEx(id, engine, lights, alarm, doors, 0, boot, objective);
			}
		}
	}
	if(dialogid == DIALOG_BAGAZNIK_CAR_INTER)//interakcja
	{
        if(response)
	    {
	        new
		    engine,
		    lights,
		    alarm,
		    doors,
		    bonnet,
		    boot,
		    objective;
		    new id = GetPVarInt(playerid, "pojazduid");
			if(listitem == 0)
			{
			    GetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, boot, objective);
			    SetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, 1, objective);
			}
			if(listitem == 1)
			{
			    GetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, boot, objective);
			    SetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, 0, objective);
			}
		}
	}
	if(dialogid == DIALOG_MASKA_CAR)
	{
	    if(response)
	    {
	        new
		    engine,
		    lights,
		    alarm,
		    doors,
		    bonnet,
		    boot,
		    objective;
			if(listitem == 0)
			{
			    GetVehicleParamsEx(GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective);
			    SetVehicleParamsEx(GetPlayerVehicleID(playerid), engine, lights, alarm, doors, 1, boot, objective);
			}
			if(listitem == 1)
			{
			    GetVehicleParamsEx(GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective);
			    SetVehicleParamsEx(GetPlayerVehicleID(playerid), engine, lights, alarm, doors, 0, boot, objective);
			}
		}
	}
	if(dialogid == DIALOG_BAGAZNIK_CAR)
	{
        if(response)
	    {
	        new
		    engine,
		    lights,
		    alarm,
		    doors,
		    bonnet,
		    boot,
		    objective;
			if(listitem == 0)
			{
			    GetVehicleParamsEx(GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective);
			    SetVehicleParamsEx(GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, 1, objective);
			}
			if(listitem == 1)
			{
			    GetVehicleParamsEx(GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective);
			    SetVehicleParamsEx(GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, 0, objective);
			}
		}
	}
	if(dialogid == DIALOG_RADIO_OPCJE)
	{
	    if(response)
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			new veh = SprawdzCarUID(vehicleid);
			if(listitem == 0)
			{
			    //Wy³¹cz/W³¹cz system audio
			    //pRok - tabela do Audio
			    if(PojazdInfo[veh][pAudio] == 0)
				{
			    	GameTextForPlayer(playerid, "~r~Brak systemu audio.", 3000, 5);
			    	return 0;
			    }
			    if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER)
				{
				    if(PojazdInfo[veh][pRok] == 0)
					{
					    PojazdInfo[veh][pRok] = 1;
					    GameTextForPlayer(playerid, "Wylaczyles radio", 3000, 5);
					    ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									if(IsPlayerConnected(i))
									{
										if(GetPlayerVehicleID(i) == vehicleid && Discman[playerid] == 0)
										{
											StopAudioStreamForPlayer(i);
										}
									}
								}
							}
						}
						PojazdInfo[veh][pAudioStream] = 0;
						cmd_fasdasfdfive(playerid, "wy³¹cza radio w samochodzie.");
					    return 1;
					}
					else
					{
					    PojazdInfo[veh][pRok] = 0;
					    GameTextForPlayer(playerid, "Wlaczyles radio", 3000, 5);
	                    cmd_fasdasfdfive(playerid, "w³¹cza radio w samochodzie.");
					    return 1;
					}
				}
				else
				{
				    GameTextForPlayer(playerid, "Dostepne tylko dla kierowcy", 3000, 5);
				}
			}
			if(listitem == 1)
			{
			    if(PojazdInfo[veh][pAudio] == 0)
				{
			    	GameTextForPlayer(playerid, "~r~Brak systemu audio.", 3000, 5);
			    	return 0;
			    }
			    //Zmieñ p³ytê w napêdzie
			    new found = 0;
				strdel(tekst_global, 0, 2048);
				ForeachEx(i, MAX_PRZEDMIOT)
				{
					if(PrzedmiotInfo[i][pOwner] == DaneGracza[playerid][gUID] && PrzedmiotInfo[i][pTyp] == P_CD && PrzedmiotInfo[i][pTypWlas] == TYP_WLASCICIEL)
					{
						format(tekst_global, sizeof(tekst_global), "%s\n%d\t%s", tekst_global, PrzedmiotInfo[i][pUID], PrzedmiotInfo[i][pNazwa]);
						found++;
					}
				}
				if(found != 0) dShowPlayerDialog(playerid, DIALOG_RADIO_CD, DIALOG_STYLE_LIST, "• P³yty CD:", tekst_global, "Wybierz", "Zamknij");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie posiadasz przy sobie ¿adnej p³yty CD, któr¹ móg³byœ w³o¿yæ do napêdu.", "Zamknij", "");
				return 1;
			}
			if(listitem == 2)
			{
			    if(PojazdInfo[veh][pAudio] == 0)
				{
			    	GameTextForPlayer(playerid, "~r~Brak systemu audio.", 3000, 5);
			    	return 0;
			    }
			    new tekst[512];
			    if(PojazdInfo[veh][pGlosnik] == 0)
				{
				    format(tekst, sizeof(tekst), "%s\n{008000}» S³ychaæ tylko i wy³¹cznie w pojeŸdzie(LV: 1)", tekst);
				    format(tekst, sizeof(tekst), "%s\n{FFFFFF}» S³ychaæ w pojeŸdzie i obok niego(LV: 2)", tekst);
				}
				if(PojazdInfo[veh][pGlosnik] == 1)
				{
				    format(tekst, sizeof(tekst), "%s\n{FFFFFF}» S³ychaæ tylko i wy³¹cznie w pojeŸdzie(LV: 1)", tekst);
				    format(tekst, sizeof(tekst), "%s\n{008000}» S³ychaæ w pojeŸdzie i obok niego(LV: 2)", tekst);
				}
		        dShowPlayerDialog(playerid, DIALOG_LV, DIALOG_STYLE_LIST, "• Radio - G³oœnoœæ:", tekst, "Wybierz", "Zamknij");
		        return 1;
			}
		}
	}
	if(dialogid == DIALOG_LV)
	{
  		if(response)
  		{
  		    new vehicleid = GetPlayerVehicleID(playerid);
	        new veh = SprawdzCarUID(vehicleid);
			if(listitem == 0)
			{
			    if(PojazdInfo[veh][pGlosnik] == 1)
				{
				    PojazdInfo[veh][pGlosnik] = 0;
				    DestroyDynamicObject(GetPVarInt(playerid, "BoomboxObjectveh"));
			        DeletePVar(playerid, "BoomboxObjectveh"); DeletePVar(playerid, "BoomboxURLveh");
			        DeletePVar(playerid, "bposXveh"); DeletePVar(playerid, "bposYveh"); DeletePVar(playerid, "bposZveh");
			        if(GetPVarType(playerid, "bboxareaidveh"))
			        {
			            foreach(Player,i)
			            {
			                if(IsPlayerInDynamicArea(i, GetPVarInt(playerid, "bboxareaidveh")))
			                {
			                    StopAudioStreamForPlayer(i);
			                }
			            }
			            DeletePVar(playerid, "bboxareaidveh");
			        }
				}
				PojazdInfo[veh][pGlosnik] = 0;
				GameTextForPlayer(playerid, "~r~Glosnosc lv. 1", 3000, 5);
				return 1;
			}
			if(listitem == 1)
			{
			    if(PojazdInfo[veh][pSilnik] == 0)
			    {
				    if(!GetPVarType(playerid, "BoomboxObject") || !GetPVarType(playerid, "BoomboxObjectveh"))
			    	{
				        foreach(Player, i)
				        {
				            if(GetPVarType(i, "BoomboxObjectveh") || GetPVarType(i, "BoomboxObject"))
				            {
				                if(IsPlayerInRangeOfPoint(playerid, 20.0, GetPVarFloat(i, "bposXveh"), GetPVarFloat(i, "bposYveh"), GetPVarFloat(i, "bposZveh")) || IsPlayerInRangeOfPoint(playerid, 20.0, GetPVarFloat(i, "bposX"), GetPVarFloat(i, "bposY"), GetPVarFloat(i, "bposZ")))
				                {
				                    return 1;
				                }
				            }
				        }
				        new Float:x, Float:y, Float:z, Float:a;
				        GetPlayerPos(playerid, x, y, z); GetPlayerFacingAngle(playerid, a);
				        SetPVarInt(playerid, "BoomboxObjectveh", 1);
				        SetPVarFloat(playerid, "bposXveh", x); SetPVarFloat(playerid, "bposYveh", y); SetPVarFloat(playerid, "bposZveh", z);
				        SetPVarInt(playerid, "bboxareaidveh", CreateDynamicSphere(x, y, z, 10.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid)));
	                    new uids = PojazdInfo[veh][pAudioStream];
						foreach(Player, i)
				        {
				            if(IsPlayerInDynamicArea(i, GetPVarInt(playerid, "bboxareaidveh")))
				            {
				                PlayAudioStreamForPlayer(i, PrzedmiotInfo[uids][pWar3], GetPVarFloat(playerid, "bposXveh"), GetPVarFloat(playerid, "bposYveh"), GetPVarFloat(playerid, "bposZveh"), 10.0, 1);
				            }
				        }
						new audio[128];
						format(audio, sizeof(audio), "%s",PrzedmiotInfo[uids][pWar3]);
	  					SetPVarString(playerid, "BoomboxURLveh", audio);
	  					PojazdInfo[veh][pGlosnik] = 1;
	  					GameTextForPlayer(playerid, "~r~Glosnosc lv. 2", 3000, 5);
			   			return 1;
					}
				}
			}
		}
	}
	if(dialogid == DIALOG_RADIO_CD)
	{
	    if(response)
		{
		    new uid = strval(inputtext);
		    if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER)
			{
				new vehicleide = GetPlayerVehicleID(playerid);
				new uidv = SprawdzCarUID(vehicleide);
				if(PojazdInfo[uidv][pAudio] == 1)
				{
				    if(PojazdInfo[uidv][pRok] == 0)
					{
						if(PojazdInfo[uidv][pAudioStream] != 0)
						{
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										if(IsPlayerConnected(i))
										{
											if(GetPlayerVehicleID(i) == vehicleide && Discman[playerid] == 0)
											{
												StopAudioStreamForPlayer(i);
											}
										}
									}
								}
							}
							PojazdInfo[uidv][pAudioStream] = 0;
							cmd_fasdasfdfive(playerid, "wyciaga p³ytke z systemu audio.");
						}
						else
						{
							new audio[128];
							format(audio, sizeof(audio), "%s",PrzedmiotInfo[uid][pWar3]);
							PojazdInfo[uidv][pAudioStream] = uid;
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										if(IsPlayerConnected(i))
										{
											if(GetPlayerVehicleID(i) == vehicleide && Discman[playerid] == 0)
											{
												if(GetPVarInt(playerid,"spawn"))
												{
													DeletePVar(playerid,"spawn");
												}
												StopAudioStreamForPlayer(i);
												PlayAudioStreamForPlayer(i, audio, 0, 0, 0, 14.0, 0);
											}
										}
									}
								}
							}
							cmd_fasdasfdfive(playerid, "wk³ada p³ytke do systemu audio.");
						}
					}
				}
				else
				{
					GameTextForPlayer(playerid, "~r~Brak systemu audio.", 3000, 5);
				}
		    }
		}
		return 1;
	}
	if(dialogid == DIALOG_CBRADIO)
	{
	    if(response)
		{
		    //CB Radio opcje
		    new vehicleid = GetPlayerVehicleID(playerid);
			new veh = SprawdzCarUID(vehicleid);
		    format(tekst_global, sizeof(tekst_global), "%s\n» Wy³¹cz/W³¹cz CB radio", tekst_global);
			format(tekst_global, sizeof(tekst_global), "%s\n» Czêstotliwoœæ %d", tekst_global, PojazdInfo[veh][pKanal]);
			format(tekst_global, sizeof(tekst_global), "%s\n» Przeka¿ wiadomoœæ", tekst_global);
	        dShowPlayerDialog(playerid, DIALOG_RADIO_OPCJE, DIALOG_STYLE_LIST, "• Radio samochodowe:", tekst_global, "Wybierz", "Zamknij");
            return 1;
		}
	}
	if(dialogid == DIALOG_CBRADIO_OPCJE)
	{
	    if(response)
		{
		    new vehicleid = GetPlayerVehicleID(playerid);
			new veh = SprawdzCarUID(vehicleid);
		    if(listitem == 0)
			{
			    if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER)
				{
					//pMoc - Wy³¹cz/W³¹cz CB radio
					if(PojazdInfo[veh][pCB] == 0)
					{
						GameTextForPlayer(playerid, "~r~W pojezdzie nie ma CB radia.", 3000, 5);
						return 0;
					}
		   			if(PojazdInfo[veh][pMoc] == 0)
					{
					    PojazdInfo[veh][pMoc] = 1;
					    GameTextForPlayer(playerid, "Wylaczyles CB radio", 3000, 5);
					    cmd_fasdasfdfive(playerid, "wy³¹cza CB radio w samochodzie.");
					    ForeachEx(is, MAX_PLAYERS)
						{
							if(IsPlayerConnected(is))
							{
								if(zalogowany[is] == true)
								{
									new vehicleide = GetPlayerVehicleID(playerid);
									if(GetPlayerVehicleID(is) == vehicleide)
									{
										TextDrawHideForPlayer(is, CB);
									}
								}
							}
						}
					    return 1;
					}
					else
					{
					    PojazdInfo[veh][pMoc] = 0;
					    GameTextForPlayer(playerid, "Wlaczyles CB radio", 3000, 5);
					    cmd_fasdasfdfive(playerid, "w³¹cza CB radio w samochodzie.");
					    ForeachEx(is, MAX_PLAYERS)
						{
							if(IsPlayerConnected(is))
							{
								if(zalogowany[is] == true)
								{
									new vehicleide = GetPlayerVehicleID(playerid);
									if(GetPlayerVehicleID(is) == vehicleide)
									{
										new kanstr[124];
										format(kanstr, sizeof(kanstr), "~y~CB Radio ~>~~w~ Czestotliwosc %d", PojazdInfo[veh][pKanal]);
										TextDrawShowForPlayer(playerid, CB);
										TextDrawSetString(CB, kanstr);
									}
								}
							}
						}
					    return 1;
					}
				}
				else
				{
				    GameTextForPlayer(playerid, "Dostepne tylko dla kierowcy", 3000, 5);
				}
			}
			if(listitem == 1)
			{
			    //Czêstotliwoœæ
			    if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER)
				{
				    if(PojazdInfo[veh][pCB] == 0)
					{
						GameTextForPlayer(playerid, "~r~W pojezdzie nie ma CB radia.", 3000, 5);
						return 0;
					}
	            	dShowPlayerDialog(playerid,DIALOG_CBRADIO_KANAL,DIALOG_STYLE_INPUT,"•» Zmiana czêstotliwoœci","{ed5a5a}Pamiêtaj o zakresie, który obowi¹zuje od 1 do 1000.\n{FFFFFF}Wpisz na jak¹ chcesz przejœæ czêstotliwoœæ:","Zmieñ","Zamknij");
	            	return 1;
                }
				else
				{
				    GameTextForPlayer(playerid, "Dostepne tylko dla kierowcy", 3000, 5);
				}
			}
			if(listitem == 2)
			{
				//Przeka¿ wiadomoœæ
				if(PojazdInfo[veh][pCB] == 0)
				{
					GameTextForPlayer(playerid, "~r~W pojezdzie nie ma CB radia.", 3000, 5);
					return 0;
				}
				dShowPlayerDialog(playerid,DIALOG_CBRADIO_TEKST,DIALOG_STYLE_INPUT,"•» Wiadomoœæ przez CB","Poni¿ej wpisz tekst, który ma byæ nadany w CB radio:","Nadaj","Zamknij");
				return 1;
			}
		}
	}
	if(dialogid == DIALOG_CBRADIO_TEKST)
	{
	    if(response)
		{
		    new tekst[128];
			strcat(tekst, inputtext);
		    if(IsPlayerInAnyVehicle(playerid))
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new uid = SprawdzCarUID(vehicleid);
				if(PojazdInfo[uid][pCB] == 0)
				{
					GameTextForPlayer(playerid, "~r~W pojezdzie nie ma CB radia.", 3000, 5);
					return 0;
				}
				if(PojazdInfo[uid][pKanal] == 0)
				{
					GameTextForPlayer(playerid, "~r~Aby uzywac CB radia musisz ustawic kanal.", 3000, 5);
					return 0;
				}
				strdel(tekst_global, 0, 2048);
				UsunPLZnaki(tekst);
				ForeachEx(is, MAX_PLAYERS)
				{
					if(IsPlayerConnected(is))
					{
						if(zalogowany[is] == true)
						{
							new vehicleide = GetPlayerVehicleID(playerid);
							if(GetPlayerVehicleID(is) == vehicleide)
							{
								if(PojazdInfo[uid][pMoc] == 0)
								{
									format(tekst_global, sizeof(tekst_global), "~y~CB Radio ~>~~w~ %s przez radio: %s", ZmianaNicku(playerid), tekst);
									TextDrawShowForPlayer(is, CB);
									TextDrawSetString(CB, tekst_global);
								}
							}
						}
					}
				}
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_CBRADIO_KANAL)
	{
	    if(response)
		{
		    new kanal = strval(inputtext);
		    new vehicleid = GetPlayerVehicleID(playerid);
			new uid = SprawdzCarUID(vehicleid);
		    if(PojazdInfo[uid][pCB] == 0)
			{
				GameTextForPlayer(playerid, "~r~W pojezdzie nie ma CB radia.", 3000, 5);
				return 0;
			}
		    if(kanal < 1 || kanal > 1000)
			{
				return 0;
			}
			PojazdInfo[uid][pKanal] = kanal;
			new kanstr[124];
			format(kanstr, sizeof(kanstr), "Czêstotliwoœæ zmieniona na: %d", PojazdInfo[uid][pKanal]);
			SendClientMessage( playerid, SZARY, kanstr);
			ZapiszPojazd(uid, 1);
			ZapiszPojazd(uid, 2);
			return 1;
		}
	}
	if(dialogid == DIALOG_INFO_BP)
	{
	    if(!response)
	    {
	        Kick(playerid);
			return 0;
	    }
	    SendClientMessage(playerid, SZARY, "WejdŸ z poprawnym nickname postaci!");
		Kick(playerid);
		SetPlayerCameraPos(playerid, 198.782237, -1860.767944, 7.0);
		SetPlayerCameraLookAt(playerid, 192.639099, -1877.993896, 2.161899);
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerInterior(playerid, 0);
		Teleportuj(playerid, 245.427795, -1873.137573, 3.317595);
		SetPlayerVirtualWorld(playerid, 0);
	    return 1;
	}
	if(dialogid == DIALOG_NICK2)
	{
		if(response)
	    {
			DaneGracza[playerid][gLogin] = 1;
			ZapiszGracza(playerid);
			Relog[playerid] = 1;
	    	new g;
	    	g = strval(inputtext);
		    new namei[100], sql1[250], team;
			format(sql1, sizeof(sql1), "SELECT `name`, `is_team` FROM `jochym_postacie` WHERE `ID` = '%d' LIMIT 1", g);
			mysql_query(sql1);
			mysql_store_result();
		    mysql_fetch_row(sql1);
		    sscanf(sql1, "p<|>s[100]d", namei, team);
			new imien[50], nazwisko[50], tekst_global1[50];
			sscanf(namei, "p<_>s[50]s[50]",imien,nazwisko);
			imien[0] = toupper(imien[0]);
			nazwisko[0] = toupper(nazwisko[0]);
			if(team == 1)
			{
				format(tekst_global1, sizeof(tekst_global1), "%s", imien);
			}
			if(team == 0 || team == 2 || team == 3)
			{
				format(tekst_global1, sizeof(tekst_global1), "%s_%s", imien,nazwisko);
			}
			SetPlayerName(playerid, tekst_global1);
			GameTextForPlayer(playerid, "~n~~n~~n~~n~~y~Postac zostala wybrana, zaloguj sie!", 2000, 5);
			if(BetaTesty == 0)
			{
				if(mysql_num_rows() != 0)
				{
					format(sql1, sizeof(sql1), "SELECT `ID`, `GUID`, `AKTYWNE`, `is_team`, `Przelogowal` FROM `jochym_postacie` WHERE `name` = '%s' LIMIT 1", ImieGracza(playerid));
					mysql_query(sql1);
					mysql_store_result();
					mysql_fetch_row(sql1);
					sscanf(sql1, "p<|>dddd", DaneGracza[playerid][gUID], DaneGracza[playerid][gGUID], DaneGracza[playerid][gAKTYWNE], team, DaneGracza[playerid][gLogin]);
					if(DaneGracza[playerid][gAKTYWNE] == 1 && (DaneGracza[playerid][gAKTYWNE] < gettime()+CZAS_LETNI && DaneGracza[playerid][gAKTYWNE] != -1))
					{
						new str5[512];//Logowanie dla cz³onka ekipy
						format(str5, sizeof(str5), "{9DB6D3}Witaj na "PROJEKT", nowym innowacyjnym w pe³ni rozwijaj¹cym siê serwerze!\nOd 2016 roku pracowaliœmy nad stworzeniem miejsca dla graczy na serwerze oraz forum, od tamtego czasu..\n[...] zdo³aliœmy zakodowaæ o wiele wiêcej ni¿ konkurencja a to dopiero pocz¹tek naszej przygody!\n\n");
						format(str5, sizeof(str5), "%s\t{9DB6D3}Logujesz siê na postaæ: {FFFFFF}%s{9DB6D3}, która {63D075}istnieje w naszej bazie danych!{9DB6D3}\n\tZaloguj siê albo zmieñ nick by wejœæ na inn¹ postaæ.", str5, ImieGracza2(playerid));
						dShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Panel Logowania:", str5, "Zaloguj sie", "Lista");
						SetPlayerWorldBounds(playerid, 20000.00, -20000.00, 20000.00, -20000.00);
						KameraLogowania(playerid);
					}
					else
					{
						SendClientMessage(playerid, SZARY, "WejdŸ z poprawnym nickname postaci!");
						Kick(playerid);
						SetPlayerWorldBounds(playerid, 20000.00, -20000.00, 20000.00, -20000.00);
						KameraLogowania(playerid);
					}
				}
				else
				{
					DaneGracza[playerid][gLogin] = 1;
					ZapiszGracza(playerid);
					Relog[playerid] = 1;
					new IP[16];
					GetPlayerIp(playerid, IP, sizeof(IP));
					new found = 0;
					strdel(tekst_global, 0, 4048);
					format(tekst_global, sizeof(tekst_global), "UID\tImie i nazwisko\tCzas gry", tekst_global);
					ForeachEx(i, MAX_POSTACI)
					{
						new IPI[16], online;
						format(sql1, sizeof(sql1), "SELECT `IP`, `name`, `CZAS_ONLINE`, `is_team` FROM `jochym_postacie` WHERE `IP` = '%s' AND `ID` = '%d'", IP, i);
						mysql_query(sql1);
						mysql_store_result();
						mysql_fetch_row(sql1);
						sscanf(sql1, "p<|>s[16]s[100]dd", IPI, namei, online, team);
						sscanf(namei, "p<_>s[50]s[50]",imien,nazwisko);
						imien[0] = toupper(imien[0]);
						nazwisko[0] = toupper(nazwisko[0]);
						if(team == 1)
						{
							format(tekst_global1, sizeof(tekst_global1), "%s", imien);
						}
						if(team == 0 || team == 2 || team == 3)
						{	
							format(tekst_global1, sizeof(tekst_global1), "%s %s", imien,nazwisko);
						}
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
					format(tekst_global, sizeof(tekst_global), "%s\n	lub naciœnij drugi przycisk by przejœæ do menu zmiany nicku.", tekst_global);
					format(tekst_global, sizeof(tekst_global), "%s\n\n•            Nie masz jeszcze w³asnej postaci na "STRONAWWW"!", tekst_global);
					format(tekst_global, sizeof(tekst_global), "%s\n\n•            Zminimalizuj grê i wejdŸ na forum "STRONAWWW"!", tekst_global);
					if(found != 0)
					{
						dShowPlayerDialog(playerid, DIALOG_NICK2, DIALOG_STYLE_TABLIST_HEADERS, "Czy któraœ z tych postaci jest Twoja?", tekst_global, "Zaloguj", "Zmien nick");
					}
					else
					{
						SendClientMessage(playerid, SZARY, "WejdŸ z poprawnym nickname postaci!");
						Kick(playerid);
					}
					KameraLogowania(playerid);
					SetPlayerVirtualWorld(playerid, 0);
					SetPlayerInterior(playerid, 0);
				}
			}
			else
			{
				if(mysql_num_rows() != 0)
				{
					format(sql1, sizeof(sql1), "SELECT `ID`, `GUID`, `AKTYWNE`, `is_team`, `Przelogowal` FROM `jochym_postacie` WHERE `name` = '%s' LIMIT 1", ImieGracza(playerid));
					mysql_query(sql1);
					mysql_store_result();
					mysql_fetch_row(sql1);
					sscanf(sql1, "p<|>dddd", DaneGracza[playerid][gUID], DaneGracza[playerid][gGUID], DaneGracza[playerid][gAKTYWNE], team, DaneGracza[playerid][gLogin]);
					if(DaneGracza[playerid][gAKTYWNE] == 1 && (DaneGracza[playerid][gAKTYWNE] < gettime()+CZAS_LETNI && DaneGracza[playerid][gAKTYWNE] != -1))
					{
						if(team == 0)
						{
							new str5[512];//Logowanie dla graczy
							format(str5, sizeof(str5), "{9DB6D3}Witaj na "PROJEKT", nowym innowacyjnym w pe³ni rozwijaj¹cym siê serwerze!\nOd 2016 roku pracowaliœmy nad stworzeniem miejsca dla graczy na serwerze oraz forum, od tamtego czasu..\n[...] zdo³aliœmy zakodowaæ o wiele wiêcej ni¿ konkurencja a to dopiero pocz¹tek naszej przygody!\n\n");
							format(str5, sizeof(str5), "%s\t{9DB6D3}Logujesz siê na postaæ: {FFFFFF}%s{9DB6D3}, która {63D075}istnieje w naszej bazie danych!{9DB6D3}\n\tZaloguj siê albo zmieñ nick by wejœæ na inn¹ postaæ.", str5, ImieGracza2(playerid));
							dShowPlayerDialog(playerid, DIALOG_BETA, DIALOG_STYLE_PASSWORD, "Panel Logowania:", str5, "Zaloguj sie", "Lista");
							SetPlayerWorldBounds(playerid, 20000.00, -20000.00, 20000.00, -20000.00);
							KameraLogowania(playerid);
						}
						else if(team == 1 || team == 2 || team == 3)
						{
							new str5[512];//Logowanie dla cz³onka ekipy
							format(str5, sizeof(str5), "{9DB6D3}Witaj na "PROJEKT", nowym innowacyjnym w pe³ni rozwijaj¹cym siê serwerze!\nOd 2016 roku pracowaliœmy nad stworzeniem miejsca dla graczy na serwerze oraz forum, od tamtego czasu..\n[...] zdo³aliœmy zakodowaæ o wiele wiêcej ni¿ konkurencja a to dopiero pocz¹tek naszej przygody!\n\n");
							format(str5, sizeof(str5), "%s\t{9DB6D3}Logujesz siê na postaæ: {FFFFFF}%s{9DB6D3}, która {63D075}istnieje w naszej bazie danych!{9DB6D3}\n\tZaloguj siê albo zmieñ nick by wejœæ na inn¹ postaæ.", str5, ImieGracza2(playerid));
							dShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Panel Logowania:", str5, "Zaloguj sie", "Lista");
							SetPlayerWorldBounds(playerid, 20000.00, -20000.00, 20000.00, -20000.00);
							KameraLogowania(playerid);
						}
					}
					else
					{
						SendClientMessage(playerid, SZARY, "WejdŸ z poprawnym nickname postaci!");
						Kick(playerid);
						SetPlayerWorldBounds(playerid, 20000.00, -20000.00, 20000.00, -20000.00);
						KameraLogowania(playerid);
					}
				}
				else
				{
					DaneGracza[playerid][gLogin] = 1;
					ZapiszGracza(playerid);
					Relog[playerid] = 1;
					new IP[16];
					GetPlayerIp(playerid, IP, sizeof(IP));
					new found = 0;
					strdel(tekst_global, 0, 4048);
					format(tekst_global, sizeof(tekst_global), "UID\tImie i nazwisko\tCzas gry", tekst_global);
					ForeachEx(i, MAX_POSTACI)
					{
						new IPI[16], online;
						format(sql1, sizeof(sql1), "SELECT `IP`, `name`, `CZAS_ONLINE`, `is_team` FROM `jochym_postacie` WHERE `IP` = '%s' AND `ID` = '%d'", IP, i);
						mysql_query(sql1);
						mysql_store_result();
						mysql_fetch_row(sql1);
						sscanf(sql1, "p<|>s[16]s[100]dd", IPI, namei, online, team);
						sscanf(namei, "p<_>s[50]s[50]",imien,nazwisko);
						imien[0] = toupper(imien[0]);
						nazwisko[0] = toupper(nazwisko[0]);
						if(team == 1)
						{
							format(tekst_global1, sizeof(tekst_global1), "%s", imien);
						}
						if(team == 0 || team == 2 || team == 3)
						{	
							format(tekst_global1, sizeof(tekst_global1), "%s %s", imien,nazwisko);
						}
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
					format(tekst_global, sizeof(tekst_global), "%s\n	lub naciœnij drugi przycisk by przejœæ do menu zmiany nicku.", tekst_global);
					format(tekst_global, sizeof(tekst_global), "%s\n\n•            Nie masz jeszcze w³asnej postaci na "STRONAWWW"!", tekst_global);
					format(tekst_global, sizeof(tekst_global), "%s\n\n•            Zminimalizuj grê i wejdŸ na forum "STRONAWWW"!", tekst_global);
					if(found != 0)
					{
						dShowPlayerDialog(playerid, DIALOG_NICK2, DIALOG_STYLE_TABLIST_HEADERS, "Czy któraœ z tych postaci jest Twoja?", tekst_global, "Zaloguj", "Zmien nick");
					}
					else
					{
						SendClientMessage(playerid, SZARY, "WejdŸ z poprawnym nickname postaci!");
						Kick(playerid);
					}
					KameraLogowania(playerid);
					SetPlayerVirtualWorld(playerid, 0);
					SetPlayerInterior(playerid, 0);
				}
			}
			OnPlayerDisconnect(playerid, 1002);
			OnPlayerConnect(playerid);
		}
        else
		{
    		DaneGracza[playerid][gLogin] = 1;
			ZapiszGracza(playerid);
			Relog[playerid] = 1;
			new IP[16], sql1[250];
			new namei[100], team;
			new imien[50], nazwisko[50], tekst_global1[50];
			GetPlayerIp(playerid, IP, sizeof(IP));
			new found = 0;
			strdel(tekst_global, 0, 4048);
			format(tekst_global, sizeof(tekst_global), "UID\tImie i nazwisko\tCzas gry", tekst_global);
			ForeachEx(i, MAX_POSTACI)
			{
				new IPI[16], online;
				format(sql1, sizeof(sql1), "SELECT `IP`, `name`, `CZAS_ONLINE`, `is_team` FROM `jochym_postacie` WHERE `IP` = '%s' AND `ID` = '%d'", IP, i);
				mysql_query(sql1);
				mysql_store_result();
				mysql_fetch_row(sql1);
				sscanf(sql1, "p<|>s[16]s[100]dd", IPI, namei, online, team);
				sscanf(namei, "p<_>s[50]s[50]",imien,nazwisko);
				imien[0] = toupper(imien[0]);
				nazwisko[0] = toupper(nazwisko[0]);
				if(team == 1)
				{
					format(tekst_global1, sizeof(tekst_global1), "%s", imien);
				}
				if(team == 0 || team == 2 || team == 3)
				{	
					format(tekst_global1, sizeof(tekst_global1), "%s %s", imien,nazwisko);
				}
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
			format(tekst_global, sizeof(tekst_global), "%s\n	lub naciœnij drugi przycisk by przejœæ do menu zmiany nicku.", tekst_global);
			format(tekst_global, sizeof(tekst_global), "%s\n\n•            Nie masz jeszcze w³asnej postaci na "STRONAWWW"!", tekst_global);
			format(tekst_global, sizeof(tekst_global), "%s\n\n•            Zminimalizuj grê i wejdŸ na forum "STRONAWWW"!", tekst_global);
			if(found != 0)
			{
				dShowPlayerDialog(playerid, DIALOG_NICK2, DIALOG_STYLE_TABLIST_HEADERS, "Czy któraœ z tych postaci jest Twoja?", tekst_global, "Zaloguj", "Zmien nick");
			}
			else
			{
				SendClientMessage(playerid, SZARY, "WejdŸ z poprawnym nickname postaci!");
				Kick(playerid);
			}
			KameraLogowania(playerid);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
		}
	}
	if(dialogid == DIALOG_BETA)
	{
	    if(response)
		{
		    SendClientMessage(playerid, SZARY, "Nie mo¿esz siê zalogowaæ na serwer jako gracz! Stay Tuned!");
		    OnPlayerDisconnect(playerid, -1);
		    Kick(playerid);
		    return 0;
		}
		else
		{
		    SendClientMessage(playerid, SZARY, "WejdŸ z poprawnym nickname postaci!");
			Kick(playerid);
			SetPlayerCameraPos(playerid, 198.782237, -1860.767944, 7.0);
			SetPlayerCameraLookAt(playerid, 192.639099, -1877.993896, 2.161899);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
			Teleportuj(playerid, 245.427795, -1873.137573, 3.317595);
			SetPlayerVirtualWorld(playerid, 0);
		}
	}
	if(dialogid == DIALOG_NICK)
	{
		if(response)
		{
			if(isnull(inputtext) || strlen(inputtext) < 3 || strlen(inputtext) > 24)
			{
				GameTextForPlayer(playerid, "~n~~n~~n~~n~~r~Niepoprawny nick.~n~~w~Nick postaci nie zostal zmieniony", 2000, 5);
				new str2[512];
				format(str2, sizeof(str2), "{ed5a5a}Witaj na "PROJEKT", nowym innowacyjnym w pe³ni rozwijaj¹cym siê serwerze!\nOd 2016 roku pracowaliœmy nad stworzeniem miejsca dla graczy na serwerze oraz forum, od tamtego czasu..\n[...] zdo³aliœmy zakodowaæ o wiele wiêcej ni¿ konkurencja a to dopiero pocz¹tek naszej przygody!\n\n");
				format(str2, sizeof(str2), "%s\t{9DB6D3}Poni¿ej wpisz inny nick postaci, by póŸniej zalogowaæ siê na ni¹!\n\tPamiêtaj o formacie: {FFFFFF}Imie_Nazwisko{9DB6D3}!\n\tJe¿eli nie posiadasz postaci to za³ó¿ j¹ na forum {FFFFFF}"STRONAWWW"{9DB6D3}.", str2);
				dShowPlayerDialog(playerid, DIALOG_NICK, DIALOG_STYLE_INPUT, "Panel Logowania » Zmiana nicku", str2, "Zmieñ", "Wróæ");
				SetPlayerCameraPos(playerid, 198.782237, -1860.767944, 7.0);
				SetPlayerCameraLookAt(playerid, 192.639099, -1877.993896, 2.161899);
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
				Teleportuj(playerid, 245.427795, -1873.137573, 3.317595);
				SetPlayerVirtualWorld(playerid, 0);
				return 1;
			}
			else
			{
				if(isnull(inputtext) || strlen(inputtext) > 3 || strlen(inputtext) < 24)
				{
					SetPlayerName(playerid, inputtext);
					GameTextForPlayer(playerid, "~n~~n~~n~~n~~y~Nickname zostal zmieniony", 2000, 5);
					DaneGracza[playerid][gLogin] = 1;
					ZapiszGracza(playerid);
					Relog[playerid] = 1;
					new sql[200];
					format(sql, sizeof(sql), "SELECT * FROM `jochym_postacie` WHERE `name` = '%s' LIMIT 1", ImieGracza(playerid));
					mysql_query(sql);
					mysql_store_result();
					if(BetaTesty == 0)
					{
						if(mysql_num_rows() != 0)
						{
							new sql1[200], team;
							format(sql1, sizeof(sql1), "SELECT `ID`, `GUID`, `AKTYWNE`, `is_team`, `Przelogowal` FROM `jochym_postacie` WHERE `name` = '%s' LIMIT 1", ImieGracza(playerid));
							mysql_query(sql1);
							mysql_store_result();
							mysql_fetch_row(sql1);
							sscanf(sql1, "p<|>dddd", DaneGracza[playerid][gUID], DaneGracza[playerid][gGUID], DaneGracza[playerid][gAKTYWNE], team, DaneGracza[playerid][gLogin]);
							if(DaneGracza[playerid][gAKTYWNE] == 1 && (DaneGracza[playerid][gAKTYWNE] < gettime()+CZAS_LETNI && DaneGracza[playerid][gAKTYWNE] != -1))
							{
								new str5[512];//Logowanie dla cz³onka ekipy
								format(str5, sizeof(str5), "{9DB6D3}Witaj na "PROJEKT", nowym innowacyjnym w pe³ni rozwijaj¹cym siê serwerze!\nOd 2016 roku pracowaliœmy nad stworzeniem miejsca dla graczy na serwerze oraz forum, od tamtego czasu..\n[...] zdo³aliœmy zakodowaæ o wiele wiêcej ni¿ konkurencja a to dopiero pocz¹tek naszej przygody!\n\n");
								format(str5, sizeof(str5), "%s\t{9DB6D3}Logujesz siê na postaæ: {FFFFFF}%s{9DB6D3}, która {63D075}istnieje w naszej bazie danych!{9DB6D3}\n\tZaloguj siê albo zmieñ nick by wejœæ na inn¹ postaæ.", str5, ImieGracza2(playerid));
								dShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Panel Logowania:", str5, "Zaloguj sie", "Lista");
								SetPlayerWorldBounds(playerid, 20000.00, -20000.00, 20000.00, -20000.00);
								KameraLogowania(playerid);
							}
							else
							{
								new str4[512];//Postaæ zablokowana
								format(str4, sizeof(str4), "{9DB6D3}Witaj na "PROJEKT", nowym innowacyjnym w pe³ni rozwijaj¹cym siê serwerze!\nOd 2016 roku pracowaliœmy nad stworzeniem miejsca dla graczy na serwerze oraz forum, od tamtego czasu..\n[...] zdo³aliœmy zakodowaæ o wiele wiêcej ni¿ konkurencja a to dopiero pocz¹tek naszej przygody!\n\n");
								format(str4, sizeof(str4), "%s\t{9DB6D3}Logujesz siê na postaæ: {FFFFFF}%s{9DB6D3}, która jest {ed5a5a}zablokowana w naszej bazie danych!{9DB6D3}\n\tNie zgadzasz siê z blokad¹ postaci to z³ó¿ apelacjê na stronie {FFFFFF}"STRONAWWW"", str4, ImieGracza2(playerid));
								dShowPlayerDialog(playerid, DIALOG_NICK, DIALOG_STYLE_INPUT, "Panel Logowania:", str4, "Zmien nick", "Wyjdz");
								SetPlayerWorldBounds(playerid, 20000.00, -20000.00, 20000.00, -20000.00);
								KameraLogowania(playerid);
							}
						}
						else
						{
							DaneGracza[playerid][gLogin] = 1;
							ZapiszGracza(playerid);
							Relog[playerid] = 1;
							new IP[16], sql1[250];
							new namei[100], team;
							new imien[50], nazwisko[50], tekst_global1[50];
							GetPlayerIp(playerid, IP, sizeof(IP));
							new found = 0;
							strdel(tekst_global, 0, 4048);
							format(tekst_global, sizeof(tekst_global), "UID\tImie i nazwisko\tCzas gry", tekst_global);
							ForeachEx(i, MAX_POSTACI)
							{
								new IPI[16], online;
								format(sql1, sizeof(sql1), "SELECT `IP`, `name`, `CZAS_ONLINE`, `is_team` FROM `jochym_postacie` WHERE `IP` = '%s' AND `ID` = '%d'", IP, i);
								mysql_query(sql1);
								mysql_store_result();
								mysql_fetch_row(sql1);
								sscanf(sql1, "p<|>s[16]s[100]dd", IPI, namei, online, team);
								sscanf(namei, "p<_>s[50]s[50]",imien,nazwisko);
								imien[0] = toupper(imien[0]);
								nazwisko[0] = toupper(nazwisko[0]);
								if(team == 1)
								{
									format(tekst_global1, sizeof(tekst_global1), "%s", imien);
								}
								if(team == 0 || team == 2 || team == 3)
								{	
									format(tekst_global1, sizeof(tekst_global1), "%s %s", imien,nazwisko);
								}
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
							format(tekst_global, sizeof(tekst_global), "%s\n	lub naciœnij drugi przycisk by przejœæ do menu zmiany nicku.", tekst_global);
							format(tekst_global, sizeof(tekst_global), "%s\n\n•            Nie masz jeszcze w³asnej postaci na "STRONAWWW"!", tekst_global);
							format(tekst_global, sizeof(tekst_global), "%s\n\n•            Zminimalizuj grê i wejdŸ na forum "STRONAWWW"!", tekst_global);
							if(found != 0)
							{
								dShowPlayerDialog(playerid, DIALOG_NICK2, DIALOG_STYLE_TABLIST_HEADERS, "Czy któraœ z tych postaci jest Twoja?", tekst_global, "Zaloguj", "Zmien nick");
							}
							else
							{
								SendClientMessage(playerid, SZARY, "WejdŸ z poprawnym nickname postaci!");
								Kick(playerid);
							}
							KameraLogowania(playerid);
							SetPlayerVirtualWorld(playerid, 0);
							SetPlayerInterior(playerid, 0);
						}
					}
					else
					{
						if(mysql_num_rows() != 0)
						{
							new sql1[200], team;
							format(sql1, sizeof(sql1), "SELECT `ID`, `GUID`, `AKTYWNE`, `is_team`, `Przelogowal` FROM `jochym_postacie` WHERE `name` = '%s' LIMIT 1", ImieGracza(playerid));
							mysql_query(sql1);
							mysql_store_result();
							mysql_fetch_row(sql1);
							sscanf(sql1, "p<|>dddd", DaneGracza[playerid][gUID], DaneGracza[playerid][gGUID], DaneGracza[playerid][gAKTYWNE], team, DaneGracza[playerid][gLogin]);
							if(DaneGracza[playerid][gAKTYWNE] == 1 && (DaneGracza[playerid][gAKTYWNE] < gettime()+CZAS_LETNI && DaneGracza[playerid][gAKTYWNE] != -1))
							{
								if(team == 0)
								{
									new str5[512];//Logowanie dla graczy
									format(str5, sizeof(str5), "{9DB6D3}Witaj na "PROJEKT", nowym innowacyjnym w pe³ni rozwijaj¹cym siê serwerze!\nOd 2016 roku pracowaliœmy nad stworzeniem miejsca dla graczy na serwerze oraz forum, od tamtego czasu..\n[...] zdo³aliœmy zakodowaæ o wiele wiêcej ni¿ konkurencja a to dopiero pocz¹tek naszej przygody!\n\n");
									format(str5, sizeof(str5), "%s\t{9DB6D3}Logujesz siê na postaæ: {FFFFFF}%s{9DB6D3}, która {63D075}istnieje w naszej bazie danych!{9DB6D3}\n\tZaloguj siê albo zmieñ nick by wejœæ na inn¹ postaæ.", str5, ImieGracza2(playerid));
									dShowPlayerDialog(playerid, DIALOG_BETA, DIALOG_STYLE_PASSWORD, "Panel Logowania:", str5, "Zaloguj sie", "Zmien nick");
									SetPlayerWorldBounds(playerid, 20000.00, -20000.00, 20000.00, -20000.00);
									KameraLogowania(playerid);
								}
								else if(team == 1 || team == 2 || team == 3)
								{
									new str5[512];//Logowanie dla cz³onka ekipy
									format(str5, sizeof(str5), "{9DB6D3}Witaj na "PROJEKT", nowym innowacyjnym w pe³ni rozwijaj¹cym siê serwerze!\nOd 2016 roku pracowaliœmy nad stworzeniem miejsca dla graczy na serwerze oraz forum, od tamtego czasu..\n[...] zdo³aliœmy zakodowaæ o wiele wiêcej ni¿ konkurencja a to dopiero pocz¹tek naszej przygody!\n\n");
									format(str5, sizeof(str5), "%s\t{9DB6D3}Logujesz siê na postaæ: {FFFFFF}%s{9DB6D3}, która {63D075}istnieje w naszej bazie danych!{9DB6D3}\n\tZaloguj siê albo zmieñ nick by wejœæ na inn¹ postaæ.", str5, ImieGracza2(playerid));
									dShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Panel Logowania:", str5, "Zaloguj sie", "Lista");
									SetPlayerWorldBounds(playerid, 20000.00, -20000.00, 20000.00, -20000.00);
									KameraLogowania(playerid);
								}
							}
							else
							{
								SendClientMessage(playerid, SZARY, "WejdŸ z poprawnym nickname postaci!");
								Kick(playerid);
								SetPlayerWorldBounds(playerid, 20000.00, -20000.00, 20000.00, -20000.00);
								KameraLogowania(playerid);
							}
						}
						else
						{
							DaneGracza[playerid][gLogin] = 1;
							ZapiszGracza(playerid);
							Relog[playerid] = 1;
							new IP[16], sql1[250];
							new namei[100], team;
							new imien[50], nazwisko[50], tekst_global1[50];
							GetPlayerIp(playerid, IP, sizeof(IP));
							new found = 0;
							strdel(tekst_global, 0, 4048);
							format(tekst_global, sizeof(tekst_global), "UID\tImie i nazwisko\tCzas gry", tekst_global);
							ForeachEx(i, MAX_POSTACI)
							{
								new IPI[16], online;
								format(sql1, sizeof(sql1), "SELECT `IP`, `name`, `CZAS_ONLINE`, `is_team` FROM `jochym_postacie` WHERE `IP` = '%s' AND `ID` = '%d'", IP, i);
								mysql_query(sql1);
								mysql_store_result();
								mysql_fetch_row(sql1);
								sscanf(sql1, "p<|>s[16]s[100]dd", IPI, namei, online, team);
								sscanf(namei, "p<_>s[50]s[50]",imien,nazwisko);
								imien[0] = toupper(imien[0]);
								nazwisko[0] = toupper(nazwisko[0]);
								if(team == 1)
								{
									format(tekst_global1, sizeof(tekst_global1), "%s", imien);
								}
								if(team == 0 || team == 2 || team == 3)
								{	
									format(tekst_global1, sizeof(tekst_global1), "%s %s", imien,nazwisko);
								}
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
							format(tekst_global, sizeof(tekst_global), "%s\n	lub naciœnij drugi przycisk by przejœæ do menu zmiany nicku.", tekst_global);
							format(tekst_global, sizeof(tekst_global), "%s\n\n•            Nie masz jeszcze w³asnej postaci na "STRONAWWW"!", tekst_global);
							format(tekst_global, sizeof(tekst_global), "%s\n\n•            Zminimalizuj grê i wejdŸ na forum "STRONAWWW"!", tekst_global);
							if(found != 0)
							{
								dShowPlayerDialog(playerid, DIALOG_NICK2, DIALOG_STYLE_TABLIST_HEADERS, "Czy któraœ z tych postaci jest Twoja?", tekst_global, "Zaloguj", "Zmien nick");
							}
							else
							{
								SendClientMessage(playerid, SZARY, "WejdŸ z poprawnym nickname postaci!");
								Kick(playerid);
							}
							KameraLogowania(playerid);
							SetPlayerVirtualWorld(playerid, 0);
							SetPlayerInterior(playerid, 0);
						}
					}
				}
				return 1;
   			}
		}
        else
		{
        	OnPlayerDisconnect(playerid, 1002);
			OnPlayerConnect(playerid);
		}
	}
	if( dialogid == DIALOG_REJESTR_UNIK )
	{
		if( !response )
		    return 1;
        new vehicleid = GetPlayerVehicleID(playerid);
		new indexveh = SprawdzCarUID(vehicleid);
		if( !strlen( inputtext ) || strlen( inputtext ) > 24 )
		    return dShowPlayerDialog(playerid, DIALOG_REJESTR_UNIK, DIALOG_STYLE_INPUT, "• Tablica rejestracyjna:","Wpisz nazwê unikalnej tablicy rejestracyjnej.\n{ff0000}Maxymalnie 1-10 znaków.", "Dalej", "Zamknij" );
        A_KOL(inputtext);
        A_KOLS(inputtext);
		SetVehicleNumberPlate(vehicleid, inputtext);
		strmid(PojazdInfo[indexveh][pTablice], inputtext, 0, 64, 64);
		ZapiszPojazd(indexveh, 1);
		dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Tablica rejestracyjna:", "Aby wprowadziæ zmiany w pojezdzie zaleca siê unspawn i spawn pojazdu.", "Zatwierdz", "Zamknij" );
	}
	if(dialogid == DIALOG_LOGIN)
	{
		if(response)
		{
           	if(strlen(inputtext) > 32)
			{
				new str2[512];
				format(str2, sizeof(str2), "{ed5a5a}Witaj na "PROJEKT", nowym innowacyjnym w pe³ni rozwijaj¹cym siê serwerze!\nOd 2016 roku pracowaliœmy nad stworzeniem miejsca dla graczy na serwerze oraz forum, od tamtego czasu..\n[...] zdo³aliœmy zakodowaæ o wiele wiêcej ni¿ konkurencja a to dopiero pocz¹tek naszej przygody!\n\n");
				format(str2, sizeof(str2), "%s\t{9DB6D3}Logujesz siê na postaæ: {FFFFFF}%s{9DB6D3}, która istanieje w naszej bazie danych!\n\tZaloguj siê albo zmieñ nick by wejœæ na inn¹ postaæ.", str2, ImieGracza2(playerid));
				dShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Panel Logowania:", str2, "Zaloguj sie", "Lista");
				SetPlayerCameraPos(playerid, 198.782237, -1860.767944, 7.0);
				SetPlayerCameraLookAt(playerid, 192.639099, -1877.993896, 2.161899);
                Teleportuj(playerid, 245.427795, -1873.137573, 3.317595);
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
			}
			else
			{
                new sql3[1054];
				format(sql3, sizeof(sql3), "SELECT `members_pass_hash`, `premium`, `block_ooc`, `block_run`, `ban_active`, `block_veh`, `block_gun`, `name`, `gamescore`, `member_group_id`, `admin_level`, `klatwa`, `gamescore`, `obiekty` FROM `ips_core_members` WHERE `member_id` = '%d'", DaneGracza[playerid][gGUID]);
				mysql_query(sql3);
				mysql_store_result();
				mysql_fetch_row(sql3);
				sscanf(sql3, "p<|>s[124]dddddds[124]dddddd", DaneGracza[playerid][gHASLO]
                    ,DaneGracza[playerid][gPREMIUM]
                    ,DaneGracza[playerid][gOOC]
                    ,DaneGracza[playerid][gRUN]
                    ,DaneGracza[playerid][gBAN]
                    ,DaneGracza[playerid][gVEH]
                    ,DaneGracza[playerid][gGUN]
					,DaneGracza[playerid][nickOOC]
					,DaneGracza[playerid][gGAMESCORE]
					,DaneGracza[playerid][gAdmGroup]
					,DaneGracza[playerid][gAdmLVL]
					,DaneGracza[playerid][gKLATWA]
					,DaneGracza[playerid][gSLUZBAA]
					,DaneGracza[playerid][gObiekty]
				);
				bcrypt_verify(playerid, "OnPasswordChecked" , inputtext, DaneGracza[playerid][gHASLO]);
			}
			return 1;
		}
		else
		{
		    /*new str2[512];
		    format(str2, sizeof(str2), "{ed5a5a}Witaj na "PROJEKT", nowym innowacyjnym w pe³ni rozwijaj¹cym siê serwerze!\nOd 2016 roku pracowaliœmy nad stworzeniem miejsca dla graczy na serwerze oraz forum, od tamtego czasu..\n[...] zdo³aliœmy zakodowaæ o wiele wiêcej ni¿ konkurencja a to dopiero pocz¹tek naszej przygody!\n\n");
			format(str2, sizeof(str2), "%s\t{9DB6D3}Poni¿ej wpisz inny nick postaci, by póŸniej zalogowaæ siê na ni¹!\n\tPamiêtaj o formacie: {FFFFFF}Imie_Nazwisko{9DB6D3}!\n\tJe¿eli nie posiadasz postaci to za³ó¿ j¹ na forum {FFFFFF}"STRONAWWW"{9DB6D3}.", str2);
           	dShowPlayerDialog(playerid, DIALOG_NICK, DIALOG_STYLE_INPUT, "Panel Logowania » Zmiana nicku", str2, "Zmieñ", "Wróæ");*/
			DaneGracza[playerid][gLogin] = 1;
			ZapiszGracza(playerid);
			Relog[playerid] = 1;
			new IP[16], sql1[250];
			new namei[100], team;
			new imien[50], nazwisko[50], tekst_global1[50];
			GetPlayerIp(playerid, IP, sizeof(IP));
			new found = 0;
			strdel(tekst_global, 0, 4048);
			format(tekst_global, sizeof(tekst_global), "UID\tImie i nazwisko\tCzas gry", tekst_global);
			ForeachEx(i, MAX_POSTACI)
			{
				new IPI[16], online;
				format(sql1, sizeof(sql1), "SELECT `IP`, `name`, `CZAS_ONLINE`, `is_team` FROM `jochym_postacie` WHERE `IP` = '%s' AND `ID` = '%d'", IP, i);
				mysql_query(sql1);
				mysql_store_result();
				mysql_fetch_row(sql1);
				sscanf(sql1, "p<|>s[16]s[100]dd", IPI, namei, online, team);
				sscanf(namei, "p<_>s[50]s[50]",imien,nazwisko);
				imien[0] = toupper(imien[0]);
				nazwisko[0] = toupper(nazwisko[0]);
				if(team == 1)
				{
					format(tekst_global1, sizeof(tekst_global1), "%s", imien);
				}
				if(team == 0 || team == 2 || team == 3)
				{	
					format(tekst_global1, sizeof(tekst_global1), "%s %s", imien,nazwisko);
				}
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
			format(tekst_global, sizeof(tekst_global), "%s\n	lub naciœnij drugi przycisk by przejœæ do menu zmiany nicku.", tekst_global);
			format(tekst_global, sizeof(tekst_global), "%s\n\n•            Nie masz jeszcze w³asnej postaci na "STRONAWWW"!", tekst_global);
			format(tekst_global, sizeof(tekst_global), "%s\n\n•            Zminimalizuj grê i wejdŸ na forum "STRONAWWW"!", tekst_global);
			if(found != 0)
			{
				dShowPlayerDialog(playerid, DIALOG_NICK2, DIALOG_STYLE_TABLIST_HEADERS, "Czy któraœ z tych postaci jest Twoja?", tekst_global, "Zaloguj", "Zmien nick");
			}
			else
			{
				SendClientMessage(playerid, SZARY, "WejdŸ z poprawnym nickname postaci!");
				Kick(playerid);
			}
			KameraLogowania(playerid);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
		}
		return 1;
	}
	if(dialogid == DIALOG_PODPISZ_VEH)
	{
	    if(response)
		{
		    new vehicleid = GetPlayerVehicleID(playerid);
			new veh = SprawdzCarUID(vehicleid);
  			if(PojazdInfo[veh][pOwnerPostac] == DaneGracza[playerid][gUID] && PojazdInfo[veh][pOwnerDzialalnosc] == 0)
  			{
			    new uid = strval(inputtext);
			    SetPVarInt(playerid, "PodpisanieAuta", uid);
				dShowPlayerDialog(playerid, DIALOG_PODPISZ_VEH_ACC, DIALOG_STYLE_MSGBOX, "• Informacja:", "Czy na pewno chcesz podpisaæ pojazd pod Grupê?\nPamiêtaj jeœli zatwierdzisz nie bêdzie odwrotu - auta ju¿ nie bêdziesz móg³ odpisaæ.", "Tak", "Nie");
			}else{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie posiadasz uprawnieñ do podpisania tego auta pod grupê.", "Zamknij", "");
			}
		}
		else return 1;
	}
	if(dialogid == DIALOG_PODPISZ_VEH_ACC)
	{
	    if(response)
		{
		    new uid = GetPVarInt(playerid, "PodpisanieAuta");
		    new vehicleid = GetPlayerVehicleID(playerid);
			new veh = SprawdzCarUID(vehicleid);
			if(uid == 1)
			{
			SetPVarInt(playerid, "SprzedalPojazd", 1);
	    	SetTimerEx("SprzedalPojazd",15000,0,"d",playerid);
		    PojazdInfo[veh][pOwnerPostac] = 0;
			PojazdInfo[veh][pOwnerDzialalnosc] = DaneGracza[playerid][gDzialalnosc1];
			}
			else if(uid == 2)
			{
			SetPVarInt(playerid, "SprzedalPojazd", 1);
	    	SetTimerEx("SprzedalPojazd",15000,0,"d",playerid);
			PojazdInfo[veh][pOwnerPostac] = 0;
			PojazdInfo[veh][pOwnerDzialalnosc] = DaneGracza[playerid][gDzialalnosc2];
			}
			else if(uid == 3)
			{
			SetPVarInt(playerid, "SprzedalPojazd", 1);
	    	SetTimerEx("SprzedalPojazd",15000,0,"d",playerid);
            PojazdInfo[veh][pOwnerPostac] = 0;
			PojazdInfo[veh][pOwnerDzialalnosc] = DaneGracza[playerid][gDzialalnosc3];
			}
			else if(uid == 4)
			{
			SetPVarInt(playerid, "SprzedalPojazd", 1);
	    	SetTimerEx("SprzedalPojazd",15000,0,"d",playerid);
            PojazdInfo[veh][pOwnerPostac] = 0;
			PojazdInfo[veh][pOwnerDzialalnosc] = DaneGracza[playerid][gDzialalnosc4];
			}
			else if(uid == 5)
			{
			SetPVarInt(playerid, "SprzedalPojazd", 1);
	    	SetTimerEx("SprzedalPojazd",15000,0,"d",playerid);
            PojazdInfo[veh][pOwnerPostac] = 0;
			PojazdInfo[veh][pOwnerDzialalnosc] = DaneGracza[playerid][gDzialalnosc5];
			}
			else if(uid == 6)
			{
			SetPVarInt(playerid, "SprzedalPojazd", 1);
	    	SetTimerEx("SprzedalPojazd",15000,0,"d",playerid);
            PojazdInfo[veh][pOwnerPostac] = 0;
			PojazdInfo[veh][pOwnerDzialalnosc] = DaneGracza[playerid][gDzialalnosc6];
			}
			ZapiszPojazd(veh, 2);
			DeletePVar(playerid,"PodpisanieAuta");
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Pojazd zosta³ prawid³owo przypisany do Grupy.", "Zamknij", "");
		}
		else
		{
		
		}
		return 1;
	}
	if(dialogid == DIALOG_VEH_SPAWN)
	{
	    if(response)
		{
			if(spawns[playerid] >= 3 && !GraczPremium(playerid))
			{
				dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:" ,"Nie posiadasz konta premium aby zespawnowaæ wiêcej pojazdów.", "Zamknij", "" );
				return 0;
			}
		    new uid = strval(inputtext);
		    if(PojazdInfo[uid][pSpawn] != 0)
			{
				new siedzi = -1;
				for(new is=0; is< IloscGraczy; is++)
				{
					if(GetPlayerVehicleID(is) == PojazdInfo[uid][pID])
					{
						siedzi = is;
						break;
					}
				}
				if(siedzi != -1)
				{
					strdel(tekst_globals, 0, 2048);
					format(tekst_globals, sizeof(tekst_globals), "~r~W tym pojezdzie znajduje sie: ~y~%s (Id: %d)", ZmianaNicku(siedzi), siedzi);
					GameTextForPlayer(playerid, tekst_globals, 3000, 5);
				}
				else
				{
					StworzPojazd(uid, playerid);
				}
			}
			else
			{
				StworzPojazd(uid, playerid);
			}
		}
		else return 1;
	}
	if(dialogid == DIALOG_VEH_SPAWN_DZ)
	{
		new uid = strval(inputtext);
		if(response)
		{
			if(PojazdInfo[uid][pSpawn] != 0)
			{
				new siedzi = -1;
				for(new is=0; is< IloscGraczy; is++)
				{
					if(GetPlayerVehicleID(is) == PojazdInfo[uid][pID])
					{
						siedzi = is;
						break;
					}
				}
				if(siedzi != -1)
				{
					strdel(tekst_globals, 0, 2048);
					format(tekst_globals, sizeof(tekst_globals), "~r~W tym pojezdzie znajduje sie: ~y~%s (Id: %d)", ZmianaNicku(siedzi), siedzi);
					GameTextForPlayer(playerid, tekst_globals, 3000, 5);
				}
				else
				{
					StworzPojazd(uid, playerid);
				}
			}
			else
			{
				StworzPojazd(uid, playerid);
			}
		}
		else
		{
			SetPVarInt(playerid, "OPCJAPOJAZDY", uid);
			dShowPlayerDialog(playerid, DIALOG_POJAZD_OPCJE_DZ, DIALOG_STYLE_LIST, "• Grupa » {FFFFFF}Pojazdy » {FFFFFF}Opcje:", "1.\t» Namierz\n2.\t» Zresetuj na spawnpoint\n3.\t» Skasuj ca³kowicie\n4.\t» Odpisz", "Wybierz", "Zamknij");
		}
	}
	if(dialogid == DIALOG_PALIWKO)
	{
	    if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					new vehicleid=GetPlayerVehicleID(playerid);
					new uid = SprawdzCarUID(vehicleid);
					PojazdInfo[uid][pTypPaliwa] = 1;
					ZapiszPojazd(uid, 1);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Rodzaj paliwa twojego pojazdu zosta³ zmieniony na diesel.", "Zamknij", "");
				}
				case 1:
				{
					new vehicleid=GetPlayerVehicleID(playerid);
					new uid = SprawdzCarUID(vehicleid);
					PojazdInfo[uid][pTypPaliwa] = 2;
					ZapiszPojazd(uid, 1);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Rodzaj paliwa twojego pojazdu zosta³ zmieniony na benzyne.", "Zamknij", "");
				}
			}
		}
		else
		{
			RemovePlayerFromVehicle(playerid);
			RemovePlayerFromVehicle(playerid);
		}
		return 1;
	}
	if(dialogid == DIALOG_VEH_NAMIERZ)
	{
	    if(response)
		{
		    new uid = strval(inputtext);
		    new Float:X, Float:Y, Float:Z;
		    GetVehiclePos(PojazdInfo[uid][pID], X, Y, Z);
		    SetPlayerCheckpoint(playerid, X, Y, Z, 5.0);
		    SetPVarInt(playerid, "Namierzony", 1);
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pojazd :", "Pojazd zosta³ namierzony. Wpisz komendê ponownie, aby wy³¹czyæ radar!", "Zamknij", "");
		}
		return 1;
	}
	if(dialogid == DIALOG_AREA)
	{
		if(response)
		{
	    	switch(listitem)
	    	{
				case 0:
	    	    {
	       			new uid = GraczNaTerenie(playerid);
	       			new owner = Lokacja[uid][gOwnerP];
	       			if(Lokacja[uid][gOwner] == -1 && owner == 0 || Lokacja[uid][gOwner] == 0 && owner == 0)
	       			{
	       			    format(tekst_global, sizeof(tekst_global), "Strefa: (UID %d)\nNale¿y do grupy: Brak\nNale¿y do: Brak", Lokacja[uid][gUID]);
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", tekst_global, "Zamknij", "");
	       			}
	       			else if(Lokacja[uid][gOwner] == 0 && owner != 0)
	       			{
	       			    format(tekst_global, sizeof(tekst_global), "Strefa: (UID %d)\nNale¿y do grupy: Brak\nNale¿y do: %s (UID %d)", Lokacja[uid][gUID], ImieWlasciciela(owner), owner);
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", tekst_global, "Zamknij", "");
	       			}
	       			else if(Lokacja[uid][gOwner] > 0 && owner != 0)
	       			{
	       			    format(tekst_global, sizeof(tekst_global), "Strefa: (UID %d)\nNale¿y do grupy: %s (UID %d)\nNale¿y do: %s (UID %d)", Lokacja[uid][gUID], GrupaInfo[Lokacja[uid][gOwner]][gNazwa], GrupaInfo[Lokacja[uid][gOwner]][gUID], ImieWlasciciela(owner), owner);
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", tekst_global, "Zamknij", "");
	       			}
    				GangZoneStopFlashForPlayer(playerid, uid);
				}
				case 1:
				{
	                new uid = GraczNaTerenie(playerid);
					new owner = Lokacja[uid][gOwnerP];
	                if(Lokacja[uid][gOwnerP] != 0)
	                {
	                    if(Lokacja[uid][gOwnerP] == DaneGracza[playerid][gUID] || UprawnieniaCMa(playerid, 0))
						{
							if(Lokacja[uid][gOwner] == 0)
							{
								POD_DZIALALNOSC(playerid, DIALOG_PODPISZ_AREA);
							}
							else
							{
								Lokacja[uid][gOwner] = 0;
								format(Lokacja[uid][gKolor], 10, "FFFFFF11");
								ZapiszTeren(uid);
								GangZoneShowForAll(Lokacja[uid][gID], HexToInt("FFFFFF11"));
								Transakcja(T_HPODPIS, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, uid, 0, -1, "-", gettime()+KOREKTA_CZASOWA);
								ZapiszTeren(uid);
								format(tekst_global, sizeof(tekst_global), "Strefa (%d) zosta³a odpisana, teraz tylko Ty posiadasz do niej uprawnienia.", Lokacja[uid][gUID]);
								dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", tekst_global, "Zamknij", "");
								GangZoneStopFlashForPlayer(playerid, uid);
							}
						}
						else
						{
							format(tekst_global, sizeof(tekst_global), "Nie jesteœ ownerem tego terenu (%d) wiêc nie mo¿esz wykonaæ ¿adnych czynnoœci dla tego terenu.\nStrefa nale¿y do %s (%d).", Lokacja[uid][gUID], ImieWlasciciela(owner), owner);
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", tekst_global, "Zamknij", "");
							return 0;
						}
					}
					else
					{
						if(Lokacja[uid][gOwner] == 0)
						{
							new budynkow = 0;
							ForeachEx(n, MAX_NIERUCHOMOSCI)
							{
								if(BudynekInfo[n][nArea] == uid && ZarzadzanieBudynkiem(n, playerid) && n != 0 && uid != 0)
								{
									budynkow++;
								}
							}
							if(budynkow >= 2)
							{
								Lokacja[uid][gOwnerP] = DaneGracza[playerid][gUID];
								Lokacja[uid][gOwner] = 0;
								ZapiszTeren(uid);
								format(tekst_global, sizeof(tekst_global), "Strefa (%d) zosta³a przejêta pomyœlnie, zosta³eœ jej ownerem\nOd teraz mo¿esz ni¹ zarz¹dzaæ na /area.", Lokacja[uid][gUID]);
								dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", tekst_global, "Zamknij", "");
								GangZoneStopFlashForPlayer(playerid, uid);
							}
							else
							{
								format(tekst_global, sizeof(tekst_global), "Nie posiadasz wymaganej iloœci budynków na terenie %d by by³a ona twoj¹ w³asnoœci¹.\nObecnie wykryliœmy zarejestrowanych budyków na tym terenie %d/02!", Lokacja[uid][gUID], budynkow);
								dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", tekst_global, "Zamknij", "");
								GangZoneStopFlashForPlayer(playerid, uid);
							}
						}
		                if(Lokacja[uid][gOwner] == -1 && UprawnieniaCMa(playerid, 0))
		                {
						    Lokacja[uid][gOwnerP] = DaneGracza[playerid][gUID];
						    Lokacja[uid][gOwner] = 0;
						    ZapiszTeren(uid);
						    format(tekst_global, sizeof(tekst_global), "Strefa (%d) zosta³a przejêta pomyœlnie, zosta³eœ jej ownerem\nOd teraz mo¿esz ni¹ zarz¹dzaæ na /area.", Lokacja[uid][gUID]);
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", tekst_global, "Zamknij", "");
                        	GangZoneStopFlashForPlayer(playerid, uid);
						}
					}
				}
				case 2:
	    	    {
	    	        new uid = GraczNaTerenie(playerid);
					new owner = Lokacja[uid][gOwnerP];
	    	        if(Lokacja[uid][gOwnerP] != 0)
	                {
						if(Lokacja[uid][gOwnerP] == DaneGracza[playerid][gUID] || UprawnieniaCMa(playerid, 0))
						{
							new tekst[256];
							format(tekst, sizeof(tekst), "Wpisz iloœæ obiektów któr¹ chcesz przypisaæ do strefy.\n\n- Obecna iloœæ obiektów przypisanych do strefy: %d\n- Obecna iloœæ obiektów które mo¿esz przypisaæ: %d\n\n{FF0000}Pamiêtaj, ¿e przywróciæ obiektów na postaæ nie mo¿na.", Lokacja[uid][gObiekty], DaneGracza[playerid][gObiekty]);
							dShowPlayerDialog(playerid, DIALOG_AREA_OBIEKTY, DIALOG_STYLE_INPUT, "• Informacja:", tekst, "Zatwierdz", "Zamknij");
						}
						else
						{
							format(tekst_global, sizeof(tekst_global), "Nie jesteœ ownerem tego terenu (%d), wiêc nie mo¿esz wykonaæ ¿adnych czynnoœci dla tego terenu.\nStrefa nale¿y do %s (%d).", Lokacja[uid][gUID], ImieWlasciciela(owner), owner);
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", tekst_global, "Zamknij", "");
							return 0;
						}
					}
					else
					{
						if(Lokacja[uid][gOwnerP] == DaneGracza[playerid][gUID] || UprawnieniaCMa(playerid, 0))
						{
							if(Lokacja[uid][gOwner] == 0)
							{
								POD_DZIALALNOSC(playerid, DIALOG_PODPISZ_AREA);
							}
							else
							{
								Lokacja[uid][gOwner] = 0;
								format(Lokacja[uid][gKolor], 10, "FFFFFF11");
								ZapiszTeren(uid);
								GangZoneShowForAll(Lokacja[uid][gID], HexToInt("FFFFFF11"));
								Transakcja(T_HPODPIS, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, uid, 0, -1, "-", gettime()+KOREKTA_CZASOWA);
								ZapiszTeren(uid);
								format(tekst_global, sizeof(tekst_global), "Strefa (%d) zosta³a odpisana, teraz tylko Ty posiadasz do niej uprawnienia.", Lokacja[uid][gUID]);
								dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", tekst_global, "Zamknij", "");
								GangZoneStopFlashForPlayer(playerid, uid);
							}
						}
						else
						{
							format(tekst_global, sizeof(tekst_global), "Nie jesteœ ownerem tego terenu (%d) wiêc nie mo¿esz wykonaæ ¿adnych czynnoœci dla tego terenu.\nStrefa nale¿y do %s (%d).", Lokacja[uid][gUID], ImieWlasciciela(owner), owner);
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", tekst_global, "Zamknij", "");
							return 0;
						}
					}
				}
				case 3:
				{
				    new uid = GraczNaTerenie(playerid);
					new owner = Lokacja[uid][gOwnerP];
					if(Lokacja[uid][gOwnerP] == DaneGracza[playerid][gUID] || UprawnieniaCMa(playerid, 0))
					{
						new tekst[256];
						format(tekst, sizeof(tekst), "Wpisz iloœæ obiektów któr¹ chcesz przypisaæ do strefy.\n\n- Obecna iloœæ obiektów przypisanych do strefy: %d\n- Obecna iloœæ obiektów które mo¿esz przypisaæ: %d\n\n{FF0000}Pamiêtaj, ¿e przywróciæ obiektów na postaæ nie mo¿na.", Lokacja[uid][gObiekty], DaneGracza[playerid][gObiekty]);
						dShowPlayerDialog(playerid, DIALOG_AREA_OBIEKTY, DIALOG_STYLE_INPUT, "• Informacja:", tekst, "Zatwierdz", "Zamknij");
					}
					else
					{
						format(tekst_global, sizeof(tekst_global), "Nie jesteœ ownerem tego terenu (%d) wiêc nie mo¿esz wykonaæ ¿adnych czynnoœci dla tego terenu.\nStrefa nale¿y do %s (%d).", Lokacja[uid][gUID], ImieWlasciciela(owner), owner);
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", tekst_global, "Zamknij", "");
						return 0;
					}
				}
			}
		}
		else
		{
		    new uid = GraczNaTerenie(playerid);
		    GangZoneStopFlashForPlayer(playerid, uid);
		}
		return 1;
	}
	if(dialogid == DIALOG_AREA_ADMIN)//» Wystaw strefê do przejêcia\n» Ustal cene za metr\n» Aktywnoœæ strefy
	{
		if(response)
		{
	    	switch(listitem)
	    	{
	    	    case 0:
	    	    {
	    	        new uid = GraczNaTerenie(playerid);
	    	        new przejmij[64];
	    	        if(Lokacja[uid][gOwner] == -1)
	    	        {
	    	            format(przejmij, sizeof(przejmij), "TAK");
	    	        }
	    	        else
	    	        {
	    	            format(przejmij, sizeof(przejmij), "NIE");
	    	        }
	    	        new owner = Lokacja[uid][gOwnerP];
	    	        if(Lokacja[uid][gOwner] == -1 && owner == 0 || Lokacja[uid][gOwner] == 0 && owner == 0)
	       			{
	       			    format(tekst_global, sizeof(tekst_global), "Strefa: (UID %d)\nNale¿y do grupy: Brak\nNale¿y do: Brak\n\nCena za metr: %d\nMaksymalna iloœæ obiektów: %d\nMinimalny metra¿: %d\nDo przejêcia: %s", Lokacja[uid][gUID], Lokacja[uid][gCena], Lokacja[uid][gLimit], Lokacja[uid][gMetr], przejmij);
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", tekst_global, "Zamknij", "");
	       			}
	       			else if(Lokacja[uid][gOwner] == 0 && owner != 0)
	       			{
	       			    format(tekst_global, sizeof(tekst_global), "Strefa: (UID %d)\nNale¿y do grupy: Brak\nNale¿y do: %s (UID %d)\n\nCena za metr: %d\nMaksymalna iloœæ obiektów: %d\nMinimalny metra¿: %d\nDo przejêcia: %s", Lokacja[uid][gUID], ImieWlasciciela(owner), owner, Lokacja[uid][gCena], Lokacja[uid][gLimit], Lokacja[uid][gMetr], przejmij);
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", tekst_global, "Zamknij", "");
	       			}
	       			else if(Lokacja[uid][gOwner] > 0 && owner != 0)
	       			{
	       			    format(tekst_global, sizeof(tekst_global), "Strefa: (UID %d)\nNale¿y do grupy: %s (UID %d)\nNale¿y do: %s (UID %d)\n\nCena za metr: %d\nMaksymalna iloœæ obiektów: %d\nMinimalny metra¿: %d\nDo przejêcia: %s", Lokacja[uid][gUID], GrupaInfo[Lokacja[uid][gOwner]][gNazwa], GrupaInfo[Lokacja[uid][gOwner]][gUID], ImieWlasciciela(owner), owner, Lokacja[uid][gCena], Lokacja[uid][gLimit], Lokacja[uid][gMetr], przejmij);
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", tekst_global, "Zamknij", "");
	       			}
    				GangZoneStopFlashForPlayer(playerid, uid);
				}
				case 1:
				{
	                new uid = GraczNaTerenie(playerid);
	                if(Lokacja[uid][gOwnerP] != 0)
	                {
	                    //
					}
					else
					{
		                if(Lokacja[uid][gOwner] == -1)
		                {
						    Lokacja[uid][gOwnerP] = DaneGracza[playerid][gUID];
						    Lokacja[uid][gOwner] = 0;
						    ZapiszTeren(uid);
						    format(tekst_global, sizeof(tekst_global), "Strefa (%d) zosta³a przejêta pomyœlnie, zosta³eœ jej ownerem\nOd teraz mo¿esz ni¹ zarz¹dzaæ na /area.", Lokacja[uid][gUID]);
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", tekst_global, "Zamknij", "");
                        	GangZoneStopFlashForPlayer(playerid, uid);
						}
						else
						{
							format(tekst_global, sizeof(tekst_global), "Strefa (%d) nie mo¿e zostaæ przejêta, zwróc siê z tym do Administracji.\nJe¿eli jesteœ OWNEREM nie mo¿esz ponownie przej¹æ strefy.", Lokacja[uid][gUID]);
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", tekst_global, "Zamknij", "");
                        	GangZoneStopFlashForPlayer(playerid, uid);
						}
					}
				}
				case 2:
	    	    {
	    	        new uid = GraczNaTerenie(playerid);
	    	        if(Lokacja[uid][gOwner] == 0)
	    	        {
	       				POD_DZIALALNOSC(playerid, DIALOG_PODPISZ_AREA);
					}
					else
					{
					    Lokacja[uid][gOwner] = 0;
						format(Lokacja[uid][gKolor], 10, "FFFFFF11");
						ZapiszTeren(uid);
						GangZoneShowForAll(Lokacja[uid][gID], HexToInt("FFFFFF11"));
						Transakcja(T_HPODPIS, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, uid, 0, -1, "-", gettime()+KOREKTA_CZASOWA);
					    ZapiszTeren(uid);
					    format(tekst_global, sizeof(tekst_global), "Strefa (%d) zosta³a odpisana, teraz tylko Ty posiadasz do niej uprawnienia.", Lokacja[uid][gUID]);
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", tekst_global, "Zamknij", "");
                        GangZoneStopFlashForPlayer(playerid, uid);
					}
				}
				case 3:
				{
				    new uid = GraczNaTerenie(playerid);
					new tekst[256];
					format(tekst, sizeof(tekst), "Wpisz iloœæ obiektów któr¹ chcesz przypisaæ do strefy.\n\n- Obecna iloœæ obiektów przypisanych do strefy: %d\n- Obecna iloœæ obiektów które mo¿esz przypisaæ: %d\n\n{FF0000}Pamiêtaj, ¿e przywróciæ obiektów na postaæ nie mo¿na.", Lokacja[uid][gObiekty], DaneGracza[playerid][gObiekty]);
					dShowPlayerDialog(playerid, DIALOG_AREA_OBIEKTY, DIALOG_STYLE_INPUT, "• Informacja:", tekst, "Zatwierdz", "Zamknij");
				}
				case 4:
				{
				    new uid = GraczNaTerenie(playerid);
				    if(Lokacja[uid][gOwner] != -1)
				    {
					    Lokacja[uid][gOwner] = -1;
					    Lokacja[uid][gOwnerP] = 0;
					    ZapiszTeren(uid);
					    format(tekst_global, sizeof(tekst_global), "Strefa (UID %d)\nStrefa zosta³a wystawiona przez Ciebie do przejêcia na /strefa.", Lokacja[uid][gUID]);
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", tekst_global, "Zamknij", "");
		 				GangZoneStopFlashForPlayer(playerid, uid);
					}
					else
					{
					    Lokacja[uid][gOwner] = 0;
					    Lokacja[uid][gOwnerP] = 0;
					    ZapiszTeren(uid);
					    format(tekst_global, sizeof(tekst_global), "Strefa (UID %d)\nStrefa zosta³a zablokowana, nie mo¿na jej przej¹æ.", Lokacja[uid][gUID]);
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", tekst_global, "Zamknij", "");
		 				GangZoneStopFlashForPlayer(playerid, uid);
					}
				}
				case 5:
				{
				    new uid = GraczNaTerenie(playerid);
				    SetPVarInt(playerid,"TerenAdmin", uid);
				    strdel(tekst_global, 0, 2048);
					format(tekst_global, sizeof(tekst_global), "Strefa: (UID %d)\nUstal cenê na tym terenie za 1m2 budynku.", Lokacja[uid][gUID]);
					dShowPlayerDialog(playerid,DIALOG_AREA_CENA,DIALOG_STYLE_INPUT,"• Informacja:",tekst_global,"Ustal","Anuluj");
					GangZoneStopFlashForPlayer(playerid, uid);
				}
				case 6:
				{
				    new uid = GraczNaTerenie(playerid);
				    SetPVarInt(playerid,"TerenAdmin", uid);
				    strdel(tekst_global, 0, 2048);
					format(tekst_global, sizeof(tekst_global), "Strefa: (UID %d)\nUstal minimalny metra¿ na tym terenie.", Lokacja[uid][gUID]);
					dShowPlayerDialog(playerid,DIALOG_AREA_METR,DIALOG_STYLE_INPUT,"• Informacja:",tekst_global,"Ustal","Anuluj");
					GangZoneStopFlashForPlayer(playerid, uid);
				}
				case 7:
				{
				    new uid = GraczNaTerenie(playerid);
				    SetPVarInt(playerid,"TerenAdmin", uid);
				    strdel(tekst_global, 0, 2048);
					format(tekst_global, sizeof(tekst_global), "Strefa: (UID %d)\nUstal limit stworzonych obiektów na tej strefie.", Lokacja[uid][gUID]);
					dShowPlayerDialog(playerid,DIALOG_AREA_LIMIT,DIALOG_STYLE_INPUT,"• Informacja:",tekst_global,"Ustal","Anuluj");
					GangZoneStopFlashForPlayer(playerid, uid);
				}
				case 8:
				{
				    new uid = GraczNaTerenie(playerid);
				    SetPVarInt(playerid,"TerenAdmin", uid);
					if(Lokacja[uid][gBudowanie] == 0)
					{
					    Lokacja[uid][gBudowanie] = 1;
					    ZapiszTeren(uid);
					    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX,"• Informacja:","Zablokowa³eœ tworzenie obiektów na tym terenie!","Rozumiem","");
					    GangZoneStopFlashForPlayer(playerid, uid);
					    return 1;
					}
					else
					{
					    Lokacja[uid][gBudowanie] = 0;
					    ZapiszTeren(uid);
					    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX,"• Informacja:","Odblokowa³eœ tworzenie obiektów na tym terenie!","Rozumiem","");
					    GangZoneStopFlashForPlayer(playerid, uid);
					    return 1;
					}
				}
			}
		}
		else
		{
		    new uid = GraczNaTerenie(playerid);
		    GangZoneStopFlashForPlayer(playerid, uid);
		}
		return 1;
	}
	if(dialogid == DIALOG_AREA_METR)
	{
	    if(response)
		{
		    new uid = GetPVarInt(playerid,"TerenAdmin");
		    Lokacja[uid][gMetr] = strval(inputtext);
	  		ZapiszTeren(uid);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX,"• Informacja:","Ustali³eœ minimalny metra¿ na tej strefie.","Rozumiem","");
   			GangZoneStopFlashForPlayer(playerid, uid);
		}
		else
		{
		    new uid = GraczNaTerenie(playerid);
		    GangZoneStopFlashForPlayer(playerid, uid);
		}
		return 1;
	}
	if(dialogid == DIALOG_AREA_LIMIT)
	{
	    if(response)
		{
		    new uid = GetPVarInt(playerid,"TerenAdmin");
		    Lokacja[uid][gLimit] = strval(inputtext);
	  		ZapiszTeren(uid);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX,"• Informacja:","Ustali³eœ limit obiektów na tej strefie.","Rozumiem","");
   			GangZoneStopFlashForPlayer(playerid, uid);
		}
		else
		{
		    new uid = GraczNaTerenie(playerid);
		    GangZoneStopFlashForPlayer(playerid, uid);
		}
		return 1;
	}
	if(dialogid == DIALOG_AREA_CENA)
	{
	    if(response)
		{
		    new uid = GetPVarInt(playerid,"TerenAdmin");
	  		Lokacja[uid][gCena] = strval(inputtext);
	  		ZapiszTeren(uid);
	  		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX,"• Informacja:","Ustali³eœ cenê za metr na tej strefie.","Rozumiem","");
   			GangZoneStopFlashForPlayer(playerid, uid);
		}
		else
		{
		    new uid = GraczNaTerenie(playerid);
		    GangZoneStopFlashForPlayer(playerid, uid);
		}
		return 1;
	}
 	if(dialogid == DIALOG_BOOMBOX)
	{
	    if(!GetPVarType(playerid, "BoomboxObject"))
	    {
	        foreach(Player, i)
	        {
	            if(GetPVarType(i, "BoomboxObject"))
	            {

	                if(IsPlayerInRangeOfPoint(playerid, 20.0, GetPVarFloat(i, "bposX"), GetPVarFloat(i, "bposY"), GetPVarFloat(i, "bposZ")))
	                {
	                    return 1;
	                }
	            }
	        }
	        new Float:x, Float:y, Float:z, Float:a;
	        GetPlayerPos(playerid, x, y, z); GetPlayerFacingAngle(playerid, a);
	        SetPVarInt(playerid, "BoomboxObject", CreateDynamicObject(2103, x, y, z-0.95, 0.0, 0.0, 0.0, .worldid = GetPlayerVirtualWorld(playerid), .interiorid = GetPlayerInterior(playerid)));
	        SetPVarFloat(playerid, "bposX", x); SetPVarFloat(playerid, "bposY", y); SetPVarFloat(playerid, "bposZ", z);
	        SetPVarInt(playerid, "bboxareaid", CreateDynamicSphere(x, y, z, 20.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid)));
	        foreach(Player, i)
	        {
	            if(IsPlayerInDynamicArea(i, GetPVarInt(playerid, "bboxareaid")))
	            {
	                PlayAudioStreamForPlayer(i, inputtext, GetPVarFloat(playerid, "bposX"), GetPVarFloat(playerid, "bposY"), GetPVarFloat(playerid, "bposZ"), 20.0, 1);
	            }
	        }
	        SetPVarString(playerid, "BoomboxURL", inputtext);
	    }
	    else
	    {
	        DestroyDynamicObject(GetPVarInt(playerid, "BoomboxObject"));
	        DeletePVar(playerid, "BoomboxObject"); DeletePVar(playerid, "BoomboxURL");
	        DeletePVar(playerid, "bposX"); DeletePVar(playerid, "bposY"); DeletePVar(playerid, "bposZ");
	        if(GetPVarType(playerid, "bboxareaid"))
	        {
	            foreach(Player,i)
	            {
	                if(IsPlayerInDynamicArea(i, GetPVarInt(playerid, "bboxareaid")))
	                {
	                    StopAudioStreamForPlayer(i);
	                }
	            }
	            DeletePVar(playerid, "bboxareaid");
	        }
	    }
  	    return 1;
	}
	if(dialogid == DIALOG_GZ_D)
	{
		if( !response ) return 1;
    	if(strlen(inputtext) < 3)
		{
			dShowPlayerDialog(playerid, DIALOG_GZ_D, DIALOG_STYLE_INPUT, "• Informacja:", "Podaj nazwe terenu:", "Dalej", "Zamknij");
			return 0;
		}
		new Float:AX, Float:AY, Float:AZ;
		GetPlayerPos(playerid, AX, AY, AZ);
		DaneGracza[playerid][gTeren] = DodajTeren(AX, AY);
		GangZonePL[playerid] = true;
		return 1;
	}
	if(dialogid == DIALOG_LEK)
	{
	    new idGracza = strval(inputtext);
        new nr = GetPVarInt(playerid, "Lek");
		UstawHP(idGracza,15);
		Frezuj(idGracza, true);
		ClearAnimations(idGracza);
		ApplyAnimation(idGracza, "CARRY", "crry_prtial", 4, 0, 0, 0, 0, 0, 0);
		SetCameraBehindPlayer(idGracza);
		DaneGracza[idGracza][gBW] = 0;
		Uderzony(idGracza, 0x8fef55FF);
        UsunPrzedmiot(nr);
		new str[256];
		format(str, sizeof(str), "aplikuje morfinê %s.", ZmianaNicku(idGracza));
        cmd_fasdasfdfive(playerid, str);
		ZapiszGracza(idGracza);
	}
	if(dialogid == DIALOG_KONTAKT_ZAPROS)
	{
		if( !response ) return 0;
	    new idGracza = strval(inputtext);
	    SetPVarInt(playerid, "Kontakt", idGracza);
        Oferuj(playerid, idGracza, 0, 0, 0, 0, OFEROWANIE_KONTAKT, 0,"", 0);
	}
	if(dialogid == DIALOG_WEZ_PACZKE)
	{
		if( !response ) return 0;
		new uid = strval(inputtext);\
		if(PaczkaInfo[uid][xZAJETY] != 0)
		{
			new id_gr = -1;
			ForeachEx(playerida, MAX_PLAYERS)
			{
				if(IsPlayerConnected(playerida))
				{
					if(zalogowany[playerida] == true)
					{
						if(IsPlayerConnected(playerida) && DaneGracza[playerida][gUID] == PaczkaInfo[uid][xZAJETY])
						{
							id_gr = playerida;
							break;
						}
					}
				}
			}
			new budka_lista[256];
			strdel(budka_lista, 0, 256);
			if(id_gr != -1) 
			{
				format(budka_lista, sizeof(budka_lista), "Ta paczka jest dostarczana przez: %s.", ZmianaNicku(id_gr));
			}
			else 
			{
				format(budka_lista, sizeof(budka_lista), "Ta paczka jest dostarczana przez: Brak gracza.");
				PaczkaInfo[uid][xZAJETY] = 0;
			}
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", budka_lista, "Zamknij", "");
		}
		else
		{
			DaneGracza[playerid][gPaczkaUID] = uid;
			PaczkaInfo[uid][xZAJETY] = DaneGracza[playerid][gUID];
			DaneGracza[playerid][gPaczkaM] = 1;
			strdel(tekst_global, 0, 2048);
			format(tekst_global, sizeof(tekst_global), "~w~Numer paczki: ~r~%d~n~~w~Adresat: ~r~%s~n~~n~~w~Miejsce dostarczenia:~n~~w~%s",PaczkaInfo[uid][xUID],PaczkaInfo[uid][xNICK], BudynekInfo[PaczkaInfo[uid][xMIEJSCED]][nAdres]);
			TextDrawSetString(OBJ[playerid], tekst_global);
			TextDrawShowForPlayer(playerid, OBJ[playerid]);
			new id = PaczkaInfo[uid][xHURT];
			SetPlayerCheckpoint(playerid, BudynekInfo[id][nX], BudynekInfo[id][nY], BudynekInfo[id][nZ], 5.0);
		}
	}
	if(dialogid == DIALOG_PRACA)
	{
		if( !response ) return 0;
		switch(listitem)
		{
            case 0:
			{
				DaneGracza[playerid][gPracaTyp] = PRACA_MECHANIK;
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Gratulacje przyj¹³eœ prace mechanika.\nPracuj na stacji, lub w warsztacie!", "Zamknij", "");
			}
			case 1:
			{
				DaneGracza[playerid][gPracaTyp] = PRACA_KURIER;
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Gratulacje przyj¹³eœ prace kuriera.\nAby rozpocz¹æ prace wpisz /paczka.", "Zamknij", "");
			}
			case 2:
			{
				DaneGracza[playerid][gPracaTyp] = PRACA_WEDKARZ;
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Gratulacje przyj¹³eœ prace wêdkarza.\nAby rozpocz¹æ prace udaj siê na Molo z Ko³em.", "Zamknij", "");
			}
			case 3:
			{
				DaneGracza[playerid][gPracaTyp] = PRACA_GAZECIARZ;
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Gratulacje przyj¹³eœ prace roznosiciela gazet\nAby rozpocz¹æ pracê udaj siê do Dashawn Paxton i odbierz gazety!", "Zamknij", "");
			}
			case 4:
			{
				//DaneGracza[playerid][gPracaTyp] = PRACA_GAZECIARZ;
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Oferta niedostêpna.", "Zamknij", "");
			}
			case 5:
			{
				DaneGracza[playerid][gPracaTyp] = PRACA_ZLOM;
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Gratulacje przyj¹³eœ prace z³omiarza.\nAby rozpocz¹æ prace udaj siê na z³omowisko.", "Zamknij", "");
			}
			case 6:
			{
			    DaneGracza[playerid][gPracaTyp] = PRACA_BRAK;
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Zrezygnowa³eœ z pracy dorywczej.", "Zamknij", "");
			}
		}
		ZapiszGracza(playerid);
		return 1;
	}
	if(dialogid == DIALOG_TELEFON_DZWONI)
	{
	    if( !response ) return 0;
		switch(listitem)
		{
			case 0:
			{
       			cmd_od(playerid, "");
			}
			case 1:
			{
			    cmd_z(playerid, "");
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_TELEFON_OPCJA1)
	{
	    if( !response ) return 0;
		switch(listitem)
		{
			case 0:
			{
			    new id_przedmiotu = GetPVarInt( playerid, "UzytyItem");
			    if(PrzedmiotInfo[id_przedmiotu][pUzywany] == 0)
				{
					GameTextForPlayer(playerid, "~r~Ten telefon jest wy³¹czony musisz go wlaczyc!.", 3000, 5);
					return 0;
				}
				if(PrzedmiotInfo[id_przedmiotu][pWar2] == 0)
				{
					GameTextForPlayer(playerid, "~r~Ten telefon nie posiada karty SIM.", 3000, 5);
					return 0;
				}
				if(Dzwoni[playerid] != 0)
				{
					GameTextForPlayer(playerid, "~r~Aktualnie wykonujesz juz polaczenie.", 3000, 5);
					return 0;
				}
				dShowPlayerDialog(playerid, DIALOG_TELEFON_DZWON_KAL, DIALOG_STYLE_INPUT, "• Informacja:", "Podaj numer, do którego chcesz siê dodzwoniæ.", "Zadzwoñ", "Zamknij");
				return 1;
			}
			case 1:
			{
			    if(Dzwoni[playerid] != 0)
				{
					GameTextForPlayer(playerid, "~r~Aktualnie wykonujesz juz polaczenie.", 3000, 5);
					return 0;
				}
				new id_przedmiotu = GetPVarInt( playerid, "UzytyItem");
				if(PrzedmiotInfo[id_przedmiotu][pUzywany] == 0)
				{
					GameTextForPlayer(playerid, "~r~Ten telefon jest wylaczony.", 3000, 5);
					return 0;
				}
				if(PrzedmiotInfo[id_przedmiotu][pWar2] == 0)
				{
					GameTextForPlayer(playerid, "~r~Ten telefon nie posiada karty SIM.", 3000, 5);
					return 0;
				}
				new find = 0, budka_lista[1024];
				ForeachEx(i, MAX_KONTAKTOW)
				{
					if(Kontakt[i][kPrzedmiot] == DaneGracza[playerid][gTelefon])
					{
						format(budka_lista, sizeof(budka_lista), "%s\n%d\t%d\t%s", budka_lista, Kontakt[i][kUID], Kontakt[i][kNumer], Kontakt[i][kNazwa]);
						find++;
					}
				}
				if(find != 0)
				{
					dShowPlayerDialog(playerid, DIALOG_TELEFON_DZWON_K, DIALOG_STYLE_LIST, "• Telefon:", budka_lista, "Wybierz", "Zamknij");
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Telefon:", "Nie masz zapisanych kontaktów w swoim smartfonie.", "Zamknij", "");
				}
			}
			case 2:
			{
			    new id_przedmiotu = GetPVarInt( playerid, "UzytyItem");
				if(PrzedmiotInfo[id_przedmiotu][pUzywany] == 0)
				{
					GameTextForPlayer(playerid, "~r~Ten telefon jest wylaczony.", 3000, 5);
					return 0;
				}
				if(PrzedmiotInfo[id_przedmiotu][pWar2] == 0)
				{
					GameTextForPlayer(playerid, "~r~Ten telefon nie posiada karty SIM.", 3000, 5);
					return 0;
				}
				new find = 0, budka_lista[512];
				ForeachEx(i, MAX_GROUP)
				{
					if(GrupaInfo[i][gUID] != 0)
					{
						if(GrupaInfo[i][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[i][gTyp] == DZIALALNOSC_SANNEWS || GrupaInfo[i][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[i][gTyp] == DZIALALNOSC_RZADOWA)
						{
							new findduty = 0;
							ForeachEx(playeridg, MAX_PLAYERS)
							{
								if(IsPlayerConnected(playeridg))
								{
									if(zalogowany[playeridg] == true)
									{
										if(DaneGracza[playeridg][gSluzba] == GrupaInfo[i][gUID])
										{
											findduty++;
										}
									}
								}
							}
							if(findduty != 0)
							{
								format(budka_lista, sizeof(budka_lista), "%s\n%d\t»  %s (Osoby na s³u¿bie: %d)", budka_lista, GrupaInfo[i][gUID], GrupaInfo[i][gNazwa], findduty);
								find++;
							}
						}
					}
				}
				if(find != 0)
				{
					dShowPlayerDialog(playerid, DIALOG_TELEFON_SL, DIALOG_STYLE_LIST, "• Telefon:", budka_lista, "Wybierz", "Zamknij");
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Telefon:", "Aktualnie nie ma s³u¿b porz¹dkowych na s³u¿bie.", "Zamknij", "");
				}
			}
			case 3:
			{
			    new id_przedmiotu = GetPVarInt( playerid, "UzytyItem");
				if(PrzedmiotInfo[id_przedmiotu][pUzywany] == 0)
				{
					GameTextForPlayer(playerid, "~r~Ten telefon jest wylaczony.", 3000, 5);
					return 0;
				}
				if(PrzedmiotInfo[id_przedmiotu][pWar2] == 0)
				{
					GameTextForPlayer(playerid, "~r~Ten telefon nie posiada karty SIM.", 3000, 5);
					return 0;
				}
				new find = 0, budka_lista[1024];
				ForeachEx(i, MAX_GROUP)
				{
					if(GrupaInfo[i][gUID] != 0)
					{
						if(GrupaInfo[i][gTyp] != DZIALALNOSC_SANNEWS && GrupaInfo[i][gTyp] != DZIALALNOSC_POLICYJNA && GrupaInfo[i][gTyp] != DZIALALNOSC_ZMOTORYZOWANA && GrupaInfo[i][gTyp] != DZIALALNOSC_MAFIE && GrupaInfo[i][gTyp] != DZIALALNOSC_RODZINKA && GrupaInfo[i][gTyp] != DZIALALNOSC_MEDYCZNA && GrupaInfo[i][gTyp] != DZIALALNOSC_GANGI && GrupaInfo[i][gTyp] != DZIALALNOSC_RZADOWA)
						{
							new findduty = 0;
							ForeachEx(playeridg, MAX_PLAYERS)
							{
								if(IsPlayerConnected(playeridg))
								{
									if(zalogowany[playeridg] == true)
									{
										if(DaneGracza[playeridg][gSluzba] == GrupaInfo[i][gUID])
										{
											findduty++;
										}
									}
								}
							}
							if(findduty != 0)
							{
								format(budka_lista, sizeof(budka_lista), "%s\n%d\t»  %s (Osoby na s³u¿bie: %d)", budka_lista, GrupaInfo[i][gUID], GrupaInfo[i][gNazwa], findduty);
								find++;
							}
						}
					}
				}
				if(find != 0)
				{
					dShowPlayerDialog(playerid, DIALOG_TELEFON_SL, DIALOG_STYLE_LIST, "• Telefon:", budka_lista, "Wybierz", "Zamknij");
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Telefon:", "Aktualnie nie ma ¿adnych Grupy na s³u¿bie.", "Wybierz", "Zamknij");
				}
			}
			case 4:
			{
			    //Zamawianie przedmiotów w hurtowni
			    new id_przedmiotu = GetPVarInt( playerid, "UzytyItem");
			    if(PrzedmiotInfo[id_przedmiotu][pUzywany] == 0)
				{
					GameTextForPlayer(playerid, "~r~Ten telefon jest wylaczony.", 3000, 5);
					return 0;
				}
			    if(PrzedmiotInfo[id_przedmiotu][pWar2] == 0)
				{
					GameTextForPlayer(playerid, "~r~Ten telefon nie posiada karty SIM.", 3000, 5);
					return 0;
				}
				if(DaneGracza[playerid][gSluzba] == 0)
				{
					GameTextForPlayer(playerid, "~r~Nie znajdujesz sie na sluzbie grupy!.", 3000, 5);
					return 0;
				}
			    new dol[1024];
				strdel(dol, 0, 1024);
				format(dol, sizeof(dol), "%s\n»  Czêœci zamienne", dol);
				format(dol, sizeof(dol), "%s\n»  Sklepy 24/7", dol);
				format(dol, sizeof(dol), "%s\n»  Gastronomia", dol);
				format(dol, sizeof(dol), "%s\n»  Medykamenty", dol);
				format(dol, sizeof(dol), "%s\n»  Si³ownie", dol);
				format(dol, sizeof(dol), "%s\n»  Warsztaty", dol);
				format(dol, sizeof(dol), "%s\n»  Porz¹dkowe", dol);
				format(dol, sizeof(dol), "%s\n»  Przestêpcze", dol);
				format(dol, sizeof(dol), "%s\n»  Ammunation", dol);
				format(dol, sizeof(dol), "%s\n»  Strzelnica", dol);
				format(dol, sizeof(dol), "%s\n»  Sieæ telefonów", dol);
				format(dol, sizeof(dol), "%s\n»  Salon tatua¿u", dol);
				format(dol, sizeof(dol), "%s\n»  Ubrania firmowe", dol);
				format(dol, sizeof(dol), "%s\n»  Czêsci dla org. porz¹dkowych", dol);
				dShowPlayerDialog(playerid, DIALOG_ZAMOW_PACZKE, DIALOG_STYLE_LIST, "• Telefon: Zamawianie produktów > Kategorie", dol, "Wybierz", "Zamknij");
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_TELEFON_OPCJA2)
	{
	    if( !response ) return 0;
		switch(listitem)
		{
			case 0:
			{
			    new id_przedmiotu = GetPVarInt( playerid, "UzytyItem");
				if(PrzedmiotInfo[id_przedmiotu][pUzywany] == 0)
				{
					GameTextForPlayer(playerid, "~r~Ten telefon jest wylaczony.", 3000, 5);
					return 0;
				}
				if(PrzedmiotInfo[id_przedmiotu][pWar2] == 0)
				{
					GameTextForPlayer(playerid, "~r~Ten telefon nie posiada karty SIM.", 3000, 5);
					return 0;
				}
				dShowPlayerDialog(playerid, DIALOG_TELEFON_SMS_KAL, DIALOG_STYLE_INPUT, "• Informacja:", "Podaj numer, do którego chcesz wys³aæ wiadomoœæ.", "Zatwierdz", "Zamknij");
			}
			case 1:
			{
			    new id_przedmiotu = GetPVarInt( playerid, "UzytyItem");
				if(PrzedmiotInfo[id_przedmiotu][pUzywany] == 0)
				{
					GameTextForPlayer(playerid, "~r~Ten telefon jest wylaczony.", 3000, 5);
					return 0;
				}
				if(PrzedmiotInfo[id_przedmiotu][pWar2] == 0)
				{
					GameTextForPlayer(playerid, "~r~Ten telefon nie posiada karty SIM.", 3000, 5);
					return 0;
				}
				new find = 0, budka_lista[1024];
				ForeachEx(i, MAX_KONTAKTOW)
				{
					if(Kontakt[i][kPrzedmiot] == DaneGracza[playerid][gTelefon])
					{
						format(budka_lista, sizeof(budka_lista), "%s\n%d\t%d\t%s", budka_lista, Kontakt[i][kUID], Kontakt[i][kNumer], Kontakt[i][kNazwa]);
						find++;
					}
				}
				if(find != 0)
				{
					dShowPlayerDialog(playerid, DIALOG_TELEFON_SMS_K, DIALOG_STYLE_LIST, "• Telefon:", budka_lista, "Wybierz", "Zamknij");
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Telefon:", "Nie masz zapisanych kontaktów w swoim smartfonie.", "Zamknij", "");
				}
			}
			case 2:
			{
			    ZaladujSMS();
				new found = 0;
				strdel(tekst_global, 0, 1024);
				format(tekst_global, sizeof(tekst_global), "ID\tNumer\tTresc\tOtrzymano", tekst_global);
			    ForeachEx(i, MAX_SMS)
				{
					if(SMSY[i][sNUMER2] == DaneGracza[playerid][gTelefon])
					{
						format(tekst_global, sizeof(tekst_global), "%s\n%d\t%d\t%s\t%d.%d.%dr %d:%d", tekst_global, SMSY[i][sID], SMSY[i][sNUMER1], SMSY[i][sTRESC], SMSY[i][sDzien], SMSY[i][sMiesiac], SMSY[i][sRok], SMSY[i][sGodzina]+6, SMSY[i][sMinuta]);
						found++;
					}
				}
				if(found != 0) dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_TABLIST_HEADERS, "• Skrynka odbiorcza:", tekst_global, "Zamknij", "");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Twoja skrzynka odbiorcza jest pusta.", "Rozumiem", "Zamknij");
				return 1;
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_TELEFON_OPCJA3)
	{
	    if( !response ) return 0;
		switch(listitem)
		{
			case 0:
			{
			    new id_przedmiotu = GetPVarInt( playerid, "UzytyItem");
				if(PrzedmiotInfo[id_przedmiotu][pUzywany] == 0)
				{
					GameTextForPlayer(playerid, "~r~Ten telefon jest wylaczony.", 3000, 5);
					return 0;
				}
				if(PrzedmiotInfo[id_przedmiotu][pWar2] == 0)
				{
					GameTextForPlayer(playerid, "~r~Ten telefon nie posiada karty SIM.", 3000, 5);
					return 0;
				}
				new found = 0;
				strdel(tekst_global, 0, 2048);
				ForeachEx(i, MAX_PLAYERS)
				{
					if(IsPlayerConnected(i))
					{
						if(zalogowany[i] == true)
						{
							if(PlayerObokPlayera(playerid, i, 15) && i != playerid && zalogowany[i] == true && DaneGracza[i][gTelefon] != 0 && SpecUruchomiony[i] == 0)
							{
								format(tekst_global, sizeof(tekst_global), "%s\n%d\t%s", tekst_global, i, ZmianaNicku(i));
								found++;
							}
						}
					}
				}
				if(found != 0) dShowPlayerDialog(playerid, DIALOG_KONTAKT_ZAPROS, DIALOG_STYLE_LIST, "• Telefon:", tekst_global, "Zaproœ", "Zamknij");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie znajdujesz siê obok gracza, b¹dz ta osoba nie ma w³¹czonego telefonu.", "Zamknij", "");
			}
			case 1:
			{
			    new id_przedmiotu = GetPVarInt( playerid, "UzytyItem");
				if(PrzedmiotInfo[id_przedmiotu][pUzywany] == 0)
				{
					GameTextForPlayer(playerid, "~r~Ten telefon jest wylaczony.", 3000, 5);
					return 0;
				}
				if(PrzedmiotInfo[id_przedmiotu][pWar2] == 0)
				{
					GameTextForPlayer(playerid, "~r~Ten telefon nie posiada karty SIM.", 3000, 5);
					return 0;
				}
				new find = 0, budka_lista[1024];
				ForeachEx(i, MAX_KONTAKTOW)
				{
					if(Kontakt[i][kPrzedmiot] == DaneGracza[playerid][gTelefon])
					{
						format(budka_lista, sizeof(budka_lista), "%s\n%d\t%d\t%s", budka_lista, Kontakt[i][kUID], Kontakt[i][kNumer], Kontakt[i][kNazwa]);
						find++;
					}
				}
				if(find != 0)
				{
					dShowPlayerDialog(playerid, DIALOG_TELEFON_USUN, DIALOG_STYLE_LIST, "• Telefon:", budka_lista, "Usuñ", "Zamknij");
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Telefon:", "Nie masz zapisanych kontaktów w swoim smartfonie.", "Zamknij", "");
				}
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_TELEFON_OPCJA4)
	{
	    if( !response ) return 0;
		switch(listitem)
		{
			case 0:
			{
			    new id_przedmiotu = GetPVarInt( playerid, "UzytyItem");
			    if(PrzedmiotInfo[id_przedmiotu][pUzywany] == 0)
				{
					GameTextForPlayer(playerid, "~r~Ten telefon jest wylaczony.", 3000, 5);
					return 0;
				}
				if(PrzedmiotInfo[id_przedmiotu][pWar2] == 0)
				{
					GameTextForPlayer(playerid, "~r~Ten telefon nie posiada karty SIM.", 3000, 5);
					return 0;
				}
			    dShowPlayerDialog(playerid, DIALOG_BANKOMAT_PRZELEW, DIALOG_STYLE_INPUT, "• Przelew Telefoniczny:", "Podaj numer konta bankowego by przelaæ swoje pieni¹dze, koszt jednego przelewu wynosi: 10$", "Dalej", "Zamknij");
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_TELEFON)
	{
		if( !response ) return 0;
		switch(listitem)
		{
			case 0:
			{
			    new id_przedmiotu = GetPVarInt( playerid, "UzytyItem");
                if(PrzedmiotInfo[id_przedmiotu][pUzywany] == 0)
				{
					if(DaneGracza[playerid][gTelefon] != 0)
					{
						GameTextForPlayer(playerid, "~r~Masz juz aktywny jeden telefon.", 3000, 5);
						return 0;
					}
					DaneGracza[playerid][gTelefon] = PrzedmiotInfo[id_przedmiotu][pWar2];
					PrzedmiotInfo[id_przedmiotu][pUzywany] = 1;
					ZapiszPrzedmiot(id_przedmiotu);
					ZapiszGracza(playerid);
					CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
					TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
					TextDrawSetString(TextNaDrzwi[playerid], "Wlaczyles swoj telefon.");
					TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
					new akcja[126];
					format(akcja,sizeof(akcja),"*w³¹czy³ swój telefon*");
					SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
					new akcja2[126];
					format(akcja2,sizeof(akcja2),"wlaczyl swoj telefon");
					TextDrawSetString(AkcjaTD[playerid], akcja2);
					TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
					CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
					return 1;
				}
				if(PrzedmiotInfo[id_przedmiotu][pUzywany] == 1)
				{
				    new dol[312];
				    format(dol, sizeof(dol), "%s\n»  Zadzwoñ pod numer", dol);
					format(dol, sizeof(dol), "%s\n»  Zadzwoñ do kontaktu", dol);
					format(dol, sizeof(dol), "%s\n»  Zadzwoñ do organizacji publicznych", dol);
					format(dol, sizeof(dol), "%s\n»  Zadzwoñ do dzia³alnoœci publicznych", dol);
					format(dol, sizeof(dol), "%s\n»  Zadzwoñ do hurtowni", dol);
					dShowPlayerDialog(playerid, DIALOG_TELEFON_OPCJA1, DIALOG_STYLE_LIST, "Zadzwoñ", dol, "Wybierz", "Zamknij");
					return 1;
				}
				return 1;
			}
			case 1:
			{
			    new dol[256];
			    format(dol, sizeof(dol), "%s\n»  Wyœlij wiadomoœæ pod numer", dol);
				format(dol, sizeof(dol), "%s\n»  Wyœlij wiadomoœæ do kontaktu", dol);
				format(dol, sizeof(dol), "%s\n»  Przegl¹daj swoje wiadomoœci", dol);
				dShowPlayerDialog(playerid, DIALOG_TELEFON_OPCJA2, DIALOG_STYLE_LIST, "Wiadomoœci", dol, "Wybierz", "Zamknij");
				return 1;
			}
			case 2:
			{
			    new dol[256];
			    format(dol, sizeof(dol), "%s\n»  Wyœlij swój v-card", dol);
				format(dol, sizeof(dol), "%s\n»  Usuñ kontakt z telefonu", dol);
				dShowPlayerDialog(playerid, DIALOG_TELEFON_OPCJA3, DIALOG_STYLE_LIST, "Dodaj lub usuñ kontakt", dol, "Wybierz", "Zamknij");
				return 1;
			}
			case 3:
			{
			    new dol[64];
			    format(dol, sizeof(dol), "%s\n»  Dokonaj przelewu", dol);
				dShowPlayerDialog(playerid, DIALOG_TELEFON_OPCJA4, DIALOG_STYLE_LIST, "Internet", dol, "Wybierz", "Zamknij");
				return 1;
			}
		    case 4://ustawienia
			{
                dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "Ustawienia", "Funkcja niedostêpna w tym momencie, czekaj na aktualizacjê smartfona!", "Zamknij", "");
                return 1;
			}
			case 5://przerwa
			{
			//
			}
			case 6:
			{
			    new id_przedmiotu = GetPVarInt( playerid, "UzytyItem");
			    if(PrzedmiotInfo[id_przedmiotu][pWar2] == 0)
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Karta SIM:", "Twój telefon nie posiada karty SIM, w³ó¿ j¹ do telefonu by korzystaæ z opcji które nam daje.", "Zamknij", "");
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Karta SIM:", "Poprawnie wyci¹g³eœ kartê SIM z swojego telefonu", "Zamknij", "");
                    //DodajPrzedmiot(DaneGracza[playerid][gUID], 0, 91, 0, PrzedmiotInfo[id_przedmiotu][pWar2], "Karta SIM", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
                    new uid2 = PrzedmiotInfo[id_przedmiotu][pWar2]-10000;
                    PrzedmiotInfo[uid2][pUzywany] = 0;
                    ZapiszPrzedmiot(uid2);
					PrzedmiotInfo[id_przedmiotu][pWar2] = 0;
					DaneGracza[playerid][gTelefon] = 0;
					ZapiszGracza(playerid);
					ZapiszPrzedmiot(id_przedmiotu);
					new akcja[126];
					format(akcja,sizeof(akcja),"*wyciaga kartê SIM z telefonu*");
					SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
					new akcja2[126];
					format(akcja2,sizeof(akcja2),"wyciaga karte SIM z telefonu");
					TextDrawSetString(AkcjaTD[playerid], akcja2);
					TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
					CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
					return 1;
				}
				return 1;
			}
			case 7:
			{
				new id_przedmiotu = GetPVarInt( playerid, "UzytyItem");
				if(PrzedmiotInfo[id_przedmiotu][pUzywany] == 0)
				{
					if(DaneGracza[playerid][gTelefon] != 0)
					{
						GameTextForPlayer(playerid, "~r~Masz juz aktywny jeden telefon.", 3000, 5);
						return 0;
					}
					DaneGracza[playerid][gTelefon] = PrzedmiotInfo[id_przedmiotu][pWar2];
					PrzedmiotInfo[id_przedmiotu][pUzywany] = 1;
					ZapiszPrzedmiot(id_przedmiotu);
					ZapiszGracza(playerid);
					CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
					TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
					TextDrawSetString(TextNaDrzwi[playerid], "Wlaczyles swoj telefon.");
					TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
					new akcja[126];
					format(akcja,sizeof(akcja),"*w³¹czy³ swój telefon*");
					SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
					new akcja2[126];
					format(akcja2,sizeof(akcja2),"wlaczyl swoj telefon");
					TextDrawSetString(AkcjaTD[playerid], akcja2);
					TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
					CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
					return 1;
				}
				else
				{
					if(Dzwoni[playerid] != 0)
					{
						GameTextForPlayer(playerid, "~r~Aktualnie wykonujesz polaczenie.", 3000, 5);
						return 0;
					}
					DaneGracza[playerid][gTelefon] = 0;
					//PrzedmiotInfo[id_przedmiotu][pWar2] = 0;
					PrzedmiotInfo[id_przedmiotu][pUzywany] = 0;
					ZapiszPrzedmiot(id_przedmiotu);
					ZapiszGracza(playerid);
					CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
					TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
					TextDrawSetString(TextNaDrzwi[playerid], "Wylaczyles swoj telefon.");
					TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
					new akcja[126];
					format(akcja,sizeof(akcja),"*wy³¹czy³ swój telefon*");
					SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
					new akcja2[126];
					format(akcja2,sizeof(akcja2),"wylaczyl swoj telefon");
					TextDrawSetString(AkcjaTD[playerid], akcja2);
					TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
					CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
					return 1;
				}
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_ZAMOW_PACZKE)
	{
		if(!response)
		{
			return 1;
		}
		switch( listitem )
		{
			case 0:
			{
				Hurtownia(playerid, 3, DZIALALNOSC_WARSZTAT, 43, GetPlayerVirtualWorld(playerid));
			}
			case 1:
			{
				Hurtownia(playerid, 6, DZIALALNOSC_247, 43, GetPlayerVirtualWorld(playerid));
			}
			case 2:
			{
				Hurtownia(playerid, 8, DZIALALNOSC_GASTRONOMIA, 44, GetPlayerVirtualWorld(playerid));
			}
			case 3:
			{
				Hurtownia(playerid, 12, DZIALALNOSC_MEDYCZNA, 44, GetPlayerVirtualWorld(playerid));
			}
			case 4:
			{
				Hurtownia(playerid, 26, DZIALALNOSC_SILOWNIA, 43, GetPlayerVirtualWorld(playerid));
			}
			case 5:
			{
			    new dol[1024];
				strdel(dol, 0, 1024);
                format(dol, sizeof(dol), "%s\n»  Luksusowe Felgi", dol);
				format(dol, sizeof(dol), "%s\n»  Sportowe Spoilery", dol);
				format(dol, sizeof(dol), "%s\n»  Sportowe Wydechy i wloty", dol);
				format(dol, sizeof(dol), "%s\n»  Sportowe Progi", dol);
				format(dol, sizeof(dol), "%s\n»  Sportowe Zderzaki", dol);
				dShowPlayerDialog(playerid, DIALOG_ZAMOW_PACZKE_WIZUALNE, DIALOG_STYLE_LIST, "•Zamawianie produktów > Kategorie > Warsztaty", dol, "Wybierz", "Zamknij");
			}
			/*case 7:
			{
				new dol[256];
				strdel(dol, 0, 1024);
                format(dol, sizeof(dol), "%s\n»  Filtry powietrza", dol);
				format(dol, sizeof(dol), "%s\n»  Sportowe turbiny", dol);
				dShowPlayerDialog(playerid, DIALOG_ZAMOW_PACZKE_TUNING, DIALOG_STYLE_LIST, "Zamawianie produktów > Kategorie > Tuning mechaniczny", dol, "Wybierz", "Zamknij");
			}*/
			case 6:
			{
				Hurtownia(playerid, 5, DZIALALNOSC_POLICYJNA, 43, GetPlayerVirtualWorld(playerid));
			}
			case 7:
			{
				new dol[256];
				strdel(dol, 0, 1024);
                format(dol, sizeof(dol), "%s\n»  Zamawianie: Broñ", dol);
				format(dol, sizeof(dol), "%s\n»  Zamawianie: Narkotyki", dol);
				format(dol, sizeof(dol), "%s\n»  Zamawianie: Amunicja", dol);
				dShowPlayerDialog(playerid, DIALOG_ZAMOW_PACZKE_MAFIE, DIALOG_STYLE_LIST, "•Zamawianie produktów > Kategorie > Przestêpcze", dol, "Wybierz", "Zamknij");
			}
   			case 8:
   			{
   			    Hurtownia(playerid, 27, DZIALALNOSC_AMUNATION, 43, GetPlayerVirtualWorld(playerid));
   			}
   			case 9:
   			{
   			    Hurtownia(playerid, 28, DZIALALNOSC_STRZELNICA, 43, GetPlayerVirtualWorld(playerid));
   			}
   			case 10:
   			{
   			    Hurtownia(playerid, 29, DZIALALNOSC_SIEC, 43, GetPlayerVirtualWorld(playerid));
   			}
   			case 11:
   			{
   			    Hurtownia(playerid, 30, DZIALALNOSC_TATUAZ, 43, GetPlayerVirtualWorld(playerid));
   			}
   			case 12:
   			{
   			    new dol[256];
				strdel(dol, 0, 1024);
                format(dol, sizeof(dol), "%s\n»  Ubrania porzadkowe", dol);
				format(dol, sizeof(dol), "%s\n»  Ubrania mafijne", dol);
				format(dol, sizeof(dol), "%s\n»  Ubrania gangowe", dol);
				format(dol, sizeof(dol), "%s\n»  Ubrania zmotoryzowane", dol);
				format(dol, sizeof(dol), "%s\n»  Ubrania medyczne", dol);
				format(dol, sizeof(dol), "%s\n»  Ubrania strazakow", dol);
				dShowPlayerDialog(playerid, DIALOG_ZAMOW_UBRANIA, DIALOG_STYLE_LIST, "•Zamawianie produktów > Kategorie > Organizacje", dol, "Wybierz", "Zamknij");
   			}
   			case 13:
   			{
   			    Hurtownia(playerid, 34, DZIALALNOSC_POLICYJNA, 43, GetPlayerVirtualWorld(playerid));
   			}
		}
	}
	if(dialogid == DIALOG_ZAMOW_PACZKE_WIZUALNE)
	{
        if(!response)
		{
			return 1;
		}
		switch( listitem )
		{
		    case 0:
		    {
		        Hurtownia(playerid, 21, DZIALALNOSC_WARSZTAT, 43, GetPlayerVirtualWorld(playerid));
		    }
		    case 1:
		    {
		        Hurtownia(playerid, 22, DZIALALNOSC_WARSZTAT, 43, GetPlayerVirtualWorld(playerid));
		    }
		    case 2:
		    {
		        Hurtownia(playerid, 23, DZIALALNOSC_WARSZTAT, 43, GetPlayerVirtualWorld(playerid));
		    }
		    case 3:
		    {
		        Hurtownia(playerid, 24, DZIALALNOSC_WARSZTAT, 43, GetPlayerVirtualWorld(playerid));
		    }
		    case 4:
		    {
		        Hurtownia(playerid, 25, DZIALALNOSC_WARSZTAT, 43, GetPlayerVirtualWorld(playerid));
		    }
		    case 5:
		    {
		        Hurtownia(playerid, 13, DZIALALNOSC_ZMOTORYZOWANA, 41, GetPlayerVirtualWorld(playerid));
		    }
		}
	}
	if(dialogid == DIALOG_ZAMOW_PACZKE_WIZUALNE2)
	{
        if(!response)
		{
			return 1;
		}
		switch( listitem )
		{
		    case 0:
		    {
		        Hurtownia(playerid, 21, DZIALALNOSC_ZMOTORYZOWANA, 41, GetPlayerVirtualWorld(playerid));
		    }
		    case 1:
		    {
		        Hurtownia(playerid, 22, DZIALALNOSC_ZMOTORYZOWANA, 41, GetPlayerVirtualWorld(playerid));
		    }
		    case 2:
		    {
		        Hurtownia(playerid, 23, DZIALALNOSC_ZMOTORYZOWANA, 41, GetPlayerVirtualWorld(playerid));
		    }
		    case 3:
		    {
		        Hurtownia(playerid, 24, DZIALALNOSC_ZMOTORYZOWANA, 41, GetPlayerVirtualWorld(playerid));
		    }
		    case 4:
		    {
		        Hurtownia(playerid, 25, DZIALALNOSC_ZMOTORYZOWANA, 41, GetPlayerVirtualWorld(playerid));
		    }
		    case 5:
		    {
		        Hurtownia(playerid, 31, DZIALALNOSC_ZMOTORYZOWANA, 41, GetPlayerVirtualWorld(playerid));
		    }
		    case 6:
		    {
		        Hurtownia(playerid, 13, DZIALALNOSC_ZMOTORYZOWANA, 41, GetPlayerVirtualWorld(playerid));
		    }
		}
	}
	if(dialogid == DIALOG_ZAMOW_PACZKE_TUNING)
	{
        if(!response)
		{
			return 1;
		}
		switch( listitem )
		{
		    case 0:
		    {
		        //filtry powietrza
		    }
		    case 1:
		    {
		        //turbiny
		    }
		}
	}
	if(dialogid == DIALOG_ZAMOW_UBRANIA)
	{
        if(!response)
		{
			return 1;
		}
		switch( listitem )
		{
		    case 0:
		    {
		        Hurtownia(playerid, 32, DZIALALNOSC_POLICYJNA, 43, GetPlayerVirtualWorld(playerid));
		    }
		    case 1:
		    {
		        Hurtownia(playerid, 33, DZIALALNOSC_MAFIE, 41, GetPlayerVirtualWorld(playerid));
		    }
		    case 2:
		    {
		        Hurtownia(playerid, 33, DZIALALNOSC_GANGI, 41, GetPlayerVirtualWorld(playerid));
		    }
		    case 3:
		    {
		        Hurtownia(playerid, 33, DZIALALNOSC_ZMOTORYZOWANA, 41, GetPlayerVirtualWorld(playerid));
		    }
		    case 4:
		    {
		        Hurtownia(playerid, 35, DZIALALNOSC_MEDYCZNA, 43, GetPlayerVirtualWorld(playerid));
		    }
		    case 5:
		    {
		        Hurtownia(playerid, 36, DZIALALNOSC_MEDYCZNA, 43, GetPlayerVirtualWorld(playerid));
		    }
		}
	}
	if(dialogid == DIALOG_OFERTA_BUT0)
	{
		if(response)
		{
			new naglowek[126];
			format(naglowek, sizeof(naglowek), "• Wybierz sposób p³atnoœci:", ZmianaNicku(playerid));
			dShowPlayerDialog(playerid, DIALOG_OFERTA_BUT3, DIALOG_STYLE_MSGBOX, naglowek, "Musisz wybrac dla tej oferty sposób p³atnoœci:", "Gotówka", "Konto Bankowe");
			return 1;
		}
		else
		{
			Akceptacja(playerid, 0, 0);
			return 1;
		}
	}
	if(dialogid == DIALOG_OFERTA_BUT1)
	{
		if(response)
		{
			Akceptacja(playerid, 1, 2);
			return 1;
		}
		else
		{
			Akceptacja(playerid, 0, 0);
			return 1;
		}
	}
	if(dialogid == DIALOG_OFERTA_BUT3)
	{
		if(response)//Gotówka
		{
			Akceptacja(playerid, 1, 0);
			return 1;
		}
		else
		{	//Karta bankowa
			if(GetPVarInt(playerid, "DlugGracza") != 0 && GetPVarInt(playerid, "ZadluzeniePoTerminie") != 0 && GetPVarInt(playerid, "SplataOferta") == 0)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zadluzenie konta bankowego:", "Musisz sp³aciæ zad³u¿enia na swoim koncie bankowym!", "Rozumiem", "");
				return 0;
			}
			if(DaneGracza[playerid][gKONTO_W_BANKU] != 0)
			{
				Akceptacja(playerid, 1, 1);
				return 1;
			}
			else
			{
				 Akceptacja(playerid, 0, 0);
				 GameTextForPlayer(playerid, "~r~Nie posiadasz konta w banku.", 3000, 5);
				 return 1;
			}
		}
	}
 	if(dialogid == DIALOG_ZAMOW_PACZKE_MAFIE)
	{
        if(!response)
		{
			return 1;
		}
		switch( listitem )
		{
		    case 0:
		    {
		        Hurtownia(playerid, 14, DZIALALNOSC_MAFIE, 41, GetPlayerVirtualWorld(playerid));
		    }
		    case 1:
		    {
		        Hurtownia(playerid, 9, DZIALALNOSC_GANGI, 41, GetPlayerVirtualWorld(playerid));
		    }
		    case 2:
		    {
				Hurtownia(playerid, 13, DZIALALNOSC_ZMOTORYZOWANA, 41, GetPlayerVirtualWorld(playerid));
		        /*new dol[1024];
				strdel(dol, 0, 1024);
                format(dol, sizeof(dol), "%s\n»  Luksusowe Felgi", dol);
				format(dol, sizeof(dol), "%s\n»  Sportowe Spoilery", dol);
				format(dol, sizeof(dol), "%s\n»  Sportowe Wydechy i wloty", dol);
				format(dol, sizeof(dol), "%s\n»  Sportowe Progi", dol);
				format(dol, sizeof(dol), "%s\n»  Sportowe Zderzaki", dol);
				format(dol, sizeof(dol), "%s\n»  Sportowe czêœci mechaniczne", dol);
				format(dol, sizeof(dol), "%s\n»  Przedmioty dot. organizacji", dol);
				dShowPlayerDialog(playerid, DIALOG_ZAMOW_PACZKE_WIZUALNE2, DIALOG_STYLE_LIST, "•Zamawianie produktów > Kategorie > Tuning wizualny oraz mechaniczny", dol, "Wybierz", "Zamknij");*/
		    }
	  		case 3:
	  		{
	  		    //
	  		}
		}
	}
	if(dialogid == DIALOG_TELEFON_DZWON_K)
	{
		if(!response)
		{
		
		}
		else
		{
			new a = 0;
			new uid = strval(inputtext);
			ForeachEx(id, MAX_PLAYERS)
			{
				if(IsPlayerConnected(id))
				{
					if(zalogowany[id] == true)
					{
						if(DaneGracza[id][gTelefon] == Kontakt[uid][kNumer] && zalogowany[id] == true)
						{
							if(Dzwoni[id] == 1)
							{
								cmd_do(playerid, "Sygna³ zajêtoœci...");
								a++;
								break;
							}
							else
							{
								TextDrawHideForPlayer(id, TextNaDrzwi[id]);
								cmd_do(id, "Dzwoni telefon");
								new str[256];
								format(str, sizeof(str), "~w~Ktos do Ciebie dzwoni!~n~Numer: %d~n~~n~~y~Uzyj telefonu,~n~by odebrac lub odrzucic~n~polaczenie.",DaneGracza[playerid][gTelefon]);
								TextDrawSetString(TextNaDrzwi2[id], str);
								TextDrawShowForPlayer(id, TextNaDrzwi2[id]);
								Dzwoni[id] = -1;
								DzwoniID[id] = playerid;
								DzwoniID[playerid] = id;
								Dzwoni[playerid] = 1;
								dzwon[playerid] = SetTimerEx("Dzwonie", 10000, 0, "i", playerid);
								new strsa[256];
								format(strsa, sizeof(strsa), "~w~Dzwonisz:~n~Numer: %d~n~~n~~y~Uzyj telefonu,~n~by odrzucic~n~polaczenie.",DaneGracza[id][gTelefon]);
								TextDrawSetString(TextNaDrzwi2[playerid], strsa);
								TextDrawShowForPlayer(playerid, TextNaDrzwi2[playerid]);
								a++;
								break;
							}
						}
					}
				}
			}
			if(a == 0)
			{
				cmd_do(playerid, "Brak sygna³u...");
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_TELEFON_USUN)
	{
		if(!response)
		{
		
		}
		else
		{
			new uid = strval(inputtext);
			UsunKontakt(uid);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Kontat zosta³ usuniêty z listy.", "Zamknij", "");
			new akcja[126];
			format(akcja,sizeof(akcja),"*usuwa kontakt z telefonu*");
			SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
			new akcja2[126];
			format(akcja2,sizeof(akcja2),"usuwa kontakt z telefonu");
			TextDrawSetString(AkcjaTD[playerid], akcja2);
			TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
			CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
		}
		return 1;
	}
	if(dialogid == DIALOG_TELEFON_DZWON_KAL)
	{
		if(!response)
		{
		
		}
		else
		{
			if(strval(inputtext) > 10000)
			{	
				new a = 0;
				new uid = strval(inputtext);
				if(uid == DaneGracza[playerid][gTelefon])
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Telefon:", "Nie ma takiego numeru.", "Zamknij", "");
				    return 0;
				}
				ForeachEx(id, MAX_PLAYERS)
				{
					if(IsPlayerConnected(id))
					{
						if(zalogowany[id] == true)
						{
							if(DaneGracza[id][gTelefon] == uid && zalogowany[id] == true)
							{
								if(Dzwoni[id] == 1)
								{
									cmd_do(playerid, "Sygna³ zajêtoœci...");
									a++;
									break;
								}
								else
								{
									TextDrawHideForPlayer(id, TextNaDrzwi[id]);
									cmd_do(id, "Dzwoni telefon");
									new str[256];
									format(str, sizeof(str), "~w~Ktos do Ciebie dzwoni!~n~Numer: %d~n~~n~~y~Uzyj telefonu,~n~by odebrac lub odrzucic~n~polaczenie.",DaneGracza[playerid][gTelefon]);
									TextDrawSetString(TextNaDrzwi2[id], str);
									TextDrawShowForPlayer(id, TextNaDrzwi2[id]);
									Dzwoni[id] = -1;
									DzwoniID[id] = playerid;
									DzwoniID[playerid] = id;
									Dzwoni[playerid] = 1;
									dzwon[playerid] = SetTimerEx("Dzwonie", 10000, 0, "i", playerid);
									new strsa[256];
									format(strsa, sizeof(strsa), "~w~Dzwonisz:~n~Numer: %d~n~~n~~y~Uzyj telefonu,~n~by odrzucic~n~polaczenie.",DaneGracza[id][gTelefon]);
									TextDrawSetString(TextNaDrzwi2[playerid], strsa);
									TextDrawShowForPlayer(playerid, TextNaDrzwi2[playerid]);
									a++;
									break;
								}
							}
						}
					}
				}
				if(a == 0)
				{
					cmd_do(playerid, "Brak sygna³u...");
				}
			}
			else
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Telefon:", "Podany numer jest nieprawid³owy.", "Zamknij", "");
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_TELEFON_SMS_KAL)
	{
		if(!response)
		{
		
		}
		else
		{
			if(strval(inputtext) > 10000)
			{
				SetPVarInt(playerid, "uidgra", strval(inputtext));
				new ids = GetPVarInt(playerid, "uidgra");
				SetPVarInt(playerid, "uidnumere", ids);
				dShowPlayerDialog(playerid, DIALOG_TELEFON_SMS_KL, DIALOG_STYLE_INPUT, "• Informacja:", "Podaj treœæ sms'a nastêpnie zatwierdz wiadomoœæ.", "Zatwierdz", "Zamknij");
			}
			else
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Podany numer jest nieprawid³owy.", "Zamknij", "");
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_TELEFON_SMS_K)
	{
		if(!response)
		{
		
		}
		else
		{
			SetPVarInt(playerid, "uidgra", strval(inputtext));
			new ids = GetPVarInt(playerid, "uidgra");
			SetPVarInt(playerid, "uidnumere", Kontakt[ids][kNumer]);
			dShowPlayerDialog(playerid, DIALOG_TELEFON_SMS_KL, DIALOG_STYLE_INPUT, "• Informacja:", "Podaj treœæ sms'a nastêpnie zatwierdz wiadomoœæ.", "Zatwierdz", "Zamknij");
		}
		return 1;
	}
	if(dialogid == DIALOG_TELEFON_SMS_KL)
	{
		if(!response)
		{
		
		}
		else
		{
			new ids = GetPVarInt(playerid, "uidnumere"), a = 0;
			/*if(uid == DaneGracza[playerid][gTelefon])
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Telefon:", "Nie ma takiego numeru.", "Zamknij", "");
			    return 0;
			}*/
			ForeachEx(i, MAX_PLAYERS)
			{
				if(IsPlayerConnected(i))
				{
					if(zalogowany[i] == true)
					{
						if(DaneGracza[i][gTelefon] == ids)
						{
							new akcja[126];
							format(akcja,sizeof(akcja),"*wysy³a SMS-a ze swojego telefonu*");
							SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
							cmd_fasdasfdfive(playerid, "wysy³a SMS-a ze swojego telefonu.");
							new akcja2[126];
							format(akcja2,sizeof(akcja2),"wysyla SMS-a ze swojego telefonu");
							TextDrawSetString(AkcjaTD[playerid], akcja2);
							TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
							CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
							new strsa[256];
							format(strsa, sizeof(strsa), "{FFFF00}%d > %s.", DaneGracza[i][gTelefon], inputtext);
							SendClientMessage(playerid, 0xFFFFFFFF, strsa);//Nadawca sms'a
							cmd_do(i, "Otrzyma³ SMS-a");
							new strs[256];//{008000}
							format(strs, sizeof(strs), "{008000}#%d{ffffff} %s.", DaneGracza[playerid][gTelefon], inputtext);
							SendClientMessage(i, 0xFFFFFFFF, strs);//Odbiorca sms'a
							new rok, miesiac, dzien, godzina, minuta, sekunda;
							sekundytodata(gettime()+CZAS_LETNI, rok, miesiac, dzien, godzina, minuta, sekunda);
							new astr[512];
							format(astr, sizeof(astr), "INSERT INTO `jochym_smsy` (`NUMER1`, `NUMER2`, `NICK1`, `NICK2`, `TRESC`, `dzien`, `miesiac`, `rok`, `godzina`, `minuta`) VALUES ('%d', '%d', '%s', '%s', '%s', '%02d', '%02d', '%d', '%02d', '%02d')", DaneGracza[playerid][gTelefon], DaneGracza[i][gTelefon], ZmianaNicku(playerid), ZmianaNicku(i), inputtext, dzien, miesiac, rok, godzina, minuta);
							mysql_check();
							mysql_query2(astr);
							mysql_free_result();
							new Float:x, Float:y, Float:z;
							GetPlayerPos(i, x, y, z);
							ForeachEx(ig, MAX_PLAYERS)
							{
								if(IsPlayerConnected(ig))
								{
									if(zalogowany[ig] == true)
									{
										if(IsPlayerInRangeOfPoint(ig, 10, x, y, z))
										{
											PlayerPlaySound(ig,1058,0.0,0.0,0.0);
										}
									}
								}
							}
							a++;
							break;
						}
					}
				}
			}
			if(a == 0)
			{
    			cmd_do(playerid, "Brak raportu dorêczenia...");
			}
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "SMS zosta³ wys³any.", "Zamknij", "");
		}
		return 1;
	}
	if(dialogid == DIALOG_TELEFON_SL)
	{
		if(!response)
		{
		
		}
		else
		{
			SetPVarInt(playerid, "uidgr", strval(inputtext));
			dShowPlayerDialog(playerid, DIALOG_TELEFON_SL_ZG, DIALOG_STYLE_INPUT, "• Informacja:", "Podaj treœæ zg³oszenia nastêpnie zatwierdz wiadomoœæ.", "Zatwierdz", "Zamknij");
		}
		return 1;
	}
	if(dialogid == DIALOG_TELEFON_SL_ZG)
	{
		if(!response)
		{
		
		}
		else
		{
			if(strlen(inputtext) < 3)
			{
				dShowPlayerDialog(playerid, DIALOG_TELEFON_SL_ZG, DIALOG_STYLE_INPUT, "• Informacja:", "Podaj treœæ zg³oszenia nastêpnie zatwierdz wiadomoœæ.", "Zatwierdz", "Zamknij");
				return 0;
			}
			ForeachEx(i, MAX_PLAYERS)
			{
			    if(IsPlayerConnected(i))
			    {
				    if(zalogowany[i] == true)
					{
						if(DaneGracza[i][gSluzba]  == GetPVarInt(playerid, "uidgr"))
						{
							SendClientMessage(i, SZARY, "Wp³ynê³o nowe zg³oszenie dla twojej grupy!");
						}
					}
				}
			}
			//911 zg³oszenie
			new Float:x, Float:y, Float: z;
			GetPlayerPos(playerid, x, y ,z);
			new astr[512];
			format(astr, sizeof(astr), "INSERT INTO `jochym_zgloszenia` (`UID`, `NUMER`, `NICK`, `X`, `Y`, `Z`, `TRESC`, `ODEBRAL`, `ZAKONCZONE`, `UID_GRUPY`) VALUES ('%d', '%d', '%s', '%f', '%f', '%f', '%s', '%d', '%d', '%d')"
			, DaneGracza[playerid][gUID], DaneGracza[playerid][gTelefon], ZmianaNicku(playerid), x, y, z, inputtext, 0, 0, GetPVarInt(playerid, "uidgr"));
			mysql_check();
			mysql_query2(astr);
			mysql_free_result();
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Zg³oszenie zosta³o wys³ane.", "Zamknij", "");
			return 1;
		}
		return 1;
	}
	if(dialogid == DIALOG_ZGLOSZENIE_OPCJE2)
	{
	    if(response)
		{
		    switch(listitem)
        	{
			    case 0:
			    {
			        new id = GetPVarInt(playerid, "Zgloszenie");
					SetPlayerCheckpoint(playerid, Zgloszenie[id][zX], Zgloszenie[id][zY], Zgloszenie[id][zZ], 2.0);
					strdel(tekst_global, 0, 2048);
				    format(tekst_global, sizeof(tekst_global), "~r~Zgloszenie: ~w~%d~n~~n~~r~Zglosil: ~y~%s(%d), ~r~Numer telefonu: ~y~%d~n~~r~MIEJCE ZAZNACZONE NA GPS",
					Zgloszenie[id][zID], Zgloszenie[id][zNICK], Zgloszenie[id][zUID], Zgloszenie[id][zNUMER]);
					TextDrawSetString(OBJ[playerid], tekst_global);
					TextDrawShowForPlayer(playerid, OBJ[playerid]);
					SetTimerEx("NapisUsunsV",5000,0,"d",playerid);
					strdel(zapyt, 0, 1024);
					format(zapyt, sizeof(zapyt),"UPDATE `jochym_zgloszenia` SET `ODEBRAL`='1' WHERE `ID`='%d'", id);
					mysql_check();
					mysql_query2(zapyt);
					DeletePVar(playerid,"Zgloszenie");
					SetPVarInt(playerid, "ZgloszeniePD", 1);
					return 1;
			    }
				case 1:
				{
				    new id = GetPVarInt(playerid, "Zgloszenie");
	                strdel(zapyt, 0, 1024);
					format(zapyt, sizeof(zapyt),"UPDATE `jochym_zgloszenia` SET `ZAKONCZONE`='1' WHERE `ID`='%d'", id);
					mysql_check();
					mysql_query2(zapyt);
					DisablePlayerCheckpoint(playerid);
					SetPVarInt(playerid, "ZgloszeniePD", 0);
					DeletePVar(playerid,"Zgloszenie");
					return 1;
					
				}
			}
		}
	}
	if(dialogid == DIALOG_ZGLOSZENIE_OPCJE)
	{
	    if(response)
		{
		    new id = strval(inputtext);
		    SetPVarInt(playerid, "Zgloszenie", id);
		    new dol[126];
		    strdel(dol, 0, 126);
            format(dol, sizeof(dol), "%s\n»  Odbierz zg³oszenie", dol);
			format(dol, sizeof(dol), "%s\n»  Zakoñcz zg³oszenie", dol);
			dShowPlayerDialog(playerid, DIALOG_ZGLOSZENIE_OPCJE2, DIALOG_STYLE_LIST, "• Zg³oszenia - Opcje", dol, "Wybierz", "Zamknij");
			return 1;
		}
	}
	if( dialogid == DIALOG_ATTACH_EDITREPLACE )
	{
        if(response)
		{
			EditAttachedObject(playerid, GetPVarInt(playerid, "AttachmentIndexSel"));
		}
        else
		{		
			RemovePlayerAttachedObject(playerid, GetPVarInt(playerid, "AttachmentIndexSel"));
			format(zapyt, sizeof(zapyt), "DELETE FROM `jochym_dodadtki` WHERE `UID` = '%d' AND `index` = '%d'", DaneGracza[playerid][gUID], GetPVarInt(playerid, "AttachmentIndexSel"));
			mysql_query(zapyt);
			if(GetPVarInt(playerid, "AttachmentIndexSel") == 7)
			{
				DaneGracza[playerid][gPrzyczepiony1] = 0;
			}
			if(GetPVarInt(playerid, "AttachmentIndexSel") == 8)
			{
				DaneGracza[playerid][gPrzyczepiony2] = 0;
			}
			DeletePVar(playerid, "AttachmentIndexSel");
		}
        return 1;
    }
	if( dialogid == DIALOG_ATTACH_MODEL_SELECTION )
	{
        if(response)
        {
			strdel(tekst_global, 0, 2048);
            if(GetPVarInt(playerid, "AttachmentUsed") == 1) EditAttachedObject(playerid, listitem);
            else
            {
                SetPVarInt(playerid, "AttachmentModelSel", AttachmentObjects[listitem][attachmodel]);
                for(new x;x<sizeof(AttachmentBones);x++)
                {
                    format(tekst_global, sizeof(tekst_global), "%s\n%s", tekst_global, AttachmentBones[x]);
                }
				dShowPlayerDialog(playerid, DIALOG_ATTACH_BONE_SELECTION, DIALOG_STYLE_LIST, "• Informacja:", tekst_global, "Edytuj", "Zamknij");
            }
        }
        else DeletePVar(playerid, "AttachmentIndexSel");
        return 1;
    }
	if( dialogid == DIALOG_ATTACH_BONE_SELECTION )
	{
        if(response)
        {
            SetPlayerAttachedObject(playerid, GetPVarInt(playerid, "AttachmentIndexSel"), GetPVarInt(playerid, "AttachmentModelSel"), listitem+1);
            EditAttachedObject(playerid, GetPVarInt(playerid, "AttachmentIndexSel"));
        }
        DeletePVar(playerid, "AttachmentIndexSel");
        DeletePVar(playerid, "AttachmentModelSel");
        return 1;
    }
	if( dialogid == DIALOG_ATTACH_INDEX_SELECTION )
	{
		if( !response )
	        return 0;

		switch( listitem )
		{
			case 0:
			{
				strdel(tekst_global, 0, 2048);
				if(IsPlayerAttachedObjectSlotUsed(playerid, 7))
				{
					dShowPlayerDialog(playerid, DIALOG_ATTACH_EDITREPLACE, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ten slot jest zajêty.", "Edytuj", "Usuñ");
				}
				else
				{
					for(new x;x<sizeof(AttachmentObjects);x++)
					{
						format(tekst_global, sizeof(tekst_global), "%s\n%s", tekst_global, AttachmentObjects[x][attachname]);
					}
					dShowPlayerDialog(playerid, DIALOG_ATTACH_MODEL_SELECTION, DIALOG_STYLE_LIST, "• Informacja:", tekst_global, "Wybierz", "Zamknij");
					/*static array[1][1];
    				ShowPlayerPreviewModelDialog(playerid, DIALOG_ATTACH_MODEL_SELECTION, DIALOG_STYLE_PREVMODEL, "Dodatki", DodatkiPOSTAC, array, "Wybierz", "Anuluj");*/
				}
				SetPVarInt(playerid, "AttachmentIndexSel", 7);
			}
			case 1:
			{
				strdel(tekst_global, 0, 2048);
				if(IsPlayerAttachedObjectSlotUsed(playerid, 8))
				{
					dShowPlayerDialog(playerid, DIALOG_ATTACH_EDITREPLACE, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ten slot jest zajêty.", "Edytuj", "Usuñ");
				}
				else
				{
					for(new x;x<sizeof(AttachmentObjects);x++)
					{
						format(tekst_global, sizeof(tekst_global), "%s\n%s", tekst_global, AttachmentObjects[x][attachname]);
					}
					dShowPlayerDialog(playerid, DIALOG_ATTACH_MODEL_SELECTION, DIALOG_STYLE_LIST, "• Informacja:", tekst_global, "Wybierz", "Zamknij");
					//ShowPlayerPreviewModelDialog(playerid, DIALOG_ATTACH_MODEL_SELECTION, DIALOG_STYLE_PREVMODEL, "• Dodatki:", DodatkiPOSTAC, array, "Wybierz", "Zamknij");
				}
				SetPVarInt(playerid, "AttachmentIndexSel", 8);
			}
        }
	}
	if( dialogid == DIALOG_SWEEPER )
	{
	    if( !response )
		{
			RemovePlayerFromVehicle(playerid);
			RemovePlayerFromVehicle(playerid);
			Pracuje[playerid] = 0;
		}
		else
		{
			new nr_trasy;
			new rand = random(5);
			if(rand == 0) nr_trasy = 20;
			if(rand == 1) nr_trasy = 60;
			if(rand == 2) nr_trasy = 130;
			if(rand == 3) nr_trasy = 234;
			if(rand == 4) nr_trasy = 255;
			else nr_trasy = 106;
			new vehicleid = GetPlayerVehicleID(playerid);
			new vehc = SprawdzCarUID(vehicleid);
			Pracuje[playerid] = vehicleid;
			DaneGracza[playerid][gWyscig] = nr_trasy;
			DaneGracza[playerid][gCheckopintID] = 0;
			new nextto = SzukajCheckpointu(1, WyscigInfo[DaneGracza[playerid][gWyscig]][StworzylTrase],WyscigInfo[DaneGracza[playerid][gWyscig]][wNazwa]);
			SetPlayerRaceCheckpoint(playerid,0,WyscigInfo[nr_trasy][wX], WyscigInfo[nr_trasy][wY], WyscigInfo[nr_trasy][wZ],WyscigInfo[nextto][wX], WyscigInfo[nextto][wY], WyscigInfo[nextto][wZ],8);
			DaneGracza[playerid][gKoniecWyscigu] = 0;
			PojazdInfo[vehc][pPaliwo] = 100;
			PojazdInfo[vehc][pSilnik] = 1;
			new lights,bonnet,boot,objective,alarm;
			SetVehicleParamsEx(vehicleid,true,lights,alarm,true,bonnet,boot,objective);
			TextDrawHideForPlayer(playerid,Licznik[playerid]);
			//PojazdInfo[vehc][pTimer] = SetTimerEx("MinusPaliwo", 30000, 1, "i", vehicleid);
			DaneGracza[playerid][gSwp] = 60;
		}
	}
	if( dialogid == DIALOG_BUS )
	{
	    if( !response )
	        return 1;
		new
		    uid = strval( inputtext ), czas, koszt,dis;
		dis = GetPlayerDistanceToPoint( playerid, Przystanek[ uid ][ busPozX ],
		Przystanek[ uid ][ busPozY ], Przystanek[ uid ][ busPozZ ] );
		if(DaneGracza[playerid][gCZAS_ONLINE] < 3 * 60 * 60)
		{
			koszt = 0;
		}
		else
		{
			koszt 	= dis/17000;
		}
		czas    = dis/12000;
		new taksiarz = 0;
		ForeachEx(i, MAX_PLAYERS)
		{
			if(IsPlayerConnected(i))
			{
				if(zalogowany[i] == true)
				{
					if(DaneGracza[i][gSluzba] != 0 && GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_TAXI && !GraczJestAFK(i))
					{
						taksiarz = 1;
						break;
					}
				}
			}
		}
		if(taksiarz == 0 && koszt > 20)
		{
			koszt = koszt/4;
		}
		SetPVarInt( playerid, "BusKoszt", koszt );
		SetPVarInt( playerid, "BusCzas", czas );
		SetPVarInt( playerid, "BusDo", uid );
		SetPVarInt( playerid, "BusPrzystanek", GetPlayerBusStop( playerid ) );
		strdel(tekst_global, 0, 2048);
		format( tekst_global, sizeof( tekst_global ), "Trasa: %s » %s\n\
		Czas: %d min. %d s\n\
		Koszt: %d$ (do 3h darmowy przejazd)", Przystanek[ GetPlayerBusStop( playerid ) ][ busText ],
		Przystanek[ uid ][ busText ], czas / 60, czas % 60, koszt );
		dShowPlayerDialog( playerid, DIALOG_BUS_BILET, DIALOG_STYLE_MSGBOX, "• Bilet :",
		tekst_global, "Kup", "Zamknij" );

	}

	if( dialogid == DIALOG_BUS_BILET )
	{
	    if( !response )
	    {
	        DeletePVar( playerid, "BusKoszt" );
	        DeletePVar( playerid, "BusCzas" );
	        DeletePVar( playerid, "BusPrzystanek" );
	        DeletePVar( playerid, "BusDo" );
	        return 1;
		}

		if( GetPVarInt( playerid, "BusKoszt" ) > GetPlayerMoney( playerid ) )
		{
		    DeletePVar( playerid, "BusKoszt" );
	        DeletePVar( playerid, "BusCzas" );
	        DeletePVar( playerid, "BusDo" );
	        DeletePVar( playerid, "BusPrzystanek" );
	        return dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:","Nie posiadasz wystarczaj¹cej iloœci pieniêdzy na zakup biletu.", "Zamknij", "" );
		}

		SetTimerEx( "BusStart", 33000, 0, "i", playerid );
		GameTextForPlayer( playerid, "~y~~h~autobus pojawi sie~n~~y~~h~za okolo ~b~~h~pol minuty.",3000, 5);

	}
	if( dialogid == DIALOG_NOWYBUS_CZ1 )
	{
		if( !response )
		    return 1;

		if( !strlen( inputtext ) || strlen( inputtext ) > 32 )
		    return dShowPlayerDialog( playerid, DIALOG_NOWYBUS_CZ1, DIALOG_STYLE_INPUT, "• Przystanek :",
		            "Zbyt krótka lub zbyt d³uga nazwa przystanku.\n\
		            Wpisz poprawn¹ nazwê.", "Dalej", "Zamknij" );
		new Float:x, Float:y, Float:z, Float:a;
		GetPlayerPos( playerid, x, y, z );
		GetPlayerFacingAngle( playerid, a );
		new id = StworzPrzystanek( inputtext, x, y, z, a );
		strdel(tekst_global, 0, 2048);
		format( tekst_global, sizeof( tekst_global ), "Utworzono przystanek %d. %s",
		id, Przystanek[ id ][ busText ] );
		dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Przystanek :",tekst_global, "Zamknij", "" );
	}
	if( dialogid == DIALOG_BUS_EDIT )
	{
	    if( !response )
	        return DeletePVar( playerid, "BusPoz" );

		switch( listitem )
		{
		    case 0, 1, 2, 3, 4, 5:
		        return cmd_abus( playerid, "edytuj" );

			case 6:
			    return 	dShowPlayerDialog( playerid, DIALOG_BUS_EDITZAPISZ, DIALOG_STYLE_INPUT, "• Przystanek :",
			            "Wpisz now¹ nazwê przystanku.", "Dalej", "Zamknij" );

			case 7:
				return dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Przystanek :","Ustaw siê w nowej pozycji przystanku i wpisz /abus.", "Zamknij", "" );

			case 8:
			{
			    UsunPrzystanek( GetPVarInt( playerid, "BusPoz" ) );
			    dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Przystanek :","Usuniêto przystanek.", "Zamknij", "" );
			    DeletePVar( playerid, "BusPoz" );
			}
		}
	}
	if( dialogid == DIALOG_BUS_EDITZAPISZ )
	{
	    if( !response )
	        return DeletePVar( playerid, "BusPoz" );

		if( !strlen( inputtext ) || strlen( inputtext ) > 32 )
		    return 	dShowPlayerDialog( playerid, DIALOG_BUS_EDITZAPISZ, DIALOG_STYLE_INPUT, "• Przystanek :",
			        "Wpisana przez Ciebie nazwa jest niepoprawna.\n\
					Spróbuj ponownie, nie przekraczaj¹c limitu 32 znaków.", "Dalej", "Zamknij" );

		new
		    id = GetPVarInt( playerid, "BusPoz" )
		;
		format( Przystanek[ id ][ busText ], 32, "%s", inputtext );
		ZapiszPrzystanek( id );
		strdel(tekst_global, 0, 2048);
		format( tekst_global, 100, "Przystanek %d. %s\n\
		Aby kupiæ bilet, kliknij Y lub wpisz /bus",
		id, Przystanek[ id ][ busText ] );

		UpdateDynamic3DTextLabelText( Przystanek[ id ][ busTag ], SZARY, tekst_global );

		DeletePVar( playerid, "BusPoz" );
	}
	if(dialogid == DIALOG_PRZEDZMIOTY)
	{
	    if(response)
		{
		    UzywanieItemu(playerid, strval(inputtext));
		    SetPVarInt(playerid, "UzytyItem", strval(inputtext));
		}
		else
		{
			SetPVarInt(playerid, "UzytyItem", strval(inputtext));
 	        dShowPlayerDialog(playerid, DIALOG_PRZEDZMIOT_OPCJE, DIALOG_STYLE_LIST, "• Przedmioty » Menu przedmiotu :", "» Od³ó¿ na ziemiê\n» Sprzedaj przedmiot graczu\n» Daj przedmiot graczu\n» W³ó¿ do szafy\n» W³ó¿ do torby\n» W³ó¿ do magazynu\n» W³ó¿ do craftingu\n» W³ó¿ do grilla\n» Schowaj do baga¿nika", "U¿yj", "Wiêcej");
		}
		return 1;
	}
	if(dialogid == DIALOG_GRIL)
	{
	    if( !response )
	        return 1;
		SetPVarInt( playerid, "UzytyItemGril", strval(inputtext));
 	    dShowPlayerDialog(playerid, DIALOG_GRIL_OPCJE, DIALOG_STYLE_LIST, "• Przedmiotyt na grilu» {FFFFFF}Opcje :", "»  Wyci¹gnij sk³adnik\n»  Griluj sk³adniki", "Wybierz", "Zamknij");
		return 1;
	}
	if(dialogid == DIALOG_CRAFT)
	{
	    if( !response )
	        return 1;
		SetPVarInt( playerid, "UzytyItemCraft", strval(inputtext));
 	    dShowPlayerDialog(playerid, DIALOG_CRAFT_OPCJE, DIALOG_STYLE_LIST, "• Przedmioty na stole» {FFFFFF}Opcje :", "»  Wyci¹gnij sk³adnik\n»  Zmieszaj sk³adniki", "Wybierz", "Zamknij");
		return 1;
	}
	if( dialogid == DIALOG_CRAFT_OPCJE )
	{
		new uid = GetPVarInt(playerid, "UzytyItemCraft");
		if( !response )
	        return 1;
		switch(listitem)
		{
		    case 0:
			{
				PrzedmiotInfo[uid][pTypWlas] = TYP_WLASCICIEL;
				PrzedmiotInfo[uid][pOwner] = DaneGracza[playerid][gUID];
				ZapiszPrzedmiot(uid);
				GameTextForPlayer(playerid, "~y~Przedmiot zostal ~w~wyciagniety z craftingu.", 3000, 5);
				new akcja[126];
				format(akcja,sizeof(akcja),"*wyci¹ga przedmiot z craftingu*");
				SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
				new akcja2[126];
				format(akcja2,sizeof(akcja2),"wyciaga przedmiot z craftingu");
				TextDrawSetString(AkcjaTD[playerid], akcja2);
				TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
				CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
			}
			case 1:
			{
				new wcraft[64], ip= 0;
				ForeachEx(i, MAX_PRZEDMIOT)
				{
					if(PrzedmiotInfo[i][pOwner] == GetPVarInt( playerid, "UIDCRAFT") && PrzedmiotInfo[i][pTypWlas] == TYP_CRAFT && PrzedmiotInfo[i][pUID] != 0)
					{
						wcraft[ip] = i;
						ip++;
						//if(ip > 2) break;
					}
				}
				if(ip < 3)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aby u¿yæ craftingu na stole musz¹ siê znajdowaæ minimum 3 sk³adniki.", "Zamknij", "");
					return 0;
				}
				if(ip > 3)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aby u¿yæ craftingu na stole musz¹ siê znajdowaæ maximum 3 sk³adniki.", "Zamknij", "");
					return 0;
				}
				new a,b,c;
				a = wcraft[0];
				b = wcraft[1];
				c = wcraft[2];
				if(PrzedmiotInfo[a][pTyp] == PrzedmiotInfo[b][pTyp] && PrzedmiotInfo[a][pTyp] == PrzedmiotInfo[c][pTyp] && PrzedmiotInfo[b][pTyp] == PrzedmiotInfo[c][pTyp])
				{
					if(PrzedmiotInfo[a][pWar1] == PrzedmiotInfo[b][pWar1] && PrzedmiotInfo[a][pWar1] == PrzedmiotInfo[c][pWar1] && PrzedmiotInfo[b][pWar1] == PrzedmiotInfo[c][pWar1])
					{
						if(PrzedmiotInfo[wcraft[0]][pTyp] != P_SKLADNIK_MARYCHA && PrzedmiotInfo[wcraft[0]][pTyp] != P_SKLADNIK_AMFA &&
						PrzedmiotInfo[wcraft[0]][pTyp] != P_SKLADNIK_KOKA && PrzedmiotInfo[wcraft[0]][pTyp] != P_SKLADNIK_EXTASA && PrzedmiotInfo[wcraft[0]][pTyp] != P_SKLADNIK_LSD &&
						PrzedmiotInfo[wcraft[0]][pTyp] != P_SKLADNIK_GRZYBY && PrzedmiotInfo[wcraft[0]][pTyp] != P_SKLADNIK_HERA && PrzedmiotInfo[wcraft[0]][pTyp] != P_SKLADNIK_MEFEDRON)
						{
							ForeachEx(i, MAX_PRZEDMIOT)
							{
								if(PrzedmiotInfo[i][pOwner] == GetPVarInt( playerid, "UIDCRAFT") && PrzedmiotInfo[i][pTypWlas] == TYP_CRAFT && PrzedmiotInfo[i][pUID] != 0)
								{
									UsunPrzedmiot(i);
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Mieszanie sk³adników zakoñczone niepowodzeniem, sk³adniki nie pasuj¹ do siebie.", "Zamknij", "");
							return 0;
						}
						new nazwan[256], typ;
						if(PrzedmiotInfo[wcraft[0]][pTyp] == P_SKLADNIK_MARYCHA)
						{
							format(nazwan, sizeof(nazwan), "Marihuana");
							typ = P_SKLADNIK_MARYCHA;
						}
						if(PrzedmiotInfo[wcraft[0]][pTyp] == P_SKLADNIK_AMFA)
						{
							format(nazwan, sizeof(nazwan), "Amfetamina");
							typ = P_SKLADNIK_AMFA;
						}
						if(PrzedmiotInfo[wcraft[0]][pTyp] == P_SKLADNIK_KOKA)
						{
							format(nazwan, sizeof(nazwan), "Kokaina");
							typ = P_SKLADNIK_KOKA;
						}
						if(PrzedmiotInfo[wcraft[0]][pTyp] == P_SKLADNIK_EXTASA)
						{
							format(nazwan, sizeof(nazwan), "Extasa");
							typ = P_SKLADNIK_EXTASA;
						}
						if(PrzedmiotInfo[wcraft[0]][pTyp] == P_SKLADNIK_LSD)
						{
							format(nazwan, sizeof(nazwan), "LSD");
							typ = P_SKLADNIK_LSD;
						}
						if(PrzedmiotInfo[wcraft[0]][pTyp] == P_SKLADNIK_GRZYBY)
						{
							format(nazwan, sizeof(nazwan), "Grzybki");
							typ = P_SKLADNIK_GRZYBY;
						}
						if(PrzedmiotInfo[wcraft[0]][pTyp] == P_SKLADNIK_HERA)
						{
							format(nazwan, sizeof(nazwan), "Heroina");
							typ = P_SKLADNIK_HERA;
						}
						if(PrzedmiotInfo[wcraft[0]][pTyp] == P_SKLADNIK_MEFEDRON)
						{
							format(nazwan, sizeof(nazwan), "Mefedron");
							typ = P_SKLADNIK_MEFEDRON;
						}
						ForeachEx(i, MAX_PRZEDMIOT)
						{
							if(PrzedmiotInfo[i][pOwner] == GetPVarInt( playerid, "UIDCRAFT") && PrzedmiotInfo[i][pTypWlas] == TYP_CRAFT && PrzedmiotInfo[i][pUID] != 0)
							{
								UsunPrzedmiot(i);
							}
						}
						DodajPrzedmiot(GetPVarInt( playerid, "UIDCRAFT"), TYP_CRAFT, P_NARKOTYKI, typ, 1, nazwan, -1, 0, -1, 0, 0, 0, 0, "");
						Przedmioty(playerid, playerid, DIALOG_CRAFT, "• Przedmioty na stole:", TYP_CRAFT, GetPVarInt( playerid, "UIDCRAFT"));
						GameTextForPlayer(playerid, "~y~Skladniki zostaly ~w~zmieszane.", 3000, 5);
					}
					else
					{
						ForeachEx(i, MAX_PRZEDMIOT)
						{
							if(PrzedmiotInfo[i][pOwner] == GetPVarInt( playerid, "UIDCRAFT") && PrzedmiotInfo[i][pTypWlas] == TYP_CRAFT && PrzedmiotInfo[i][pUID] != 0)
							{
								UsunPrzedmiot(i);
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Mieszanie sk³adników zakoñczone niepowodzeniem, sk³adniki nie pasuj¹ do siebie.", "Zamknij", "");
					}
				}
				else
				{
					ForeachEx(i, MAX_PRZEDMIOT)
					{
						if(PrzedmiotInfo[i][pOwner] == GetPVarInt( playerid, "UIDCRAFT") && PrzedmiotInfo[i][pTypWlas] == TYP_CRAFT && PrzedmiotInfo[i][pUID] != 0)
						{
							UsunPrzedmiot(i);
						}
					}
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Mieszanie sk³adników zakoñczone niepowodzeniem, sk³adniki nie pasuj¹ do siebie.", "Zamknij", "");
				}
			}
		}
	}
	if( dialogid == DIALOG_GRIL_OPCJE )
	{
		new uid = GetPVarInt(playerid, "UzytyItemGril");
		if( !response )
	        return 1;
		switch(listitem)
		{
		    case 0:
			{
				PrzedmiotInfo[uid][pTypWlas] = TYP_WLASCICIEL;
				PrzedmiotInfo[uid][pOwner] = DaneGracza[playerid][gUID];
				ZapiszPrzedmiot(uid);
				GameTextForPlayer(playerid, "~y~Przedmiot zostal ~w~wyciagniety z grila.", 3000, 5);
			}
			case 1:
			{
				new wcraft[64], ip= 0;
				ForeachEx(i, MAX_PRZEDMIOT)
				{
					if(PrzedmiotInfo[i][pOwner] == GetPVarInt( playerid, "UIDGRIL") && PrzedmiotInfo[i][pTypWlas] == TYP_GRIL && PrzedmiotInfo[i][pUID] != 0)
					{
						wcraft[ip] = i;
						ip++;
						//if(ip > 2) break;
					}
				}
				if(ip < 3)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aby u¿yæ grila musz¹ siê w nim znajdowaæ minimum 3 sk³adniki.", "Zamknij", "");
					return 0;
				}
				if(ip > 3)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aby u¿yæ grila musz¹ siê w nim znajdowaæ maximum 3 sk³adniki.", "Zamknij", "");
					return 0;
				}
				new a,b,c;
				a = wcraft[0];
				b = wcraft[1];
				c = wcraft[2];
				if(PrzedmiotInfo[a][pTyp] == PrzedmiotInfo[b][pTyp] && PrzedmiotInfo[a][pTyp] == PrzedmiotInfo[c][pTyp] && PrzedmiotInfo[b][pTyp] == PrzedmiotInfo[c][pTyp])
				{
					if(PrzedmiotInfo[a][pWar1] != PrzedmiotInfo[b][pWar1] && PrzedmiotInfo[a][pWar1] != PrzedmiotInfo[c][pWar1] && PrzedmiotInfo[b][pWar1] != PrzedmiotInfo[c][pWar1])
					{
						if(PrzedmiotInfo[wcraft[0]][pTyp] != P_SKLADNIK_KIELBA && PrzedmiotInfo[wcraft[0]][pTyp] != P_SKLADNIK_SASZLYK &&
						PrzedmiotInfo[wcraft[0]][pTyp] != P_SKLADNIK_KARKOWKA && PrzedmiotInfo[wcraft[0]][pTyp] != P_SKLADNIK_KURCZAK && PrzedmiotInfo[wcraft[0]][pTyp] != P_SKLADNIK_TOST &&
						PrzedmiotInfo[wcraft[0]][pTyp] != P_SKLADNIK_BOCZEK && PrzedmiotInfo[wcraft[0]][pTyp] != P_SKLADNIK_STEK && PrzedmiotInfo[wcraft[0]][pTyp] != P_SKLADNIK_ZIEMNIAKI)
						{
							ForeachEx(i, MAX_PRZEDMIOT)
							{
								if(PrzedmiotInfo[i][pOwner] == GetPVarInt( playerid, "UIDGRIL") && PrzedmiotInfo[i][pTypWlas] == TYP_GRIL && PrzedmiotInfo[i][pUID] != 0)
								{
									UsunPrzedmiot(i);
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Grilowanie sk³adników zakoñczone niepowodzeniem, sk³adniki nie pasuj¹ do siebie.", "Zamknij", "");
							return 0;
						}
						new nazwan[256], typ;
						if(PrzedmiotInfo[wcraft[0]][pTyp] == P_SKLADNIK_KIELBA)
						{
							format(nazwan, sizeof(nazwan), "Kielbasa z grila");
							typ = P_SKLADNIK_KIELBA;
						}
						if(PrzedmiotInfo[wcraft[0]][pTyp] == P_SKLADNIK_SASZLYK)
						{
							format(nazwan, sizeof(nazwan), "Saszlyk z grila");
							typ = P_SKLADNIK_SASZLYK;
						}
						if(PrzedmiotInfo[wcraft[0]][pTyp] == P_SKLADNIK_KARKOWKA)
						{
							format(nazwan, sizeof(nazwan), "Karkowka z grila");
							typ = P_SKLADNIK_KARKOWKA;
						}
						if(PrzedmiotInfo[wcraft[0]][pTyp] == P_SKLADNIK_KURCZAK)
						{
							format(nazwan, sizeof(nazwan), "Kurczak z grila");
							typ = P_SKLADNIK_KURCZAK;
						}
						if(PrzedmiotInfo[wcraft[0]][pTyp] == P_SKLADNIK_TOST)
						{
							format(nazwan, sizeof(nazwan), "Tost z grila");
							typ = P_SKLADNIK_TOST;
						}
						if(PrzedmiotInfo[wcraft[0]][pTyp] == P_SKLADNIK_BOCZEK)
						{
							format(nazwan, sizeof(nazwan), "Boczek z grila");
							typ = P_SKLADNIK_BOCZEK;
						}
						if(PrzedmiotInfo[wcraft[0]][pTyp] == P_SKLADNIK_STEK)
						{
							format(nazwan, sizeof(nazwan), "Stek z grila");
							typ = P_SKLADNIK_STEK;
						}
						if(PrzedmiotInfo[wcraft[0]][pTyp] == P_SKLADNIK_ZIEMNIAKI)
						{
							format(nazwan, sizeof(nazwan), "Ziemniaki z grila");
							typ = P_SKLADNIK_ZIEMNIAKI;
						}
						ForeachEx(i, MAX_PRZEDMIOT)
						{
							if(PrzedmiotInfo[i][pOwner] == GetPVarInt( playerid, "UIDGRIL") && PrzedmiotInfo[i][pTypWlas] == TYP_GRIL && PrzedmiotInfo[i][pUID] != 0)
							{
								UsunPrzedmiot(i);
							}
						}
						DodajPrzedmiot(GetPVarInt( playerid, "UIDGRIL"), TYP_GRIL, P_ZARCIE, typ, 10, nazwan, -1, 0, -1, 0, 0, 0, 0, "");
						Przedmioty(playerid, playerid, DIALOG_GRIL, "• Przedmioty z grila:", TYP_GRIL, GetPVarInt( playerid, "UIDGRIL"));
						GameTextForPlayer(playerid, "~y~Skladniki zostaly ~w~zgrilowane.", 3000, 5);
					}
					else
					{
						ForeachEx(i, MAX_PRZEDMIOT)
						{
							if(PrzedmiotInfo[i][pOwner] == GetPVarInt( playerid, "UIDGRIL") && PrzedmiotInfo[i][pTypWlas] == TYP_GRIL && PrzedmiotInfo[i][pUID] != 0)
							{
								UsunPrzedmiot(i);
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Grilowanie sk³adników zakoñczone niepowodzeniem, sk³adniki nie pasuj¹ do siebie.", "Zamknij", "");
					}
				}
				else
				{
					ForeachEx(i, MAX_PRZEDMIOT)
					{
						if(PrzedmiotInfo[i][pOwner] == GetPVarInt( playerid, "UIDCRAFT") && PrzedmiotInfo[i][pTypWlas] == TYP_CRAFT && PrzedmiotInfo[i][pUID] != 0)
						{
							UsunPrzedmiot(i);
						}
					}
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Mieszanie sk³adników zakoñczone niepowodzeniem, sk³adniki nie pasuj¹ do siebie.", "Zamknij", "");
				}
			}
		}
	}
	if( dialogid == DIALOG_PRZEDZMIOT_OPCJE )
	{
	    new uid = GetPVarInt(playerid, "UzytyItem");
	    if( !response )
	        return 1;
		switch(listitem)
		{
			case 0:
			{
			    if(PrzedmiotInfo[uid][pTyp] == P_PACZKA)//od³ó¿ na ziemiê
			    {
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ten przedmiot mo¿na tylko i wy³¹cznie w³o¿yæ do magazynu swojego biznesu.\nPamiêtaj jeœli nie w³o¿ysz go do swojego biznesu przez najbli¿sze dwa dni\nTen przedmiot zostanie skasowany.", "Zamknij", "");
					return 0;
				}
				if(PrzedmiotInfo[uid][pUzywany] != 0)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz tego zrobiæ poniewa¿ przedmiot jest u¿ywany.", "Zamknij", "");
					return 0;
				}
				if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz tego zrobiæ, gdy kogoœ specujesz!", "Zamknij", "");
					return 0;
				}
			    OdkladanieItemu(playerid, GetPVarInt(playerid, "UzytyItem"));
		        return 1;
			}
			case 1://sprzedaj przedmiot graczu
			{
				SetPVarInt(playerid, "Wybrany", GetPVarInt(playerid, "UzytyItem"));
				if(PrzedmiotInfo[uid][pUzywany] != 0)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz tego zrobiæ poniewa¿ przedmiot jest u¿ywany.", "Zamknij", "");
					return 0;
				}
				if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz tego zrobiæ, gdy kogoœ specujesz!", "Zamknij", "");
					return 0;
				}
			    if(response)
				{
					strdel(tekst_global, 0, 2048);
					new found = 0;
					ForeachEx(i, MAX_PLAYERS)
					{
						if(IsPlayerConnected(i))
						{
							if(zalogowany[i] == true)
							{
								if(DaneGracza[i][gUID] && PlayerObokPlayera(playerid, i, 5) && i != playerid && GetPlayerState(i) != PLAYER_STATE_SPECTATING && Nieznajomy[i] == 0)
								{
									format(tekst_global, sizeof(tekst_global), "%s\n%d\t%s", tekst_global, i, ZmianaNicku(i));
									found++;
								}
							}
						}
					}
					if(found != 0) dShowPlayerDialog(playerid, DIALOG_OFER_GR_ITEM, DIALOG_STYLE_LIST, "• Informacja:", tekst_global, "Zatwierdz", "Zamknij");
					else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nikt obok Ciebie nie stoi.", "Zamknij", "");
				}	
				return 1;
			}
			case 2://daj przedmiot graczu
			{
			    SetPVarInt(playerid, "Wybrany", GetPVarInt(playerid, "UzytyItem"));
				if(PrzedmiotInfo[uid][pUzywany] != 0)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz tego zrobiæ poniewa¿ przedmiot jest u¿ywany.", "Zamknij", "");
					return 0;
				}
				if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz tego zrobiæ, gdy kogoœ specujesz!", "Zamknij", "");
					return 0;
				}
			    if(response)
				{
					strdel(tekst_global, 0, 2048);
					new found = 0;
					ForeachEx(i, MAX_PLAYERS)
					{
						if(IsPlayerConnected(i))
						{
							if(zalogowany[i] == true)
							{
								if(DaneGracza[i][gUID] && PlayerObokPlayera(playerid, i, 5) && i != playerid && GetPlayerState(i) != PLAYER_STATE_SPECTATING && Nieznajomy[i] == 0)
								{
									format(tekst_global, sizeof(tekst_global), "%s\n%d\t%s", tekst_global, i, ZmianaNicku(i));
									found++;
								}
							}
						}
					}
					if(found != 0) dShowPlayerDialog(playerid, DIALOG_OFER_GR_ITEM_FREE, DIALOG_STYLE_LIST, "• Informacja:", tekst_global, "Zatwierdz", "Zamknij");
					else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nikt obok Ciebie nie stoi.", "Zamknij", "");
				}
				return 1;
			}
			case 3://w³ó¿ do szafy
			{
				if(PrzedmiotInfo[uid][pUzywany] != 0)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz w³o¿yæ tego przedmiotu do szafy poniewa¿ jest u¿ywany.", "Zamknij", "");
					return 0;
				}
			    if(PrzedmiotInfo[uid][pTyp] == P_PACZKA)
			    {
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ten przedmiot mo¿na tylko i wy³¹cznie w³o¿yæ do magazynu swojego biznesu.\nPamiêtaj jeœli nie w³o¿ysz go do swojego biznesu przez najbli¿sze dwa dni\nTen przedmiot zostanie skasowany.", "Zamknij", "");
					return 0;
				}
				new vw = GetPlayerVirtualWorld(playerid);
				if(vw == 0)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie znajdujesz siê w budynku.", "Zamknij", "");
					return 0;
				}
				if(BudynekInfo[vw][nSzafa] == -1)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "W tym budynku nie ma szafy.", "Zamknij", "");
					return 0;
				}
				if(DaneGracza[playerid][gBW] > 0)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz u¿ywaæ tej komendy, gdy jesteœ nieprzytomny.", "Zamknij", "");
					return 0;
				}
				if(!ZarzadzanieSzafa(vw, playerid))
				{
					GameTextForPlayer(playerid, "~r~Brak uprawnien.", 3000, 5);
					return 0;
				}
				if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz tego zrobiæ, gdy kogoœ specujesz!", "Zamknij", "");
					return 0;
				}
				PrzedmiotInfo[uid][pTypWlas] = TYP_SZAFA;
				PrzedmiotInfo[uid][pOwner] = vw;
				ZapiszPrzedmiot(uid);
				DeletePVar(playerid, "UzytyItem");
				GameTextForPlayer(playerid, "~y~Przedmiot zostal ~w~wlozony do szafy.", 3000, 5);
				format(tekst_global, sizeof(tekst_global), "* %s odk³ada coœ w szafie.", ZmianaNicku(playerid));
				SendWrappedMessageToPlayerRange(playerid, FIOLETOWY, tekst_global, 10);
				ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 0, 0, 0, 0, 0);
				new akcja[126];
				format(akcja,sizeof(akcja),"*odk³ada coœ w szafie*");
				SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
				new akcja2[126];
				format(akcja2,sizeof(akcja2),"odklada cos w szafie");
				TextDrawSetString(AkcjaTD[playerid], akcja2);
				TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
				CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
				return 1;
			}
			case 4://w³ó¿ do torby
			{
			    new found = 0;
				if(PrzedmiotInfo[GetPVarInt(playerid, "UzytyItem")][pTyp] == P_TORBA)
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz w³o¿yæ torby do torby.", "Zamknij", "");
				    return 0;
				}
				if(PrzedmiotInfo[GetPVarInt(playerid, "UzytyItem")][pUzywany] != 0)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz w³o¿yæ tego przedmiotu do torby poniewa¿ jest u¿ywany.", "Zamknij", "");
					return 0;
				}
				if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz tego zrobiæ, gdy kogoœ specujesz!", "Zamknij", "");
					return 0;
				}
				strdel(tekst_global, 0, 2048);
				ForeachEx(i, MAX_PRZEDMIOT)
				{
					if(PrzedmiotInfo[i][pOwner] == DaneGracza[playerid][gUID] && PrzedmiotInfo[i][pTyp] == P_TORBA && PrzedmiotInfo[i][pTypWlas] == TYP_WLASCICIEL)
					{
						format(tekst_global, sizeof(tekst_global), "%s\n%d\t%s", tekst_global, PrzedmiotInfo[i][pUID], PrzedmiotInfo[i][pNazwa]);
						found++;
					}
				}
				if(found != 0) dShowPlayerDialog(playerid, DIALOG_TORBA_WLOZ, DIALOG_STYLE_LIST, "• Torby :", tekst_global, "Wybierz", "Zamknij");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Torby :", "Nie posiadasz przy sobie torby.", "Zamknij", "");
				return 1;
			}
			case 5://w³ó¿ do magazynu
			{
			    new vw = GetPlayerVirtualWorld(playerid);
			    new uids = GetPVarInt(playerid, "uiddrzwi");
			    if(PrzedmiotInfo[uid][pUzywany] != 0)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz w³o¿yæ tego przedmiotu do magazynu poniewa¿ jest u¿ywany.", "Zamknij", "");
					return 0;
				}
				if(vw == 0)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie znajdujesz siê w budynku.", "Zamknij", "");
					return 0;
				}
    			if(DaneGracza[playerid][gSluzba] == 0)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie jestes na s³u¿bie, wejdŸ na s³u¿bê do której nale¿y budynek.", "Zamknij", "");
					return 0;
				}
				if(BudynekInfo[uids][nWlascicielD] != DaneGracza[playerid][gSluzba])
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ten budynek nie nale¿y do grupy w której jestes aktualnie na s³u¿bie", "Zamknij", "");
					return 0;
				}
				if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz tego zrobiæ, gdy kogoœ specujesz!", "Zamknij", "");
					return 0;
				}
                DodajDoMagazynu(DaneGracza[playerid][gSluzba], PrzedmiotInfo[uid][pTyp], PrzedmiotInfo[uid][pWar1], PrzedmiotInfo[uid][pWar2], PrzedmiotInfo[uid][pWar4], PrzedmiotInfo[uid][pNazwa], PrzedmiotInfo[uid][pCenas], 1);
				UsunPrzedmiot(uid);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Przedmiot pomyœlnie od³o¿ony", "Zamknij", "");
			    return 1;
			}
			case 6:
			{
				if(PrzedmiotInfo[GetPVarInt(playerid, "UzytyItem")][pTyp] == P_PACZKA)
			    {
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "{88b711}» {FFFFFF}"VER" {88b711}» {FFFFFF}Informacja {88b711}:", "{DEDEDE}Ten przedmiot mo¿na tylko i wy³¹cznie w³o¿yæ do {88b711}magazynu{DEDEDE} swojego biznesu.\nPamiêtaj jeœli nie w³o¿ysz go do swojego biznesu przez najbli¿sze {88b711}dwa{DEDEDE} dni\nTen {88b711}przedmiot{DEDEDE} zostanie skasowany.", "Zamknij", "");
					return 0;
				}
				if(PrzedmiotInfo[GetPVarInt(playerid, "UzytyItem")][pUzywany] != 0)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "{88b711}» {FFFFFF}"VER" {88b711}» {FFFFFF}Informacja {88b711}:", "{DEDEDE}Nie mo¿esz w³o¿yæ tego {88b711}przedmiotu{DEDEDE} do craftingu poniewa¿ jest u¿ywany.", "Zamknij", "");
					return 0;
				}
				new find = 0;
				new uid_budynku = GetPlayerVirtualWorld(playerid);
				ForeachEx(h, BudynekInfo[uid_budynku][nStworzoneObiekty])
				{
					if(Dystans(1.5, playerid, ObiektInfo[BudynekInfo[uid_budynku][nObiekty][h]][objPozX],ObiektInfo[BudynekInfo[uid_budynku][nObiekty][h]][objPozY],ObiektInfo[BudynekInfo[uid_budynku][nObiekty][h]][objPozZ]) && GetPlayerVirtualWorld(playerid) == ObiektInfo[BudynekInfo[uid_budynku][nObiekty][h]][objvWorld] && ObiektInfo[BudynekInfo[uid_budynku][nObiekty][h]][gZajety] == 0 && ObiektInfo[BudynekInfo[uid_budynku][nObiekty][h]][objModel] == 2419)
					{
						find = BudynekInfo[uid_budynku][nObiekty][h];
						break;
					}
				}
				if(ObiektInfo[find][objModel] == 2419)
				{
					new uz = GetPVarInt(playerid, "UzytyItem");
					PrzedmiotInfo[uz][pTypWlas] = TYP_CRAFT;
					PrzedmiotInfo[uz][pOwner] = find;
					ZapiszPrzedmiot(uz);
					GameTextForPlayer(playerid, "~y~Przedmiot zostal ~w~wlozony do craftingu.", 3000, 5);
					DeletePVar(playerid, "UzytyItem");
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "{88b711}» {FFFFFF}"VER" {88b711}» {FFFFFF}Informacja{88b711}:", "{DEDEDE}Jesteœ zbyt daleko od {88b711}modelu{DEDEDE} sto³u do craftingu (obiekt id: {88b711}2419{DEDEDE}).", "Zamknij", "");
				}
				return 1;
			}
			case 7:
			{
				if(PrzedmiotInfo[GetPVarInt(playerid, "UzytyItem")][pTyp] == P_PACZKA)
			    {
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "{88b711}» {FFFFFF}"VER" {88b711}» {FFFFFF}Informacja {88b711}:", "{DEDEDE}Ten przedmiot mo¿na tylko i wy³¹cznie w³o¿yæ do {88b711}magazynu{DEDEDE} swojego biznesu.\nPamiêtaj jeœli nie w³o¿ysz go do swojego biznesu przez najbli¿sze {88b711}dwa{DEDEDE} dni\nTen {88b711}przedmiot{DEDEDE} zostanie skasowany.", "Zamknij", "");
					return 0;
				}
				if(PrzedmiotInfo[GetPVarInt(playerid, "UzytyItem")][pUzywany] != 0)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "{88b711}» {FFFFFF}"VER" {88b711}» {FFFFFF}Informacja {88b711}:", "{DEDEDE}Nie mo¿esz w³o¿yæ tego {88b711}przedmiotu{DEDEDE} do craftingu poniewa¿ jest u¿ywany.", "Zamknij", "");
					return 0;
				}
				new find = 0;
				find = PrzyObiekcie(playerid, 1481, 5);
				if(find != 0)
				{
					new uz = GetPVarInt(playerid, "UzytyItem");
					PrzedmiotInfo[uz][pTypWlas] = TYP_GRIL;
					PrzedmiotInfo[uz][pOwner] = find;
					ZapiszPrzedmiot(uz);
					GameTextForPlayer(playerid, "~y~Przedmiot zostal ~w~wlozony do grila.", 3000, 5);
					DeletePVar(playerid, "UzytyItem");
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "{88b711}» {FFFFFF}"VER" {88b711}» {FFFFFF}Informacja{88b711}:", "{DEDEDE}Jesteœ zbyt daleko od {88b711}modelu{DEDEDE} grila (obiekt id: {88b711}1481{DEDEDE}).", "Zamknij", "");
				}
				return 1;
			}
			case 8:
			{
			    if(PrzedmiotInfo[uid][pUzywany] != 0)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz w³o¿yæ tego przedmiotu do baga¿nika poniewa¿ jest u¿ywany.", "Zamknij", "");
					return 0;
				}
			    if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz tego zrobiæ, gdy kogoœ specujesz!", "Zamknij", "");
					return 0;
				}
		       	new vec = GetClosestVehicle(playerid, 15);
			    if(IsPlayerInAnyVehicle(playerid))
			    {
			        vec = GetPlayerVehicleID(playerid);
			    }
			    new uidt = SprawdzCarUID(vec);
			    if(vec == INVALID_VEHICLE_ID)
			    {
			        GameTextForPlayer(playerid, "~r~Nie stoisz przy zadnym pojezdzie!", 3000, 5);
				    return 1;
				}
				if(Rowery(vec))
				{
				    GameTextForPlayer(playerid, "~r~Ten pojazd nie posiada bagaznika!", 3000, 5);
				    return 1;
				}
				PrzedmiotInfo[uid][pX] = 0;
				PrzedmiotInfo[uid][pY] = 0;
				PrzedmiotInfo[uid][pZ] = 0;
				PrzedmiotInfo[uid][pVW] = 0;
				PrzedmiotInfo[uid][pTypWlas] = TYP_AUTO;
				PrzedmiotInfo[uid][pOwner] = uidt;
				DeletePVar(playerid, "UzytyItem");
		    	ZapiszPrzedmiot(uid);
				strdel(tekst_global, 0, 2048);
		    	format(tekst_global, sizeof(tekst_global), "* %s odk³ada coœ do baga¿nika pojazdu.", ZmianaNicku(playerid));
				SendWrappedMessageToPlayerRange(playerid, FIOLETOWY, tekst_global, 10);
				new akcja[126];
				format(akcja,sizeof(akcja),"*odk³ada coœ do baga¿nika pojazdu*");
				SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
				new akcja2[126];
				format(akcja2,sizeof(akcja2),"odklada cos do bagaznika pojazdu");
				TextDrawSetString(AkcjaTD[playerid], akcja2);
				TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
				CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
				ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 0, 0, 0, 0, 0);
				new log[256];
				format(log, sizeof(log), "[THING] [DOWN-CAR-BAGAZNIK] [%s] [ID: %d] %d (%s) [%d, %d] [Car: %d]", ZmianaNicku(playerid), playerid, PrzedmiotInfo[uid][pUID], PrzedmiotInfo[uid][pNazwa], PrzedmiotInfo[uid][pWar1], PrzedmiotInfo[uid][pWar2], PrzedmiotInfo[uid][pOwner]);
				Transakcja(T_IC, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, log, gettime()+KOREKTA_CZASOWA);
			}
		}
	}
	if(dialogid == DIALOG_PRZEDMIOT_DEL)
    {
        if(response)
        {
            new uid = strval(inputtext);
			if(PrzedmiotInfo[uid][pTyp] == P_TORBA)
			{
				ForeachEx(id, MAX_PRZEDMIOT)
				{
					if(PrzedmiotInfo[id][pOwner] == uid && PrzedmiotInfo[id][pTypWlas] == TYP_TORBA && PrzedmiotInfo[id][pUID] != 0)
					{
						UsunPrzedmiot(id);
					}
				}
			}
			UsunPrzedmiot(uid);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Przedmiot zosta³ w³o¿ony do œmietnika.", "Zamknij", "");
			ApplyAnimation(playerid, "BAR", "Barserve_give", 4.1, 0, 0, 0, 0, 0);
        }
        else
        {
            return 1;
        }
        return 1;
    }
    if(dialogid == DIALOG_PRZEDMIOT_DNA)
    {
        if(response)
        {
            new uid = strval(inputtext);
            new found = 0;
            ForeachEx(d, MAX_DNA)
			{
			    if(Dna[d][dUID] == uid)
			    {
			        if(Dna[d][dTyp] == 2)
			        {
					    format(tekst_global, sizeof(tekst_global), "%s\n%d\n%s\n%s", tekst_global, Dna[d][dID], Dna[d][dKod], Dna[d][dZapis]);
						found++;
					}
				}
			}
			if(found != 0) dShowPlayerDialog(playerid, DIALOG_PRZEDMIOT_DNA, DIALOG_STYLE_LIST, "• DNA pobrane z przedmiotu:", tekst_global, "Wybierz", "Anuluj");
			else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• DNA:", "Nie znaleziono ¿adnych œladów DNA na wybranym przedmiocie.", "Rozumiem", "Zamknij");
			return 1;
        }
        return 1;
    }
	if(dialogid == DIALOG_FOREX_AKCJE_WYMIEN)
	{
		if(response)
		{
			new uid = GetPVarInt(playerid, "ForexUID");
			new naglowek[128], tekst[2048];
			format(naglowek, sizeof(naglowek), "{FFFFFF}• Forex, Konto: %d{000099}€{FFFFFF}, %d{63D075}${FFFFFF}", DaneGracza[playerid][gEuro], DaneGracza[playerid][gPORTFEL]);
			if(Forex[uid][fWaluta] == 0)
			{
				format(tekst, sizeof(tekst), "Wybra³eœ na gie³dzie aukcje %d jej kurs obecnie wynosi %0.1f.\n Chcesz kupiæ USD ($) za EUR (€), pamiêtaj by nie przep³aciæ obserwuj kurs na rynku!\n\nPrzygotowaliœmy dla Ciebie ma³e zestawienie pogl¹dowe:\n•\t10$ za %d€\n•\t100$ za %d€\n•\t500$ za %d€\n\nPoni¿ej wpisz ile USD ($) chcesz zakupiæ:", uid, Forex[uid][fKurs], Float:10*Forex[uid][fKurs], Float:100*Forex[uid][fKurs], Float:500*Forex[uid][fKurs]);
			}
			else
			{
				format(tekst, sizeof(tekst), "Wybra³eœ na gie³dzie aukcje %d jej kurs obecnie wynosi %0.1f.\n Chcesz kupiæ EUR (€) za USD ($), pamiêtaj by nie przep³aciæ obserwuj kurs na rynku!\n\nPrzygotowaliœmy dla Ciebie ma³e zestawienie pogl¹dowe:\n•\t10€ za %d$\n•\t100€ za %d$\n•\t500€ za %d$\n\nPoni¿ej wpisz ile EURO (€) chcesz zakupiæ:", uid, Forex[uid][fKurs], Float:10*Forex[uid][fKurs], Float:100*Forex[uid][fKurs], Float:500*Forex[uid][fKurs]);
			}
			if(strval(inputtext) < 0)
			{
				dShowPlayerDialog(playerid, DIALOG_FOREX_AKCJE_WYMIEN, DIALOG_STYLE_INPUT, naglowek, tekst, "Wymieñ", "Anuluj");
				return 0;
			}
			new ilosc = strval(inputtext);
			new obliczenie[12];
			format(obliczenie, sizeof(obliczenie), "%d", Float:ilosc*Forex[uid][fKurs]);
			new wynik = strval(obliczenie);
			if(ilosc <= Forex[uid][fIlosc])
			{
				if(Forex[uid][fWaluta] == 0)
				{
					if(DaneGracza[playerid][gEuro] >= wynik)
					{
						DaneGracza[playerid][gEuro] -= wynik;
						Dodajkase(playerid, ilosc);
						ZapiszGracza(playerid);
						OdswiezEuro(playerid);
						format(tekst, sizeof(tekst), "{009900}FOREX{DEDEDE} Wymieni³eœ %d EUR (€) na %d USD ($).", wynik, ilosc);
						SendClientMessage(playerid, SZARY, tekst);
						Forex[uid][fIlosc] -= wynik;
						Forex[uid][fWymieniono] += wynik;
						ZapiszForex(uid);
						new stankonta, row[256], astr[256];
						format(astr, sizeof(astr), "SELECT `STAN_KONTA` FROM `jochym_bank` WHERE `UID_POSTACI`= '%d' LIMIT 1", Forex[uid][fUID]);
						mysql_check();
						mysql_query2(astr);
						mysql_store_result();
						mysql_fetch_row(row);
						sscanf(row,  "p<|>d", stankonta);
						new query[256];
						format(query, sizeof(query), "UPDATE `jochym_bank` SET `STAN_KONTA` = '%d' WHERE `UID_POSTACI` = '%d'", stankonta+ilosc, Forex[uid][fUID]);
						mysql_check();
						mysql_query(query);
						new euro;
						format(astr, sizeof(astr), "SELECT `EURO` FROM `jochym_postacie` WHERE `UID_POSTACI`= '%d' LIMIT 1", Forex[uid][fUID]);
						mysql_check();
						mysql_query2(astr);
						mysql_store_result();
						mysql_fetch_row(row);
						sscanf(row,  "p<|>d", euro);
						format(query, sizeof(query), "UPDATE `jochym_postacie` SET `EURO` = '%d' WHERE `UID_POSTACI` = '%d'", euro+ilosc, Forex[uid][fUID]);
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
								if(DaneGracza[gracz][gUID] == Forex[uid][fUID])
								{
									format(astr, sizeof(astr), "SELECT `EURO` FROM `jochym_postacie` WHERE `UID_POSTACI`= '%d' LIMIT 1", Forex[uid][fUID]);
									mysql_check();
									mysql_query2(astr);
									mysql_store_result();
									mysql_fetch_row(row);
									sscanf(row,  "p<|>d", DaneGracza[gracz][gEuro]);
									ZapiszGracza(gracz);
									OdswiezEuro(gracz);
									format(tekst, sizeof(tekst), "{FF99CC}FOREX{DEDEDE} W³aœnie odkupiono z Twojej aukcji %d USD ($) za %d EUR (€).", ilosc, wynik);
									SendClientMessage(gracz, SZARY, tekst);
								}
							}
						}
						return 1;
					}
					else
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Forex", "Nie posiadasz tyle EURO (€) by wymieniæ tak¹ iloœæ!", "Rozumiem", "");
						return 0;
					}
				}
				else
				{
					if(DaneGracza[playerid][gPORTFEL] >= wynik)
					{
						DaneGracza[playerid][gEuro] += ilosc;
						Dodajkase(playerid, -wynik);
						ZapiszGracza(playerid);
						OdswiezEuro(playerid);
						format(tekst, sizeof(tekst), "{009900}FOREX{DEDEDE} Wymieni³eœ %d USD ($) na %d EUR (€).", wynik, ilosc);
						SendClientMessage(playerid, SZARY, tekst);
						Forex[uid][fIlosc] -= wynik;
						Forex[uid][fWymieniono] += wynik;
						ZapiszForex(uid);
						new stankonta, row[256], astr[256];
						format(astr, sizeof(astr), "SELECT `STAN_KONTA` FROM `jochym_bank` WHERE `UID_POSTACI`= '%d' LIMIT 1", Forex[uid][fUID]);
						mysql_check();
						mysql_query2(astr);
						mysql_store_result();
						mysql_fetch_row(row);
						sscanf(row,  "p<|>d", stankonta);
						new query[256];
						format(query, sizeof(query), "UPDATE `jochym_bank` SET `STAN_KONTA` = '%d' WHERE `UID_POSTACI` = '%d'", stankonta+ilosc, Forex[uid][fUID]);
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
								if(DaneGracza[gracz][gUID] == Forex[uid][fUID])
								{
									format(tekst, sizeof(tekst), "{FF99CC}FOREX{DEDEDE} W³aœnie odkupiono z Twojej aukcji %d EUR ($) za %d USD ($).", ilosc, wynik);
									SendClientMessage(gracz, SZARY, tekst);
								}
							}
						}
						return 1;
					}
					else
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Forex", "Nie posiadasz tyle USD ($) by wymieniæ tak¹ iloœæ!", "Rozumiem", "");
						return 0;
					}
				}
			}
			else
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Forex", "Zbyt du¿a wartoœæ któr¹ chcia³byœ wymieniæ na tej aukcji!", "Rozumiem", "");
				return 0;
			}
		}
	}
	if(dialogid == DIALOG_FOREX_AKCJE)
	{
		if(response)
		{
			new uid = strval(inputtext);
			new naglowek[128], tekst[2048];
			SetPVarInt(playerid, "ForexUID", uid);
			format(naglowek, sizeof(naglowek), "{FFFFFF}• Forex, Konto: %d{000099}€{FFFFFF}, %d{63D075}${FFFFFF}", DaneGracza[playerid][gEuro], DaneGracza[playerid][gPORTFEL]);
			if(Forex[uid][fWaluta] == 0)
			{
				format(tekst, sizeof(tekst), "Wybra³eœ na gie³dzie aukcje %d jej kurs obecnie wynosi %0.1f.\n Chcesz kupiæ USD ($) za EUR (€), pamiêtaj by nie przep³aciæ obserwuj kurs na rynku!\n\nPrzygotowaliœmy dla Ciebie ma³e zestawienie pogl¹dowe:\n•\t10$ za %d€\n•\t100$ za %d€\n•\t500$ za %d€\n\nPoni¿ej wpisz ile USD ($) chcesz zakupiæ:", uid, Forex[uid][fKurs], Float:10*Forex[uid][fKurs], Float:100*Forex[uid][fKurs], Float:500*Forex[uid][fKurs]);
			}
			else
			{
				format(tekst, sizeof(tekst), "Wybra³eœ na gie³dzie aukcje %d jej kurs obecnie wynosi %0.1f.\n Chcesz kupiæ EUR (€) za USD ($), pamiêtaj by nie przep³aciæ obserwuj kurs na rynku!\n\nPrzygotowaliœmy dla Ciebie ma³e zestawienie pogl¹dowe:\n•\t10€ za %d$\n•\t100€ za %d$\n•\t500€ za %d$\n\nPoni¿ej wpisz ile EURO (€) chcesz zakupiæ:", uid, Forex[uid][fKurs], Float:10*Forex[uid][fKurs], Float:100*Forex[uid][fKurs], Float:500*Forex[uid][fKurs]);
			}
			dShowPlayerDialog(playerid, DIALOG_FOREX_AKCJE_WYMIEN, DIALOG_STYLE_INPUT, naglowek, tekst, "Wymieñ", "Anuluj");
			return 1;
		}
	}
	if(dialogid == DIALOG_FOREX)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					ZaladujForex();
					new naglowek[128], tekst[2048], found = 0;
					format(naglowek, sizeof(naglowek), "{FFFFFF}• Forex, Konto: %d{000099}€{FFFFFF}, %d{63D075}${FFFFFF}", DaneGracza[playerid][gEuro], DaneGracza[playerid][gPORTFEL]);
					format(tekst, sizeof(tekst), "{848484}#\t{848484}Sprzedawane\t{848484}Kurs\t{848484}Dostêpna iloœæ");
					ForeachEx(f, MAX_FOREX)
					{
						if(Forex[f][fID] == f && Forex[f][fID] != 0)
						{
							new waluta[32], kurs[64];
							if(Forex[f][fWaluta] == 0)
							{
								format(waluta, sizeof(waluta), "USD");
								format(kurs, sizeof(kurs), "1$ - %0.1f", Forex[f][fKurs]);
							}
							else
							{
								format(waluta, sizeof(waluta), "EUR");
								format(kurs, sizeof(kurs), "1€ - %0.1f", Forex[f][fKurs]);
							}
							format(tekst, sizeof(tekst), "%s\n%d\t%s\t%s\t%d", tekst, Forex[f][fID], waluta, kurs, Forex[f][fIlosc]);
							found++;
						}
					}
					if(found == 0)
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, naglowek, "Brak dostêpnych transakcji Forex na gie³dzie.\nWystaw swoj¹ ofertê na gie³dzie Forex, po korzystnym kursie dla Ciebie.", "Rozumiem", "");
						return 1;
					}
					else
					{
						dShowPlayerDialog(playerid, DIALOG_FOREX_AKCJE, DIALOG_STYLE_TABLIST_HEADERS, naglowek, tekst, "Wymieñ", "Anuluj");
						return 1;
					}
				}
				case 1:
				{
					new naglowek[128], tekst[2048];
					format(naglowek, sizeof(naglowek), "{FFFFFF}• Forex, Konto: %d{000099}€{FFFFFF}, %d{63D075}${FFFFFF}", DaneGracza[playerid][gEuro], DaneGracza[playerid][gPORTFEL]);
					format(tekst, sizeof(tekst), "{848484}Wybierz poni¿ej co chcesz wystawiæ na gie³dê Forex:");
					format(tekst, sizeof(tekst), "%s\nUSD ($)", tekst);
					format(tekst, sizeof(tekst), "%s\nEUR (€)", tekst);
					dShowPlayerDialog(playerid, DIALOG_FOREX_WYSTAW, DIALOG_STYLE_TABLIST_HEADERS, naglowek, tekst, "Wybierz", "Anuluj");
					return 1;
				}
				case 2:
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Forex", "Opcja jest obecnie niedostepna", "Rozumiem", "");
					return 1;
				}
			}
		}
	}
	if(dialogid == DIALOG_FOREX_WYSTAW)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					SetPVarInt(playerid, "ForexWaluta", 0);
					new naglowek[128], tekst[2048];
					format(naglowek, sizeof(naglowek), "{FFFFFF}• Forex, Konto: %d{000099}€{FFFFFF}, %d{63D075}${FFFFFF}", DaneGracza[playerid][gEuro], DaneGracza[playerid][gPORTFEL]);
					format(tekst, sizeof(tekst), "Chcesz wystawiæ USD ($) wpisz kurs po którym inni bêd¹ mogli od Ciebie odkupiæ dan¹ walutê. Dla tej waluty najlepszym kursem jest 0.25 musisz ustaliæ wiêksz¹ od tej, lecz Ty decydujesz o ile zwiêkszysz kurs tej aukcji!");
					dShowPlayerDialog(playerid, DIALOG_FOREX_AKCJE_WYMIEN_ILOSC, DIALOG_STYLE_INPUT, naglowek, tekst, "Wystaw", "Anuluj");
				}
				case 1:
				{
					SetPVarInt(playerid, "ForexWaluta", 1);
					new naglowek[128], tekst[2048];
					format(naglowek, sizeof(naglowek), "{FFFFFF}• Forex, Konto: %d{000099}€{FFFFFF}, %d{63D075}${FFFFFF}", DaneGracza[playerid][gEuro], DaneGracza[playerid][gPORTFEL]);
					format(tekst, sizeof(tekst), "Chcesz wystawiæ EUR (€) wpisz kurs po którym inni bêd¹ mogli od Ciebie odkupiæ dan¹ walutê. Dla tej waluty najlepszym kursem jest 4.5 musisz ustaliæ wiêksz¹ od tej, lecz Ty decydujesz o ile zwiêkszysz kurs tej aukcji!");
					dShowPlayerDialog(playerid, DIALOG_FOREX_AKCJE_WYMIEN_ILOSC, DIALOG_STYLE_INPUT, naglowek, tekst, "Wystaw", "Anuluj");
				}
			}
		}
	}
	if(dialogid == DIALOG_FOREX_AKCJE_WYMIEN_ILOSC)
	{
		if(response)
		{
			new waluta = GetPVarInt(playerid, "ForexWaluta");
			new Float:kurs;
			sscanf(inputtext, "f", kurs);
			SetPVarFloat(playerid, "ForexKurs", kurs);
			if(kurs >= 0.25 && waluta == 0)
			{
				new naglowek[128], tekst[2048];
				format(naglowek, sizeof(naglowek), "{FFFFFF}• Forex, Konto: %d{000099}€{FFFFFF}, %d{63D075}${FFFFFF}", DaneGracza[playerid][gEuro], DaneGracza[playerid][gPORTFEL]);
				format(tekst, sizeof(tekst), "Chcesz wystawiæ USD ($) wpisz kurs po którym inni bêd¹ mogli od Ciebie odkupiæ dan¹ walutê. Dla tej waluty najlepszym kursem jest 0.25 musisz ustaliæ wiêksz¹ od tej, lecz Ty decydujesz o ile zwiêkszysz kurs tej aukcji!");
				dShowPlayerDialog(playerid, DIALOG_FOREX_AKCJE_WYMIEN_ILOSC, DIALOG_STYLE_INPUT, naglowek, tekst, "Wystaw", "Anuluj");
			}
			if(kurs <= 0.25 && waluta == 0)
			{
				new naglowek[128], tekst[2048];
				format(naglowek, sizeof(naglowek), "{FFFFFF}• Forex, Konto: %d{000099}€{FFFFFF}, %d{63D075}${FFFFFF}", DaneGracza[playerid][gEuro], DaneGracza[playerid][gPORTFEL]);
				format(tekst, sizeof(tekst), "Chcesz wystawiæ USD ($) ustali³es ju¿ dla tej aukcji kurs %0.2f. Prosimy o podanie danej ilosci waluty która trafi na aukcje!", kurs);
				dShowPlayerDialog(playerid, DIALOG_FOREX_AKCJE_WYMIEN_ACCEPT, DIALOG_STYLE_INPUT, naglowek, tekst, "Wystaw", "Anuluj");
			}
			if(kurs >= 4.5 && waluta == 1)
			{
				new naglowek[128], tekst[2048];
				format(naglowek, sizeof(naglowek), "{FFFFFF}• Forex, Konto: %d{000099}€{FFFFFF}, %d{63D075}${FFFFFF}", DaneGracza[playerid][gEuro], DaneGracza[playerid][gPORTFEL]);
				format(tekst, sizeof(tekst), "Chcesz wystawiæ EUR (€) wpisz kurs po którym inni bêd¹ mogli od Ciebie odkupiæ dan¹ walutê. Dla tej waluty najlepszym kursem jest 4.5 musisz ustaliæ wiêksz¹ od tej, lecz Ty decydujesz o ile zwiêkszysz kurs tej aukcji!");
				dShowPlayerDialog(playerid, DIALOG_FOREX_AKCJE_WYMIEN_ILOSC, DIALOG_STYLE_INPUT, naglowek, tekst, "Wystaw", "Anuluj");
			}
			if(kurs <= 4.5 && waluta == 1)
			{
				new naglowek[128], tekst[2048];
				format(naglowek, sizeof(naglowek), "{FFFFFF}• Forex, Konto: %d{000099}€{FFFFFF}, %d{63D075}${FFFFFF}", DaneGracza[playerid][gEuro], DaneGracza[playerid][gPORTFEL]);
				format(tekst, sizeof(tekst), "Chcesz wystawiæ EUR (€) ustali³es ju¿ dla tej aukcji kurs %0.2f. Prosimy o podanie danej ilosci waluty która trafi na aukcje!", kurs);
				dShowPlayerDialog(playerid, DIALOG_FOREX_AKCJE_WYMIEN_ACCEPT, DIALOG_STYLE_INPUT, naglowek, tekst, "Wystaw", "Anuluj");
			}
		}
	}
	if(dialogid == DIALOG_FOREX_AKCJE_WYMIEN_ACCEPT)
	{
		if(response)
		{
			new waluta = GetPVarInt(playerid, "ForexWaluta");
			new Float:kurs = GetPVarFloat(playerid, "ForexKurs");
			if(strval(inputtext) < 0)
			{
				if(waluta == 0)
				{
					new naglowek[128], tekst[2048];
					format(naglowek, sizeof(naglowek), "{FFFFFF}• Forex, Konto: %d{000099}€{FFFFFF}, %d{63D075}${FFFFFF}", DaneGracza[playerid][gEuro], DaneGracza[playerid][gPORTFEL]);
					format(tekst, sizeof(tekst), "Chcesz wystawiæ USD ($) ustali³es ju¿ dla tej aukcji kurs %0.2f. Prosimy o podanie danej ilosci waluty która trafi na aukcje!", kurs);
					dShowPlayerDialog(playerid, DIALOG_FOREX_AKCJE_WYMIEN_ILOSC, DIALOG_STYLE_INPUT, naglowek, tekst, "Wystaw", "Anuluj");
				}
				else
				{
					new naglowek[128], tekst[2048];
					format(naglowek, sizeof(naglowek), "{FFFFFF}• Forex, Konto: %d{000099}€{FFFFFF}, %d{63D075}${FFFFFF}", DaneGracza[playerid][gEuro], DaneGracza[playerid][gPORTFEL]);
					format(tekst, sizeof(tekst), "Chcesz wystawiæ EUR (€) ustali³es ju¿ dla tej aukcji kurs %0.2f. Prosimy o podanie danej ilosci waluty która trafi na aukcje!", kurs);
					dShowPlayerDialog(playerid, DIALOG_FOREX_AKCJE_WYMIEN_ILOSC, DIALOG_STYLE_INPUT, naglowek, tekst, "Wystaw", "Anuluj");
				}
			}
			if(waluta == 0)
			{
				if(DaneGracza[playerid][gPORTFEL] >= strval(inputtext))
				{
					Dodajkase(playerid, -strval(inputtext));
					DodajForex(playerid, waluta, strval(inputtext), kurs);
					new tekst[128];
					format(tekst, sizeof(tekst), "{009900}FOREX{DEDEDE} W³aœnie wystawi³eœ na aukcje %d USD ($) jej kurs wynosi %0.2f.", strval(inputtext), kurs);
					SendClientMessage(playerid, SZARY, tekst);
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Forex", "Nie posiadasz takiej ilosci USD ($) by wystawiæ aukcje FOREX!", "Rozumiem", "");
					return 0;
				}
			}
			else
			{
				if(DaneGracza[playerid][gEuro] >= strval(inputtext))
				{
					DodajEuro(playerid, -strval(inputtext));
					DodajForex(playerid, waluta, strval(inputtext), kurs);
					new tekst[128];
					format(tekst, sizeof(tekst), "{009900}FOREX{DEDEDE} W³aœnie wystawi³eœ na aukcje %d EURO (€) jej kurs wynosi %0.2f.", strval(inputtext), kurs);
					SendClientMessage(playerid, SZARY, tekst);
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Forex", "Nie posiadasz takiej ilosci EUR (€) by wystawiæ aukcje FOREX!", "Rozumiem", "");
					return 0;
				}
			}
		}
	}
	if(dialogid == DIALOG_ROSLINA_SELL)
	{
		if(response)
        {
            new uid = strval(inputtext);
            new cena;
            if(PrzedmiotInfo[uid][pTyp] == P_ROSLINA)
		    {
 				cena = 200;
		    }
		    else if(PrzedmiotInfo[uid][pTyp] == P_SKLADNIK_MARYCHA)
		    {
 				cena = 300;
		    }
		    Dodajkase(playerid, cena);
			UsunPrzedmiot(uid);
			ApplyAnimation(playerid, "BAR", "Barserve_give", 4.1, 0, 0, 0, 0, 0);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Paser:", "Produkt zosta³ sprzedany, pieni¹dze otrzyma³eœ w gotówce do rêki!", "Zamknij", "");
		}
	}
    if(dialogid == DIALOG_PASER_SELL)
	{
	    if(response)
        {
            new uid = strval(inputtext);
            new cena;
            if(PrzedmiotInfo[uid][pWar1] == P_TASMA_LED)
		    {
 				cena = 5;
		    }
		    else if(PrzedmiotInfo[uid][pWar1] == P_PROCESORY)
		    {
 				cena = 10;
		    }
		    else if(PrzedmiotInfo[uid][pWar1] == P_LAPTOPY)
		    {
 				cena = 12;
		    }
		    else if(PrzedmiotInfo[uid][pWar1] == P_AUDIO)
		    {
 				cena = 15;
		    }
		    Dodajkase(playerid, cena);
			UsunPrzedmiot(uid);
			ApplyAnimation(playerid, "BAR", "Barserve_give", 4.1, 0, 0, 0, 0, 0);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Paser:", "Sprzêt zosta³ sprzedany Paserowi, przekaza³ on Tobie gotówkê!", "Zamknij", "");
		}
	}
    if(dialogid == DIALOG_CORNER_SELL)
    {
        if(response)
        {
            new uid = strval(inputtext);
            new cena;
            if(PrzedmiotInfo[uid][pWar1] == P_SKLADNIK_AMFA)
		    {
 				cena = 50;
		    }
		    else if(PrzedmiotInfo[uid][pWar1] == P_SKLADNIK_KOKA)
		    {
 				cena = 45;
		    }
		    else if(PrzedmiotInfo[uid][pWar1] == P_SKLADNIK_EXTASA)
		    {
 				cena = 40;
		    }
		    else if(PrzedmiotInfo[uid][pWar1] == P_SKLADNIK_LSD)
		    {
 				cena = 45;
		    }
		    else if(PrzedmiotInfo[uid][pWar1] == P_SKLADNIK_GRZYBY)
		    {
 				cena = 42;
		    }
		    else if(PrzedmiotInfo[uid][pWar1] == P_SKLADNIK_HERA)
		    {
 				cena = 55;
		    }
		    else if(PrzedmiotInfo[uid][pWar1] == P_SKLADNIK_MEFEDRON)
		    {
 				cena = 40;
		    }
		    else if(PrzedmiotInfo[uid][pWar1] == P_SKLADNIK_MARYCHA)
		    {
 				cena = 25;
		    }
		    Dodajkase(playerid, cena);
			UsunPrzedmiot(uid);
			ApplyAnimation(playerid, "BAR", "Barserve_give", 4.1, 0, 0, 0, 0, 0);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Corner:", "Narkotyk zosta³ sprzedany æpunowi.", "Zamknij", "");
			CornerAktorDel(playerid, 2);
			SetPVarInt(playerid, "AktorZajety", 0);
			return 1;
        }
        else
        {
            SetPVarInt(playerid, "AktorZajety", 0);
            CornerAktorDel(playerid, 2);
            dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Corner:", "Nie sprzeda³eœ ¿adnego narkotyku æpunowi.", "Zamknij", "");
            return 1;
        }
    }
    if(dialogid == DIALOG_PRZEDMIOT_ACTOR)
    {
        if(response)
        {
            new uid = strval(inputtext);
            new cena;
		    if(PrzedmiotInfo[uid][pWar1] == 1)
		    {
 				cena = 2;
		    }
		    if(PrzedmiotInfo[uid][pWar1] == 2)
		    {
 				cena = 3;
		    }
		    if(PrzedmiotInfo[uid][pWar1] == 3)
		    {
 				cena = 4;
		    }
		    if(PrzedmiotInfo[uid][pWar1] == 4)
		    {
 				cena = 5;
		    }
		    if(PrzedmiotInfo[uid][pWar1] == 5)
		    {
 				cena = 6;
		    }
		    if(PrzedmiotInfo[uid][pWar1] == 6)
		    {
 				cena = 7;
		    }
		    if(PrzedmiotInfo[uid][pWar1] == 7)
		    {
 				cena = 8;
		    }
		    if(PrzedmiotInfo[uid][pWar1] == 8)
		    {
 				cena = 9;
		    }
		    if(PrzedmiotInfo[uid][pWar1] == 9)
		    {
 				cena = 10;
		    }
		    if(PrzedmiotInfo[uid][pWar1] == 10)
		    {
 				cena = 11;
		    }
		    else
		    {
		        cena = 15;
		    }
		    Dodajkase(playerid, cena);
			UsunPrzedmiot(uid);
			ApplyAnimation(playerid, "BAR", "Barserve_give", 4.1, 0, 0, 0, 0, 0);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Przedmiot zosta³ sprzedany rybakowi.", "Zamknij", "");
			return 1;
        }
        else
        {
            return 1;
        }
    }
    if(dialogid == DIALOG_PRZEDMIOT_POCHOWAJ)
    {
        if(response)
        {
            new uid = strval(inputtext);
            new n = GetPVarInt(playerid, "InterakcjaObiekt");
            ForeachEx(pochowany, MAX_NAGROBEK)
            {
                if(Nagrobek[pochowany][cnOBJ] == n)
                {
                    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ten pomnik ju¿ jest zajêty przez kogoœ innego, znajdŸ inny wolny pomnik by pogrzebaæ tutaj cia³o.", "Zamknij", "");
                    return 1;
                }
            }
            new string[64];
            new Rok, Miesiac, Dzien;
			getdate(Rok, Miesiac, Dzien);
            format(string, sizeof(string), "%s", PrzedmiotInfo[uid][pNazwa]);
            StworzNagrobek(playerid, ObiektInfo[n][objUID], string, ObiektInfo[n][objPozX], ObiektInfo[n][objPozY], ObiektInfo[n][objPozZ], Dzien, Miesiac, DaneGracza[playerid][gUID]);
			UsunPrzedmiot(uid);
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 0, 0, 0, 0, 0);
			return 1;
        }
        else
        {
            return 1;
        }
    }
	if(dialogid == DIALOG_OFER_GR_ITEM)
	{
		if( !response )
	        return 1;
		new gracz = strval(inputtext);
		SetPVarInt(playerid, "GraczItem", gracz);
		dShowPlayerDialog(playerid, DIALOG_OFER_GR_ITEM_CENA, DIALOG_STYLE_INPUT, "• Informacja:", "Wpisz kwote za jak¹ chcesz sprzedaæ przedmiot:", "Zatwierdz", "Zamknij");
		return 1;
	}
	if(dialogid == DIALOG_OFER_GR_ITEM_FREE)
	{
	    if(response)
		{
		    new gracz = strval(inputtext);
			SetPVarInt(playerid, "GraczItem", gracz);
			Oferuj(playerid, GetPVarInt(playerid, "GraczItem"), GetPVarInt(playerid, "Wybrany"), 0, 0, 0, OFEROWANIE_PRZEDMIOTU, 0, "", 0);
			return 1;
		}
		else
		{
		    return 1;
		}
	}
	if(dialogid == DIALOG_OFER_GR_ITEM_CENA)
	{
		if( !response )
	        return 1;
		if(strval(inputtext) < 0)
		{
			dShowPlayerDialog(playerid, DIALOG_OFER_GR_ITEM_CENA, DIALOG_STYLE_INPUT, "• Informacja:", "Wpisz kwote za jak¹ chcesz sprzedaæ przedmiot:", "Zatwierdz", "Zamknij");
			return 1;
		}
		Oferuj(playerid, GetPVarInt(playerid, "GraczItem"), GetPVarInt(playerid, "Wybrany"), 0, 0, 0, OFEROWANIE_PRZEDMIOTU, strval(inputtext), "", 0);
		return 1;
	}
	if(dialogid == DIALOG_TORBA_WYCIAGNIJ)
	{
		if( !response )
	        return 1;
		new uid = strval(inputtext);
		PrzedmiotInfo[uid][pTypWlas] = TYP_WLASCICIEL;
		PrzedmiotInfo[uid][pOwner] = DaneGracza[playerid][gUID];
	    ZapiszPrzedmiot(uid);
		GameTextForPlayer(playerid, "~y~Przedmiot zostal ~w~wyciagniety z torby.", 3000, 5);
		new akcja[126];
		format(akcja,sizeof(akcja),"*wyci¹ga coœ z torby*");
		SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
		new akcja2[126];
		format(akcja2,sizeof(akcja2),"wyciaga cos z torby");
		TextDrawSetString(AkcjaTD[playerid], akcja2);
		TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
		CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
		return 1;
	}
	if(dialogid == DIALOG_DISC_WL)
	{
	    if( !response )
	        return 1;
	    new uid = strval(inputtext);
	    new uz = GetPVarInt(playerid, "UzytyItem");
		format(PrzedmiotInfo[uid][pWar3], 50, "%s", PrzedmiotInfo[uz][pWar3]);
		DeletePVar(playerid, "UzytyItem");
	    ZapiszPrzedmiot(uid);
	    GameTextForPlayer(playerid, "~y~Plyta zostala ~w~wlozona do discmana.", 3000, 5);
	    format(tekst_global, sizeof(tekst_global), "* %s wk³ada p³ytê do %s.", ZmianaNicku(playerid), PrzedmiotInfo[uid][pNazwa]);
		SendWrappedMessageToPlayerRange(playerid, FIOLETOWY, tekst_global, 10);
		new akcja[126];
		format(akcja,sizeof(akcja),"*wk³ada p³ytê do %s*", PrzedmiotInfo[uid][pNazwa]);
		SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
		new akcja2[126];
		format(akcja2,sizeof(akcja2),"wklada plyte do %s", PrzedmiotInfo[uid][pNazwa]);
		TextDrawSetString(AkcjaTD[playerid], akcja2);
		TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
		CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
	    return 1;
	}
	if(dialogid == DIALOG_KARTOTEKA_PODGLAD)
	{
	    if( !response )
	        return 1;
        new playerid2 = GetPVarInt(playerid,"KartotekaID");
		SetPVarInt(playerid, "IDKART", playerid2);
		if(listitem == 13)//wpisy karne
		{
		    new	wpisy[2048], find = 0;
			ForeachEx(i, MAX_KARTOTEKA)
			{
			    if(KartotekaInfo[i][kUID] == DaneGracza[playerid2][gUID])
			    {
					format(wpisy, sizeof(wpisy), "%s\n%d\t[%s]\t%s", wpisy, KartotekaInfo[i][kID], KartotekaInfo[i][kData], KartotekaInfo[i][kPowod]);
					find++;
				}
			}
			if(find > 0)
			{
				new	wpisys[512];
				format(wpisys, sizeof(wpisys), "Kartoteka osobowa %s, Wpisów: %d", ZmianaNicku(playerid2), find);
				dShowPlayerDialog(playerid, DIALOG_KARTOTEKA_OPCJE, DIALOG_STYLE_LIST, wpisys, wpisy, "Wiecej", "Zamknij");
			}
			else
			{
				new	wpisyss[512];
				new	wpisys[512];
				format(wpisyss, sizeof(wpisyss), "%s nie posiada wpisów w kartotece.\nAby dodaæ nowy wpis dla tej osoby wciœnij 'Dodaj'", ZmianaNicku(playerid2));
				format(wpisys, sizeof(wpisys), "Kartoteka osobowa %s, Wpisów: %d", ZmianaNicku(playerid2), find);
				dShowPlayerDialog(playerid, DIALOG_KARTOTEKA_WPIS, DIALOG_STYLE_MSGBOX, wpisys,wpisyss, "Dodaj", "Zamknij");
			}
		}
		if(listitem == 14)//zarejestrowane pojazdy
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Urz¹d Miasta:", "Strona w trakcie pracy, zapraszamy póŸniej!", "Zamknij", "");
		}
		if(listitem == 15)
		{
		    if(DaneGracza[playerid2][gPOSZ] == 0)
		    {
			    dShowPlayerDialog(playerid, DIALOG_POSZUKIWANY_DODAJ, DIALOG_STYLE_INPUT, "• Dodaj poszukiwanego:", "Podaj dlaczego osoba ma byæ poszukiwana:", "Wpisz", "Zamknij");
			    SetPVarInt(playerid, "Poszukiwany", playerid2);
	        	return 1;
			}
			else
			{
			    dShowPlayerDialog(playerid, DIALOG_POSZUKIWANY_USUN, DIALOG_STYLE_INPUT, "• Dodaj poszukiwanego:", "Podaj dlaczego osoba ma nie byæ ju¿ poszukiwana:", "Wpisz", "Zamknij");
			    SetPVarInt(playerid, "Poszukiwany", playerid2);
	        	return 1;
			}
		}
		if(listitem == 16)
		{
		    ZaladujPoszukiwania();
		    new	wpisy[2048], find = 0;
			ForeachEx(i, MAX_KARTOTEKA)
			{
			    if(PoszukiwanyInfo[i][kUID] == DaneGracza[playerid2][gUID])
			    {
					format(wpisy, sizeof(wpisy), "%s\n%d\t[%s]\t%s", wpisy, PoszukiwanyInfo[i][kID], PoszukiwanyInfo[i][kData], PoszukiwanyInfo[i][kPowod]);
					find++;
				}
			}
			if(find > 0)
			{
				new	wpisys[512];
				format(wpisys, sizeof(wpisys), "Listy goñcze osoby %s, Wpisów: %d", ZmianaNicku(playerid2), find);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, wpisys, wpisy, "Rozumiem", "Zamknij");
			}
			else
			{
				new	wpisyss[512];
				new	wpisys[512];
				format(wpisyss, sizeof(wpisyss), "%s nie posiada wpisów w listach goñczych.", ZmianaNicku(playerid2));
				format(wpisys, sizeof(wpisys), "Listy goñcze osoby %s, Wpisów: %d", ZmianaNicku(playerid2), find);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, wpisys,wpisyss, "Rozumiem", "Zamknij");
			}
		}
		if(listitem == 17)
		{
		    if(!PlayerObokPlayera(playerid, playerid2, 5))
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Osoba której chcesz zabraæ prawo jazdy nie znajduje siê obok Ciebie.", "Zamknij", "");
			    return 1;
			}
		    if(DaneGracza[playerid2][gDokumenty][D_PRAWKO_A] == 1 && DaneGracza[playerid2][gDokumenty][D_PRAWKO_B] == 1)
		    {
			    DaneGracza[playerid2][gDokumenty][D_PRAWKO_A] = 0;
			    DaneGracza[playerid2][gDokumenty][D_PRAWKO_B] = 0;
			    ZapiszGracza(playerid2);
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Prawo jazdy:", "Prawo jazdy zosta³o zabrane, od teraz ta osoba musi wyrobiæ je na nowo.", "Zamknij", "");
			    dShowPlayerDialog(playerid2, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Prawo jazdy:", "Prawo jazdy zosta³o Ci zabrane, udaj siê do urzêdnika by wyrobiæ je na nowo!", "Zamknij", "");
	     		return 1;
			}
			else
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Prawo jazdy:", "Ta osoba nie posiada prawa jazdy!", "Zamknij", "");
			    return 1;
			}
		}
	}
	if(dialogid == DIALOG_POSZUKIWANY_DODAJ)
	{
	    if( !response )
			return 1;
		if(strlen(inputtext) < 3)
		{
			dShowPlayerDialog(playerid, DIALOG_POSZUKIWANY_DODAJ, DIALOG_STYLE_INPUT, "• Dodaj poszukiwanego:", "Podaj dlaczego osoba ma byæ poszukiwana:", "Wpisz", "Zamknij");
			return 0;
		}
		DodajPoszukiwany(playerid, GetPVarInt(playerid, "IDKART"), 0, inputtext);
		new playerid2 = GetPVarInt(playerid, "Poszukiwany");
		DaneGracza[playerid2][gPOSZ] = 1;
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Osoba poszukiwana zosta³a dodana.", "Zamknij", "");
		return 1;
	}
	if(dialogid == DIALOG_POSZUKIWANY_USUN)
	{
	    if( !response )
			return 1;
		if(strlen(inputtext) < 3)
		{
			dShowPlayerDialog(playerid, DIALOG_POSZUKIWANY_USUN, DIALOG_STYLE_INPUT, "• Dodaj poszukiwanego:", "Podaj dlaczego osoba ma nie byæ ju¿ poszukiwana:", "Wpisz", "Zamknij");
			return 0;
		}
		DodajPoszukiwany(playerid, GetPVarInt(playerid, "IDKART"), 0, inputtext);
		new playerid2 = GetPVarInt(playerid, "Poszukiwany");
		DaneGracza[playerid2][gPOSZ] = 0;
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Osoba poszukiwana zosta³a usuniêta.", "Zamknij", "");
		return 1;
	}
	if(dialogid == DIALOG_USTAWIENIA_P)
	{
	    if( !response )
	        return 1;
        if(listitem == 0)
		{
		    new str[512];
			strdel(str, 0, 512);
			format(str, sizeof(str), "%s\n%s", str, "Brak");
			format(str, sizeof(str), "%s\n%s", str, AnimInfo[1][CMD]);
			format(str, sizeof(str), "%s\n%s", str, AnimInfo[2][CMD]);
			format(str, sizeof(str), "%s\n%s", str, AnimInfo[3][CMD]);
			format(str, sizeof(str), "%s\n%s", str, AnimInfo[4][CMD]);
			format(str, sizeof(str), "%s\n%s", str, AnimInfo[5][CMD]);
			dShowPlayerDialog(playerid, DIALOG_ANIM_CHODZENIA, DIALOG_STYLE_LIST, "• Animacja chodzenia:", str, "Wybierz", "Zamknij");
		}
		if(listitem == 1)
		{
		    new str[512];
			strdel(str, 0, 512);
			format(str, sizeof(str), "%s\nW³¹cz", str);
			format(str, sizeof(str), "%s\nWy³¹cz", str);
			dShowPlayerDialog(playerid, DIALOG_AKCES, DIALOG_STYLE_LIST, "• Akcesoria:", str, "Wybierz", "Zamknij");
		}
		if(listitem == 2)
		{
		    new str[512];
			strdel(str, 0, 512);
			format(str, sizeof(str), "%s\nSAMP", str);
			format(str, sizeof(str), "%s\nMTA", str);
			dShowPlayerDialog(playerid, DIALOG_UEDYTOR, DIALOG_STYLE_LIST, "• Edytor budowania:", str, "Wybierz", "Zamknij");
		}
		if(listitem == 3)
		{
		    if(GetPVarInt(playerid, "CZATPW") == 0)
		    {
		    	SetPVarInt(playerid, "CZATPW", 1);
		    	dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Ustawienia postaci:", "Prywatne wiadomoœci zosta³y wy³¹czone", "Zamknij", "");
			}
			else
			{
			    SetPVarInt(playerid, "CZATPW", 0);
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Ustawienia postaci:", "Prywatne wiadomoœci zosta³y w³¹czone", "Zamknij", "");
			}
		}
		if(listitem == 4)
		{
		    new str[512];
			strdel(str, 0, 512);
			format(str, sizeof(str), "%s\nW³¹cz", str);
			format(str, sizeof(str), "%s\nWy³¹cz", str);
			dShowPlayerDialog(playerid, DIALOG_FREEZE, DIALOG_STYLE_LIST, "• Zamra¿anie postaci:", str, "Wybierz", "Zamknij");
		}
		if(listitem == 5)
		{
		    new str[1024], found = 0;
		    if(DaneGracza[playerid][gAnim] == 0)
			{
			    ForeachEx(i, MAX_ANIM)
				{
					format(str, sizeof(str), "%s\n%s", str, AnimInfo[i][CMD]);
					found++;
				}
				dShowPlayerDialog(playerid, DIALOG_ANIM_PRZYCISK, DIALOG_STYLE_LIST, "• Wybierz animacje na przycisk:", str, "Wybierz", "Zamknij");
			}
			else
			{
				format(str, sizeof(str), "%s\nWy³¹cz animacje", str);
				dShowPlayerDialog(playerid, DIALOG_ANIM_PRZYCISK, DIALOG_STYLE_LIST, "• Wybierz animacje na przycisk:", str, "Wybierz", "Zamknij");
			}
		}
		if(listitem == 6)
		{
		    new str[512];
			strdel(str, 0, 512);
			format(str, sizeof(str), "%s\nW³¹cz", str);
			format(str, sizeof(str), "%s\nWy³¹cz", str);
			dShowPlayerDialog(playerid, DIALOG_FIRSTPERSON, DIALOG_STYLE_LIST, "• Kamera pierwszoosobowa (/fps):", str, "Wybierz", "Zamknij");
		}
	}
	if(dialogid == DIALOG_STATS)
	{
	    if( !response )
	        return 1;
        new rokp, miesiacp, dzienp, godzinap, minutap, sekundap;
		sekundytodata(DaneGracza[playerid][gBetaTester], rokp, miesiacp, dzienp, godzinap, minutap, sekundap);
	 	if(DaneGracza[playerid][gBetaTester] < (gettime()+CZAS_LETNI))
		{
			if(listitem == 18)
			{
			    // new imie[50], nazwisko[50];
				// sscanf(ImieGracza(playerid), "p<_>s[50]s[50]",imie,nazwisko);
				new dz[1024];
				new kc[30], kd[30], ke[30];
				new prawojazdy[64];
				format(dz, sizeof(dz), "%s\n", dz);
				if(Dokument(playerid, D_BRON)) kc="{63D075}posiadana{FFFFFF}"; else kc="{ed5a5a}brak{FFFFFF}";
				if(Dokument(playerid, D_BRON)) kd="{63D075}posiadane{FFFFFF}"; else kd="{ed5a5a}brak{FFFFFF}";
				if(Dokument(playerid, D_WEDKARSKA)) ke="{63D075}posiadana{FFFFFF}"; else ke="{ed5a5a}brak{FFFFFF}";
				// dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Twoje dokumenty:", dz, "Zamknij", "");

				if(Dokument(playerid, D_PRAWKO_A) && Dokument(playerid, D_PRAWKO_B))
					prawojazdy = "{63D075}A, B{FFFFFF}";
				else if(Dokument(playerid, D_PRAWKO_B))
					prawojazdy = "{63D075}B{FFFFFF}";
				else if(Dokument(playerid, D_PRAWKO_A))
					prawojazdy = "{63D075}A{FFFFFF}";
				else
					prawojazdy = "{ed5a5a}brak{FFFFFF}";


				new dokumenty[1024];
				format(dokumenty, sizeof(dokumenty), 	"{FFE5B4}D{FFFFFF}okumenty\t-\n{FFE5B4}P{FFFFFF}rawo jazdy: \t%s\n{FFE5B4}L{FFFFFF}icencja na broñ:\t%s\n{FFE5B4}Z{FFFFFF}aœwiadczenie o niekaralnoœci:\t%s\n{FFE5B4}K{FFFFFF}arta wêdkarska:\t%s\n",
				prawojazdy, kc, kd, ke);

				ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_TABLIST_HEADERS, GUIOPIS"Twoje Dokumenty", dokumenty, "Zamknij", "");
				return 1;
			}
			if(listitem == 19)
			{
			    ZaladujTato();
				new found = 0;
				strdel(tekst_global, 0, 1024);
				format(tekst_global, sizeof(tekst_global), "ID\tOpis tatua¿u", tekst_global);
			    ForeachEx(i, MAX_TATO)
				{
					if(Tatuaze[i][tUID] == DaneGracza[playerid][gUID])
					{
						format(tekst_global, sizeof(tekst_global), "%s\n%d\t%s", tekst_global, Tatuaze[i][tID], Tatuaze[i][tTATUAZ]);
						found++;
					}
				}
				if(found != 0) dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_TABLIST_HEADERS, "• Lista tatua¿y:", tekst_global, "Zamknij", "");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "{FFFFFF}Nie posiadasz ¿adnego tatua¿u na ciele swojej postaci.", "Rozumiem", "");
				return 1;
			}
			if(listitem == 20)
			{
			    new str[512];
			    format(str, sizeof(str), "%s\n{FFE5B4}Z{FFFFFF}mieñ animacjê chodzenia", str);
			    format(str, sizeof(str), "%s\n{FFE5B4}Z{FFFFFF}arz¹dzaj akcesoriami", str);
			    format(str, sizeof(str), "%s\n{FFE5B4}E{FFFFFF}dytor budowania", str);
			    format(str, sizeof(str), "%s\n{FFE5B4}W{FFFFFF}y³¹cz Prywatne Wiadomoœci", str);
			    format(str, sizeof(str), "%s\n{FFE5B4}W{FFFFFF}y³¹cz zamra¿anie postaci", str);
			    format(str, sizeof(str), "%s\n{FFE5B4}W{FFFFFF}ybierz animacje na przycisk (N)", str);
			    format(str, sizeof(str), "%s\n{FFE5B4}K{FFFFFF}amera pierwszoosobowa (/fps)", str);
				dShowPlayerDialog(playerid, DIALOG_USTAWIENIA_P, DIALOG_STYLE_LIST, "• Ustawienia postaci:", str, "Wybierz", "Zamknij");
			}
			if(listitem == 21)
			{
				new dz[1024];
				new sila[64];
				if(DaneGracza[playerid][gSILA] >= 300 && DaneGracza[playerid][gSILA] <= 799)
			    {
			        if(DaneGracza[playerid][gPLEC] == 0)
			        {
			        	format(sila, sizeof(sila), "wysportowany");
					}
					else
					{
					    format(sila, sizeof(sila), "wysportowana");
					}
			    }
			    else if(DaneGracza[playerid][gSILA] >= 800 && DaneGracza[playerid][gSILA] <= 1499)
			    {
			        if(DaneGracza[playerid][gPLEC] == 0)
			        {
			        	format(sila, sizeof(sila), "umiêœniony");
					}
					else
					{
					    format(sila, sizeof(sila), "umiêœniona");
					}
			    }
			    else if(DaneGracza[playerid][gSILA] >= 1500)
			    {
			        if(DaneGracza[playerid][gPLEC] == 0)
			        {
			        	format(sila, sizeof(sila), "kulturysta");
					}
					else
					{
					    format(sila, sizeof(sila), "kulturystka");
					}
			    }
			    format(dz, sizeof(dz), "{FFE5B4}U{FFFFFF}miejêtnoœci\t{FFE5B4}S{FFFFFF}tan");
				format(dz, sizeof(dz), "%s\n{FFE5B4}S{FFFFFF}trzelectwo: Broñ krótka: \t%d", dz, DaneGracza[playerid][g0]);
				format(dz, sizeof(dz), "%s\n{FFE5B4}S{FFFFFF}trzelectwo: Strzelby: \t%d", dz, DaneGracza[playerid][g3]);
				format(dz, sizeof(dz), "%s\n{FFE5B4}S{FFFFFF}trzelectwo: Broñ automatyczna: \t\t%d", dz, DaneGracza[playerid][g6]);
				format(dz, sizeof(dz), "%s\n{FFE5B4}S{FFFFFF}trzelectwo: Broñ maszynowa: \t%d", dz, DaneGracza[playerid][g8]);
				format(dz, sizeof(dz), "%s\n{222222}-", dz);
				format(dz, sizeof(dz), "%s\n{FFE5B4}S{FFFFFF}i³a postaci: \t%dj (%s)", dz, DaneGracza[playerid][gSILA], sila);
				format(dz, sizeof(dz), "%s\n{FFE5B4}K{FFFFFF}ondycja: \t100%", dz);
				format(dz, sizeof(dz), "%s\n{FFE5B4}Z{FFFFFF}dolnoœci manualne: \tPoziom 1", dz);
				format(dz, sizeof(dz), "%s\n{FFE5B4}W{FFFFFF}êdkarstwo: \tPoziom 1", dz);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_TABLIST_HEADERS, "• Umiejêtnoœci postaci:", dz, "Zamknij", "");
				return 1;
			}
		}
		else
		{
			if(listitem == 19)
			{
			    // new imie[50], nazwisko[50];
				// sscanf(ImieGracza(playerid), "p<_>s[50]s[50]",imie,nazwisko);
				new dz[1024];
				new kc[30], kd[30], ke[30];
				new prawojazdy[64];
				format(dz, sizeof(dz), "%s\n", dz);
				if(Dokument(playerid, D_BRON)) kc="{63D075}posiadana{FFFFFF}"; else kc="{ed5a5a}brak{FFFFFF}";
				if(Dokument(playerid, D_BRON)) kd="{63D075}posiadane{FFFFFF}"; else kd="{ed5a5a}brak{FFFFFF}";
				if(Dokument(playerid, D_WEDKARSKA)) ke="{63D075}posiadana{FFFFFF}"; else ke="{ed5a5a}brak{FFFFFF}";
				// dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Twoje dokumenty:", dz, "Zamknij", "");

				if(Dokument(playerid, D_PRAWKO_A) && Dokument(playerid, D_PRAWKO_B))
					prawojazdy = "{63D075}A, B{FFFFFF}";
				else if(Dokument(playerid, D_PRAWKO_B))
					prawojazdy = "{63D075}B{FFFFFF}";
				else if(Dokument(playerid, D_PRAWKO_A))
					prawojazdy = "{63D075}A{FFFFFF}";
				else
					prawojazdy = "{ed5a5a}brak{FFFFFF}";


				new dokumenty[1024];
				format(dokumenty, sizeof(dokumenty), 	"{FFE5B4}D{FFFFFF}okumenty\t-\n{FFE5B4}P{FFFFFF}rawo jazdy: \t%s\n{FFE5B4}L{FFFFFF}icencja na broñ:\t%s\n{FFE5B4}Z{FFFFFF}aœwiadczenie o niekaralnoœci:\t%s\n{FFE5B4}K{FFFFFF}arta wêdkarska:\t%s\n",
				prawojazdy, kc, kd, ke);

				ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_TABLIST_HEADERS, GUIOPIS"Twoje Dokumenty", dokumenty, "Zamknij", "");
				return 1;
			}
			if(listitem == 20)
			{
			    ZaladujTato();
				new found = 0;
				strdel(tekst_global, 0, 1024);
				format(tekst_global, sizeof(tekst_global), "ID\tOpis tatua¿u", tekst_global);
			    ForeachEx(i, MAX_TATO)
				{
					if(Tatuaze[i][tUID] == DaneGracza[playerid][gUID])
					{
						format(tekst_global, sizeof(tekst_global), "%s\n%d\t%s", tekst_global, Tatuaze[i][tID], Tatuaze[i][tTATUAZ]);
						found++;
					}
				}
				if(found != 0) dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_TABLIST_HEADERS, "• Lista tatua¿y:", tekst_global, "Zamknij", "");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "{FFFFFF}Nie posiadasz ¿adnego tatua¿u na ciele swojej postaci.", "Rozumiem", "");
				return 1;
			}
			if(listitem == 21)
			{
			    new str[512];
			    format(str, sizeof(str), "%s\n{FFE5B4}Z{FFFFFF}mieñ animacjê chodzenia", str);
			    format(str, sizeof(str), "%s\n{FFE5B4}Z{FFFFFF}arz¹dzaj akcesoriami", str);
			    format(str, sizeof(str), "%s\n{FFE5B4}E{FFFFFF}dytor budowania", str);
			    format(str, sizeof(str), "%s\n{FFE5B4}W{FFFFFF}y³¹cz Prywatne Wiadomoœci", str);
			    format(str, sizeof(str), "%s\n{FFE5B4}W{FFFFFF}y³¹cz zamra¿anie postaci", str);
			    format(str, sizeof(str), "%s\n{FFE5B4}W{FFFFFF}ybierz animacje na przycisk (N)", str);
			    format(str, sizeof(str), "%s\n{FFE5B4}K{FFFFFF}amera pierwszoosobowa (/fps)", str);
				dShowPlayerDialog(playerid, DIALOG_USTAWIENIA_P, DIALOG_STYLE_LIST, "• Ustawienia postaci:", str, "Wybierz", "Zamknij");
			}
			if(listitem == 22)
			{
				new dz[1024];
				new sila[64];
				if(DaneGracza[playerid][gSILA] >= 300 && DaneGracza[playerid][gSILA] <= 799)
			    {
			        if(DaneGracza[playerid][gPLEC] == 0)
			        {
			        	format(sila, sizeof(sila), "wysportowany");
					}
					else
					{
					    format(sila, sizeof(sila), "wysportowana");
					}
			    }
			    else if(DaneGracza[playerid][gSILA] >= 800 && DaneGracza[playerid][gSILA] <= 1499)
			    {
			        if(DaneGracza[playerid][gPLEC] == 0)
			        {
			        	format(sila, sizeof(sila), "umiêœniony");
					}
					else
					{
					    format(sila, sizeof(sila), "umiêœniona");
					}
			    }
			    else if(DaneGracza[playerid][gSILA] >= 1500)
			    {
			        if(DaneGracza[playerid][gPLEC] == 0)
			        {
			        	format(sila, sizeof(sila), "kulturysta");
					}
					else
					{
					    format(sila, sizeof(sila), "kulturystka");
					}
			    }
			    format(dz, sizeof(dz), "{FFE5B4}U{FFFFFF}miejêtnoœci\t{FFE5B4}S{FFFFFF}tan");
				format(dz, sizeof(dz), "%s\n{FFE5B4}S{FFFFFF}trzelectwo: Broñ krótka: \t%d", dz, DaneGracza[playerid][g0]);
				format(dz, sizeof(dz), "%s\n{FFE5B4}S{FFFFFF}trzelectwo: Strzelby: \t%d", dz, DaneGracza[playerid][g3]);
				format(dz, sizeof(dz), "%s\n{FFE5B4}S{FFFFFF}trzelectwo: Broñ automatyczna: \t\t%d", dz, DaneGracza[playerid][g6]);
				format(dz, sizeof(dz), "%s\n{FFE5B4}S{FFFFFF}trzelectwo: Broñ maszynowa: \t%d", dz, DaneGracza[playerid][g8]);
				format(dz, sizeof(dz), "%s\n{222222}-", dz);
				format(dz, sizeof(dz), "%s\n{FFE5B4}S{FFFFFF}i³a postaci: \t%dj (%s)", dz, DaneGracza[playerid][gSILA], sila);
				format(dz, sizeof(dz), "%s\n{FFE5B4}K{FFFFFF}ondycja: \t100%", dz);
				format(dz, sizeof(dz), "%s\n{FFE5B4}Z{FFFFFF}dolnoœci manualne: \tPoziom 1", dz);
				format(dz, sizeof(dz), "%s\n{FFE5B4}W{FFFFFF}êdkarstwo: \tPoziom 1", dz);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_TABLIST_HEADERS, "• Umiejêtnoœci postaci:", dz, "Zamknij", "");
				return 1;
			}
		}
	    return 1;
	}
	if(dialogid == DIALOG_FREEZE)
	{
	    if( !response )
	        return 1;
        if(listitem == 0)
        {
			DaneGracza[playerid][gFreeze] = 0;
			ZapiszGracza(playerid);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zamra¿anie postaci:", "{FFFFFF}Zamara¿anie postaci w³¹czone poprawnie.", "Zamknij", "");
			return 1;
		}
	    if(listitem == 1)
		{
			DaneGracza[playerid][gFreeze] = 0;
			ZapiszGracza(playerid);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zamra¿anie postaci:", "{FFFFFF}Zamara¿anie postaci wy³¹czone poprawnie (OPCJA NIEDOSTEPNA TYMCZASOWO).", "Zamknij", "");
			return 1;
		}
	}
	if(dialogid == DIALOG_AKCES)
	{
	    if( !response )
	        return 1;
        if(listitem == 0)
        {
			DaneGracza[playerid][gAKCES] = 1;
			ZapiszGracza(playerid);
			RemovePlayerAttachedObject(playerid, 7);
			RemovePlayerAttachedObject(playerid, 8);
			if(DaneGracza[playerid][gPrzyczepiony1] != 0)
			{
				new sql4[200];
				format(sql4, sizeof(sql4), "SELECT * FROM `jochym_dodadtki` WHERE `UID` = '%d' AND `index` = '%d' LIMIT 1", DaneGracza[playerid][gUID], DaneGracza[playerid][gPrzyczepiony1]);
				mysql_query(sql4);
				mysql_store_result();
				if(mysql_num_rows() != 0)
				{
					mysql_fetch_row(sql4);
					new Float:zm[9], zmnsa[5];
					sscanf(sql4, "p<|>{dd}dddfffffffff", zmnsa[0]
						, zmnsa[1]
						, zmnsa[2]
						, zm[0]
						, zm[1]
						, zm[2]
						, zm[3]
						, zm[4]
						, zm[5]
						, zm[6]
						, zm[7]
						, zm[8]
						);
					SetPlayerAttachedObject(playerid,zmnsa[0],zmnsa[1],zmnsa[2],zm[0],zm[1],zm[2],zm[3],zm[4],zm[5],zm[6],zm[7],zm[8]);
				}
			}
			if(DaneGracza[playerid][gPrzyczepiony2] != 0)
			{
				new sql4[200];
				format(sql4, sizeof(sql4), "SELECT * FROM `jochym_dodadtki` WHERE `UID` = '%d' AND `index` = '%d' LIMIT 1", DaneGracza[playerid][gUID], DaneGracza[playerid][gPrzyczepiony2]);
				mysql_query(sql4);
				mysql_store_result();
				if(mysql_num_rows() != 0)
				{
					mysql_fetch_row(sql4);
					new Float:zm[9], zmnsa[5];
					sscanf(sql4, "p<|>{dd}dddfffffffff", zmnsa[0]
						, zmnsa[1]
						, zmnsa[2]
						, zm[0]
						, zm[1]
						, zm[2]
						, zm[3]
						, zm[4]
						, zm[5]
						, zm[6]
						, zm[7]
						, zm[8]
						);
					SetPlayerAttachedObject(playerid,zmnsa[0],zmnsa[1],zmnsa[2],zm[0],zm[1],zm[2],zm[3],zm[4],zm[5],zm[6],zm[7],zm[8]);
				}
			}
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Akcesoria:", "{FFFFFF}Twoje akcesoria zosta³y pomyœlnie ustawione.", "Zamknij", "");
			return 1;
		}
	    if(listitem == 1)
		{
			DaneGracza[playerid][gAKCES] = 0;
			ZapiszGracza(playerid);
			RemovePlayerAttachedObject(playerid, 7);
			RemovePlayerAttachedObject(playerid, 8);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Akcesoria:", "{FFFFFF}Twoje akcesoria zosta³y pomyœlnie ustawione.", "Zamknij", "");
			return 1;
		}
	}
	if(dialogid == DIALOG_ANIM_CHODZENIA)
	{
	    if( !response )
	        return 1;
		if(listitem == 0) DaneGracza[playerid][gTYPCHODZENIA] = 0;
	    if(listitem == 1) DaneGracza[playerid][gTYPCHODZENIA] = 1;
		if(listitem == 2) DaneGracza[playerid][gTYPCHODZENIA] = 2;
		if(listitem == 3) DaneGracza[playerid][gTYPCHODZENIA] = 3;
		if(listitem == 4) DaneGracza[playerid][gTYPCHODZENIA] = 4;
		if(listitem == 5) DaneGracza[playerid][gTYPCHODZENIA] = 5;
		ZapiszGracza(playerid);
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Animacje:", "{FFFFFF}Wybra³eœ nowy styl chodzenia.", "Zamknij", "");
	    return 1;
	}
	if(dialogid == DIALOG_TORBA_WLOZ)
	{
	    if( !response )
	        return 1;
	    new uid = strval(inputtext);
	    new uz = GetPVarInt(playerid, "UzytyItem");
	    PrzedmiotInfo[uz][pTypWlas] = TYP_TORBA;
		PrzedmiotInfo[uz][pOwner] = uid;
		DeletePVar(playerid, "UzytyItem");
	    ZapiszPrzedmiot(uz);
	    GameTextForPlayer(playerid, "~y~Przedmiot zostal ~w~wlozony do torby.", 3000, 5);
	    new akcja[126];
		format(akcja,sizeof(akcja),"*odk³ada coœ do torby*");
		SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
		new akcja2[126];
		format(akcja2,sizeof(akcja2),"odklada cos do torby");
		TextDrawSetString(AkcjaTD[playerid], akcja2);
		TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
		CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
	    return 1;
	}
	if(dialogid == DIALOG_OFFER_TUNING)
	{
	    if(!response )
	        return 1;
		new cena, idGracza;
	    sscanf(inputtext, "dd", idGracza, cena);
		if(idGracza == playerid) return 1;
		if(!PlayerObokPlayera(playerid, idGracza, 5))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Musisz siê znajdowaæ obok gracza, aby mu coœ oferowaæ.", "Zamknij", "");
			return 0;
		}
		if(zalogowany[idGracza] == false)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Gracz nie jest zalogowany.", "Zamknij", "");
			return 0;
		}
		if(!IsPlayerInAnyVehicle(idGracza))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Gracz nie znajduje siê w pojezdzie.", "Zamknij", "");
			return 0;
		}
		if(!Wlascicielpojazdu(GetPlayerVehicleID(idGracza), idGracza))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ten gracz nie jest w³aœcicielem tego pojazdu.", "Zamknij", "");
			return 0;
		}
		if(cena <= 0)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Wprowadzona kwota jest niepoprawna.", "Zamknij", "");
			return 0;
		}
		new uz = GetPVarInt(playerid, "UzytyItem");
		if(PrzedmiotInfo[uz][pWar1] == 7)
		{
			if(NieSzyby(GetPlayerVehicleID(idGracza)))
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ten pojazd nie ma szyb!", "Zamknij", "");
				return 0;
			}
		}
		new przedtyp = GetPVarInt(playerid, "TypM");
		if(przedtyp != P_KOMPONENTY)
		{
			if(Jednoslady(GetPlayerVehicleID(idGracza)))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz tego zrobiæ dla tego pojazdu.", "Zamknij", "");
				return 0;
			}
		}
		NaprawiaID[playerid] = idGracza;
		NaprawianieCena[playerid] = cena;
		NaprawiaVeh[playerid] = GetPlayerVehicleID(idGracza);
		NaprawianieVW[playerid] = GetVehicleVirtualWorld(GetPlayerVehicleID(idGracza));
		NaprawiaIUID[playerid] = uz;
		Oferuj(playerid, idGracza, uz, 0, 0, 0, OFEROWANIE_NAP_VEH, cena, "", 0);
	    return 1;
	}
	if(dialogid == DIALOG_HOLOWANIE)
	{
	    if( !response )
	        return 1;
		new uz = GetPVarInt(playerid, "UzytyItem");
		new cena, idGracza;
	    sscanf(inputtext, "dd", idGracza, cena);
		if(idGracza == playerid) return 1;
		if(!PlayerObokPlayera(playerid, idGracza, 40))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Musisz siê znajdowaæ obok gracza, aby mu coœ oferowaæ.", "Zamknij", "");
			return 0;
		}
		if(zalogowany[idGracza] == false)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Gracz nie jest zalogowany.", "Zamknij", "");
			return 0;
		}
		if(!IsPlayerInAnyVehicle(idGracza))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Gracz nie znajduje siê w pojezdzie.", "Zamknij", "");
			return 0;
		}
		if(GetPlayerState(idGracza) != PLAYER_STATE_PASSENGER)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Gracz nie mo¿e znajdywaæ siê za kierownic¹.", "Zamknij", "");
			return 0;
		}
		if(!Wlascicielpojazdu(GetPlayerVehicleID(idGracza), idGracza))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ten gracz nie jest w³aœcicielem tego pojazdu.", "Zamknij", "");
			return 0;
		}
		if(cena <= 0)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Wprowadzona kwota jest niepoprawna.", "Zamknij", "");
			return 0;
		}
		Oferuj(playerid, idGracza, GetPlayerVehicleID(idGracza), SprawdzCarUID(GetPlayerVehicleID(idGracza)), uz, 0, OFEROWANIE_HOLOWANIA, cena, "", 0);
	    return 1;
	}
	if(dialogid == DIALOG_OFFER_NAPRAWE)
	{
	    if( !response )
	        return 1;
		new cena, idGracza;
	    sscanf(inputtext, "dd", idGracza, cena);
		if(idGracza == playerid) return 1;
		if(!PlayerObokPlayera(playerid, idGracza, 5))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Musisz siê znajdowaæ obok gracza, aby mu coœ oferowaæ.", "Zamknij", "");
			return 0;
		}
		if(zalogowany[idGracza] == false)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Gracz nie jest zalogowany.", "Zamknij", "");
			return 0;
		}
		if(!IsPlayerInAnyVehicle(idGracza))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Gracz nie znajduje siê w pojezdzie.", "Zamknij", "");
			return 0;
		}
		if(!Wlascicielpojazdu(GetPlayerVehicleID(idGracza), idGracza))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ten gracz nie jest w³aœcicielem tego pojazdu.", "Zamknij", "");
			return 0;
		}
		if(cena <= 0)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Wprowadzona kwota jest niepoprawna.", "Zamknij", "");
			return 0;
		}
	    new uz = GetPVarInt(playerid, "UzytyItem");
		NaprawiaID[playerid] = idGracza;
		NaprawianieCena[playerid] = cena;
		NaprawiaVeh[playerid] = GetPlayerVehicleID(idGracza);
		NaprawianieVW[playerid] = GetVehicleVirtualWorld(GetPlayerVehicleID(idGracza));
		NaprawiaIUID[playerid] = uz;
		Oferuj(playerid, idGracza, uz, 0, 0, 0, OFEROWANIE_NAP_VEH, cena, "", 0);
	    return 1;
	}
	if(dialogid == DIALOG_STWORZ_DZ)
	{
	    if( !response )
		{
			DeletePVar(playerid, "IDDZGR");
			DeletePVar(playerid, "NAZWADZST");
		    return 1;
		}
		new zmien[25];
		strdel(zmien, 0, 25);
		GetPVarString(playerid, "NAZWADZST", zmien, 25);
		switch(listitem)
		{
		    case 0:
			{
				new id_gracza = GetPVarInt(playerid, "IDDZGR");
			    Oferuj(playerid, id_gracza, DZIALALNOSC_WARSZTAT, DaneGracza[playerid][gSluzba], 0, 0, OFEROWANIE_DZIALA, 3000,zmien, 0);
				DeletePVar(playerid, "IDDZGR");
				DeletePVar(playerid, "NAZWADZST");
		        return 1;
			}
			case 1:
			{
				new id_gracza = GetPVarInt(playerid, "IDDZGR");
				Oferuj(playerid, id_gracza, DZIALALNOSC_247, DaneGracza[playerid][gSluzba], 0, 0, OFEROWANIE_DZIALA, 3000,zmien, 0);
				DeletePVar(playerid, "IDDZGR");
				DeletePVar(playerid, "NAZWADZST");
		        return 1;
			}
			case 2:
			{
				new id_gracza = GetPVarInt(playerid, "IDDZGR");
				Oferuj(playerid, id_gracza, DZIALALNOSC_ELEKTRTYKA, DaneGracza[playerid][gSluzba], 0, 0, OFEROWANIE_DZIALA, 3000,zmien, 0);
				DeletePVar(playerid, "IDDZGR");
				DeletePVar(playerid, "NAZWADZST");
		        return 1;
			}
			case 3:
			{
				new id_gracza = GetPVarInt(playerid, "IDDZGR");
				Oferuj(playerid, id_gracza, DZIALALNOSC_GASTRONOMIA, DaneGracza[playerid][gSluzba], 0, 0, OFEROWANIE_DZIALA, 3000,zmien, 0);
				DeletePVar(playerid, "IDDZGR");
				DeletePVar(playerid, "NAZWADZST");
		        return 1;
			}
			case 4:
			{
				new id_gracza = GetPVarInt(playerid, "IDDZGR");
				Oferuj(playerid, id_gracza, DZIALALNOSC_HOTEL, DaneGracza[playerid][gSluzba], 0, 0, OFEROWANIE_DZIALA, 3000,zmien, 0);
				DeletePVar(playerid, "IDDZGR");
				DeletePVar(playerid, "NAZWADZST");
		        return 1;
			}
			case 5:
			{
				new id_gracza = GetPVarInt(playerid, "IDDZGR");
				Oferuj(playerid, id_gracza, DZIALALNOSC_TAXI, DaneGracza[playerid][gSluzba], 0, 0, OFEROWANIE_DZIALA, 3000,zmien, 0);
				DeletePVar(playerid, "IDDZGR");
				DeletePVar(playerid, "NAZWADZST");
		        return 1;
			}
			case 6:
			{
				new id_gracza = GetPVarInt(playerid, "IDDZGR");
				Oferuj(playerid, id_gracza, DZIALALNOSC_SILOWNIA, DaneGracza[playerid][gSluzba], 0, 0, OFEROWANIE_DZIALA, 3000,zmien, 0);
				DeletePVar(playerid, "IDDZGR");
				DeletePVar(playerid, "NAZWADZST");
		        return 1;
			}
			case 7:
			{
				new id_gracza = GetPVarInt(playerid, "IDDZGR");
				Oferuj(playerid, id_gracza, DZIALALNOSC_SANNEWS, DaneGracza[playerid][gSluzba], 0, 0, OFEROWANIE_DZIALA, 3000,zmien, 0);
				DeletePVar(playerid, "IDDZGR");
				DeletePVar(playerid, "NAZWADZST");
		        return 1;
			}
			case 8:
			{
				new id_gracza = GetPVarInt(playerid, "IDDZGR");
				Oferuj(playerid, id_gracza, DZIALALNOSC_SIEC, DaneGracza[playerid][gSluzba], 0, 0, OFEROWANIE_DZIALA, 3000,zmien, 0);
				DeletePVar(playerid, "IDDZGR");
				DeletePVar(playerid, "NAZWADZST");
		        return 1;
			}
			case 9:
			{
				new id_gracza = GetPVarInt(playerid, "IDDZGR");
				Oferuj(playerid, id_gracza, DZIALALNOSC_STRZELNICA, DaneGracza[playerid][gSluzba], 0, 0, OFEROWANIE_DZIALA, 3000,zmien, 0);
				DeletePVar(playerid, "IDDZGR");
				DeletePVar(playerid, "NAZWADZST");
		        return 1;
			}
			case 10:
			{
				new id_gracza = GetPVarInt(playerid, "IDDZGR");
				Oferuj(playerid, id_gracza, DZIALALNOSC_AMUNATION, DaneGracza[playerid][gSluzba], 0, 0, OFEROWANIE_DZIALA, 3000,zmien, 0);
				DeletePVar(playerid, "IDDZGR");
				DeletePVar(playerid, "NAZWADZST");
		        return 1;
			}
		}
	}
	if(dialogid == DIALOG_POJAZD_OPCJE_DZ)
	{
	    new uid = GetPVarInt(playerid, "OPCJAPOJAZDY");
	    if( !response )
	        return 1;
		switch(listitem)
		{
		    case 0:
			{
			    if(PojazdInfo[uid][pSpawn] == 0)
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aby namierzyæ pojazd musi on byæ zespawnowany.", "Zamknij", "");
				    return 0;
				}
			    new Float:X, Float:Y, Float:Z;
			    GetVehiclePos(PojazdInfo[uid][pID], X, Y, Z);
			    SetPlayerCheckpoint(playerid, X, Y, Z, 5.0);
		        return 1;
			}
			case 1:
			{
				if(!ZarzadzaniePojazdami(uid, playerid))
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Brak uprawnieñ do tej opcji", "Zamknij", "");
				    return 0;
				}
				if(PojazdInfo[uid][pSpawn] != 0)
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aby zresetowaæ pojazd na spawnpoint musi on byæ unspawnowany.", "Zamknij", "");
				    return 0;
				}
			    dShowPlayerDialog(playerid, DIALOG_POJAZD_OPCJE_RESET, DIALOG_STYLE_MSGBOX, "• Informacja:", "Czy aby na pewno chesz zresetowaæ spawnpoint swojego pojazdu?\nPamiêtaj zresetowanie pozycji pojazdu wi¹¿e siê z na³o¿eniem blokady na ko³o o wartoœci 100$", "Tak", "Nie");
		        return 1;
			}
			case 2:
			{
				if(PojazdInfo[uid][pSpawn] != 0)
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aby usun¹æ pojazd musi on byæ unspawnowany.", "Zamknij", "");
				    return 0;
				}
			    if(!WlascicielGrupyOwnerUID(uid, playerid))
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Brak uprawnieñ do tej opcji", "Zamknij", "");
				    return 0;
				}
			    dShowPlayerDialog(playerid, DIALOG_POJAZD_OPCJE_DEL, DIALOG_STYLE_MSGBOX, "• Informacja:", "Czy aby na pewno chesz usun¹æ swój pojazd z Grupy?\nPamiêtaj ta opcja nie jest odwracalna.", "Tak", "Nie");
		        return 1;
			}
			case 3:
			{
				if(!ZarzadzaniePojazdamiDlaDz(uid, playerid, DZIALALNOSC_ZMOTORYZOWANA))
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ta opcja jest dostêpna tylko dla Grupy przestêpczych.", "Zamknij", "");
				    return 0;
				}
				if(PojazdInfo[uid][pSpawn] == 0)
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aby odpisaæ pojazd musi on byæ zespawnowany.", "Zamknij", "");
				    return 0;
				}
			    dShowPlayerDialog(playerid, DIALOG_POJAZD_OPCJE_ODPISZ, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ta opcja jest niedostêpna dla graczy.", "Zamknij", "");
		        return 1;
			}
		}
	}
	if(dialogid == DIALOG_POJAZD_OPCJE_RESET)
	{
	    if(!response)
		{
		    return 0;
		}
		new uid = GetPVarInt(playerid, "OPCJAPOJAZDY");
		if(PojazdInfo[uid][pSpawn] != 0)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aby zresetowaæ pojazd musi on byæ odspawnowany.", "Zamknij", "");
		    return 0;
		}
		PojazdInfo[uid][pBlokada] = 100;
		PojazdInfo[uid][pX] = 929.5447;
		PojazdInfo[uid][pY] = -1221.7166;
		PojazdInfo[uid][pZ] = 16.8016;
		new rok, miesiac, dzien, godzina, minuta, sekunda;
		sekundytodata(gettime()+CZAS_LETNI, rok, miesiac, dzien, godzina, minuta, sekunda);
		printf("[UID_POJAZDU:%d][%02d-%02d-%d, %02d:%02d][Reset Pojazdu] Gracz: %s (UID: %d, GUID: %d) zresetowal pojazd (UID: %d) na spawnpoint.[KONIEC_LOGU]",uid, dzien, miesiac, rok, godzina, minuta, ZmianaNicku(playerid), DaneGracza[playerid][gUID], DaneGracza[playerid][gGUID], uid);
		Transakcja(T_VRESET, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, 100, uid, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Pojazd zosta³ zresetowany na spawnpoint.", "Zamknij", "");
	    return 1;
	}
	if(dialogid == DIALOG_ITEM_CD)
    {
        new uid2 = GetPVarInt(playerid, "UIDWeaponAmmo");
        if(response)
        {
            format(PrzedmiotInfo[uid2][pWar3], 124, "%s", inputtext);
		    dShowPlayerDialog(playerid, DIALOG_ITEM_CD2, DIALOG_STYLE_INPUT, "• Informacja:", "Teraz mo¿esz nadaæ nazwe nagranej p³ycie:", "Zapisz", "Wyjdz");
        }
        else
        {
			format(PrzedmiotInfo[uid2][pWar3], 124, "", inputtext);
            return 1;
        }
        return 1;
    }
	if(dialogid == DIALOG_WEDKA_ZYLKA)
    {
        new uid = strval(inputtext);
        new uid2 = GetPVarInt(playerid, "UIDWeaponAmmo");
        if(response)
        {
			if(PrzedmiotInfo[uid][pWar2] != 0)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ta wêdka posiada ju¿ nawiniêt¹ ¿y³ke.", "Zamknij", "");
				return 0;
			}
            PrzedmiotInfo[uid][pWar2] = 1;
		    UsunPrzedmiot(uid2);
			ZapiszPrzedmiot(uid);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "¯y³ka zosta³a nawiniêta na twoj¹ wêdke.", "Zamknij", "");
        }
        else
        {
            return 1;
        }
        return 1;
    }
	if(dialogid == DIALOG_WEDKA_PRZYNETA)
    {
        new uid = strval(inputtext);
        new uid2 = GetPVarInt(playerid, "UIDWeaponAmmo");
        if(response)
        {
			if(PrzedmiotInfo[uid2][pWar1] == 1)
			{
				if(!ComparisonString(PrzedmiotInfo[uid][pWar3], "A"))
				{
					PrzedmiotInfo[uid][pWar4] = PrzedmiotInfo[uid2][pWar2];
					CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
					TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
					TextDrawSetString(TextNaDrzwi[playerid], "Stara przyneta jest inna niz wybrana przez Ciebie, wiec zostala zamieniona na nowa.");
					TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
				}
				else
				{
					PrzedmiotInfo[uid][pWar4] += PrzedmiotInfo[uid2][pWar2];
				}
				format(PrzedmiotInfo[uid][pWar3], 124, "A");
			}
			if(PrzedmiotInfo[uid2][pWar1] == 2)
			{
				if(!ComparisonString(PrzedmiotInfo[uid][pWar3], "B"))
				{
					PrzedmiotInfo[uid][pWar4] = PrzedmiotInfo[uid2][pWar2];
					CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
					TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
					TextDrawSetString(TextNaDrzwi[playerid], "Stara przyneta jest inna niz wybrana przez Ciebie, wiec zostala zamieniona na nowa.");
					TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
				}
				else
				{
					PrzedmiotInfo[uid][pWar4] += PrzedmiotInfo[uid2][pWar2];
				}
				format(PrzedmiotInfo[uid][pWar3], 124, "B");
			}
			if(PrzedmiotInfo[uid2][pWar1] == 3)
			{
				if(!ComparisonString(PrzedmiotInfo[uid][pWar3], "C"))
				{
					PrzedmiotInfo[uid][pWar4] = PrzedmiotInfo[uid2][pWar2];
					CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
					TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
					TextDrawSetString(TextNaDrzwi[playerid], "Stara przyneta jest inna niz wybrana przez Ciebie, wiec zostala zamieniona na nowa.");
					TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
				}
				else
				{
					PrzedmiotInfo[uid][pWar4] += PrzedmiotInfo[uid2][pWar2];
				}
				format(PrzedmiotInfo[uid][pWar3], 124, "C");
			}
            PrzedmiotInfo[uid][pWar4] += PrzedmiotInfo[uid2][pWar2];
		    UsunPrzedmiot(uid2);
			ZapiszPrzedmiot(uid);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Przynêta zosta³a na³o¿ona na haczyk.", "Zamknij", "");
        }
        else
        {
            return 1;
        }
        return 1;
    }
	if(dialogid == DIALOG_WEDKA_HACZYK)
    {
        new uid = strval(inputtext);
        new uid2 = GetPVarInt(playerid, "UIDWeaponAmmo");
        if(response)
        {
			if(PrzedmiotInfo[uid][pWar1] != 0)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ta wêdka posiada ju¿ haczyk.", "Zamknij", "");
				return 0;
			}
            PrzedmiotInfo[uid][pWar1] = 1;
		    UsunPrzedmiot(uid2);
			ZapiszPrzedmiot(uid);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Haczyk zosta³ przywi¹zoany do ¿y³ki..", "Zamknij", "");
        }
        else
        {
            return 1;
        }
        return 1;
    }
	if(dialogid == DIALOG_AMMO_NALADUJ)
    {
        new uid = strval(inputtext);
        new uid2 = GetPVarInt(playerid, "UIDWeaponAmmo");
        if(response)
        {
			if(PrzedmiotInfo[uid][pUzywany] != 0)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Przedmiot do którego chcesz za³adowaæ amunicje nie mo¿e byæ u¿ywany.", "Zamknij", "");
				return 0;
			}
			if(PrzedmiotInfo[uid2][pWar2] == 0)
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ten magazynek nie posiada w sobie amunicji!", "Zamknij", "");
				return 0;
			}
			if(PrzedmiotInfo[uid][pWar4] >= 0 && PrzedmiotInfo[uid2][pWar4] == 0 || PrzedmiotInfo[uid][pWar4] == -1 && PrzedmiotInfo[uid2][pWar4] == -1)
			{
				PrzedmiotInfo[uid][pWar2] += PrzedmiotInfo[uid2][pWar2];
				new logtekst[256];
				format(logtekst, sizeof(logtekst), "[Things] [%s] [ID: %d] add amunation %d to things %s finish ammo %d", ZmianaNicku(playerid), playerid, PrzedmiotInfo[uid2][pWar2], PrzedmiotInfo[uid][pNazwa], PrzedmiotInfo[uid][pWar2]);
				Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
				UsunPrzedmiot(uid2);
				ZapiszPrzedmiot(uid);
				if(PrzedmiotInfo[uid][pWar1] == 43)
				{
					cmd_fasdasfdfive(playerid, "wk³ada kartê pamiêci do aparatu.");
					new akcja[126];
					format(akcja,sizeof(akcja),"*wklada karte pamieci do aparatu*", akcja);
					SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
					new akcja2[126];
					format(akcja2,sizeof(akcja2),"wklada karte pamieci do aparatu");
					TextDrawSetString(AkcjaTD[playerid], akcja2);
					TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
					CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
				}
				else
				{
					cmd_fasdasfdfive(playerid, "uzupe³nia amunicjê swojej broni.");
					new akcja[126];
					format(akcja,sizeof(akcja),"*uzupe³nia amunicjê swojej broni*", akcja);
					SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
					new akcja2[126];
					format(akcja2,sizeof(akcja2),"uzupelnia amunicje swojej broni");
					TextDrawSetString(AkcjaTD[playerid], akcja2);
					TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
					CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
				}
			}
			else
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz za³adowaæ amunicji z bronii legalnej do nielegalnej lub odwrotnie!", "Zamknij", "");
				return 0;
			}
        }
        else
        {
            return 1;
        }
        return 1;
    }
    if(dialogid == DIALOG_TELEFON_SIM)
    {
        new uid = strval(inputtext);
        new uid2 = GetPVarInt(playerid, "UIDTelefonSIM");
        if(response)
        {
			if(PrzedmiotInfo[uid][pUzywany] == 0)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Telefon do którego chcesz wlo¿yæ kartê SIM musi byæ w³¹czony.", "Zamknij", "");
				return 0;
			}
			if(PrzedmiotInfo[uid][pWar2] > 0)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Telefon do którego chcesz wlo¿yæ kartê SIM nie mo¿e posiadaæ innej karty SIM\nWyci¹gnij star¹ karte SIM i w³ó¿ now¹!.", "Zamknij", "");
				return 0;
			}
            PrzedmiotInfo[uid][pWar2] = PrzedmiotInfo[uid2][pUID]+PrzedmiotInfo[uid2][pWar2];
            DaneGracza[playerid][gTelefon] = PrzedmiotInfo[uid2][pUID]+PrzedmiotInfo[uid2][pWar2];
            PrzedmiotInfo[uid2][pUzywany] = 1;
            ZapiszGracza(playerid);
			ZapiszPrzedmiot(uid);
			ZapiszPrzedmiot(uid2);
			//dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Karta SIM zosta³a poprawnie w³o¿ona do telefonu.", "Zamknij", "");
            cmd_fasdasfdfive(playerid, "wk³ada kartê SIM do smartfona.");
			new akcja[126];
			format(akcja,sizeof(akcja),"*wk³ada kartê SIM do smartfona*", akcja);
			SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
			new akcja2[126];
			format(akcja2,sizeof(akcja2),"wklada karte SIM do smartfona");
			TextDrawSetString(AkcjaTD[playerid], akcja2);
			TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
			CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
        }
        else
        {
            return 1;
        }
        return 1;
    }
    if(dialogid == DIALOG_ITEM_CD2)
    {
        new uid2 = GetPVarInt(playerid, "UIDWeaponAmmo");
        if(response)
        {
            format(PrzedmiotInfo[uid2][pNazwa], 32, "CD: %s", inputtext);
            cmd_fasdasfdfive(playerid, "nagrywa p³ytkê CD.");
			new akcja[126];
			format(akcja,sizeof(akcja),"*nagrywa p³ytkê CD*");
			SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
			new akcja2[126];
			format(akcja2,sizeof(akcja2),"nagrywa plytke CD");
			TextDrawSetString(AkcjaTD[playerid], akcja2);
			TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
			CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
		    ZapiszPrzedmiot(uid2);
		}
        else
        {
            return 1;
        }
        return 1;
    }
	if(dialogid == DIALOG_POJAZD_OPCJE_DEL)
	{
	    if(!response)
		{
		    return 0;
		}
		new uid = GetPVarInt(playerid, "OPCJAPOJAZDY");
		UsunPojazd(uid);
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Pojazd zosta³ usuniêty.", "Zamknij", "");
	    return 1;
	}
	if(dialogid == DIALOG_POJAZD_OPCJE_ODPISZ)
	{
	    if(!response)
		{
		    return 0;
		}
		new uid = GetPVarInt(playerid, "OPCJAPOJAZDY");
		if(PojazdInfo[uid][pSpawn] == 0)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aby zresetowaæ pojazd musi on byæ zespawnowany.", "Zamknij", "");
		    return 0;
		}
		PojazdInfo[uid][pOwnerPostac] = DaneGracza[playerid][gUID];
		Transakcja(T_VODP, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, uid, PojazdInfo[uid][pOwnerDzialalnosc], -1, "-", gettime()+KOREKTA_CZASOWA);
		new rok, miesiac, dzien, godzina, minuta, sekunda;
		sekundytodata(gettime()+CZAS_LETNI, rok, miesiac, dzien, godzina, minuta, sekunda);
		printf("[UID_POJAZDU:%d][%02d-%02d-%d, %02d:%02d][Odpisanie Pojazdu] Gracz: %s (UID: %d, GUID: %d) odpisal pojazd (UID: %d) z grupy (UID: %d).[KONIEC_LOGU]",uid, dzien, miesiac, rok, godzina, minuta, ZmianaNicku(playerid), DaneGracza[playerid][gUID], DaneGracza[playerid][gGUID], uid, PojazdInfo[uid][pOwnerDzialalnosc]);
		PojazdInfo[uid][pOwnerDzialalnosc] = 0;
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Pojazd zosta³ odpisany od Grupy.", "Zamknij", "");
	    return 1;
	}
	if(dialogid == DIALOG_PRZEDZMIOTY_PODNIES)
	{
	    if(response)
		{
		    new uid = strval(inputtext);
		    if(!IsPlayerInRangeOfPoint(playerid, 8, PrzedmiotInfo[uid][pX], PrzedmiotInfo[uid][pY], PrzedmiotInfo[uid][pZ]) && PrzedmiotInfo[uid][pTypWlas] != TYP_ULICA)
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ten przedmiot nie znajduje siê obok Ciebie!", "Zamknij", "");
			    return 1;
			}
			PrzedmiotInfo[uid][pX] = 0;
			PrzedmiotInfo[uid][pY] = 0;
			PrzedmiotInfo[uid][pZ] = 0;
			PrzedmiotInfo[uid][pVW] = 0;
			PrzedmiotInfo[uid][pTypWlas] = TYP_WLASCICIEL;
			PrzedmiotInfo[uid][pOwner] = DaneGracza[playerid][gUID];
			DestroyDynamicObject(PrzedmiotInfo[uid][pIDOB]);
		    ZapiszPrzedmiot(uid);
			strdel(tekst_global, 0, 2048);
		    Transakcja(T_IPODNIES, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, uid, PrzedmiotInfo[uid][pTyp], PrzedmiotInfo[uid][pWar1], "-", gettime()+KOREKTA_CZASOWA);
		    format(tekst_global, sizeof(tekst_global), "* %s podnosi jakiœ przedmiot z ziemi.", ZmianaNicku(playerid));
			SendWrappedMessageToPlayerRange(playerid, FIOLETOWY, tekst_global, 10);
			new akcja[126];
			format(akcja,sizeof(akcja),"*podnosi jakiœ przedmiot z ziemi*");
			SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
			new akcja2[126];
			format(akcja2,sizeof(akcja2),"podnosi jakis przedmiot z ziemi");
			TextDrawSetString(AkcjaTD[playerid], akcja2);
			TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
			CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 0, 0, 0, 0, 0);
		}
		else return 1;
	}
	if(dialogid == DIALOG_PRZEDZMIOTY_PODNIES_VEH)
	{
	    if(response)
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if(IsPlayerInAnyVehicle(playerid))
			{
				if(!WlascicielpojazduBezWYP(vehicleid, playerid))
				{
					GameTextForPlayer(playerid, "~r~Brak uprawnien.", 3000, 5);
					return 0;
				}
			}
			strdel(tekst_global, 0, 2048);
			new uid = strval(inputtext);
			PrzedmiotInfo[uid][pX] = 0;
			PrzedmiotInfo[uid][pY] = 0;
			PrzedmiotInfo[uid][pZ] = 0;
			PrzedmiotInfo[uid][pVW] = 0;
			PrzedmiotInfo[uid][pTypWlas] = TYP_WLASCICIEL;
			PrzedmiotInfo[uid][pOwner] = DaneGracza[playerid][gUID];
			ZapiszPrzedmiot(uid);
			Transakcja(T_IPODNIES, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, uid, PrzedmiotInfo[uid][pTyp], PrzedmiotInfo[uid][pWar1], "-", gettime()+KOREKTA_CZASOWA);
			format(tekst_global, sizeof(tekst_global), "* %s podnosi jakiœ przedmiot w pojeŸdzie.", ZmianaNicku(playerid), PrzedmiotInfo[uid][pNazwa]);
			SendWrappedMessageToPlayerRange(playerid, FIOLETOWY, tekst_global, 10);
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 0, 0, 0, 0, 0);
			new akcja[126];
			format(akcja,sizeof(akcja),"*podnosi jakiœ przedmiot w pojeŸdzie*");
			SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
			new akcja2[126];
			format(akcja2,sizeof(akcja2),"podnosi jakis przedmiot w pojezdzie");
			TextDrawSetString(AkcjaTD[playerid], akcja2);
			TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
			CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
			if(GetPVarInt(playerid, "PDVehPodnies") == 1)
			{
				new przelew[124];
				format(przelew, sizeof(przelew), "[OSTRZE¯ENIE] Gracz: %s (ID:%d) podnosi przedmiot %s na s³u¿bie org. porz¹dkowej z pojazdu.",ZmianaNicku(playerid), playerid, PrzedmiotInfo[uid][pNazwa]);
				KomunikatAdmin(1, przelew);
				SetPVarInt(playerid, "PDVehPodnies", 0);
			}
		}
		else return 1;
	}
	if(dialogid == DIALOG_PRZEDZMIOTY_PODNIES_SZAFA)
	{
	    if(response)
		{
			strdel(tekst_global, 0, 2048);
		    new uid = strval(inputtext);
			PrzedmiotInfo[uid][pX] = 0;
			PrzedmiotInfo[uid][pY] = 0;
			PrzedmiotInfo[uid][pZ] = 0;
			PrzedmiotInfo[uid][pVW] = 0;
			PrzedmiotInfo[uid][pTypWlas] = TYP_WLASCICIEL;
			PrzedmiotInfo[uid][pOwner] = DaneGracza[playerid][gUID];
		    ZapiszPrzedmiot(uid);
		    Transakcja(T_IPODNIES, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, uid, PrzedmiotInfo[uid][pTyp], PrzedmiotInfo[uid][pWar1], "-", gettime()+KOREKTA_CZASOWA);
		    format(tekst_global, sizeof(tekst_global), "* %s wyci¹ga przedmiot z szafy.", ZmianaNicku(playerid), PrzedmiotInfo[uid][pNazwa]);
			SendWrappedMessageToPlayerRange(playerid, FIOLETOWY, tekst_global, 10);
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 0, 0, 0, 0, 0);
			new akcja[126];
			format(akcja,sizeof(akcja),"*wyci¹ga przedmiot z szafy*");
			SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
			new akcja2[126];
			format(akcja2,sizeof(akcja2),"wyciaga przedmiot z szafy");
			TextDrawSetString(AkcjaTD[playerid], akcja2);
			TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
			CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
		}
		else return 1;
	}
	if(dialogid == DIALOG_DZIALALNOSCI)
	{
	    if(response)
		{
			if(listitem > 2)
			{
				if(!GraczPremium(playerid))
				{
					return 0;
				}
			}
		    SetPVarInt(playerid, "NRZLISTY", strval(inputtext));
		    dShowPlayerDialog(playerid, DIALOG_DZIALALNOSCI_OPCJE, DIALOG_STYLE_LIST, "• Grupa :", "» Wejdz na s³u¿be\n» Informacje o grupie\n» Magazyn grupy\n» Lista graczy\n» Pojazdy grupy", "Wybierz", "Zamknij");
		}
		else return 1;
	}
	if(dialogid == DIALOG_DRZWI_OPCJE2)
	{
	    if(response)
		{
			switch(listitem)
			{
				case 0:
				{
        			new uids = GetPVarInt(playerid, "uiddrzwi");
					strdel(tekst_global, 0, 2048);
					format(tekst_global, sizeof(tekst_global), "%s~y~%s~n~~n~~p~Owner:~w~ %d:%d  UID: %d  Obiekty: %d~n~~r~Wejscie:~w~ %0.02f,  %0.02f,  %0.02f", tekst_global,BudynekInfo[uids][nAdres],BudynekInfo[uids][nWlascicielP],BudynekInfo[uids][nWlascicielD],uids,BudynekInfo[uids][nLiczbaMebli],BudynekInfo[uids][nX],BudynekInfo[uids][nY],BudynekInfo[uids][nZ],BudynekInfo[uids][nXW],BudynekInfo[uids][nYW],BudynekInfo[uids][nZW]);
					format(tekst_global, sizeof(tekst_global), "%s~n~~r~Wyjscie:~w~ %0.02f,  %0.02f,  %0.02f", tekst_global,BudynekInfo[uids][nXW],BudynekInfo[uids][nYW],BudynekInfo[uids][nZW]);
					format(tekst_global, sizeof(tekst_global), "%s~n~~n~~b~Vw: ~w~%d~b~  Int:~w~ %d~n~~b~Zew. Vw: ~w~%d~b~  Zew.Int: ~w~%d~n~~b~Stworzone obiekty: ~w~%d~n~~b~Metraz: ~w~%.2f m2~n~~b~Teren: ~w~%d", tekst_global,BudynekInfo[uids][nVW],BudynekInfo[uids][nINT],BudynekInfo[uids][nVWW],BudynekInfo[uids][nINTW],BudynekInfo[uids][nStworzoneObiekty], BudynekInfo[uids][nPowieszchnia], BudynekInfo[uids][nArea]);
					TextDrawSetString(OBJ[playerid], tekst_global);
					TextDrawShowForPlayer(playerid, OBJ[playerid]);
					SetTimerEx("NapisUsunsV",7000,0,"d",playerid);
					return 1;
				}
				case 1:
				{
				    //Ochrona
				}
				case 2:
				{
                    new id = GetPVarInt(playerid, "uiddrzwi");
                    if(GetPlayerVirtualWorld(playerid) == 0)
    				{
	     				if(BudynekInfo[id][nZamek] == 1)
						{
							format(tekst_global, sizeof(tekst_global), "u¿y³ dzwonka do drzwi %d.", BudynekInfo[id][nUID]);
							cmd_fasdasfdfive(playerid, tekst_global);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										if(i != playerid && BudynekInfo[id][nVWW] == GetPlayerVirtualWorld(i))
										{
											DzwonekDom[i] = 3;
											DzwonekDom2[i] = id;
										}
									}
								}
							}
							DzwonekDom[playerid] = 3;
							DzwonekDom2[playerid] = id;
						}
						else
						{
					        format(tekst_global, sizeof(tekst_global), "u¿y³ dzwonka do drzwi %d.", BudynekInfo[id][nUID]);
							cmd_fasdasfdfive(playerid, tekst_global);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										if(i != playerid && BudynekInfo[id][nVWW] == GetPlayerVirtualWorld(i))
										{
											DzwonekDom[i] = 3;
											DzwonekDom2[i] = id;
										}
									}
								}
							}
							DzwonekDom[playerid] = 3;
							DzwonekDom2[playerid] = id;
						}
					}
				}
				case 3:
				{
				    new weaponid = GetPlayerWeapon(playerid);
				    if(weaponid == 25)
				    {
					   new id = GetPVarInt(playerid, "uiddrzwi");
						if(BudynekInfo[id][nZamek] == 0)
						{
							format(tekst_global, sizeof(tekst_global), "podchodzi do budynku nr %d, nastepnie zaczyna wywazac drzwi budynku.", BudynekInfo[id][nUID]);
							cmd_fasdasfdfive(playerid, tekst_global);
							new akcja[126];
							format(akcja,sizeof(akcja),"*podchodzi do budynku nr %d, nastepnie zaczyna wywzac drzwi budynku*", BudynekInfo[id][nUID]);
							SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
							new akcja2[126];
							format(akcja2,sizeof(akcja2),"podchodzi do budynku nr %d, nastepnie zaczyna wywazac drzwi budynku", BudynekInfo[id][nUID]);
							TextDrawSetString(AkcjaTD[playerid], akcja2);
							TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
							CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
							Wywaz[playerid] = 30;
							SetPVarInt(playerid, "Wywaz2", id);
							SetPVarFloat(playerid, "WywazX", BudynekInfo[id][nX]);
							SetPVarFloat(playerid, "WywazY", BudynekInfo[id][nY]);
							SetPVarFloat(playerid, "WywazZ", BudynekInfo[id][nZ]);
						}
					}
					else
					{
					    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz wywa¿yæ tych drzwi poniewa¿ nie masz wyci¹gniêtego Shotguna!", "Zamknij", "");
						return 0;
					}
				}
			}
		}
	}
	if(dialogid == DIALOG_MEMBERS_UPRAWNIENIA)
	{
		if(response)
		{
			new id = GetPVarInt(playerid, "Members");
			new grupa = GetPVarInt(playerid, "MembersGrupa");
			switch(listitem)
			{
				case 0:
				{//Zarz¹dzanie grup¹
					if(!ZarzadzanieGrupaUID(playerid, grupa))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nie posiadasz uprawnieñ do zarz¹dzania grup¹ by zmieniaæ uprawnienia osob¹ w tej grupie", "Zamknij", "");
						return 0;
					}
					if(Pracownik[id][invUID] != GrupaInfo[grupa][gOwnerUID] && DaneGracza[playerid][gUID] != Pracownik[id][invUID])
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nie mo¿esz edytowaæ tej rangi, gdy ta osoba jest ownerem grupy!", "Zamknij", "");
						return 0;
					}
					if(Pracownik[id][inv1] == 1)
					{
						Pracownik[id][inv1] = 0;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `1`= '%d' WHERE `ID`= '%d'", Pracownik[id][inv1], id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzania grup¹ zosta³o zabrane.", "Zamknij", "");
						return 1;
					}
					else
					{
						Pracownik[id][inv1] = 1;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `1`= '%d' WHERE `ID`= '%d'", Pracownik[id][inv1], id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzania grup¹ zosta³o nadane.", "Zamknij", "");
						return 1;
					}
				}
				case 1:
				{//Mo¿liwoœæ wejœcia na s³u¿bê
					if(!ZarzadzanieGrupaUID(playerid, grupa))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nie posiadasz uprawnieñ do zarz¹dzania grup¹ by zmieniaæ uprawnienia osob¹ w tej grupie", "Zamknij", "");
						return 0;
					}
					if(Pracownik[id][inv2] == 1)
					{
						Pracownik[id][inv2] = 0;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `2`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv2],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Mo¿liwoœc wejœcia na s³u¿bê zosta³o zabrane.", "Zamknij", "");
						return 1;
					}
					else
					{
						Pracownik[id][inv2] = 1;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `2`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv2],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Mo¿liwoœæ wejœcia na s³u¿bê zosta³o nadane.", "Zamknij", "");
						return 1;
					}
				}
				case 2:
				{//Zamawianie przedmiotów
					if(!ZarzadzanieGrupaUID(playerid, grupa))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nie posiadasz uprawnieñ do zarz¹dzania grup¹ by zmieniaæ uprawnienia osob¹ w tej grupie", "Zamknij", "");
						return 0;
					}
					if(Pracownik[id][inv3] == 1)
					{
						Pracownik[id][inv3] = 0;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `3`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv3],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zamawianie przedmiotów zosta³o zabrane.", "Zamknij", "");
						return 1;
					}
					else
					{
						Pracownik[id][inv3] = 1;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `3`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv3],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zamawianie przedmiotów zosta³o nadane.", "Zamknij", "");
						return 1;
					}
				}
				case 3:
				{//Zar¿adzanie budynkiem
					if(!ZarzadzanieGrupaUID(playerid, grupa))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nie posiadasz uprawnieñ do zarz¹dzania grup¹ by zmieniaæ uprawnienia osob¹ w tej grupie", "Zamknij", "");
						return 0;
					}
					if(Pracownik[id][inv4] == 1)
					{
						Pracownik[id][inv4] = 0;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `4`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv4],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie budynkiem zosta³o zabrane.", "Zamknij", "");
						return 1;
					}
					else
					{
						Pracownik[id][inv4] = 1;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `4`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv4],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dznie budynkiem zosta³o nadane.", "Zamknij", "");
						return 1;
					}
				}
				case 4:
				{//Zarz¹dzanie szaf¹ w budynku
					if(!ZarzadzanieGrupaUID(playerid, grupa))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nie posiadasz uprawnieñ do zarz¹dzania grup¹ by zmieniaæ uprawnienia osob¹ w tej grupie", "Zamknij", "");
						return 0;
					}
					if(Pracownik[id][inv5] == 1)
					{
						Pracownik[id][inv5] = 0;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `5`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv5],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dznie szaf¹ w budynku zosta³o zabrane.", "Zamknij", "");
						return 1;
					}
					else
					{
						Pracownik[id][inv5] = 1;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `5`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv5],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dznie szaf¹ w budynku zosta³o nadane.", "Zamknij", "");
						return 1;
					}
				}
				case 5:
				{//Zarz¹dzanie bramami
					if(!ZarzadzanieGrupaUID(playerid, grupa))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nie posiadasz uprawnieñ do zarz¹dzania grup¹ by zmieniaæ uprawnienia osob¹ w tej grupie", "Zamknij", "");
						return 0;
					}
					if(Pracownik[id][inv6] == 1)
					{
						Pracownik[id][inv6] = 0;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `6`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv6],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie bramami zosta³o zabrane.", "Zamknij", "");
						return 1;
					}
					else
					{
						Pracownik[id][inv6] = 1;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `6`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv6],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie bramami zosta³o nadane.", "Zamknij", "");
						return 1;
					}
				}
				case 6:
				{//Mozliwoœæ u¿ywania kana³u OOC
					if(!ZarzadzanieGrupaUID(playerid, grupa))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nie posiadasz uprawnieñ do zarz¹dzania grup¹ by zmieniaæ uprawnienia osob¹ w tej grupie", "Zamknij", "");
						return 0;
					}
					if(Pracownik[id][inv7] == 1)
					{
						Pracownik[id][inv7] = 0;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `7`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv7],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Mo¿liwoœæ u¿ywania kana³u OOC zosta³o zabrane.", "Zamknij", "");
						return 1;
					}
					else
					{
						Pracownik[id][inv7] = 1;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `7`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv7],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Mo¿liwoœæ u¿ywania kana³u OOC zosta³o nadane.", "Zamknij", "");
						return 1;
					}
				}
				case 7:
				{//Mo¿liwoœc u¿ywania radia, czatu IC
					if(!ZarzadzanieGrupaUID(playerid, grupa))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nie posiadasz uprawnieñ do zarz¹dzania grup¹ by zmieniaæ uprawnienia osob¹ w tej grupie", "Zamknij", "");
						return 0;
					}
					if(Pracownik[id][inv8] == 1)
					{
						Pracownik[id][inv8] = 0;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `8`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv8],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Mo¿liwoœc u¿ywania radia (czatu IC) zosta³o zabrane.", "Zamknij", "");
						return 1;
					}
					else
					{
						Pracownik[id][inv8] = 1;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `8`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv8],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Mo¿liwoœc u¿ywania radia (czatu IC) zosta³o nadane.", "Zamknij", "");
						return 1;
					}
				}
				case 8:
				{//U¿ywanie mikrofonuu
					if(!ZarzadzanieGrupaUID(playerid, grupa))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nie posiadasz uprawnieñ do zarz¹dzania grup¹ by zmieniaæ uprawnienia osob¹ w tej grupie", "Zamknij", "");
						return 0;
					}
					if(Pracownik[id][inv9] == 1)
					{
						Pracownik[id][inv9] = 0;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `9`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv9],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "U¿ywanie mikrofonu zosta³o zabrane.", "Zamknij", "");
						return 1;
					}
					else
					{
						Pracownik[id][inv9] = 1;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `9`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv9],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "U¿ywanie mikrofonu zosta³o nadane.", "Zamknij", "");
						return 1;
					}
				}
				case 9:
				{//Podanie produktów
					if(!ZarzadzanieGrupaUID(playerid, grupa))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nie posiadasz uprawnieñ do zarz¹dzania grup¹ by zmieniaæ uprawnienia osob¹ w tej grupie", "Zamknij", "");
						return 0;
					}
					if(Pracownik[id][inv10] == 1)
					{
						Pracownik[id][inv10] = 0;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `10`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv10],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Podawanie produktów zosta³o zabrane.", "Zamknij", "");
						return 1;
					}
					else
					{
						Pracownik[id][inv10] = 1;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `10`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv10],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Podawanie produktów zosta³o nadane.", "Zamknij", "");
						return 1;
					}
				}
				case 10:
				{//Mo¿liwoœæ zapraszania do grupy
					if(!ZarzadzanieGrupaUID(playerid, grupa))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nie posiadasz uprawnieñ do zarz¹dzania grup¹ by zmieniaæ uprawnienia osob¹ w tej grupie", "Zamknij", "");
						return 0;
					}
					if(Pracownik[id][inv20] == 1)
					{
						Pracownik[id][inv20] = 0;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `20`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv20],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Mo¿liwoœæ zapraszania do grupy zosta³o zabrane.", "Zamknij", "");
						return 1;
					}
					else
					{
						Pracownik[id][inv20] = 1;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `20`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv20],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Mo¿liwoœæ zapraszania do grupy zosta³o nadane.", "Zamknij", "");
						return 1;
					}
				}
				case 11:
				{//Zarz¹dzanie pojazdami
					if(!ZarzadzanieGrupaUID(playerid, grupa))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nie posiadasz uprawnieñ do zarz¹dzania grup¹ by zmieniaæ uprawnienia osob¹ w tej grupie", "Zamknij", "");
						return 0;
					}
					if(Pracownik[id][inv21] == 1)
					{
						Pracownik[id][inv21] = 0;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `21`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv21],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie pojazdami zosta³o zabrane.", "Zamknij", "");
						return 1;
					}
					else
					{
						Pracownik[id][inv21] = 1;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `21`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv21],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie pojazdami zosta³o nadane.", "Zamknij", "");
						return 1;
					}
				}
				case 12:
				{//Otwieranie i zamykanie budynków
					if(!ZarzadzanieGrupaUID(playerid, grupa))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nie posiadasz uprawnieñ do zarz¹dzania grup¹ by zmieniaæ uprawnienia osob¹ w tej grupie", "Zamknij", "");
						return 0;
					}
					if(Pracownik[id][inv23] == 1)
					{
						Pracownik[id][inv23] = 0;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `23`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv23],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Otwieranie i zamykanie budynku zosta³o zabrane.", "Zamknij", "");
						return 1;
					}
					else
					{
						Pracownik[id][inv23] = 1;
						strdel(zapyt, 0, 512);
						format(zapyt, sizeof(zapyt),
						"UPDATE `jochym_pracownicy` SET `23`= '%d' WHERE `ID`= '%d'",
						Pracownik[id][inv23],
						id);
						mysql_query(zapyt);
						ForeachEx(i, MAX_PLAYERS)
						{
							if(IsPlayerConnected(i))
							{
								if(zalogowany[i] == true)
								{
									ZaladujUprawnieniaSRP(i);
								}
							
							}
						}
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Otwieranie i zamykanie budynku zosta³o nadane.", "Zamknij", "");
						return 1;
					}
				}
				case 13://N
				{
					if(!ZarzadzanieGrupaUID(playerid, grupa))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nie posiadasz uprawnieñ do zarz¹dzania grup¹ by zmieniaæ uprawnienia osob¹ w tej grupie", "Zamknij", "");
						return 0;
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_POLICYJNA)
					{//Zarz¹dzanie blokadami
						if(Pracownik[id][inv11] == 1)
						{
							Pracownik[id][inv11] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `11`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv11],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie blokadami zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv11] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `11`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv11],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie blokadami zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_ZMOTORYZOWANA)
					{//Zarz¹dzanie przetrzymaniami
						if(Pracownik[id][inv13] == 1)
						{
							Pracownik[id][inv13] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `13`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv13],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie przetrzymaniami zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv13] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `13`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv13],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie przetrzymaniami zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_WARSZTAT)
					{//Montowanie komponentów
						if(Pracownik[id][inv12] == 1)
						{
							Pracownik[id][inv12] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `12`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv12],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Montowanie komponentów zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv12] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `12`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv12],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Montowanie komponentów zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_ELEKTRTYKA)
					{//Montowanie elektryki
						if(Pracownik[id][inv15] == 1)
						{
							Pracownik[id][inv15] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `15`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv15],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Montowanie elektryki zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv15] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `15`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv15],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Montowanie elektryki zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_SANNEWS)
					{//Nadawanie newsów
						if(Pracownik[id][inv24] == 1)
						{
							Pracownik[id][inv24] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `24`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv24],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Montowanie elektryki zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv24] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `24`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv24],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Montowanie elektryki zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_MAFIE)
					{//Zarz¹dzanie przetrzymaniami
						if(Pracownik[id][inv13] == 1)
						{
							Pracownik[id][inv13] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `13`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv13],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie przetrzymaniami zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv13] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `13`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv13],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie przetrzymaniami zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_MEDYCZNA)
					{//Czat departamentowy
						if(Pracownik[id][inv22] == 1)
						{
							Pracownik[id][inv22] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `22`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv22],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Czat departamentowy zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv22] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `22`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv22],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Czat departamentowy zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_GANGI)
					{//Zarz¹dzanie przetrzymaniami
						if(Pracownik[id][inv13] == 1)
						{
							Pracownik[id][inv13] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `13`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv13],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie przetrzymaniami zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv13] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `13`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv13],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie przetrzymaniami zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_RZADOWA)
					{//Wydawanie dokumentów
						if(Pracownik[id][inv27] == 1)
						{
							Pracownik[id][inv27] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `27`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv27],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Wydawanie dokumentów zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv27] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `27`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv27],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Wydawanie dokumentów zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_SYNDYKAT)
					{//Zarz¹dzanie przetrzymaniami
						if(Pracownik[id][inv13] == 1)
						{
							Pracownik[id][inv13] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `13`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv13],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie przetrzymaniami zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv13] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `13`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv13],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie przetrzymaniami zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
				}
				case 14://O
				{
					if(!ZarzadzanieGrupaUID(playerid, grupa))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nie posiadasz uprawnieñ do zarz¹dzania grup¹ by zmieniaæ uprawnienia osob¹ w tej grupie", "Zamknij", "");
						return 0;
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_POLICYJNA)
					{//Zarzadzanie przetrzymaniami
						if(Pracownik[id][inv13] == 1)
						{
							Pracownik[id][inv13] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `13`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv13],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie przetrzymaniami zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv13] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `13`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv13],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie przetrzymaniami zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_ZMOTORYZOWANA)
					{//Zarz¹dzanie wyœcigami
						if(Pracownik[id][inv18] == 1)
						{
							Pracownik[id][inv18] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `18`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv18],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie wyœcigami zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv18] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `18`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv18],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie wyœcigami zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_SANNEWS)
					{//Nadawanie reklam
						if(Pracownik[id][inv25] == 1)
						{
							Pracownik[id][inv25] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `25`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv25],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nadawanie reklam zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv25] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `25`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv25],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nadawanie reklam zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_RZADOWA)
					{//Wydawanie dzialalnosci
						if(Pracownik[id][inv28] == 1)
						{
							Pracownik[id][inv28] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `28`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv28],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Wydawanie dzialalnosci zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv28] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `28`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv28],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Wydawanie dzialalnosci zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
				}
				case 15://P
				{
					if(!ZarzadzanieGrupaUID(playerid, grupa))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nie posiadasz uprawnieñ do zarz¹dzania grup¹ by zmieniaæ uprawnienia osob¹ w tej grupie", "Zamknij", "");
						return 0;
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_POLICYJNA)
					{//Zarz¹dzanie blokadami na ko³o
						if(Pracownik[id][inv14] == 1)
						{
							Pracownik[id][inv14] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `14`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv14],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie blokadami na ko³o zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv14] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `14`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv14],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie blokadami na ko³o zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_ZMOTORYZOWANA)
					{//Do³¹cznie do wyœcigu
						if(Pracownik[id][inv19] == 1)
						{
							Pracownik[id][inv19] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `19`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv19],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Do³¹cznie do wyœcigu zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv19] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `19`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv19],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Do³¹cznie do wyœcigu zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_SANNEWS)
					{//Nadawanie live
						if(Pracownik[id][inv26] == 1)
						{
							Pracownik[id][inv26] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `26`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv26],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nadawanie live zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv26] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `26`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv26],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nadawanie live zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_RZADOWA)
					{//Czat departamentowy
						if(Pracownik[id][inv22] == 1)
						{
							Pracownik[id][inv22] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `22`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv22],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Czat departamentowy zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv22] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `22`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv22],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Czat departamentowy zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
				}
				case 16://R
				{
					if(!ZarzadzanieGrupaUID(playerid, grupa))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nie posiadasz uprawnieñ do zarz¹dzania grup¹ by zmieniaæ uprawnienia osob¹ w tej grupie", "Zamknij", "");
						return 0;
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_POLICYJNA)
					{//Zarz¹dzanie kartotek¹
						if(Pracownik[id][inv16] == 1)
						{
							Pracownik[id][inv16] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `16`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv16],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie kartotek¹ zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv16] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `16`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv16],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie kartotek¹ zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
				}
				case 17://S
				{
					if(!ZarzadzanieGrupaUID(playerid, grupa))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nie posiadasz uprawnieñ do zarz¹dzania grup¹ by zmieniaæ uprawnienia osob¹ w tej grupie", "Zamknij", "");
						return 0;
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_POLICYJNA)
					{//Zarz¹dzanie kolczatkami
						if(Pracownik[id][inv17] == 1)
						{
							Pracownik[id][inv17] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `17`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv17],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie kartotek¹ zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv17] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `17`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv17],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Zarz¹dzanie kartotek¹ zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
				}
				case 18://T
				{
					if(!ZarzadzanieGrupaUID(playerid, grupa))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Nie posiadasz uprawnieñ do zarz¹dzania grup¹ by zmieniaæ uprawnienia osob¹ w tej grupie", "Zamknij", "");
						return 0;
					}
					if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_POLICYJNA)
					{//Czat Departamentowy
						if(Pracownik[id][inv22] == 1)
						{
							Pracownik[id][inv22] = 0;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `22`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv22],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Czat departamentowy zosta³o zabrane.", "Zamknij", "");
							return 1;
						}
						else
						{
							Pracownik[id][inv22] = 1;
							strdel(zapyt, 0, 512);
							format(zapyt, sizeof(zapyt),
							"UPDATE `jochym_pracownicy` SET `22`= '%d' WHERE `ID`= '%d'",
							Pracownik[id][inv22],
							id);
							mysql_query(zapyt);
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										ZaladujUprawnieniaSRP(i);
									}
								
								}
							}
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zarz¹dzanie osobami w grupie:", "Czat departamentowy zosta³o nadane.", "Zamknij", "");
							return 1;
						}
					}
				}
			}
		}
	}
	if(dialogid == DIALOG_RADIOSTACJA)
	{
		if(response)
		{
			new id = strval(inputtext);
			format(tekst_global, sizeof(tekst_global), "~w~%s ~>~~w~ (Wybrales radiostacje zaczkeaj az prezenter nada jakas reklame)", GrupaInfo[id][gNazwa], tekst_global);
			TextDrawShowForAll(LosSantosFM);
			TextDrawSetString(LosSantosFM, tekst_global);
			return 1;
		}
	}
	if(dialogid == DIALOG_MEMBERS)
	{
		new id = strval(inputtext);
		new grupa = GetPVarInt(playerid, "MembersGrupa");
		if(response)
		{
			SetPVarInt(playerid, "Members", id);
			new tekst[126];
			format(tekst, sizeof(tekst), "• Zarz¹dzanie osobami w grupie: %s (ID: %d)",ImieWlasciciela(Pracownik[id][invUID]), id);
			strdel(tekst_global, 0,2048);
	        format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Zarz¹dzanie grup¹", tekst_global);
	        format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Mo¿liwoœæ wejscia na slu¿bê", tekst_global);
	        format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Zamawianie przedmiotów", tekst_global);
	        format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Zarz¹dzanie budynkiem", tekst_global);
	        format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Zadz¹dzanie szaf¹ w budynku", tekst_global);
	        format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Zarz¹dzanie bramami", tekst_global);
	        format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Mozliwoœæ u¿ywania kana³u OOC", tekst_global);
	        format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Mo¿liwoœæ uzywania radia(czatu IC)", tekst_global);
			format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}U¿ywanie mikrofonu", tekst_global);
			format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Podawanie produktów", tekst_global);
			format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Mozliwoœæ zapraszania do grupy", tekst_global);
			format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Zarzadzanie pojazdami", tekst_global);
			format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Otwieranie i zamykanie budynków", tekst_global);
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_POLICYJNA)
			{
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Zarz¹dzanie blokadami", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Zarz¹dzanie przetrzymaniami", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Zarz¹dzanie blokadami na ko³o", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Zarz¹dzanie kartotek¹", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Zarz¹dzanie kolczatkami", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Czat departamentowy", tekst_global);
			}
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_ZMOTORYZOWANA)
			{
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Zarz¹dzanie przetrzymaniami", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Zarz¹dzanie wyœcigami", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Do³¹cznie do wyœcigu", tekst_global);
			}
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_WARSZTAT)
			{
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Montowanie komponentów", tekst_global);
			}
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_CHURCH)
			{
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}U¿ywanie mikrofonu", tekst_global);
			}
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_ELEKTRTYKA)
			{
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Monta¿ elektryki", tekst_global);
			}
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_SANNEWS)
			{
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}U¿ywanie mikforonu", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Nadawanie newsów", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Nadawanie reklam", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Nadawanie live", tekst_global);
			}
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_MAFIE)
			{

				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Zarz¹dzanie przetrzymaniami", tekst_global);
			}
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_MEDYCZNA)
			{
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Czat departamentowy", tekst_global);
			}
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_GANGI)
			{
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Zarzanie przetrzymaniami", tekst_global);
			}
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_RZADOWA)
			{
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}U¿ywanie mikrofonu", tekst_global);
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Czat departamentowy", tekst_global);
			}
			if(GrupaInfo[grupa][gTyp] == DZIALALNOSC_SYNDYKAT)
			{
				format(tekst_global, sizeof(tekst_global), "%s\n{FFFFFF}Zarz¹dzanie przetrzymaniami", tekst_global);
			}
	        dShowPlayerDialog(playerid, DIALOG_MEMBERS_UPRAWNIENIA, DIALOG_STYLE_LIST, tekst, tekst_global, "Wybierz", "Zamknij");
			TextDrawHideForPlayer(playerid, tdmembers1[playerid]);
			TextDrawHideForPlayer(playerid, tdmembers2[playerid]);
			TextDrawHideForPlayer(playerid, tdmembers3[playerid]);
			TextDrawHideForPlayer(playerid, tdmembers4[playerid]);
			TextDrawHideForPlayer(playerid, tdmembers5[playerid]);
		}
		else
		{
			SetPVarInt(playerid, "Members", 0);
			TextDrawHideForPlayer(playerid, tdmembers1[playerid]);
			TextDrawHideForPlayer(playerid, tdmembers2[playerid]);
			TextDrawHideForPlayer(playerid, tdmembers3[playerid]);
			TextDrawHideForPlayer(playerid, tdmembers4[playerid]);
			TextDrawHideForPlayer(playerid, tdmembers5[playerid]);
		}
		return 1;
	}
	if(dialogid == DIALOG_DRZWI_OPCJE)
	{
	    if(response)
		{
			switch(listitem)
			{
				case 0:
				{
        			new uids = GetPVarInt(playerid, "uiddrzwi");
					strdel(tekst_global, 0, 2048);
					format(tekst_global, sizeof(tekst_global), "%s~y~%s~n~~n~~p~Owner:~w~ %d:%d  UID: %d  Obiekty: %d~n~~r~Wejscie:~w~ %0.02f,  %0.02f,  %0.02f", tekst_global,BudynekInfo[uids][nAdres],BudynekInfo[uids][nWlascicielP],BudynekInfo[uids][nWlascicielD],uids,BudynekInfo[uids][nLiczbaMebli],BudynekInfo[uids][nX],BudynekInfo[uids][nY],BudynekInfo[uids][nZ],BudynekInfo[uids][nXW],BudynekInfo[uids][nYW],BudynekInfo[uids][nZW]);
					format(tekst_global, sizeof(tekst_global), "%s~n~~r~Wyjscie:~w~ %0.02f,  %0.02f,  %0.02f", tekst_global,BudynekInfo[uids][nXW],BudynekInfo[uids][nYW],BudynekInfo[uids][nZW]);
					format(tekst_global, sizeof(tekst_global), "%s~n~~n~~b~Vw: ~w~%d~b~  Int:~w~ %d~n~~b~Zew. Vw: ~w~%d~b~  Zew.Int: ~w~%d~n~~b~Stworzone obiekty: ~w~%d~n~~b~Metraz: ~w~%.2f m2~n~~b~Teren: ~w~%d", tekst_global,BudynekInfo[uids][nVW],BudynekInfo[uids][nINT],BudynekInfo[uids][nVWW],BudynekInfo[uids][nINTW],BudynekInfo[uids][nStworzoneObiekty], BudynekInfo[uids][nPowieszchnia], BudynekInfo[uids][nArea]);
					TextDrawSetString(OBJ[playerid], tekst_global);
					TextDrawShowForPlayer(playerid, OBJ[playerid]);
					SetTimerEx("NapisUsunsV",7000,0,"d",playerid);
					return 1;
				}
				case 1:
				{
				    if(GetPlayerVirtualWorld(playerid) != 0)
				    {
					    new uids = GetPVarInt(playerid, "uiddrzwi");
						new tekst[256];
						format(tekst, sizeof(tekst), "Wpisz iloœæ obiektów któr¹ chcesz przypisaæ do budynku.\n\n- Obecna iloœæ obiektów przypisanych do budynku: %d\n- Obecna iloœæ obiektów które mo¿esz przypisaæ: %d\n\n{FF0000}Pamiêtaj, ¿e przywróciæ obiektów na postaæ nie mo¿na.", BudynekInfo[uids][nLiczbaMebli], DaneGracza[playerid][gObiekty]);
						dShowPlayerDialog(playerid, DIALOG_DRZWI_OPCJE_OB, DIALOG_STYLE_INPUT, "• Informacja:", tekst, "Zatwierdz", "Zamknij");
						return 1;
					}
					else
					{
					    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz zrobiæ tego na zewn¹trz budynku!", "Zamknij", "");
						return 0;
					}
				}
				case 2:
				{
				    
					dShowPlayerDialog(playerid, DIALOG_DRZWI_OPCJE_WN, DIALOG_STYLE_INPUT, "• Informacja:", "Wpisz now¹ nazwe w pole ni¿ej max 3-26 znaków.", "Zatwierdz", "Zamknij");
					return 1;
				}
				case 3:
				{
					if(GetPlayerVirtualWorld(playerid) != 0)
					{
						dShowPlayerDialog(playerid, DIALOG_DRZWI_OPCJE_WP, DIALOG_STYLE_INPUT, "• Informacja:", "Czy na pewno chcesz zmieniæ wewnêtrzn¹ pozycjê budynku?\nJeœli tak przepisz s³owo: ''potwierdzam'' w poni¿sze pole.", "Tak", "Nie");
						return 1;
                    }
					else
					{
					    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz zrobiæ tego na zewn¹trz budynku!", "Zamknij", "");
						return 0;
					}
					
				}
				case 4:
				{
				    if(GetPlayerVirtualWorld(playerid) != 0)
				    {
						new uids = GetPVarInt(playerid, "uiddrzwi");
						SetPVarInt(playerid, "metry", uids);
					    new Float:x, Float:y, Float:z;
					    GetPlayerPos(playerid, x, y ,z);
					    BudynekInfo[uids][nIR] = DaneGracza[playerid][gGUID];
					    BudynekInfo[uids][nIRX] = x;
					    BudynekInfo[uids][nIRY] = y;
					    BudynekInfo[uids][nIRZ] = z;
					    ZapiszNieruchomosc(uids);
					    new str[256];
					    format(str, sizeof(str), "Zacz¹³eœ ustalaæ wymiary wnêtrza od tego miejsca w którym w³asnie stoisz ustal przek¹tn¹ budynku\nOczywiœcie by zatwierdziæ wymiary wnêtrza u¿yj przycisku 'Y', wtedy zapiszesz wymiary budynku.\nGdy zatwierdzisz ju¿ wymiary wnêtrza ustaw w polu wnêtrza drzwi wejœciowe, by inni gracze mogli wejœæ do œrodka.");
					    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", str, "Rozumiem", "");
					    return 1;
                    }
					else
					{
					    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz zrobiæ tego na zewn¹trz budynku!", "Zamknij", "");
						return 0;
					}
				}
				case 5://dokupienie metrazu
				{
				    new uids = GetPVarInt(playerid, "uiddrzwi");
				    new id = BudynekNaTerenie(uids);
	    			new tekstmetrazu[512];
				    format(tekstmetrazu, sizeof(tekstmetrazu), "Podaj ile chcesz dokupiæ metrów do tego budynku.\nCena za m2: %d\nObecnie posiadasz: %.2fm2\n\nW nastêpnym etapie musisz zatwierdziæ czy na pewno chcesz powiêkszyæ metraz.", Lokacja[id][gCena], BudynekInfo[uids][nPowieszchnia]);
				    dShowPlayerDialog(playerid, DIALOG_DOKUP_M2, DIALOG_STYLE_INPUT, "• Dokup metraz:", tekstmetrazu, "Dokup", "Anuluj");
					return 1;
				}
				case 6://wykonaj projekt wnêtrza
				{
					/*if(!GraczPremium(playerid))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:" ,"Nie posiadasz Konta Premium.", "Zamknij", "" );
						return 0;
					}
					if(UprawnieniaCEO(playerid, 0))
					{
						new uids = GetPVarInt(playerid, "uiddrzwi");
						new kopiawew[512];
						format(kopiawew, sizeof(kopiawew), "Wykonanie projektu wnêtrza pozwala nam na zapisanie obecnego wygl¹du naszego budynku wewn¹trz.\n\nBêdziesz móg³ po wykonaniu projektu wnêtrza:\n•\tOdtworzyæ wnêtrze w tym budynkuy lub innym.\n•\tSprzedaæ wnêtrze lub udostêpniæ je innej osobie.\n\nProjekt wnêtrza (UID: %d) znajdziesz w swoim ekwipunku, gdy tylko wykonasz projekt!", BudynekInfo[uids][nUID]);
						dShowPlayerDialog(playerid, DIALOG_PROJEKT_WNETRZA, DIALOG_STYLE_MSGBOX, "• Wykonaj projekt wnêtrza:", kopiawew, "Wykonaj", "Anuluj");
					}
					else
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:" ,"Opcja zosta³a zablokowana przez Zarz¹d i¿ jest obecnie w edycji.", "Zamknij", "" );
						return 0;
					}
					return 1;*/
					new ilosc;
					new vw = GetPlayerVirtualWorld(playerid);
					ForeachEx(n, MAX_PLAYERS)
					{
						if(IsPlayerConnected(n))
						{
							if(zalogowany[n] == true)
							{
								if(GetPlayerVirtualWorld(n) == vw)
								{
									ilosc++;
								}
							}
						}
					}
					if(vw != 0)
					{
						if(ilosc <= 2)
						{
							new str[256];
							UnloadObject(vw);
							LoadObject(vw);
							format(str, sizeof(str), "Przeladowa³eœ %d obiektów w budynku.", reload);
							SendClientMessage(playerid, 0xFFFFFFFF, str);
							reload = 0;
							return 1;
						}
						else
						{
							SendClientMessage(playerid, 0xFFFFFFFF, "Nie mo¿esz prze³adowaæ obiektów w interiorze, gdy s¹ inne osoby w budynku!");
							return 0;
						}
					}
				}
				case 7:
				{
				    if(GetPlayerVirtualWorld(playerid) != 0)
				    {
					    dShowPlayerDialog(playerid, DIALOG_DRZWI_OPCJE_PP, DIALOG_STYLE_MSGBOX, "• Informacja:", "Czy chcesz prze³¹czyæ przejazd pojazdami?", "W³¹cz", "Wy³¹cz");
						return 1;
                    }
					else
					{
					    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz zrobiæ tego na zewn¹trz budynku!", "Zamknij", "");
						return 0;
					}
				}
				case 8:
    			{
    			    if(GetPlayerVirtualWorld(playerid) != 0)
    			    {
						new uids = GetPVarInt(playerid, "uiddrzwi");
					    if(BudynekInfo[uids][nWlascicielD] != 0)
					    {
							if(GrupaInfo[BudynekInfo[uids][nWlascicielD]][gOwnerUID] == DaneGracza[playerid][gUID])
							{
								dShowPlayerDialog(playerid, DIALOG_DRZWI_OPCJE_BP, DIALOG_STYLE_LIST, "• Informacja:", "0.\t» Przepisz budynek na t¹ postaæ.", "Wybierz", "Zamknij");
								return 1;
							}
							else
							{
								dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz odpisaæ tego budnku, poniewa¿ nie jesteœ w³asicicelem Grupy do której jest on podpisany.", "Zamknij", "");
								return 0;
							}
						}
						else
						{
							POD_DZIALALNOSC(playerid, DIALOG_PODPISZ_BUDYNEK);
					    }
						return 1;
                    }
					else
					{
					    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz zrobiæ tego na zewn¹trz budynku!", "Zamknij", "");
						return 0;
					}
				}
				case 10:
				{
				    if(GetPlayerVirtualWorld(playerid) != 0)
				    {
						new uids = GetPVarInt(playerid, "uiddrzwi");
					    if(BudynekInfo[uids][nWlascicielP] == DaneGracza[playerid][gUID] && BudynekInfo[uids][nWlascicielD] == 0 || DaneGracza[playerid][gAdmGroup] == 4)
					    {
							dShowPlayerDialog(playerid, DIALOG_DRZWI_OPCJE_SP, DIALOG_STYLE_INPUT, "• Informacja:", "Wpisz kwote za jak¹ chcesz sprzedaæ budynek:", "Zatwierdz", "Zamknij");
						}else{
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ten budynek nie nale¿y do Ciebie.", "Zamknij", "");
						}
						return 1;
                    }
					else
					{
					    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz zrobiæ tego na zewn¹trz budynku!", "Zamknij", "");
						return 0;
					}
				}
				case 11:
				{
				    if(GetPlayerVirtualWorld(playerid) != 0)
				    {
						if(!GraczPremium(playerid))
						{
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:" ,"Nie posiadasz Konta Premium.", "Zamknij", "" );
							return 0;
						}
						new uids = GetPVarInt(playerid, "uiddrzwi");
						if(ZarzadzanieBudynkiem(uids, playerid))
						{
							dShowPlayerDialog(playerid, DIALOG_TOKKEN, DIALOG_STYLE_MSGBOX, "• Informacja:", "Czy aby na pewno chcesz usun¹æ wszystkie obiekty tego budynku?", "Dalej", "Zamknij");
						}
						else
						{
							GameTextForPlayer(playerid, "~r~Brak uprawnien.", 3000, 5);
						}
					    return 1;
                    }
					else
					{
					    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz zrobiæ tego na zewn¹trz budynku!", "Zamknij", "");
						return 0;
					}
				}
				case 12:
				{
					new uids = GetPVarInt(playerid, "uiddrzwi");
					if(BudynekInfo[uids][nStworzoneObiekty] == 0)
					{
						GameTextForPlayer(playerid, "~r~W tym budynku nie ma stworzonych obiektow.", 3000, 5);
						return 0;
					}
					format(zapyt, sizeof(zapyt), "SELECT `ID` FROM `jochym_obiekty` WHERE `vw` = '%d' ORDER BY `CZAS` DESC LIMIT 1", uids);
					mysql_query(zapyt);
					mysql_store_result();
					mysql_fetch_row(zapyt);
					new models;
					sscanf(zapyt, "p<|>d", models);
					UsunObiekt(models);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ostatni obiekt zosta³ skasowany.", "Zamknij", "");
					ZapiszNieruchomosc(uids);
					new logtekst[256];
					format(logtekst, sizeof(logtekst), "[DOOR] [%s] [ID: %d] Deleted last obiect the door %s (%d)", ZmianaNicku(playerid), playerid, BudynekInfo[uids][nAdres], uids);
					Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
					return 1;
				}
				case 13:
				{
				    if(GetPlayerVirtualWorld(playerid) != 0)
					{
						new uids = GetPVarInt(playerid, "uiddrzwi");
						if(BudynekInfo[uids][nLiczbaNapisow] == 0)
						{
						    if(DaneGracza[playerid][gPORTFEL] >= 800)
							{
								Dodajkase(playerid, -800);
								Transakcja(T_HNAPIS, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, 800, uids, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
								BudynekInfo[uids][nLiczbaNapisow] = 1;
								ZapiszNieruchomosc(uids);
							}
							else
							{
							    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie posaidasz $800 na instalacjê elektryczn¹", "Zamknij", "");
								return 0;
							}
						}
						else
						{
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ten budynek posiada instalacjê elektryczn¹, zamontuj w swoim budynku nastêpuj¹ce obiekty:\n364, 1958 - /swiatlo, /bezpiecznik", "Zamknij", "");
							return 0;
						}
						return 1;
                    }
					else
					{
					    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz zrobiæ tego na zewn¹trz budynku!", "Zamknij", "");
						return 0;
					}
				}
				case 15:
				{
				    if(GetPlayerVirtualWorld(playerid) != 0)
				    {
						new uids = GetPVarInt(playerid, "uiddrzwi");
					    if(BudynekInfo[uids][nAudio] == -1)
					    {
					    	dShowPlayerDialog(playerid, DIALOG_DRZWI_OPCJE_HIFI, DIALOG_STYLE_MSGBOX, "• Informacja:", "Czy chcesz zakupiæ System Audio za kwote 2500$?", "Tak", "Nie");
					    }
					    if(BudynekInfo[uids][nAudio] == 0)
					    {
					        new found = 0;
							strdel(tekst_global, 0, 2048);
							ForeachEx(i, MAX_PRZEDMIOT)
							{
								if(PrzedmiotInfo[i][pOwner] == DaneGracza[playerid][gUID] && PrzedmiotInfo[i][pTypWlas] == TYP_WLASCICIEL&& PrzedmiotInfo[i][pTyp] == P_CD && !ComparisonString(PrzedmiotInfo[i][pWar3], ""))
								{
									format(tekst_global, sizeof(tekst_global), "%s\n%d\t%s", tekst_global, PrzedmiotInfo[i][pUID], PrzedmiotInfo[i][pNazwa]);
									found++;
								}
							}
							if(found != 0) dShowPlayerDialog(playerid, DIALOG_DRZWI_OPCJE_CD, DIALOG_STYLE_LIST, "• Informacja:", tekst_global, "Wybierz", "Zamknij");
							else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie posiadasz przy sobie p³ytek CD.", "Zamknij", "");
					    }
					    if(BudynekInfo[uids][nAudio] == 1)
					    {
					        foreach(Player, i)
							{
					            if(BudynekInfo[uids][nVWW] == GetPlayerVirtualWorld(i))
					            {
									if(Discman[i] == 0)
									{
										if(IsPlayerInAnyVehicle(i))
										{
											new vehicleid=GetPlayerVehicleID(i);
											new uid = SprawdzCarUID(vehicleid);
											if(PojazdInfo[uid][pAudioStream] == 0)
											{
												StopAudioStreamForPlayer(i);
											}
										}
										else
										{
											StopAudioStreamForPlayer(i);
										}
									}
									BudynekInfo[uids][nAudio] = 0;
									ZapiszNieruchomosc(uids);
			    				}
							}
							return 1;
						}
                    }
					else
					{
					    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz zrobiæ tego na zewn¹trz budynku!", "Zamknij", "");
						return 0;
					}
				}
				case 16:
				{
				    if(GetPlayerVirtualWorld(playerid) != 0)
				    {
						new uids = GetPVarInt(playerid, "uiddrzwi");
						if(BudynekInfo[uids][nSzafa] == -1)
					    {
							dShowPlayerDialog(playerid, DIALOG_DRZWI_OPCJE_SZAFA, DIALOG_STYLE_MSGBOX, "• Informacja:", "Czy chcesz zakupiæ szafe za kwote 2000$?", "Tak", "Nie");
						}
						else
						{
							if(!ZarzadzanieSzafa(uids, playerid))
							{
								GameTextForPlayer(playerid, "~r~Brak uprawnien.", 3000, 5);
								return 0;
							}
							Przedmioty(playerid, playerid, DIALOG_SZAFA, "• Szafa:", TYP_SZAFA, uids);
						}
						return 1;
                    }
					else
					{
					    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz zrobiæ tego na zewn¹trz budynku!", "Zamknij", "");
						return 0;
					}
				}
				case 17:
				{
				    if(GetPlayerVirtualWorld(playerid) != 0)
					{
					    new uids = GetPVarInt(playerid, "uiddrzwi");
					    if(BudynekInfo[uids][nPickupUkryty] == 0)
					    {
					        DestroyDynamicPickup(BudynekInfo[uids][nID]);
					        BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 0;
							BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							BudynekInfo[uids][nPickupUkryty] = 1;
							ZapiszNieruchomosc(uids);
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Pickup budynku zosta³ ukryty!", "Zamknij", "");
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[DOOR] [%s] [ID: %d] Hide pickup the door %s (%d)", ZmianaNicku(playerid), playerid, BudynekInfo[uids][nAdres], uids);
							Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							return 1;
					    }
					    else
					    {
					        DestroyDynamicPickup(BudynekInfo[uids][nID]);
							new uidp = BudynekInfo[uids][nWlascicielD];
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_POLICYJNA)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1247;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_ZMOTORYZOWANA)
					 		{
								if(BudynekInfo[uids][nTyp] == 0)
					 		    {
									BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1273;
									BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
								}
								if(BudynekInfo[uids][nTyp] == 1)
					 		    {
									BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1239;
									BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
								}
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_247)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1212;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_WARSZTAT)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 18635;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_SALON)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1210;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_BANK)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1274;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_GASTRONOMIA)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1582;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_HOTEL)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1272;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_MAFIE)
					 		{
								if(BudynekInfo[uids][nTyp] == 0)
					 		    {
									BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1273;
									BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
								}
								if(BudynekInfo[uids][nTyp] == 1)
					 		    {
									BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1239;
									BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
								}
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_SANNEWS)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1962;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_TAXI)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 19308;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_MAFIE)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1559;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_BINCO)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1275;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_SILOWNIA)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 3072;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_RZADOWA)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1239;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_ELKA)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1239;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_SYNDYKAT)
					 		{
								if(BudynekInfo[uids][nTyp] == 0)
					 		    {
									BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1273;
									BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
								}
								if(BudynekInfo[uids][nTyp] == 1)
					 		    {
									BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1239;
									BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
								}
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_GANGI)
					 		{
					 		    if(BudynekInfo[uids][nTyp] == 0)
					 		    {
									BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1273;
									BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
								}
								if(BudynekInfo[uids][nTyp] == 1)
					 		    {
									BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1239;
									BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
								}
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_MEDYCZNA)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1241;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_ELEKTRTYKA)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1958;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_WYPOZYCZALNIA)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1210;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_TRANS)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1210;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_RODZINKA && BudynekInfo[uids][nTyp] == 1)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1559;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_RODZINKA && BudynekInfo[uids][nTyp] == 0)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1273;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == 0 && BudynekInfo[uids][nTyp] == 1)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1239;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == 0 && BudynekInfo[uids][nTyp] == 0)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1273;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_BRANZA)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1239;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_SIEC)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 18868;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_STRZELNICA)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 346;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_TATUAZ)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 2711;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_AMUNATION)
					 		{
								BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 336;
								BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
							}
							BudynekInfo[uids][nPickupUkryty] = 0;
							ZapiszNieruchomosc(uids);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[DOOR] [%s] [ID: %d] Show pickup the door %s (%d)", ZmianaNicku(playerid), playerid, BudynekInfo[uids][nAdres], uids);
							Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Pickup budynku od teraz jest widoczny!", "Zamknij", "");
							return 1;
					    }
                    }
					else
					{
					    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz zrobiæ tego na zewn¹trz budynku!", "Zamknij", "");
						return 0;
					}
				}
				case 18:
				{
				    if(GetPlayerVirtualWorld(playerid) != 0)
				    {
						new uids = GetPVarInt(playerid, "uiddrzwi");
						if(BudynekInfo[uids][nTyp] == 0)
						{
							new found = 0;
							new lista[1048];
							ForeachEx(i, MAX_PLAYERS)
							{
								if(IsPlayerConnected(i))
								{
									if(zalogowany[i] == true)
									{
										if(DaneGracza[i][gUID] && PlayerObokPlayera(playerid, i, 5))
										{
											format(lista, sizeof(lista), "%s\n%d\t%s", lista, i, ZmianaNicku(i));
											found++;
										}
									}
								}
							}
							if(found != 0) dShowPlayerDialog(playerid, DIALOG_DRZWI_OPCJE_WNAJEM, DIALOG_STYLE_LIST, "• Wynajem:", lista, "Wynajmij", "Zamknij");
							else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aby wynaj¹æ graczu pokój musi siê znajdowaæ obok Ciebie.", "Okej", "Zamknij");
					    }
						else
						{
							if(GrupaInfo[BudynekInfo[uids][nWlascicielD]][gTyp] == DZIALALNOSC_HOTEL)
							{
								dShowPlayerDialog(playerid, DIALOG_HOTEL_CENA, DIALOG_STYLE_INPUT, "• Informacja:", "Wpisz kwote za jak¹ ma siê wynajmowaæ pokój w twoim hotelu.\nKwota nie powinna przekraczaæ 200$", "Zatwierdz", "Zamknij");
							}
						}
						return 1;
                    }
					else
					{
					    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz zrobiæ tego na zewn¹trz budynku!", "Zamknij", "");
						return 0;
					}
				}
				case 19:
				{
				    if(GetPlayerVirtualWorld(playerid) != 0)
				    {
						new uids = GetPVarInt(playerid, "uiddrzwi");
					    ZaladujWynajem();
						if(BudynekInfo[uids][nTyp] == 0)
						{
							new found = 0;
							new lista[1048];
						    ForeachEx(i, MAX_WYNAJEM)
							{
								if(Wynajem[i][wDrzwi] == uids)
								{
									format(lista, sizeof(lista), "%s\n%d\t%s ($%d)", lista, Wynajem[i][wDostal], Wynajem[i][wNick], Wynajem[i][wKoszt]);
									found++;
								}
							}
							if(found != 0) dShowPlayerDialog(playerid, DIALOG_DRZWI_NAJEMNICY_WYPROS, DIALOG_STYLE_LIST, "• Lista najemców:", lista, "Usuñ", "Zamknij");
							else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nikt nie wynajmuje tutaj mieszkania.", "Rozumiem", "Zamknij");
                        }
					}
					else
					{
					    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz zrobiæ tego na zewn¹trz budynku!", "Zamknij", "");
						return 0;
					}
				}
			}
   		}
		else
		{
			return 0;
		}
	}
	if(dialogid == DIALOG_PW2)
	{
		strdel(tekst_global, 0, 2048);
		if(!response) return 0;
		new clickedplayerid = strval(inputtext);
		format(tekst_global, sizeof(tekst_global), "Wiadomoœæ do gracza %s:", ZmianaNicku(clickedplayerid), clickedplayerid);
		dShowPlayerDialog(playerid,DIALOG_PW,DIALOG_STYLE_INPUT,"• Informacja:",tekst_global,"Wyœlij","Zamknij");
		SetPVarInt(playerid, "PM", clickedplayerid);
		return 1;
	}
	if(dialogid == DIALOG_PW)
	{
		if(!response) return 0;
		strdel(tekst_global, 0, 2048);
		format(tekst_global, sizeof(tekst_global), "%d %s", GetPVarInt(playerid, "PM"), inputtext);
		cmd_w(playerid, tekst_global);
		return 1;
	}
	if(dialogid == DIALOG_TOKKEN)
	{
	    if(response)
		{
//			new uids = GetPVarInt(playerid, "uiddrzwi");
		    dShowPlayerDialog(playerid, DIALOG_TOKKEN_V2, DIALOG_STYLE_MSGBOX, "• Informacja:", "Czy na pewno chcesz usun¹æ wszystkie obiekty w tej nieruchomoœci?\nTa opcja jest nieodwracalna chyba ¿e wczeœniej wykona³eœ projekt wnêtrza!", "Zatwierdz", "Zamknij");
   		}
		else
		{
			return 0;
		}
	}
	if(dialogid == DIALOG_TOKKEN_V2)
	{
	    if(response)
		{
			new uids = GetPVarInt(playerid, "uiddrzwi");
			SkasujIntek(uids);
			ZapiszNieruchomosc(uids);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[DOOR] [%s] [ID: %d] deleted all interior object in the door %s", ZmianaNicku(playerid), playerid, BudynekInfo[uids][nAdres]);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Interior budynku zosta³ skasowany!", "Zamknij", "");
   		}
		else
		{
			return 0;
		}
	}
	if(dialogid == DIALOG_DRZWI_OPCJE_CD)
	{
	    if(response)
		{
      		new idp = strval(inputtext);
            new uids = GetPVarInt(playerid, "uiddrzwi");
            format(BudynekInfo[uids][nRadio], 100, "%s", PrzedmiotInfo[idp][pWar3]);
            foreach(Player, i)
			{
	            if(BudynekInfo[uids][nVWW] == GetPlayerVirtualWorld(i))
	            {
					if(Discman[i] == 0)
					{
						if(IsPlayerInAnyVehicle(i))
						{
							new vehicleid=GetPlayerVehicleID(i);
							new uid = SprawdzCarUID(vehicleid);
							if(PojazdInfo[uid][pAudioStream] == 0) 
							{
								StopAudioStreamForPlayer(i);
								PlayAudioStreamForPlayer(i, BudynekInfo[uids][nRadio], 0, 0, 0, 14.0, 0);
							}
						}
						else
						{
							StopAudioStreamForPlayer(i);
							PlayAudioStreamForPlayer(i, BudynekInfo[uids][nRadio], 0, 0, 0, 14.0, 0);
						}
					}
				}
			}
			cmd_fasdasfdfive(playerid, "wk³ada p³ytke do systemu audio w budynku.");
			BudynekInfo[uids][nAudio] = 1;
   			ZapiszNieruchomosc(uids);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "P³yta zosta³a w³o¿ona do systmu audio.", "Zamknij", "");
   		}
		else
		{
			return 0;
		}
	}
	if(dialogid == DIALOG_DRZWI_OPCJE_WP)
	{
	    if(response)
		{
		    new vw = GetPlayerVirtualWorld(playerid);
		    if(vw == 0)
		    {
		        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Znajdujesz siê w Virutal World (0), wiêc nie mo¿esz tutaj edytowaæ wew. pozycji budynku!", "Zamknij", "");
			    return 0;
			}
		    new uids = GetPVarInt(playerid, "uiddrzwi");
			strtolower(inputtext);
			if(!ComparisonString(inputtext, "potwierdzam"))
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "le przepisana treœæ.", "Zamknij", "");
			    return 0;
			}
			new Float:pXs, Float:pYs, Float:pZs, Float:angle;
			GetPlayerPos(playerid, pXs, pYs, pZs);
			GetPlayerFacingAngle(playerid, angle);
			if(BudynekInfo[uids][nIR] == 0)
			{
				BudynekInfo[uids][nXW] = pXs;
				BudynekInfo[uids][nYW] = pYs;
				BudynekInfo[uids][nZW] = pZs;
				BudynekInfo[uids][naw] = angle;
				BudynekInfo[uids][nVWW] = GetPlayerVirtualWorld(playerid);
				BudynekInfo[uids][nINTW] = GetPlayerInterior(playerid);
			}
			else
			{
			    BudynekInfo[uids][nIRX] = pXs;
				BudynekInfo[uids][nIRY] = pYs;
				BudynekInfo[uids][nIRZ] = pZs;
				BudynekInfo[uids][nVWW] = GetPlayerVirtualWorld(playerid);
				BudynekInfo[uids][nINTW] = GetPlayerInterior(playerid);
			}
			ZapiszNieruchomosc(uids);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Zmieni³eœ wewnêtrzn¹ pozycjê budynku, od teraz gdy ktoœ wejdzie bêdzie znajdywa³ siê w tym miejscu.", "Zamknij", "");
   		}
		else
		{
			return 0;
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_VEH_WYBIERZ)
	{
	    if(response)
		{
		    switch(listitem)
			{
				case 0:
				{
				    new id = GetPVarInt(playerid, "pojazduid");
				    new vehc = SprawdzCarUID(id);
			     	new Audiotxt[10], Immotxt[10], CBtxt[10], szyby2[32], gpstxt[10], skradziony[10];
					if(PojazdInfo[vehc][pImmo] == 0) Immotxt="N"; else Immotxt="T";
					if(PojazdInfo[vehc][pCB] == 0) CBtxt="N"; else CBtxt="T";
					if(PojazdInfo[vehc][pAudio] == 0) Audiotxt="N"; else Audiotxt="T";
					if(PojazdInfo[vehc][pGPS] == 0) gpstxt="N"; else gpstxt="T";
					if(PojazdInfo[vehc][pPSzyba] == 0) szyby2="Nieprzyciemnione"; else szyby2="Przyciemnione";
					if(PojazdInfo[vehc][pTempomat] == 0) skradziony="N"; else skradziony="T";
					strdel(tekst_global, 0, 512);
				    format(tekst_global, sizeof(tekst_global), "~p~UID:~w~ %d  ~p~Owner:~w~ %d:%d  ~p~Model:~w~ %s~n~~p~ID:~w~ %d  ~p~Kolor:~w~ %d:%d~n~~b~Przebieg:~w~ %0.01f  ~b~HP:~w~ %0.01f~n~~n~~y~CB Radio: ~w~%s ~y~Audio: ~w~%s ~y~Skradziony: ~w~%s~n~~y~Szyby: ~w~%s ~y~Zuzycie pojazdu: ~w~%0.01f",
					PojazdInfo[vehc][pUID], PojazdInfo[vehc][pOwnerPostac], PojazdInfo[vehc][pOwnerDzialalnosc], GetVehicleModelName(PojazdInfo[vehc][pModel]), PojazdInfo[vehc][pID], PojazdInfo[vehc][pKolor], PojazdInfo[vehc][pKolor2], PojazdInfo[vehc][pPrzebieg]/1000, PojazdInfo[vehc][pStan], CBtxt, Audiotxt, skradziony, szyby2, PojazdInfo[vehc][pNaprawy]);
					TextDrawSetString(OBJ[playerid], tekst_global);
					TextDrawShowForPlayer(playerid, OBJ[playerid]);
					SetTimerEx("NapisUsunsV",15000,0,"d",playerid);
				}
				case 1:
				{
				    new id = GetPVarInt(playerid, "pojazduid");
				    if(!WlascicielpojazduBezWYP(id, playerid))
					{
		       			GameTextForPlayer(playerid, "~r~Brak uprawnien.", 3000, 5);
						return 1;
					}
					new string[124];
				    format(string, sizeof(string), "%s\n» Otwórz maskê", string);
				    format(string, sizeof(string), "%s\n» Zamknij maskê", string);
				    dShowPlayerDialog(playerid, DIALOG_MASKA_CAR_INTER, DIALOG_STYLE_LIST, "• Maska:", string, "Wybierz", "Zamknij");
				}
				case 2:
				{
				    new id = GetPVarInt(playerid, "pojazduid");
				    if(!WlascicielpojazduBezWYP(id, playerid))
					{
		       			GameTextForPlayer(playerid, "~r~Brak uprawnien.", 3000, 5);
						return 1;
					}
					new string[124];
				    format(string, sizeof(string), "%s\n» Otwórz baga¿nik", string);
				    format(string, sizeof(string), "%s\n» Zamknij baga¿nik", string);
				    dShowPlayerDialog(playerid, DIALOG_BAGAZNIK_CAR_INTER, DIALOG_STYLE_LIST, "• Maska:", string, "Wybierz", "Zamknij");
				}
				case 3:
				{
				    new id = GetPVarInt(playerid, "pojazduid");
				    new uid = SprawdzCarUID(id);
				    if(PojazdInfo[uid][pLock] == 1)
				    {
				        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Pojazd jest zamkniêty, musisz go otworzyæ by zajrzeæ do baga¿nika!", "Zamknij", "");
			    		return 0;
				    }
				    if(!WlascicielpojazduBezWYP(id, playerid))
					{
		       			GameTextForPlayer(playerid, "~r~Brak uprawnien.", 3000, 5);
						return 1;
					}
		            Przedmioty(playerid, playerid, DIALOG_PRZEDZMIOTY_PODNIES_VEH, "• Przedmioty » Pojazd:", TYP_AUTO, uid);
				}
				case 4:
				{
				    if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_MAFIE || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_GANGI)
					{
					    new hour, minute;
						gettime(hour, minute);
				  		if(hour >= 10 || hour <= 21 && minute == 00)
						{
						    new id = GetPVarInt(playerid, "pojazduid");
					    	new uid = SprawdzCarUID(id);
						    new items_list[256], item_list[256], find;
							ForeachEx(itemid, MAX_PRZEDMIOT)
							{
								if(PrzedmiotInfo[itemid][pTyp] == P_TUNING && PrzedmiotInfo[itemid][pTypWlas] == TYP_AUTO && PrzedmiotInfo[itemid][pOwner] == uid && PrzedmiotInfo[itemid][pWar2] == 1)
								{
									format(item_list, sizeof(item_list), "%d\t%s", PrzedmiotInfo[itemid][pUID], PrzedmiotInfo[itemid][pNazwa]);
									format(items_list, sizeof(items_list), "%s\n%s", items_list, item_list);
									find++;
								}
							}
							if(find == 0) dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie znaleziono ¿adnych komponentów.", "Zamknij", "");
							else dShowPlayerDialog(playerid, DIALOG_TUNING_RABUNEK, DIALOG_STYLE_LIST, "• Komponenty pojazdu:", items_list, "Kradnij", "Zamknij");
							format(tekst_global, sizeof(tekst_global), "zaglada do wnetrza pojazdu.", BudynekInfo[id][nUID]);
							cmd_fasdasfdfive(playerid, tekst_global);
							new akcja[126];
							format(akcja,sizeof(akcja),"*zaglada do wnetrza pojazdu*");
							SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
							new akcja2[126];
							format(akcja2,sizeof(akcja2),"zaglada do wnetrza pojazdu");
							TextDrawSetString(AkcjaTD[playerid], akcja2);
							TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
							CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
							SetPVarInt(playerid, "RabunekPojazd", uid);
							SetPVarInt(playerid, "RabunekPojazdID", id);
						}
						else
						{
						    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP", "Okradaæ samochody mo¿na tylko w godzinach 18-23!", "Zamknij", "");
							return 0;
						}
					}
				}
			}
   		}
		else
		{
			return 0;
		}
	}
	if(dialogid == DIALOG_TUNING_RABUNEK)
	{
	    new uid = strval(inputtext);
     	if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA)
		{
		    SetPVarInt(playerid, "RabunekPrzedmiot", uid);
		    Rabunek[playerid] = 45;
		    AnimacjaSzukaj(playerid);
		    strdel(tekst_global, 0, 512);
		    format(tekst_global, sizeof(tekst_global), "~r~~>~ Kradziez czesci samochodowych ~<~~n~~w~Spogladaj na pojazd i oczekuj szczescia!~n~Nie daj sie zlapac na goracym uczynku!~n~~n~Kliknij ~y~PPM~w~,aby przerwac animacje i oddal sie od pojazu by przerwac!");
			TextDrawSetString(OBJ[playerid], tekst_global);
			TextDrawShowForPlayer(playerid, OBJ[playerid]);
			SetTimerEx("NapisUsunsV",15000,0,"d",playerid);
		    return 1;
		}
		if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_MAFIE || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_GANGI)
		{
		    new i = GraczNaTerenie(playerid);
      		if(Lokacja[i][gOwnerP] != 0 && Lokacja[i][gOwner] == DaneGracza[playerid][gSluzba])
      		{
      		    SetPVarInt(playerid, "RabunekPrzedmiot", uid);
      		    Rabunek[playerid] = 45;
      		    AnimacjaSzukaj(playerid);
      		    strdel(tekst_global, 0, 512);
			    format(tekst_global, sizeof(tekst_global), "~r~~>~ Kradziez czesci samochodowych ~<~~n~~w~Spogladaj na pojazd i oczekuj szczescia!~n~Nie daj sie zlapac na goracym uczynku!~n~~n~Kliknij ~y~PPM~w~,aby przerwac animacje i oddal sie od pojazu by przerwac!");
				TextDrawSetString(OBJ[playerid], tekst_global);
				TextDrawShowForPlayer(playerid, OBJ[playerid]);
				SetTimerEx("NapisUsunsV",15000,0,"d",playerid);
      		    return 1;
      		}
      		else
      		{
      		    GameTextForPlayer(playerid, "~r~Nie znajdujesz sie na swoim terenie!", 3000, 5);
      		    SetPVarInt(playerid, "RabunekPojazd", 0);
				SetPVarInt(playerid, "RabunekPojazdID", 0);
      		    return 1;
      		}
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_AKTOR2)
	{
	    new string[512];
	    new id;
	    id = GetPVarInt(playerid, "BOT");
	    if(response)
		{
		    switch(listitem)
			{
				case 0:
				{
				    if(Dokument(playerid, D_DOWOD))
					{
						GameTextForPlayer(playerid, "~r~Posiadasz dowod osobisty!", 3000, 5);
						SetPVarInt(playerid, "BotAkcja", 0);
						SetPVarInt(playerid, "Poziom", 0);
						return 0;
					}
					if(GetPVarInt(playerid, "BotAkcja") == 0)
					{
						SetPVarInt(playerid, "BotAkcja", 1);
					}
				    if(GetPVarInt(playerid, "Poziom") == 0 && GetPVarInt(playerid, "BotAkcja") == 1)
				    {
						format(string, sizeof(string), "%s mówi: Witam poproszê od Pana dwa zdjêcia oraz skrócony akt urodzenia", ImieBota(id));
				        CzatGlobalnyBot(id, string, 10);
				        SetPVarInt(playerid, "Poziom", 1);
				        return 1;
				    }
				    if(GetPVarInt(playerid, "Poziom") == 1 && GetPVarInt(playerid, "BotAkcja") == 1)
				    {
						format(string, sizeof(string), "%s mówi: Chwileczkê, tylko wpiszê wszystkie Pana dane do bazy danych.", ImieBota(id));
				        CzatGlobalnyBot(id, string, 10);
				        format(string, sizeof(string), "*%s wpisuje wszystkie dane klienta do bazy danych, nastepnie wyrabia dowód osobisty po czym k³adzie dokument na ladzie*", ImieBota(id));
						SendWrappedMessageToBot(id, FIOLETOWY, string, 10);
				        Oferuj(playerid, playerid, D_DOWOD, DaneGracza[playerid][gSluzba], 0, 0, OFEROWANIE_DOKUMENTU2, 50,"", 0);
						SetPVarInt(playerid, "BotAkcja", 0);
						SetPVarInt(playerid, "Poziom", 0);
				        return 1;
				    }
				}
				case 1:
				{
				    if(Dokument(playerid, D_PRAWKO_A))
					{
						GameTextForPlayer(playerid, "~r~Posiadasz prawo jazdy!", 3000, 5);
						return 0;
					}
					if(!Dokument(playerid, D_DOWOD))
					{
						GameTextForPlayer(playerid, "~r~Brak dowodu osobistego!", 3000, 5);
						return 0;
					}
					if(GetPVarInt(playerid, "BotAkcja") == 0)
					{
						SetPVarInt(playerid, "BotAkcja", 2);
					}
				    if(GetPVarInt(playerid, "Poziom") == 0 && GetPVarInt(playerid, "BotAkcja") == 2)
				    {
						format(string, sizeof(string), "%s mówi: Witam poproszê od Pana dwa zdjêcia oraz dowód osobisty", ImieBota(id));
				        CzatGlobalnyBot(id, string, 10);
				        SetPVarInt(playerid, "Poziom", 1);
				        return 1;
				    }
				    if(GetPVarInt(playerid, "Poziom") == 1 && GetPVarInt(playerid, "BotAkcja") == 2)
				    {
						format(string, sizeof(string), "%s mówi: Chwileczkê, tylko wpisze wszyskie Pana dane do bazy danych.", ImieBota(id));
				        CzatGlobalnyBot(id, string, 10);
				        format(string, sizeof(string), "*%s wpisuje wszystkie dane klienta do bazy danych, nastepnie wyrabia prawo jazdy po czym k³adzie dokument na ladzie*", ImieBota(id));
						SendWrappedMessageToBot(id, FIOLETOWY, string, 10);
				        Oferuj(playerid, playerid, D_PRAWKO_A, DaneGracza[playerid][gSluzba], 0, 0, OFEROWANIE_DOKUMENTU2, 150,"", 0);
						SetPVarInt(playerid, "BotAkcja", 0);
						SetPVarInt(playerid, "Poziom", 0);
				        return 1;
				    }
				}
				case 2:
				{
				    if(Dokument(playerid, D_WEDKARSKA))
					{
						GameTextForPlayer(playerid, "~r~Posiadasz karte wedkarska!", 3000, 5);
						return 0;
					}
					if(!Dokument(playerid, D_DOWOD))
					{
						GameTextForPlayer(playerid, "~r~Brak dowodu osobistego!", 3000, 5);
						return 0;
					}
					if(GetPVarInt(playerid, "BotAkcja") == 0)
					{
						SetPVarInt(playerid, "BotAkcja", 3);
					}
				    if(GetPVarInt(playerid, "Poziom") == 0 && GetPVarInt(playerid, "BotAkcja") == 3)
				    {
						format(string, sizeof(string), "%s mówi: Witam poproszê od Pana dwa zdjêcia oraz dowód osobisty", ImieBota(id));
				        CzatGlobalnyBot(id, string, 10);
				        SetPVarInt(playerid, "Poziom", 1);
				        return 1;
				    }
				    if(GetPVarInt(playerid, "Poziom") == 1 && GetPVarInt(playerid, "BotAkcja") == 3)
				    {
						format(string, sizeof(string), "%s mówi: Chwileczkê, tylko wpiszê wszyskie Pana dane do bazy danych.", ImieBota(id));
				        CzatGlobalnyBot(id, string, 10);
				        format(string, sizeof(string), "*%s wpisuje wszystkie dane klienta do bazy danych, nastepnie wyrabia kartê wêdkarsk¹ po czym k³adzie dokument na ladzie*", ImieBota(id));
						SendWrappedMessageToBot(id, FIOLETOWY, string, 10);
				        Oferuj(playerid, playerid, D_WEDKARSKA, DaneGracza[playerid][gSluzba], 0, 0, OFEROWANIE_DOKUMENTU2, 100,"", 0);
						SetPVarInt(playerid, "BotAkcja", 0);
						SetPVarInt(playerid, "Poziom", 0);
				        return 1;
				    }
				}
			}
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_AKTOR3)
	{
		SetPVarInt(playerid, "BotAkcja", 0);
		SetPVarInt(playerid, "Poziom", 0);
	    new uids = strval(inputtext);
	    if(response)
		{
		    if(!WlascicielpojazduUID(uids, playerid))
			{
				GameTextForPlayer(playerid, "~r~Nie posiadasz uprawnien do tego pojazdu!", 3000, 5);
				return 0;
			}
			if(PojazdInfo[uids][pTablicaON] != 0)
			{
				GameTextForPlayer(playerid, "~r~Ten pojazd posiada tablice, badz zostaly juz wydane!", 3000, 5);
				return 0;
			}
			Oferuj(playerid, playerid, uids, DaneGracza[playerid][gSluzba], 0, 0, OFEROWANIE_TABLIC2, 200,"", 0);
			return 1;
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_AKTOR_OPLATA)
	{
	    if(response)
	    {
	        new string2[512];
			format(string2, sizeof(string2), "Podaj UID budynku, by op³aciæ budynek na nastêpny tydzieñ.");
			dShowPlayerDialog(playerid,DIALOG_INTERAKCJA_AKTOR4,DIALOG_STYLE_INPUT,"• Interakcja z aktorem:",string2,"Potwierdz","Anuluj");
	        return 1;
	    }
	    else
	    {
			SetPVarInt(playerid, "BotAkcja", 0);
			SetPVarInt(playerid, "Poziom", 0);
	        return 0;
	    }
	}
	if(dialogid == DIALOG_INTERAKCJA_AKTOR4)
	{
	    new uids = strval(inputtext);
	    if(response)
		{
		    if(!ZarzadzanieBudynkiem(uids, playerid))
			{
				GameTextForPlayer(playerid, "~r~Nie posiadasz uprawnien do tego budynku!", 3000, 5);
				return 0;
			}
			else
			{
				Oferuj(playerid, playerid, uids, DaneGracza[playerid][gSluzba], 0, 0, OFEROWANIE_OPLATY2, 1,"", 0);
				new string[512];
				new id = GetPVarInt(playerid, "IDBota");
				format(string, sizeof(string), "%s mówi: Chwileczkê, ju¿ szukam danego budynku i zaznaczê op³atê.", ImieBota(id));
		        CzatGlobalnyBot(id, string, 10);
		        format(string, sizeof(string), "*%s szuka danego budynku nastêpnie klika opcjê 'OPLATA BUDYNKU' po czym uzupe³nia dane*", ImieBota(id));
				SendWrappedMessageToBot(id, FIOLETOWY, string, 10);
				format(string, sizeof(string), "%s mówi: Gotowe ¿yczê mi³ego dnia.", ImieBota(id));
		        CzatGlobalnyBot(id, string, 10);
				SetPVarInt(playerid, "BotAkcja", 0);
				SetPVarInt(playerid, "Poziom", 0);
				return 1;
			}
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_AKTOR_NARKOTYK)
	{
	    if(response)
		{
		    switch(listitem)
			{
				case 0:
				{
				    new string[512];
				    new id;
	    			id = GetPVarInt(playerid, "BOT");
				    if(GetPVarInt(playerid, "BotAkcja") == 0)
					{
						SetPVarInt(playerid, "BotAkcja", 12);
					}
				    if(GetPVarInt(playerid, "Poziom") == 0 && GetPVarInt(playerid, "BotAkcja") == 12)
				    {
						format(string, sizeof(string), "Nieznajomy %dF0%d mówi: Siemanko, jestes w stanie zarzucic mi jakiœ proch? Strasznie mnie nos swedzi, yhh.", Bot[id][bTyp], Bot[id][bID]);
				        CzatGlobalnyBot(id, string, 3);
                        format(string, sizeof(string), "*Nieznajomy %dF0%d spogl¹da na goœcia przed sob¹ niepewnym wzrokiem przy czym delikatnie pociaga nosem*", Bot[id][bTyp], Bot[id][bID]);
						SendWrappedMessageToBot(id, FIOLETOWY, string, 10);
				        SetPVarInt(playerid, "Poziom", 1);
				        SetPVarInt(playerid, "BotAkcja", 12);
				        return 1;
				    }
				    if(GetPVarInt(playerid, "Poziom") == 1 && GetPVarInt(playerid, "BotAkcja") == 12)
				    {
						format(string, sizeof(string), "Nieznajomy %dF0%d mówi: Pamiêtaj ¿e nie mam kurwa du¿o sosu i byle jakiego syfu nie bêde bra³ z nieznanego Ÿrud³a za chuj wie ile...", Bot[id][bSkin], Bot[id][bID]);
				        CzatGlobalnyBot(id, string, 3);
                        format(string, sizeof(string), "*Nieznajomy %dF0%d krzywi mordê przy czym przeciera nos i spogl¹da na goœcia przed sob¹*", Bot[id][bTyp], Bot[id][bID]);
						SendWrappedMessageToBot(id, FIOLETOWY, string, 10);
				        SetPVarInt(playerid, "Poziom", 2);
				        SetPVarInt(playerid, "BotAkcja", 12);
				        return 1;
				    }
				    if(GetPVarInt(playerid, "Poziom") == 2 && GetPVarInt(playerid, "BotAkcja") == 12)
				    {
						format(string, sizeof(string), "Nieznajomy %dF0%d mówi: Dobra poka¿ ten syf i przedstaw swoj¹ cenê za gram'a mo¿e siê dogadamy.", Bot[id][bTyp], Bot[id][bID]);
				        CzatGlobalnyBot(id, string, 3);
                        format(string, sizeof(string), "*Nieznajomy %dF0%d spluwa obok po czym przygl¹da siê temu co przedstawi³ goœciu przed nim*", Bot[id][bTyp], Bot[id][bID]);
						SendWrappedMessageToBot(id, FIOLETOWY, string, 10);
				        SetPVarInt(playerid, "Poziom", 0);
				        SetPVarInt(playerid, "BotAkcja", 0);
				        return 1;
				    }
				}
			}
  		}
	}
	if(dialogid == DIALOG_INTERAKCJA_CREATE_OP2_2)
	{
		if(response)
		{
			new str[512];
			format(str, sizeof(str), "Zakoñczy³eœ proces zak³adania organizacji przestêpczej.");
			format(str, sizeof(str), "%s\n", str);
			format(str, sizeof(str), "%s\n\t• Twoja grupa zosta³a zmieniona w organizacjê przestêpcz¹.", str);
			format(str, sizeof(str), "%s\n\t• Pamiêtaj ¿e ceny hurtowe zosta³y zawy¿one dla Twojej grupy i¿ nie posiadacie aplikacji.", str);
			format(str, sizeof(str), "%s\n\t• Chcesz uzyskaæ ceny hurtowe przy zamwianiu produktów dla Twojej grupy?", str);
			format(str, sizeof(str), "%s\n\t• Musicie odbiæ paczkê o godzinie 18-21 od przeciwnej organizacji by zamawiaæ po cenie hurtowej.", str);
			format(str, sizeof(str), "%s\n\t• Pamiêtaj by stosowaæ siê do regulaminu w przeciwnym wypadku zostanie usuniêta Twoja organizacja.", str);
			dShowPlayerDialog(playerid,DIALOG_INFO, DIALOG_STYLE_MSGBOX,"• Za³ó¿ organizacjê przestêpcz¹:",str,"Rozumiem","");
			return 1;
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_CREATE_OP2)
	{
		if(response)
		{
			new id = strval(inputtext);
			SetPVarInt(playerid, "ZalozOrgID", id);
			new str[512];
			format(str, sizeof(str), "{848484}#\tTyp zamawiania");
			format(str, sizeof(str), "%s\n{FFFFFF}11\tBroñ", str);
			format(str, sizeof(str), "%s\n{FFFFFF}2\tAmunicja", str);
			format(str, sizeof(str), "%s\n{FFFFFF}16\tNarkotyki", str);
			dShowPlayerDialog(playerid, DIALOG_INTERAKCJA_CREATE_OP2_2, DIALOG_STYLE_TABLIST_HEADERS, "• Wybierz co wasza grupa bêdzie sprowadzaæ:", str, "Wybierz", "Anuluj");
			return 1;
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_CREATE_OP1)
	{
		if(response)
		{
			new id = strval(inputtext);
			new ilosc = 0, stref = 1;
			new str[1024], g, m, s;
			przelicznikonline(playerid, g, m, s);
			ForeachEx(p, MAX_PRACOWNIK)
			{
				if(Pracownik[p][invID] == p && Pracownik[p][invDzialalnosc] == id)
				{
					ilosc++;
				}
			}
			format(str, sizeof(str), "{FFFFFF}Informacje odnoœnie rodziny/party: %s (%d)", GrupaInfo[id][gNazwa], GrupaInfo[id][gUID]);
			format(str, sizeof(str), "%s\n\n{FFFFFF}Ownerem grupy jest %s (%s)\n", str, ImieGracza2(playerid), NickGraczaGlobalSQL(GrupaInfo[id][gOwner]));
			if(g >= 10)
			{
				format(str, sizeof(str), "%s\n{FFFFFF}Owner grupy {3f7d55}spe³nia{FFFFFF} wymagan¹ iloœæ godzin online obecnie posiada %dh %dmin %dsec", str, g, m, s);
			}
			else
			{
				format(str, sizeof(str), "%s\n{FFFFFF}Owner grupy {ff1e1e}nie spe³nia{FFFFFF} wymaganej iloœci godzin online obecnie posiada %dh %dmin %dsec", str, g, m, s);
			}
			if(ilosc >= 7)
			{
				format(str, sizeof(str), "%s\n{FFFFFF}Obecnie grupa {3f7d55}posiada{FFFFFF} wymagan¹ iloœæ cz³onków (%d/7).", str, ilosc);
			}
			else
			{
				format(str, sizeof(str), "%s\n{FFFFFF}Obecnie grupa {ff1e1e}nie posiada{FFFFFF} wymaganej iloœci cz³onków (%d/7).", str, ilosc);
			}
			if(stref != 0)
			{
				format(str, sizeof(str), "%s\n{FFFFFF}Grupa {3f7d55}posiada{FFFFFF} wymagan¹ iloœæ stref %d.", str, stref);
			}
			else
			{
				format(str, sizeof(str), "%s\n{FFFFFF}Grupa {ff1e1e}nie posiada{FFFFFF} wymaganej iloœci stref %d.", str, stref);
			}
			format(str, sizeof(str), "%s\n{FFFFFF}Cz³onkowie rodzinki/party {0e5f2e}nie posiadaj¹{FFFFFF} aktywnych kar oraz blokad.", str);
			dShowPlayerDialog(playerid,DIALOG_INFO, DIALOG_STYLE_MSGBOX,"• SprawdŸ rodzinkê/party:",str,"Rozumiem","");
			return 1;
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_CREATE_ORG)
	{
	    if(response)
		{
		    switch(listitem)
			{
				case 0:
				{
					ZaladujMembers();
					new str[512], temp = 0;
					format(str, sizeof(str), "{848484}#\tNazwa grupy");
					ForeachEx(id, MAX_PRACOWNIK)
					{
						if(Pracownik[id][invID] == id && Pracownik[id][invUID] == DaneGracza[playerid][gUID])
						{
							if(GrupaInfo[Pracownik[id][invDzialalnosc]][gTyp] == DZIALALNOSC_RODZINKA)
							{
								temp++;
								format(str, sizeof(str), "%s\n%d\t%s", str, Pracownik[id][invDzialalnosc], GrupaInfo[Pracownik[id][invDzialalnosc]][gNazwa]);
							}
						}
					}
					if(temp == 0)
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie znaleziono ¿adnej rodziny/party któr¹ móg³byœ sprawdziæ.", "Zamknij", "");
						return 0;
					}
					else
					{
						dShowPlayerDialog(playerid, DIALOG_INTERAKCJA_CREATE_OP1, DIALOG_STYLE_TABLIST_HEADERS, "• SprawdŸ rodzinê/patry:", str, "Sprawdz", "Anuluj");
						return 1;
					}
				}
				case 1:
				{
				    new string[512];
				    new id;
	    			id = GetPVarInt(playerid, "BOT");
				    if(GetPVarInt(playerid, "BotAkcja") == 0)
					{
						SetPVarInt(playerid, "BotAkcja", 14);
					}
				    if(GetPVarInt(playerid, "Poziom") == 0 && GetPVarInt(playerid, "BotAkcja") == 14)
				    {
						format(string, sizeof(string), "%s mówi: Yo'w chcia³byœ z swoj¹ paczk¹ coœ podzia³aæ na mieœcie? Potrzeba nam odwa¿nych skurwieli w mieœcie, jo?", ImieBota(id));
				        CzatGlobalnyBot(id, string, 3);
                        format(string, sizeof(string), "*%s zmierzy³ wzrokiem goœcia przed sob¹ po czym podrapa³ siê po brodzie.*", ImieBota(id));
						SendWrappedMessageToBot(id, FIOLETOWY, string, 10);
				        SetPVarInt(playerid, "Poziom", 1);
				        SetPVarInt(playerid, "BotAkcja", 14);
				        return 1;
				    }
				    if(GetPVarInt(playerid, "Poziom") == 1 && GetPVarInt(playerid, "BotAkcja") == 14)
				    {
						format(string, sizeof(string), "%s mówi: Widzia³em Twoj¹ ekipê mordo, ale nie jest jakoœ g³oœno o Was mogê wam trochê pomóc mam parê kontaktów na mieœcie, czaisz?", ImieBota(id));
				        CzatGlobalnyBot(id, string, 3);
                        format(string, sizeof(string), "*%s krzywi mordê nastêpnie wyci¹ga telefon z kieszeni i coœ w nim grzebie*", ImieBota(id));
						SendWrappedMessageToBot(id, FIOLETOWY, string, 10);
				        SetPVarInt(playerid, "Poziom", 2);
				        SetPVarInt(playerid, "BotAkcja", 14);
				        return 1;
				    }
				    if(GetPVarInt(playerid, "Poziom") == 2 && GetPVarInt(playerid, "BotAkcja") == 14)
				    {
						format(string, sizeof(string), "%s mówi: Dobra dam Wam szasnê wys³a³em Ci parê kontaktów zobaczymy jak sobie poradzicie w mieœcie chyba wiesz ¿e na pocz¹tku nie bêdzie ³atwo!", ImieBota(id));
				        CzatGlobalnyBot(id, string, 3);
						format(string, sizeof(string), "%s mówi: Mordo a teraz spierdalaj by ktoœ siê nie po³apa³ ¿e Wam pomog³em, a'yow!", ImieBota(id));
				        CzatGlobalnyBot(id, string, 3);
                        format(string, sizeof(string), "*%s wysy³a z swojego smartfona kontakty do goœcia przed sob¹ nastêpnie odwraca wzrok w innym kierunku*", ImieBota(id));
						SendWrappedMessageToBot(id, FIOLETOWY, string, 10);
				        SetPVarInt(playerid, "Poziom", 0);
				        SetPVarInt(playerid, "BotAkcja", 0);
						ZaladujMembers();
						new str[512], temp = 0;
						format(str, sizeof(str), "{848484}#\tNazwa grupy");
						ForeachEx(p, MAX_PRACOWNIK)
						{
							if(Pracownik[p][invID] == p && Pracownik[p][invUID] == DaneGracza[playerid][gUID])
							{
								if(GrupaInfo[Pracownik[p][invDzialalnosc]][gTyp] == DZIALALNOSC_RODZINKA)
								{
									temp++;
									format(str, sizeof(str), "%s\n%d\t%s", str, Pracownik[p][invDzialalnosc], GrupaInfo[Pracownik[p][invDzialalnosc]][gNazwa]);
								}
							}
						}
						if(temp == 0)
						{
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie znaleziono ¿adnej rodziny/party w Twoich grupach.", "Zamknij", "");
							return 0;
						}
						else
						{
							dShowPlayerDialog(playerid, DIALOG_INTERAKCJA_CREATE_OP2, DIALOG_STYLE_TABLIST_HEADERS, "• Za³ó¿ organizacje przestêpcz¹:", str, "Wybierz", "Anuluj");
							return 1;
						}
				    }
				}
			}
  		}
	}
	if(dialogid == DIALOG_INTERAKCJA_NASIONA)
	{
		if(response)
		{
		    switch(listitem)
			{
				case 0:
				{
					new string[512], naglowek[256];
					new id = GetPVarInt(playerid, "Nasiona");
					if(Nasiona[id][nUID] == DaneGracza[playerid][gUID])
					{
						new rok, miesiac, dzien, godzina, minuta, sekunda;
						sekundytodata(Nasiona[id][nCzas], rok, miesiac, dzien, godzina, minuta, sekunda);
						format(string, sizeof(string), "%s\nW³aœciciel roœliny: %s (%d)", string, ImieWlasciciela(Nasiona[id][nUID]), Nasiona[id][nUID]);
						format(string, sizeof(string), "%s\nNawodnienie roœliny: %d%", string, Nasiona[id][nStan]);
						format(string, sizeof(string), "%s\nZbiory dostêpne: %02d-%02d-%d, %02d:%02d", string, dzien, miesiac, rok, godzina, minuta);
						format(naglowek, sizeof(naglowek), "Informacje o roœlinie (%d)", Nasiona[id][nID]);
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, naglowek, string, "Zamknij", "");
						SetPVarInt(playerid, "Nasiona", 0);
						return 1;
					}
					else
					{
						new rok, miesiac, dzien, godzina, minuta, sekunda;
						sekundytodata(Nasiona[id][nCzas], rok, miesiac, dzien, godzina, minuta, sekunda);
						format(string, sizeof(string), "%s\nNawodnienie roœliny: %d%", string, Nasiona[id][nStan]);
						format(string, sizeof(string), "%s\nZbiory dostêpne: %02d-%02d-%d, %02d:%02d", string, dzien, miesiac, rok, godzina, minuta);
						format(naglowek, sizeof(naglowek), "Informacje o roœlinie (%d)", Nasiona[id][nID]);
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, naglowek, string, "Zamknij", "");
						SetPVarInt(playerid, "Nasiona", 0);
						return 1;
					}
				}
				case 1:
				{
					new id = GetPVarInt(playerid, "Nasiona");
					if(Nasiona[id][nUID] == DaneGracza[playerid][gUID])
					{
						if(GraczaMaTypPrzedmiotu(playerid, P_KONEWKA))
						{		
							if(Nasiona[id][nStan] <= 100)
							{
								Nasiona[id][nStan] += 10;
								ZapiszNasiono(id);
								new konewka = GetPVarInt(playerid, "UsunPrzedmiotZEQ");
								UsunPrzedmiot(konewka);
								new text[256];
								format(text, sizeof(text), "Twoja roœlina zosta³a podlana, by sprawdziæ jej stan nawodnienia wejdŸ z ni¹ w interakcje!");
								SendClientMessage(playerid, SZARY, text);
								return 1;
							}
							else
							{
								dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Roœlina:", "Nie mo¿esz bardziej podlaæ swojej roœliny!", "Zamknij", "");
								return 1;
							}
						}
						else
						{
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Roœlina:", "Nie posiadasz przy sobie przedmiotu o nazwie Konewka, udaj siê do 24/7 by j¹ zakupiæ!", "Zamknij", "");
							return 1;
						}
					}
					else
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Roœlina:", "Nie jesteœ w³aœcicielem tej roœliny, wiêc nie mo¿esz jej podlaæ.", "Zamknij", "");
						return 1;
					}
				}
				case 2:
				{
					new id = GetPVarInt(playerid, "Nasiona");
					if(Nasiona[id][nUID] == DaneGracza[playerid][gUID])
					{
						if(Nasiona[id][nCzas] <= (gettime()+CZAS_LETNI))
						{
							new ilosc = random(6);
							if(ilosc == 0)
							{
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Roœlina:", "Roœlina zosta³a zebrana\nPrzedmioty zosta³y dodane do ekwipunku.\nPamiêtaj by odpowiednio dbac o nawodnienie roœliny.", "Zamknij", "");
							}
							if(ilosc == 1)
							{
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Roœlina:", "Roœlina zosta³a zebrana\nPrzedmioty zosta³y dodane do ekwipunku.\nPamiêtaj by odpowiednio dbac o nawodnienie roœliny.", "Zamknij", "");
							}
							if(ilosc == 2)
							{
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Roœlina:", "Roœlina zosta³a zebrana\nPrzedmioty zosta³y dodane do ekwipunku.\nPamiêtaj by odpowiednio dbac o nawodnienie roœliny.", "Zamknij", "");
							}
							if(ilosc == 3)
							{
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Roœlina:", "Roœlina zosta³a zebrana\nPrzedmioty zosta³y dodane do ekwipunku.\nPamiêtaj by odpowiednio dbac o nawodnienie roœliny.", "Zamknij", "");
							}
							if(ilosc == 4)
							{
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Roœlina:", "Roœlina zosta³a zebrana\nPrzedmioty zosta³y dodane do ekwipunku.\nPamiêtaj by odpowiednio dbac o nawodnienie roœliny.", "Zamknij", "");
							}
							if(ilosc == 5)
							{
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_ROSLINA, 0, 0, "Roslina", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_SKLADNIK_MARYCHA, 0, 0, "Skladnik Marihuana", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
								dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Roœlina:", "Roœlina zosta³a zebrana\nPrzedmioty zosta³y dodane do ekwipunku.\nPamiêtaj by odpowiednio dbac o nawodnienie roœliny.", "Zamknij", "");
							}
							UsunNasiono(id);
							SetPVarInt(playerid, "Nasiona", 0);
							return 1;
						}
						else
						{
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Roœlina:", "Ta roœlina nie mo¿e byæ jeszcze zebrana i¿ nie uros³a do odpowiednich rozmiarów.", "Zamknij", "");
							SetPVarInt(playerid, "Nasiona", 0);
							return 1;
						}
					}
					else
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Roœlina:", "Brak uprawnieñ do zebrania roœliny.", "Zamknij", "");
						SetPVarInt(playerid, "Nasiona", 0);
						return 1;
					}
				}
			}
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_AKTOR_PRACA)
	{
	    if(response)
		{
		    switch(listitem)
			{
				case 0:
				{
				    new string[256], naglowek[256];
				    format(string, sizeof(string), "%s\n1.\tMechanik", string);
					format(string, sizeof(string), "%s\n2.\tKurier", string);
					format(string, sizeof(string), "%s\n3.\tWêdkarstwo", string);
					format(string, sizeof(string), "%s\n4.\tRoznosiciel gazet", string);
					format(string, sizeof(string), "%s\n5.\tWycinka drzew", string);
					format(string, sizeof(string), "%s\n6.\tZ³omiarz", string);
					format(string, sizeof(string), "%s\n7.\t{FF0000}Zrezygnuj z pracy dorywczej", string);
					format(naglowek, sizeof(naglowek), "Wybierz ofertê pracy");
					dShowPlayerDialog(playerid, DIALOG_PRACA, DIALOG_STYLE_LIST, naglowek, string, "Wybierz", "Zamknij");
				}
				case 2:
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Opcja niedostepna!.", "Zamknij", "");
				    return 1;
				}
			}
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_AKTOR_GAZETA)
	{
	    if(response)
		{
		    switch(listitem)
			{
			    case 0:
			    {
			        if(DaneGracza[playerid][gPracaTyp] != PRACA_GAZECIARZ)
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby skorzystaæ z tej opcji musisz posiadaæ pracê roznosiciela gazet.", "Zamknij", "");
						return 0;
					}
			        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Gazety:", "Odebra³eœ gazety od aktora, rozwieŸ je w wyznaczone miejsca na mini-mapie.", "Zamknij", "");
			        SetPVarInt(playerid, "Gazeciarz", 1);
			        SetPlayerCheckpoint(playerid, Gazety[1][snX], Gazety[1][snY], Gazety[1][snZ], 3.0);
			        return 1;
			    }
			}
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_AKTOR_Z£OMOWISKO)
	{
	    if(response)
		{
		    switch(listitem)
			{
				case 0:
				{
				    new string[512];
				    new id;
	    			id = GetPVarInt(playerid, "BOT");
				    if(GetPVarInt(playerid, "BotAkcja") == 0)
					{
						SetPVarInt(playerid, "BotAkcja", 21);
					}
				    if(GetPVarInt(playerid, "Poziom") == 0 && GetPVarInt(playerid, "BotAkcja") == 21)
				    {
						format(string, sizeof(string), "%s mówi: WeŸ mordo znowu posegreguj z³om, bo mnie rozkurwi co chwilê robi siê syf!", ImieBota(id));
				        CzatGlobalnyBot(id, string, 3);
				        format(string, sizeof(string), "*%s wskazuje kupkê rozwalonego z³omu, przy czym wzdycha i rozgl¹da siê po terenie*", ImieBota(id));
						SendWrappedMessageToBot(id, FIOLETOWY, string, 10);
						SetPVarInt(playerid, "Poziom", 1);
				        if(GetPlayerVirtualWorld(playerid) == 0)
		   			    {
		   			        if(DaneGracza[playerid][gPracaTyp] != PRACA_ZLOM)
		   			        {
		   			            dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Udaj siê do urzêdu po pracê z³omiarza!\nNastêpnie wróæ tutaj ponownie i rozpocznij pracê.", "Zamknij", "");
							    return 1;
		   			        }
		   			        if(DaneGracza[playerid][gBlokDorywczej] <= 800)
		   			        {
								new checkpoint = random(6);
								if(checkpoint == 0)
								{
								    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
								    SetPlayerAttachedObject(playerid,8, 1220, 1, 0.35, 0.65, 0, 0, 0, 0);
									SetPlayerCheckpoint(playerid, Zlom[1][zX], Zlom[1][zY], Zlom[1][zZ], 1.5);
									SetPVarInt(playerid, "Magazynier", 1);
									SetPVarInt(playerid, "BotAkcja", 0);
									SetPVarInt(playerid, "Poziom", 0);
								}
								if(checkpoint == 1)
								{
								    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
								    SetPlayerAttachedObject(playerid,8, 1220, 1, 0.35, 0.65, 0, 0, 0, 0);
									SetPlayerCheckpoint(playerid, Zlom[2][zX], Zlom[2][zY], Zlom[2][zZ], 1.5);
									SetPVarInt(playerid, "Magazynier", 2);
									SetPVarInt(playerid, "BotAkcja", 0);
									SetPVarInt(playerid, "Poziom", 0);
								}
								if(checkpoint == 2)
								{
								    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
								    SetPlayerAttachedObject(playerid,8, 1220, 1, 0.35, 0.65, 0, 0, 0, 0);
									SetPlayerCheckpoint(playerid, Zlom[3][zX], Zlom[3][zY], Zlom[3][zZ], 1.5);
									SetPVarInt(playerid, "Magazynier", 3);
									SetPVarInt(playerid, "BotAkcja", 0);
									SetPVarInt(playerid, "Poziom", 0);
								}
								if(checkpoint == 3)
								{
								    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
								    SetPlayerAttachedObject(playerid,8, 1220, 1, 0.35, 0.65, 0, 0, 0, 0);
									SetPlayerCheckpoint(playerid, Zlom[1][zX], Zlom[1][zY], Zlom[1][zZ], 1.5);
									SetPVarInt(playerid, "Magazynier", 1);
									SetPVarInt(playerid, "BotAkcja", 0);
									SetPVarInt(playerid, "Poziom", 0);
								}
								if(checkpoint == 4)
								{
								    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
								    SetPlayerAttachedObject(playerid,8, 1220, 1, 0.35, 0.65, 0, 0, 0, 0);
									SetPlayerCheckpoint(playerid, Zlom[2][zX], Zlom[2][zY], Zlom[2][zZ], 1.5);
									SetPVarInt(playerid, "Magazynier", 2);
								}
								if(checkpoint == 5)
								{
								    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
								    SetPlayerAttachedObject(playerid,8, 1220, 1, 0.35, 0.65, 0, 0, 0, 0);
									SetPlayerCheckpoint(playerid, Zlom[3][zX], Zlom[3][zY], Zlom[3][zZ], 1.5);
									SetPVarInt(playerid, "Magazynier", 3);
									SetPVarInt(playerid, "BotAkcja", 0);
									SetPVarInt(playerid, "Poziom", 0);
								}
								if(checkpoint == 6)
								{
								    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
								    SetPlayerAttachedObject(playerid,8, 1220, 1, 0.35, 0.65, 0, 0, 0, 0);
									SetPlayerCheckpoint(playerid, Zlom[1][zX], Zlom[1][zY], Zlom[1][zZ], 1.5);
									SetPVarInt(playerid, "Magazynier", 1);
									SetPVarInt(playerid, "BotAkcja", 0);
									SetPVarInt(playerid, "Poziom", 0);
								}
								strdel(tekst_global, 0, 512);
							    format(tekst_global, sizeof(tekst_global), "~r~~>~ Zlomiarz ~<~~n~~w~Udaj sie z skrzynka w ktorej znajduje sie zlom w wyznaczone miejsce~n~by otrzymac wynagrodzenie!~n~~n~Pamietaj ze skrzynki sa w roznych cenach od 5 do 10~g~$");
								TextDrawSetString(OBJ[playerid], tekst_global);
								TextDrawShowForPlayer(playerid, OBJ[playerid]);
								SetTimerEx("NapisUsunsV",15000,0,"d",playerid);
							}
							else
							{
							    GameTextForPlayer(playerid, "~r~Zarobiles 800$ wroc jutro!", 3000, 5);
							    return 1;
							}
						}
				        return 1;
				    }
				}
			}
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_AKTOR_RYBY)
	{
	    if(response)
		{
		    switch(listitem)
			{
				case 0:
				{
				    new string[512];
				    new id;
	    			id = GetPVarInt(playerid, "BOT");
				    if(GetPVarInt(playerid, "BotAkcja") == 0)
					{
						SetPVarInt(playerid, "BotAkcja", 20);
					}
				    if(GetPVarInt(playerid, "Poziom") == 0 && GetPVarInt(playerid, "BotAkcja") == 20)
				    {
						format(string, sizeof(string), "%s mówi: Witaj, masz jakieœ ryby ciekawe ryby?", ImieBota(id));
				        CzatGlobalnyBot(id, string, 3);
				        SetPVarInt(playerid, "Poziom", 1);
				        return 1;
				    }
				    if(GetPVarInt(playerid, "Poziom") == 1 && GetPVarInt(playerid, "BotAkcja") == 20)
				    {
                        Przedmioty5(playerid, playerid, DIALOG_PRZEDMIOT_ACTOR, "• Interakcja aktor - Sprzedaj ryby:", TYP_WLASCICIEL, 0);
						SetPVarInt(playerid, "BotAkcja", 0);
						SetPVarInt(playerid, "Poziom", 0);
				    }
				}
			}
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_LSMC1)
	{
		if(response)
		{
			if(DaneGracza[playerid][gPORTFEL] >= 20)
			{
				Dodajkase(playerid, -20);
				ZapiszGracza(playerid);
				DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_LEK, 3, 0, "Apap", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, ""); 
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "Informacja", "Zakupi³eœ Apap który znajduje siê w Twoim ekwipunku!", "Rozumiem", "");
				new logtekst[256];
				format(logtekst, sizeof(logtekst), "[MC] [%s] [ID: %d] Buy Apap added to inventory", ZmianaNicku(playerid), playerid);
				Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
			    return 1;
			}
			else
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "Informacja", "Nie posiadasz przy sobie takiej gotówki!", "Rozumiem", "");
			    return 1;
			}
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_LSMC2)
	{
		if(response)
		{
			if(DaneGracza[playerid][gPORTFEL] >= 75)
			{
				Dodajkase(playerid, -75);
				ZapiszGracza(playerid);
				DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_LEK, 2, 0, "Detox", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, ""); 
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "Informacja", "Zakupi³eœ Detox który znajduje siê w Twoim ekwipunku!", "Rozumiem", "");
				new logtekst[256];
				format(logtekst, sizeof(logtekst), "[MC] [%s] [ID: %d] Buy Detox added to inventory", ZmianaNicku(playerid), playerid);
				Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
			    return 1;
			}
			else
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "Informacja", "Nie posiadasz przy sobie takiej gotówki!", "Rozumiem", "");
			    return 1;
			}
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_LSMC3)
	{
		if(response)
		{
			if(DaneGracza[playerid][gPORTFEL] >= 40)
			{
				Dodajkase(playerid, -40);
				ZapiszGracza(playerid);
				DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_LEK, 4, 0, "Ipecac", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, ""); 
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "Informacja", "Zakupi³eœ Ipecac który znajduje siê w Twoim ekwipunku!", "Rozumiem", "");
				new logtekst[256];
				format(logtekst, sizeof(logtekst), "[MC] [%s] [ID: %d] Buy Ipecac added to inventory", ZmianaNicku(playerid), playerid);
				Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
			    return 1;
			}
			else
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "Informacja", "Nie posiadasz przy sobie takiej gotówki!", "Rozumiem", "");
			    return 1;
			}
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_LSMC)
	{
	    if(response)
		{
		    switch(listitem)
			{
				case 0:
				{
				    new string[256], naglowek[256];
					format(string, sizeof(string), "Czy na pewno chcesz zakupiæ produkt Apap za 20$?");
					format(naglowek, sizeof(naglowek), "PotwierdŸ zakup od aktora:");
					dShowPlayerDialog(playerid, DIALOG_INTERAKCJA_LSMC1, DIALOG_STYLE_MSGBOX, naglowek, string, "Tak", "Nie");
			        return 1;
				}
				case 1:
				{
				    new string[256], naglowek[256];
					format(string, sizeof(string), "Czy na pewno chcesz zakupiæ produkt Detox za 75$?");
					format(naglowek, sizeof(naglowek), "PotwierdŸ zakup od aktora:");
					dShowPlayerDialog(playerid, DIALOG_INTERAKCJA_LSMC2, DIALOG_STYLE_MSGBOX, naglowek, string, "Tak", "Nie");
			        return 1;
				}
				case 2:
				{
					new string[256], naglowek[256];
					format(string, sizeof(string), "Czy na pewno chcesz zakupiæ produkt Ipecac za 40$?");
					format(naglowek, sizeof(naglowek), "PotwierdŸ zakup od aktora:");
					dShowPlayerDialog(playerid, DIALOG_INTERAKCJA_LSMC3, DIALOG_STYLE_MSGBOX, naglowek, string, "Tak", "Nie");
			        return 1;
				}
			}
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_AKTOR_R_KUP1)
	{
		if(response)
		{
			if(DaneGracza[playerid][gPORTFEL] >= 100)
			{
				Dodajkase(playerid, -100);
				ZapiszGracza(playerid);
				DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_NASIONA, 0, 0, "Nasiono Konopi Indyjskiej", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, ""); 
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "Informacja", "Zakupi³eœ Nasiono Konopi Indyjskiej, znajduje siê w Twoim ekwipunku!", "Rozumiem", "");
				new logtekst[256];
				format(logtekst, sizeof(logtekst), "[AKTOR] [%s] [ID: %d] Buy Nosiono Konopi Indyjskiej added to inventory", ZmianaNicku(playerid), playerid);
				Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
			    return 1;
			}
			else
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "Informacja", "Nie posiadasz przy sobie takiej gotówki!", "Rozumiem", "");
			    return 1;
			}
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_AKTOR_R_KUP)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					new string[256], naglowek[256];
					format(string, sizeof(string), "Czy na pewno chcesz zakupiæ produkt Nasiono Konopi Indyjskiej za 100$?");
					format(naglowek, sizeof(naglowek), "PotwierdŸ zakup od aktora:");
					dShowPlayerDialog(playerid, DIALOG_INTERAKCJA_AKTOR_R_KUP1, DIALOG_STYLE_MSGBOX, naglowek, string, "Tak", "Nie");
					return 1;
				}
			}
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_AKTOR_ROSLIN)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					new bot;
					bot = GetPVarInt(playerid, "BOT");
					new string[256], naglowek[256];
					format(string, sizeof(string), "%s\n1.\tNasiono Konopi Indyjskiej\t100$", string);
					format(naglowek, sizeof(naglowek), "Interakcja z %s", ImieBota(bot));
					dShowPlayerDialog(playerid, DIALOG_INTERAKCJA_AKTOR_R_KUP, DIALOG_STYLE_LIST, naglowek, string, "Zakup", "Anuluj");
					return 1;
				}
				case 1:
				{
					new string[512];
					new id;
					id = GetPVarInt(playerid, "BOT");
					format(string, sizeof(string), "%s mówi: Witam masz coœ czym chcia³byœ ze mn¹ pohandlowaæ?", ImieBota(id));
					CzatGlobalnyBot(id, string, 3);
					format(string, sizeof(string), "%s mówi: Bardzo chêtnie odkupiê od Ciebie jakieœ roœliny, huh!", ImieBota(id));
					CzatGlobalnyBot(id, string, 3);
					PrzedmiotyRosliny(playerid, playerid, DIALOG_ROSLINA_SELL, "• Aktor - Sprzedaj roœliny:", TYP_WLASCICIEL, 0);
					SetPVarInt(playerid, "BotAkcja", 0);
					SetPVarInt(playerid, "Poziom", 0);
					return 1;
				}
			}
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_PASER)
	{
	    if(response)
		{
		    switch(listitem)
			{
				case 0:
				{
				    new string[512];
				    new id;
	    			id = GetPVarInt(playerid, "BOT");
	    			format(string, sizeof(string), "%s mówi: Siemanko mordko, masz coœ dla mnie? Wspaniale, poka¿ co uda³o Ci siê podjebaæ.", ImieBota(id));
			        CzatGlobalnyBot(id, string, 3);
			        format(string, sizeof(string), "%s mówi: Jak znowu coœ Ci w r¹czki wpadnie to mo¿emy znowu pohandlowaæ!", ImieBota(id));
			        CzatGlobalnyBot(id, string, 3);
			        PrzedmiotyPaser(playerid, playerid, DIALOG_PASER_SELL, "• Paser - Sprzedaj elektronike:", TYP_WLASCICIEL, 0);
					SetPVarInt(playerid, "BotAkcja", 0);
					SetPVarInt(playerid, "Poziom", 0);
			        return 1;
				}
				case 1:
				{
				    new string[512];
				    new id;
	    			id = GetPVarInt(playerid, "BOT");
	    			format(string, sizeof(string), "%s mówi: Mów ciszej bo ktoœ us³yszy niepowo³any i bêdzie na Ciebie czeka³, ju¿ Ci wysy³am lokalizacjê.", ImieBota(id));
			        CzatGlobalnyBot(id, string, 1);
			        format(string, sizeof(string), "%s mówi: SprawdŸ w telefonie lokalizacjê masz wspo³rzêdne zaznaczone.", ImieBota(id));
			        CzatGlobalnyBot(id, string, 3);
			        SetPlayerCheckpoint(playerid, 2228.112060, -2218.644287, 13.546875, 2);
					SetPVarInt(playerid, "MiejscePaser", 1);
					SetPVarInt(playerid, "BotAkcja", 0);
					SetPVarInt(playerid, "Poziom", 0);
				}
			}
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_AKTOR_ROBOTA)
	{
	    if(response)
		{
		    switch(listitem)
			{
				case 0:
				{
				    new hour, minute;
					gettime(hour, minute);
				    if(hour >= 18 || hour <= 23 && minute == 00)
					{
					    new string[512];
					    new id;
		    			id = GetPVarInt(playerid, "BOT");
					    if(GetPVarInt(playerid, "BotAkcja") == 0)
						{
							SetPVarInt(playerid, "BotAkcja", 8);
						}
					    if(GetPVarInt(playerid, "Poziom") == 0 && GetPVarInt(playerid, "BotAkcja") == 8)
					    {
							format(string, sizeof(string), "%s mówi: Siemanko mordziaty, czego siê tutaj krêcisz, szukasz czegoœ? Mam robotê dla sprytnego gangstera z tego ghetto, nad¹¿asz?", ImieBota(id));
					        CzatGlobalnyBot(id, string, 3);
					        format(string, sizeof(string), "%s mówi: Nadajesz siê to nawijaj, a bym zapomnia³ musisz mieæ Burrito i bêdziemy myœleæ czy dam Ci zarobiæ, czaisz?!", ImieBota(id));
					        CzatGlobalnyBot(id, string, 3);
					        SetPVarInt(playerid, "Poziom", 1);
					        return 1;
					    }
					    if(GetPVarInt(playerid, "Poziom") == 1 && GetPVarInt(playerid, "BotAkcja") == 8)
					    {
			                if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_MAFIE || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_GANGI)
							{
			                    format(string, sizeof(string), "%s mówi: Widzê ¿e nadajesz siê do tej roboty, gdy tylko dowiem siê ¿e coœ posz³o do Five-zero to rozjebie Ci ten pusty ³eb!", ImieBota(id));
						        CzatGlobalnyBot(id, string, 10);
						        format(string, sizeof(string), "%s mówi: Dalej tu stoisz kurwa?! Bierz swój ty³ek i do roboty wszystko masz opisane tutaj! Nie zawiedŸ mnie bo nastêpnej szansy nie bêdzie!", ImieBota(id));
						        CzatGlobalnyBot(id, string, 10);
						        format(string, sizeof(string), "*%s podaje goœciowi teczkê a w niej zawarte informacje dot. zlecenia nastêpnie zaci¹ga siê i wypuszcza dym w jego stronê*", ImieBota(id));
								SendWrappedMessageToBot(id, FIOLETOWY, string, 10);
						        SetPVarInt(playerid, "CzarnaRobota", 1);
						        SetPVarInt(playerid, "CzarnaRobotaCzas", 900);
			                    SetPlayerCheckpoint(playerid, 2066.497070, -1872.922607, 14.499691, 1.5);
			                    GameTextForPlayer(playerid, "~g~Udaj siê na miejsce rabunku, masz 15minut na wykonanie zadania!", 3000, 5);
			                    return 1;
							}
							else
							{
							    format(string, sizeof(string), "%s mówi: A'yo - s³ysza³eœ ¿e rozdaje robotê tylko mordo wiesz ¿e nie lubiê ryzykowaæ z takimi jak Ty!", ImieBota(id));
						        CzatGlobalnyBot(id, string, 10);
						        format(string, sizeof(string), "%s mówi: Wybacz ale nie wygl¹dasz mi na gangstera wiêc spierdalaj, wróæ jak zdobêdziesz jakiœ respekt, huh!", ImieBota(id));
						        CzatGlobalnyBot(id, string, 10);
						        format(string, sizeof(string), "*%s poci¹ga nosem i spogl¹da na goœcia delikatnie z byka*", ImieBota(id));
								SendWrappedMessageToBot(id, FIOLETOWY, string, 10);
								GameTextForPlayer(playerid, "~g~Aktor nie lubi ryzykowac!", 3000, 5);
								return 1;
							}
						}
					}
					else
					{
					    new string[512];
					    new id;
		    			id = GetPVarInt(playerid, "BOT");
					    format(string, sizeof(string), "%s mówi: Mordo nie zawracaj mi teraz g³owy, wpadnij pogadaæ o 19 mo¿e bêdê mia³ humor bo kurwa jak widzê ofermy..", ImieBota(id));
				        CzatGlobalnyBot(id, string, 3);
				        format(string, sizeof(string), "%s mówi: [..]które chc¹ zawracaæ mi dupê w takich przypa³owych godzinach to nic z was nie bêdzie, a tylko nie przychodŸ po 23!", ImieBota(id));
				        CzatGlobalnyBot(id, string, 3);
					}
				}
				case 1:
				{
				    new string[512];
				    new id;
	    			id = GetPVarInt(playerid, "BOT");
				    if(GetPVarInt(playerid, "CzarnaRobota") == 2)
				    {
				        if(GetPVarInt(playerid, "IloscPaczekRobota") != 0)
				        {
					        format(string, sizeof(string), "%s mówi: A'yo widzê ¿e uda³o Ci siê coœ podpierdoliæ, podoba mi siê Twoje podejœcie do tematu!", ImieBota(id));
					        CzatGlobalnyBot(id, string, 10);
					        format(string, sizeof(string), "%s mówi: Zabieraj siê st¹d oraz tego dostawczaka i nie widzê Ciê tutaj, bo pewnie ju¿ szukaj¹ winnych!", ImieBota(id));
					        CzatGlobalnyBot(id, string, 10);
					        format(string, sizeof(string), "*%s uœmiecha siê w kierunku goœcia i spluwa przed siebie.*", ImieBota(id));
							SendWrappedMessageToBot(id, FIOLETOWY, string, 10);
					        SetPVarInt(playerid, "CzarnaRobota", 0);
					        new ilosc = GetPVarInt(playerid, "IloscPaczekRobota");
                            Dodajkase(playerid, 10*ilosc);
                            SetPVarInt(playerid, "IloscPaczekRobota", 0);
                            return 1;
						}
						else
						{
						    format(string, sizeof(string), "%s mówi: A'yo uda³o Ci siê coœ podpierdoliæ? Widzê ¿e coœ pusto na tym dostawczaku!", ImieBota(id));
					        CzatGlobalnyBot(id, string, 10);
					        format(string, sizeof(string), "%s mówi: Mordo jak masz odpierdalaæ przypa³ i przychodziæ z niczym to do mnie nie przychodŸ a teraz wypierdalaj!", ImieBota(id));
					        CzatGlobalnyBot(id, string, 10);
					        format(string, sizeof(string), "*%s spluwa przed siebie delikatnie wkurzony na goœcia przed sob¹.*", ImieBota(id));
							SendWrappedMessageToBot(id, FIOLETOWY, string, 10);
					        SetPVarInt(playerid, "CzarnaRobota", 0);
					        return 1;
						}
				    }
				    else
				    {
				        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "Rabunek mieszkania", "Nie zrabowa³eœ ¿adnego mieszkania, wiêc nie mo¿esz otrzymaæ ¿adnego wynagrodzenia!", "Zamknij", "");
						return 0;
				    }
				}
				case 2:
				{
				    if(GetPVarInt(playerid, "CzarnaRobota") == 1)
				    {
						new string[512];
						new id;
						id = GetPVarInt(playerid, "BOT");
						format(string, sizeof(string), "%s mówi: Yo'w widzê ¿e obsra³eœ gacie, spierdalaj st¹d ofermo!", ImieBota(id));
					    CzatGlobalnyBot(id, string, 10);
					    SetPVarInt(playerid, "CzarnaRobota", 0);
	        			SetPVarInt(playerid, "CzarnaRobotaCzas", 0);
	        			SetPVarInt(playerid, "Poziom", 0);
	        			SetPVarInt(playerid, "BotAkcja", 0);
	        			SetPVarInt(playerid, "CzarnaRobotaPaczka", 0);
	        			RemovePlayerAttachedObject(playerid, 8);
						SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	        			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "Rabunek mieszkania", "Zrezygnowa³es z rabunku na mieszaknie.", "Zamknij", "");
						return 1;
					}
				}
			}
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_AKTOR)
	{
	    if(response)
		{
		    switch(listitem)
			{
				case 0:
				{
				    new string[256];
				    format(string, sizeof(string), "%s\n1. Wyrób dowód osobisty", string);
					format(string, sizeof(string), "%s\n2. Wyrób prawo jazdy", string);
					format(string, sizeof(string), "%s\n3. Wyrób kartê wêdkarsk¹", string);
					dShowPlayerDialog(playerid, DIALOG_INTERAKCJA_AKTOR2, DIALOG_STYLE_LIST, "• Interakcja z aktorem:", string, "Wybierz", "Zamknij");
					return 1;
				}
				case 1:
				{
				    new string[512];
				    new id;
	    			id = GetPVarInt(playerid, "BOT");
				    if(GetPVarInt(playerid, "BotAkcja") == 0)
					{
						SetPVarInt(playerid, "BotAkcja", 5);
					}
				    if(GetPVarInt(playerid, "Poziom") == 0 && GetPVarInt(playerid, "BotAkcja") == 5)
				    {
						format(string, sizeof(string), "%s mówi: Witam poproszê od pana dowód rejestracyjny.", ImieBota(id));
				        CzatGlobalnyBot(id, string, 10);
				        SetPVarInt(playerid, "Poziom", 1);
						return 1;
				    }
				    if(GetPVarInt(playerid, "Poziom") == 1 && GetPVarInt(playerid, "BotAkcja") == 5)
				    {
						format(string, sizeof(string), "%s mówi: Chwileczkê, tylko wpiszê wszystkie dane z dokumentów.", ImieBota(id));
				        CzatGlobalnyBot(id, string, 10);
				        format(string, sizeof(string), "*%s wpisuje wszystkie dane pojazdu do bazy danych, nastepnie idzie do magazynku i przynosi nowo wyt³oczone tablice rejestracyjne i podaje klientowi wraz z dokumentami*", ImieBota(id));
						SendWrappedMessageToBot(id, FIOLETOWY, string, 10);
				        new string2[512];
						format(string2, sizeof(string2), "Podaj numer UID pojazdu, by zarejestrowaæ pojazd.");
						dShowPlayerDialog(playerid,DIALOG_INTERAKCJA_AKTOR3,DIALOG_STYLE_INPUT,"• Interakcja z aktorem:",string2,"Potwierdz","Anuluj");
						SetPVarInt(playerid, "BotAkcja", 0);
						SetPVarInt(playerid, "Poziom", 0);
						return 1;
				    }
				}
				case 2:
				{
				    new string[512];
				    new id;
	    			id = GetPVarInt(playerid, "BOT");
				    if(GetPVarInt(playerid, "BotAkcja") == 0)
					{
						SetPVarInt(playerid, "BotAkcja", 5);
					}
				    if(GetPVarInt(playerid, "Poziom") == 0 && GetPVarInt(playerid, "BotAkcja") == 5)
				    {
						format(string, sizeof(string), "%s mówi: Witam poproszê od pana dokumenty budynku.", ImieBota(id));
				        CzatGlobalnyBot(id, string, 10);
				        SetPVarInt(playerid, "Poziom", 1);
				        return 1;
				    }
				    if(GetPVarInt(playerid, "Poziom") == 1 && GetPVarInt(playerid, "BotAkcja") == 5)
				    {
						format(string, sizeof(string), "%s mówi: Chwileczkê, tylko wpiszê wszyskie Pana dane osobowe do bazy danych.", ImieBota(id));
				        CzatGlobalnyBot(id, string, 10);
				        format(string, sizeof(string), "*%s wpisuje wszystkie dane osobowe klienta do bazy danych nastêpnie oddaje wszystkie dokumenty klientowi*", ImieBota(id));
						SendWrappedMessageToBot(id, FIOLETOWY, string, 10);
				        new string2[512];
				        SetPVarInt(playerid, "IDBota", id);
						format(string2, sizeof(string2), "Podaj UID budynku, by op³aciæ budynek na nastêpny tydzieñ.");
						dShowPlayerDialog(playerid,DIALOG_INTERAKCJA_AKTOR4,DIALOG_STYLE_INPUT,"• Interakcja z aktorem:",string2,"Potwierdz","Anuluj");
						SetPVarInt(playerid, "BotAkcja", 0);
						SetPVarInt(playerid, "Poziom", 0);
						return 1;
				    }
				}
				case 3:
				{
				    new string[512];
				    new id;
	    			id = GetPVarInt(playerid, "BOT");
				    if(GetPVarInt(playerid, "BotAkcja") == 0)
					{
						SetPVarInt(playerid, "BotAkcja", 5);
					}
				    if(GetPVarInt(playerid, "Poziom") == 0 && GetPVarInt(playerid, "BotAkcja") == 5)
				    {
						format(string, sizeof(string), "%s mówi: Witam poproszê od pana dowód osobisty.", ImieBota(id));
				        CzatGlobalnyBot(id, string, 10);
				        SetPVarInt(playerid, "Poziom", 1);
						return 1;
				    }
				    if(GetPVarInt(playerid, "Poziom") == 1 && GetPVarInt(playerid, "BotAkcja") == 5)
				    {
						format(string, sizeof(string), "%s mówi: Chwileczkê, tylko sprawdzê Pana dokumentacjê.", ImieBota(id));
				        CzatGlobalnyBot(id, string, 10);
				        format(string, sizeof(string), "*%s sprawdza klienta w bazie Rz¹dowej nastêpnie ca³¹ dokumentacjê*", ImieBota(id));
						SendWrappedMessageToBot(id, FIOLETOWY, string, 10);
				        new str[256];
					    format(str, sizeof(str), "%s\nWarsztat", str);
					    format(str, sizeof(str), "%s\nGastronomia", str);
					    format(str, sizeof(str), "%s\nSi³ownia", str);
					    format(str, sizeof(str), "%s\nOchrona", str);
					    format(str, sizeof(str), "%s\nSieæ telefoniczna", str);
					    format(str, sizeof(str), "%s\nStrzelnica", str);
					    format(str, sizeof(str), "%s\nSklep z broni¹ (Ammunation)", str);
					    format(str, sizeof(str), "%s\nTaxi", str);
					    format(str, sizeof(str), "%s\nSalon tatua¿u", str);
						format(str, sizeof(str), "%s\nRadio", str);
						dShowPlayerDialog(playerid, DIALOG_INTERAKCJA_AKTOR_D1, DIALOG_STYLE_LIST, "• Interakcja z aktorem:", str, "Wybierz", "Zamknij");
						SetPVarInt(playerid, "BotAkcja", 0);
						SetPVarInt(playerid, "Poziom", 0);
						return 1;
				    }
				}
				case 4:
				{
				    new gsy = DaneGracza[playerid][gGAMESCORE]-500;
				    if(gsy < 0)
				    {
				        GameTextForPlayer(playerid, "~r~Zbyt malo QPoint's!", 3000, 5);
						return 0;
				    }
				    new string[512];
				    new id;
	    			id = GetPVarInt(playerid, "BOT");
				    if(GetPVarInt(playerid, "BotAkcja") == 0)
					{
						SetPVarInt(playerid, "BotAkcja", 5);
					}
				    if(GetPVarInt(playerid, "Poziom") == 0 && GetPVarInt(playerid, "BotAkcja") == 5)
				    {
						format(string, sizeof(string), "%s mówi: Witam poproszê od dowód rejestracyjny.", ImieBota(id));
				        CzatGlobalnyBot(id, string, 10);
				        SetPVarInt(playerid, "Poziom", 1);
						return 1;
				    }
				    if(GetPVarInt(playerid, "Poziom") == 1 && GetPVarInt(playerid, "BotAkcja") == 5)
				    {
						format(string, sizeof(string), "%s mówi: Chwileczkê wprowadzê Pana dane do bazy danych.", ImieBota(id));
				        CzatGlobalnyBot(id, string, 10);
				        format(string, sizeof(string), "*%s wprowadza klienta do bazy Rz¹dowej nastêpnie podaje unikatow¹ rejestracjê samochodow¹ przy czym równie¿ oddaje dokumenty*", ImieBota(id));
						SendWrappedMessageToBot(id, FIOLETOWY, string, 10);
                        DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, P_UNIKATREJ, 0, 0, "Unikatowa rejestracja samochodowa", DaneGracza[playerid][gUID], 0, 0, 0, 0, 0, 0, "");
                        GameTextForPlayer(playerid, "~r~Rejestracja w ekwipunku!", 3000, 5);
						DaneGracza[playerid][gGAMESCORE] += -500;
						ZapiszGraczaGlobal(playerid, 1);
						SetPlayerScore(playerid, DaneGracza[playerid][gGAMESCORE]);
						SetPVarInt(playerid, "BotAkcja", 0);
						SetPVarInt(playerid, "Poziom", 0);
						return 1;
				    }
				}
				case 5:
				{
				    SetPVarInt(playerid, "BotAkcja", 0);
					SetPVarInt(playerid, "Poziom", 0);
					//Bilboardy
				}
				case 6:
				{
				    new string[512];
				    new id;
	    			id = GetPVarInt(playerid, "BOT");
				    if(GetPVarInt(playerid, "BotAkcja") == 0)
					{
						SetPVarInt(playerid, "BotAkcja", 5);
					}
				    if(GetPVarInt(playerid, "Poziom") == 0 && GetPVarInt(playerid, "BotAkcja") == 5)
				    {
						format(string, sizeof(string), "%s mówi: Witam poproszê od pana dowód osobisty oraz 2 zdjêcia.", ImieBota(id));
				        CzatGlobalnyBot(id, string, 10);
				        SetPVarInt(playerid, "Poziom", 1);
						return 1;
				    }
				    if(GetPVarInt(playerid, "Poziom") == 1 && GetPVarInt(playerid, "BotAkcja") == 5)
				    {
						format(string, sizeof(string), "%s mówi: Chwileczkê, tylko sprawdzê Pana dokumentacjê w naszej bazie Rz¹dowej i wydam panu wszystkie potrzebne dokumenty...", ImieBota(id));
				        CzatGlobalnyBot(id, string, 10);
				        format(string, sizeof(string), "%s mówi: [...] do za³o¿enia rodziny w mieœcie Los Santos.", ImieBota(id));
				        CzatGlobalnyBot(id, string, 10);
				        format(string, sizeof(string), "*%s sprawdza klienta w bazie Rz¹dowej nastêpnie ca³¹ dokumentacjê i po chwili wydaje wszystkie przygotowane dokumenty.*", ImieBota(id));
						SendWrappedMessageToBot(id, FIOLETOWY, string, 10);
				        new str[256];
					    format(str, sizeof(str), "%s\nRodzinka", str);
						dShowPlayerDialog(playerid, DIALOG_INTERAKCJA_RODZINKA_D1, DIALOG_STYLE_LIST, "• Interakcja z aktorem:", str, "Wybierz", "Zamknij");
						SetPVarInt(playerid, "BotAkcja", 0);
						SetPVarInt(playerid, "Poziom", 0);
						return 1;
				    }
				}
			}
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_RODZINKA_D1)
	{
	    if(response)
		{
		    switch(listitem)
			{
				case 0:
				{
				    new string2[512];
					format(string2, sizeof(string2), "Jak ma siê nazywaæ ta rodzinka/party?");
					dShowPlayerDialog(playerid,DIALOG_INTERAKCJA_RODZINKA,DIALOG_STYLE_INPUT,"Interakcja z aktorem:",string2,"Potwierdz","Anuluj");
					SetPVarInt(playerid, "AKTORNAZWADZ", 1);
					return 1;
				}
			}
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_AKTOR_D1)
	{
	    if(response)
		{
		    switch(listitem)
			{
				case 0:
				{
				    new string2[512];
					format(string2, sizeof(string2), "Jak ma siê nazywaæ ta dzia³alnoœæ gospodarcza?");
					dShowPlayerDialog(playerid,DIALOG_INTERAKCJA_DZIALALNOSC,DIALOG_STYLE_INPUT,"Interakcja z aktorem:",string2,"Potwierdz","Anuluj");
					SetPVarInt(playerid, "AKTORNAZWADZ", 1);
					return 1;
				}
				case 1:
				{
				    new string2[512];
					format(string2, sizeof(string2), "Jak ma siê nazywaæ ta dzia³alnoœæ gospodarcza?");
					dShowPlayerDialog(playerid,DIALOG_INTERAKCJA_DZIALALNOSC,DIALOG_STYLE_INPUT,"Interakcja z aktorem:",string2,"Potwierdz","Anuluj");
					SetPVarInt(playerid, "AKTORNAZWADZ", 2);
					return 1;
				}
				case 2:
				{
				    new string2[512];
					format(string2, sizeof(string2), "Jak ma siê nazywaæ ta dzia³alnoœæ gospodarcza?");
					dShowPlayerDialog(playerid,DIALOG_INTERAKCJA_DZIALALNOSC,DIALOG_STYLE_INPUT,"Interakcja z aktorem:",string2,"Potwierdz","Anuluj");
					SetPVarInt(playerid, "AKTORNAZWADZ", 3);
					return 1;
				}
				case 3:
				{
				    new string2[512];
					format(string2, sizeof(string2), "Jak ma siê nazywaæ ta dzia³alnoœæ gospodarcza?");
					dShowPlayerDialog(playerid,DIALOG_INTERAKCJA_DZIALALNOSC,DIALOG_STYLE_INPUT,"Interakcja z aktorem:",string2,"Potwierdz","Anuluj");
					SetPVarInt(playerid, "AKTORNAZWADZ", 4);
					return 1;
				}
				case 4:
				{
				    new string2[512];
					format(string2, sizeof(string2), "Jak ma siê nazywaæ ta dzia³alnoœæ gospodarcza?");
					dShowPlayerDialog(playerid,DIALOG_INTERAKCJA_DZIALALNOSC,DIALOG_STYLE_INPUT,"Interakcja z aktorem:",string2,"Potwierdz","Anuluj");
					SetPVarInt(playerid, "AKTORNAZWADZ", 5);
					return 1;
				}
				case 5:
				{
				    new string2[512];
					format(string2, sizeof(string2), "Jak ma siê nazywaæ ta dzia³alnoœæ gospodarcza?");
					dShowPlayerDialog(playerid,DIALOG_INTERAKCJA_DZIALALNOSC,DIALOG_STYLE_INPUT,"Interakcja z aktorem:",string2,"Potwierdz","Anuluj");
					SetPVarInt(playerid, "AKTORNAZWADZ", 6);
					return 1;
				}
				case 6:
				{
				    new string2[512];
					format(string2, sizeof(string2), "Jak ma siê nazywaæ ta dzia³alnoœæ gospodarcza?");
					dShowPlayerDialog(playerid,DIALOG_INTERAKCJA_DZIALALNOSC,DIALOG_STYLE_INPUT,"Interakcja z aktorem:",string2,"Potwierdz","Anuluj");
					SetPVarInt(playerid, "AKTORNAZWADZ", 7);
					return 1;
				}
				case 7:
				{
				    new string2[512];
					format(string2, sizeof(string2), "Jak ma siê nazywaæ ta dzia³alnoœæ gospodarcza?");
					dShowPlayerDialog(playerid,DIALOG_INTERAKCJA_DZIALALNOSC,DIALOG_STYLE_INPUT,"Interakcja z aktorem:",string2,"Potwierdz","Anuluj");
					SetPVarInt(playerid, "AKTORNAZWADZ", 8);
					return 1;
				}
				case 8:
				{
				    new string2[512];
					format(string2, sizeof(string2), "Jak ma siê nazywaæ ta dzia³alnoœæ gospodarcza?");
					dShowPlayerDialog(playerid,DIALOG_INTERAKCJA_DZIALALNOSC,DIALOG_STYLE_INPUT,"Interakcja z aktorem:",string2,"Potwierdz","Anuluj");
					SetPVarInt(playerid, "AKTORNAZWADZ", 9);
					return 1;
				}
				case 9:
				{
				    new string2[512];
					format(string2, sizeof(string2), "Jak ma siê nazywaæ ta dzia³alnoœæ gospodarcza?");
					dShowPlayerDialog(playerid,DIALOG_INTERAKCJA_DZIALALNOSC,DIALOG_STYLE_INPUT,"Interakcja z aktorem:",string2,"Potwierdz","Anuluj");
					SetPVarInt(playerid, "AKTORNAZWADZ", 10);
					return 1;
				}
			}
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_RODZINKA)
	{
	    if(response)
		{
		    if(GetPVarInt(playerid, "AKTORNAZWADZ") == 1)
		    {
		        UsunNieChcianeZnaki(inputtext);
		        UsunPLZnaki(inputtext);
		        Oferuj(playerid, playerid, DZIALALNOSC_RODZINKA, 0, 0, 0, OFEROWANIE_DZIALA, 1000, inputtext, 0);
		        return 1;
		    }
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_DZIALALNOSC)
	{
	    if(response)
		{
		    if(GetPVarInt(playerid, "AKTORNAZWADZ") == 1)
		    {
		        UsunNieChcianeZnaki(inputtext);
		        UsunPLZnaki(inputtext);
		        Oferuj(playerid, playerid, DZIALALNOSC_WARSZTAT, 0, 0, 0, OFEROWANIE_DZIALA, 2500, inputtext, 0);
		        return 1;
		    }
		    if(GetPVarInt(playerid, "AKTORNAZWADZ") == 2)
		    {
		        UsunNieChcianeZnaki(inputtext);
		        UsunPLZnaki(inputtext);
		        Oferuj(playerid, playerid, DZIALALNOSC_GASTRONOMIA, 0, 0, 0, OFEROWANIE_DZIALA, 2500, inputtext, 0);
		        return 1;
		    }
		    if(GetPVarInt(playerid, "AKTORNAZWADZ") == 3)
		    {
		        UsunNieChcianeZnaki(inputtext);
		        UsunPLZnaki(inputtext);
		        Oferuj(playerid, playerid, DZIALALNOSC_SILOWNIA, 0, 0, 0, OFEROWANIE_DZIALA, 2500, inputtext, 0);
		        return 1;
		    }
		    if(GetPVarInt(playerid, "AKTORNAZWADZ") == 4)
		    {
		        UsunNieChcianeZnaki(inputtext);
		        UsunPLZnaki(inputtext);
		        Oferuj(playerid, playerid, DZIALALNOSC_WYPOZYCZALNIA, 0, 0, 0, OFEROWANIE_DZIALA, 2500, inputtext, 0);
		        return 1;
		    }
		    if(GetPVarInt(playerid, "AKTORNAZWADZ") == 5)
		    {
		        UsunNieChcianeZnaki(inputtext);
		        UsunPLZnaki(inputtext);
		        Oferuj(playerid, playerid, DZIALALNOSC_SIEC, 0, 0, 0, OFEROWANIE_DZIALA, 2500, inputtext, 0);
		        return 1;
		    }
		    if(GetPVarInt(playerid, "AKTORNAZWADZ") == 6)
		    {
		        UsunNieChcianeZnaki(inputtext);
		        UsunPLZnaki(inputtext);
		        Oferuj(playerid, playerid, DZIALALNOSC_STRZELNICA, 0, 0, 0, OFEROWANIE_DZIALA, 2500, inputtext, 0);
		        return 1;
		    }
		    if(GetPVarInt(playerid, "AKTORNAZWADZ") == 7)
		    {
		        UsunNieChcianeZnaki(inputtext);
		        UsunPLZnaki(inputtext);
		        Oferuj(playerid, playerid, DZIALALNOSC_AMUNATION, 0, 0, 0, OFEROWANIE_DZIALA, 2500, inputtext, 0);
		        return 1;
		    }
		    if(GetPVarInt(playerid, "AKTORNAZWADZ") == 8)
		    {
		        UsunNieChcianeZnaki(inputtext);
		        UsunPLZnaki(inputtext);
		        Oferuj(playerid, playerid, DZIALALNOSC_TAXI, 0, 0, 0, OFEROWANIE_DZIALA, 2500, inputtext, 0);
		        return 1;
		    }
		    if(GetPVarInt(playerid, "AKTORNAZWADZ") == 9)
		    {
		        UsunNieChcianeZnaki(inputtext);
		        UsunPLZnaki(inputtext);
		        Oferuj(playerid, playerid, DZIALALNOSC_TATUAZ, 0, 0, 0, OFEROWANIE_DZIALA, 2500, inputtext, 0);
		        return 1;
		    }
			if(GetPVarInt(playerid, "AKTORNAZWADZ") == 10)
		    {
		        UsunNieChcianeZnaki(inputtext);
		        UsunPLZnaki(inputtext);
		        Oferuj(playerid, playerid, DZIALALNOSC_SANNEWS, 0, 0, 0, OFEROWANIE_DZIALA, 2500, inputtext, 0);
		        return 1;
		    }
		}
	}
	if(dialogid == DIALOG_INTERAKCJA_WYBIERZ)
	{
	    if(response)
		{
		    switch(listitem)
			{
				case 0:
				{
				    new id = GetPVarInt(playerid, "gracz");
                    if(!PlayerObokPlayera(playerid, id, 5))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Gracz któremu chcesz oferowaæ przywitanie nie znajduje siê obok ciebie.", "Zamknij", "");
						return 1;
					}
					if(!IsPlayerFacingPlayer(playerid, id, 20))
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Gracz któremu chcesz oferowaæ przywitanie nie patrzy w twoj¹ strone.", "Zamknij", "");
						return 1;
					}
					else
					{
						GameTextForPlayer(playerid, "~y~Oferta:~n~~w~Zostala wyslana czekaj na reakcje gracza.", 3000, 5);
						Oferuj(playerid, id, 0, 0, 0, 0, OFEROWANIE_YO, 0, "", 0);
					}
				}
				case 1:
				{
				    new playerid2 = GetPVarInt(playerid, "gracz");
                    new id = GraczNaTerenie(playerid);
					new dz1 = DaneGracza[playerid][gDzialalnosc1];
				    new dz2 = DaneGracza[playerid][gDzialalnosc2];
				    new dz3 = DaneGracza[playerid][gDzialalnosc3];
				    new dz4 = DaneGracza[playerid][gDzialalnosc4];
				    new dz5 = DaneGracza[playerid][gDzialalnosc5];
				    new dz6 = DaneGracza[playerid][gDzialalnosc6];
				    if((Lokacja[id][gOwner] != dz1 || Lokacja[id][gOwner] != dz2 || Lokacja[id][gOwner] != dz3 || Lokacja[id][gOwner] != dz4 || Lokacja[id][gOwner] != dz5 || Lokacja[id][gOwner] != dz6) && Lokacja[id][gOwner] == 0)
					{
					    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie masz uprawnieñ by okradaæ na tej strefie.", "Zamknij", "");
						return 1;
					}
					if(zalogowany[playerid2] == false)
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Gracz któremu chcesz zabraæ przedmiot nie jest zalogowany.", "Zamknij", "");
						return 1;
					}
					if(DaneGracza[playerid2][gBW] == 0)
					{
					    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Gracz któremu chcesz zabraæ przedmiot powinien byæ nieprzytomny.", "Zamknij", "");
						return 1;
					}
					if(!PlayerObokPlayera(playerid, playerid2, 5))
					{
					    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Gracz któremu chcesz zabraæ przedmiot nie znajduje siê ko³o Ciebie.", "Zamknij", "");
					    return 1;
					}
					if(playerid == playerid2) return 1;
					SetPVarInt(playerid, "IDZAB", playerid2);
					Przedmioty(playerid, playerid2, DIALOG_ZABIERZ, "• Przedmioty:", TYP_WLASCICIEL, 0);
				}
				case 2:
				{
				    //tatuaz interakcja
				    new playerid2 = GetPVarInt(playerid, "gracz");
				    ZaladujTato();
					new found = 0;
					strdel(tekst_global, 0, 1024);
				    ForeachEx(i, MAX_TATO)
					{
						if(Tatuaze[i][tUID] == DaneGracza[playerid2][gUID])
						{
							format(tekst_global, sizeof(tekst_global), "%s\n%d\t%s", tekst_global, Tatuaze[i][tID], Tatuaze[i][tTATUAZ]);
							found++;
						}
					}
					if(found != 0) dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Lista tatua¿y:", tekst_global, "Zamknij", "");
					else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie posiada ¿adnego tatua¿u.", "Rozumiem", "Zamknij");
					return 1;
				}
				case 3:
				{
					new playerid2 = GetPVarInt(playerid, "gracz");
					if(DaneGracza[playerid2][gBW] != 0)
					{
						if(DaneGracza[playerid2][gBW] < 120)
						{
							PierwszaPomoc[playerid] = 45;
							PierwszaPomocGracz[playerid] = playerid2;
							SendClientMessage(playerid, SZARY, "Udzielasz pierwszej pomocy, pamiêtaj by byæ obok gracza i siê nie oddalaæ odegraj stosown¹ akcjê RP");
						}
						else
						{
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Wezwij pomoc lub spróbuj zachwilkê udzieliæ pomocy temu graczu!", "Rozumiem", "");
							return 0;
						}
					}
					else
					{
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ten gracz nie potrzebuje pomocy innej osoby i¿ jest przytomny!", "Rozumiem", "");
						return 0;
					}
				}
			}
   		}
		else
		{
			return 0;
		}
	}
	if(dialogid == DIALOG_DRZWI_OPCJE_SP)
	{
	    if(response)
		{
            SetPVarInt(playerid, "CenaBudynku",strval(inputtext));
            new found = 0;
			strdel(tekst_global, 0, 2048);
			ForeachEx(i, MAX_PLAYERS)
			{
				if(IsPlayerConnected(i))
				{
					if(zalogowany[i] == true)
					{
						if(DaneGracza[i][gUID] && PlayerObokPlayera(playerid, i, 5) && i != playerid)
						{
							format(tekst_global, sizeof(tekst_global), "%s\n%d\t%s", tekst_global, i, ZmianaNicku(i));
							found++;
						}
					}
				}
			}
			if(found != 0) dShowPlayerDialog(playerid, DIALOG_DRZWI_OPCJE_SP_G, DIALOG_STYLE_LIST, "• Nieruchomoœæ:", tekst_global, "Oferuj", "Zamknij");
			else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nikt obok Ciebie siê nie znajduje.", "Okej", "Zamknij");
	    }
	    return 1;
	}
	if(dialogid == DIALOG_DRZWI_OPCJE_SP_G)
	{
	    if(response)
		{
		    new uids = GetPVarInt(playerid, "uiddrzwi");
		    Transakcja(T_HOFFER, DaneGracza[playerid][gUID], DaneGracza[strval(inputtext)][gUID], DaneGracza[playerid][gGUID], DaneGracza[strval(inputtext)][gGUID], GetPVarInt(playerid, "CenaBudynku"), uids, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
			Oferuj(playerid, strval(inputtext), 0, 0, uids, 0, OFEROWANIE_BUDYNKU, GetPVarInt(playerid, "CenaBudynku"), "", 0);
	    }
	    return 1;
	}
	if(dialogid == DIALOG_DRZWI_OPCJE_WN)
	{
	    if(response)
		{
			if(strlen(inputtext) > 26 || strlen(inputtext) < 3)
			{
				dShowPlayerDialog(playerid, DIALOG_DRZWI_OPCJE_WN, DIALOG_STYLE_INPUT, "• Informacja:", "Wpisz now¹ nazwe w pole ni¿ej max 3-26 znaki.", "Zatwierdz", "Zamknij");
				return 1;
			}
			if(antyst(inputtext))
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "W nazwie u¿y³eœ niedowolonych znaków takich jak:\n{FF0000}; : ' * |\nZmieñ je i¿ s¹ one niedowozolone.", "Zamknij", "");
				return 1;
			}
			//Dodajkase(playerid, -100);
			new uids = GetPVarInt(playerid, "uiddrzwi");
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[DOOR] [%s] [ID: %d] changed the name of the building %s value %s", ZmianaNicku(playerid), playerid, BudynekInfo[uids][nAdres], inputtext);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
			format(BudynekInfo[uids][nAdres], 50, "%s", inputtext);
   			ZapiszNieruchomosc(uids);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nazwa budynku zosta³a zmieniona.", "Zamknij", "");
	    }
	    return 1;
	}
	if(dialogid == DIALOG_PODPISZ_BUDYNEK)
	{
	    if(response)
		{
		    new uidd = strval(inputtext);
		    new uid = GetPVarInt(playerid, "uiddrzwi");
			if(uidd == 1)
			{
			    BudynekInfo[uid][nWlascicielP] = 0;
				BudynekInfo[uid][nWlascicielD] = DaneGracza[playerid][gDzialalnosc1];
				Transakcja(T_HPODPIS, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, uid, DaneGracza[playerid][gDzialalnosc1], -1, "-", gettime()+KOREKTA_CZASOWA);
			}
			else if(uidd == 2)
			{
				BudynekInfo[uid][nWlascicielP] = 0;
				BudynekInfo[uid][nWlascicielD] = DaneGracza[playerid][gDzialalnosc2];
				Transakcja(T_HPODPIS, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, uid, DaneGracza[playerid][gDzialalnosc2], -1, "-", gettime()+KOREKTA_CZASOWA);
			}
			else if(uidd == 3)
			{
	            BudynekInfo[uid][nWlascicielP] = 0;
				BudynekInfo[uid][nWlascicielD] = DaneGracza[playerid][gDzialalnosc3];
				Transakcja(T_HPODPIS, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, uid, DaneGracza[playerid][gDzialalnosc3], -1, "-", gettime()+KOREKTA_CZASOWA);
			}
			else if(uidd == 4)
			{
	            BudynekInfo[uid][nWlascicielP] = 0;
				BudynekInfo[uid][nWlascicielD] = DaneGracza[playerid][gDzialalnosc4];
				Transakcja(T_HPODPIS, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, uid, DaneGracza[playerid][gDzialalnosc4], -1, "-", gettime()+KOREKTA_CZASOWA);
			}
			else if(uidd == 5)
			{
	            BudynekInfo[uid][nWlascicielP] = 0;
				BudynekInfo[uid][nWlascicielD] = DaneGracza[playerid][gDzialalnosc5];
				Transakcja(T_HPODPIS, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, uid, DaneGracza[playerid][gDzialalnosc5], -1, "-", gettime()+KOREKTA_CZASOWA);
			}
			else if(uidd == 6)
			{
	            BudynekInfo[uid][nWlascicielP] = 0;
				BudynekInfo[uid][nWlascicielD] = DaneGracza[playerid][gDzialalnosc6];
				Transakcja(T_HPODPIS, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, uid, DaneGracza[playerid][gDzialalnosc6], -1, "-", gettime()+KOREKTA_CZASOWA);
			}
			ZapiszNieruchomosc(uid);
			DestroyDynamicPickup(BudynekInfo[uid][nID]);
			new uidp = BudynekInfo[uid][nWlascicielD];
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_POLICYJNA)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1247;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_ZMOTORYZOWANA)
	 		{
				if(BudynekInfo[uid][nTyp] == 0)
	 		    {
					BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1273;
					BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
				}
				if(BudynekInfo[uid][nTyp] == 1)
	 		    {
					BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1239;
					BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
				}
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_247)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1212;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_WARSZTAT)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 18635;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_SALON)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1210;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_BANK)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1274;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_GASTRONOMIA)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1582;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_HOTEL)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1272;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_MAFIE)
	 		{
				if(BudynekInfo[uid][nTyp] == 0)
	 		    {
					BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1273;
					BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
				}
				if(BudynekInfo[uid][nTyp] == 1)
	 		    {
					BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1239;
					BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
				}
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_SANNEWS)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1962;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_TAXI)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 19308;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_BINCO)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1275;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_SILOWNIA)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 3072;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_RZADOWA)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1239;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_ELKA)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1239;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_SYNDYKAT)
	 		{
				if(BudynekInfo[uid][nTyp] == 0)
	 		    {
					BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1273;
					BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
				}
				if(BudynekInfo[uid][nTyp] == 1)
	 		    {
					BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1239;
					BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
				}
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_GANGI)
	 		{
	 		    if(BudynekInfo[uid][nTyp] == 0)
	 		    {
					BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1273;
					BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
				}
				if(BudynekInfo[uid][nTyp] == 1)
	 		    {
					BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1239;
					BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
				}
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_MEDYCZNA)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1241;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_ELEKTRTYKA)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1958;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_WYPOZYCZALNIA)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1210;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_TRANS)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1210;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_RODZINKA && BudynekInfo[uid][nTyp] == 1)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1559;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_RODZINKA && BudynekInfo[uid][nTyp] == 0)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1273;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == 0 && BudynekInfo[uid][nTyp] == 1)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1239;//
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == 0 && BudynekInfo[uid][nTyp] == 0)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1273;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_BRANZA)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 1239;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_SIEC)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 18868;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_STRZELNICA)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 346;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_TATUAZ)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 2711;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			if(GrupaInfo[uidp][gTyp] == DZIALALNOSC_AMUNATION)
	 		{
				BudynekInfo[uid][nID] = BudynekInfo[uid][nPickup] = 336;
				BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
			}
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[DOOR] [%s] [ID: %d] rewritten the door %s under the group %s", ZmianaNicku(playerid), playerid, BudynekInfo[uid][nAdres], GrupaInfo[uidp][gNazwa]);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
			ZapiszNieruchomosc(uid);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "\nBudynek zosta³ podpisany pod Grupê!\nOd teraz mo¿esz w tym budynku pe³niæ s³u¿bê!", "Zamknij", "");
		}
		else
		{
        	//dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "•» Informacja", "Anulowa³eœ transakcje pomyœlnie.", "Zamknij", "");
		}
		return 1;
	}
	if(dialogid == DIALOG_PODPISZ_AREA)
	{
	    if(response)
		{
		    new uidd = strval(inputtext);
		    new uid = GraczNaTerenie(playerid);
			if(uidd == 1)
			{
			    Lokacja[uid][gOwnerP] = DaneGracza[playerid][gUID];
				Lokacja[uid][gOwner] = DaneGracza[playerid][gDzialalnosc1];
				new uidg = DaneGracza[playerid][gDzialalnosc1];
				format(Lokacja[uid][gKolor], 10, "%s77", GrupaInfo[uidg][gKolorNicku]);
				ZapiszTeren(uid);
				GangZoneShowForAll(Lokacja[uid][gID], HexToInt(Lokacja[uid][gKolor]));
				Transakcja(T_HPODPIS, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, uid, DaneGracza[playerid][gDzialalnosc1], -1, "-", gettime()+KOREKTA_CZASOWA);
			}
			else if(uidd == 2)
			{
				Lokacja[uid][gOwnerP] = DaneGracza[playerid][gUID];
				Lokacja[uid][gOwner] = DaneGracza[playerid][gDzialalnosc2];
				new uidg = DaneGracza[playerid][gDzialalnosc2];
				format(Lokacja[uid][gKolor], 10, "%s77", GrupaInfo[uidg][gKolorNicku]);
				ZapiszTeren(uid);
				GangZoneShowForAll(Lokacja[uid][gID], HexToInt(Lokacja[uid][gKolor]));
				Transakcja(T_HPODPIS, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, uid, DaneGracza[playerid][gDzialalnosc2], -1, "-", gettime()+KOREKTA_CZASOWA);
			}
			else if(uidd == 3)
			{
	            Lokacja[uid][gOwnerP] = DaneGracza[playerid][gUID];
				Lokacja[uid][gOwner] = DaneGracza[playerid][gDzialalnosc3];
				new uidg = DaneGracza[playerid][gDzialalnosc3];
				format(Lokacja[uid][gKolor], 10, "%s77", GrupaInfo[uidg][gKolorNicku]);
				ZapiszTeren(uid);
				GangZoneShowForAll(Lokacja[uid][gID], HexToInt(Lokacja[uid][gKolor]));
				Transakcja(T_HPODPIS, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, uid, DaneGracza[playerid][gDzialalnosc3], -1, "-", gettime()+KOREKTA_CZASOWA);
			}
			else if(uidd == 4)
			{
	            Lokacja[uid][gOwnerP] = DaneGracza[playerid][gUID];
				Lokacja[uid][gOwner] = DaneGracza[playerid][gDzialalnosc4];
				new uidg = DaneGracza[playerid][gDzialalnosc4];
				format(Lokacja[uid][gKolor], 10, "%s77", GrupaInfo[uidg][gKolorNicku]);
				ZapiszTeren(uid);
				GangZoneShowForAll(Lokacja[uid][gID], HexToInt(Lokacja[uid][gKolor]));
				Transakcja(T_HPODPIS, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, uid, DaneGracza[playerid][gDzialalnosc4], -1, "-", gettime()+KOREKTA_CZASOWA);
			}
			else if(uidd == 5)
			{
	            Lokacja[uid][gOwnerP] = DaneGracza[playerid][gUID];
				Lokacja[uid][gOwner] = DaneGracza[playerid][gDzialalnosc5];
				new uidg = DaneGracza[playerid][gDzialalnosc5];
				format(Lokacja[uid][gKolor], 10, "%s77", GrupaInfo[uidg][gKolorNicku]);
				ZapiszTeren(uid);
				GangZoneShowForAll(Lokacja[uid][gID], HexToInt(Lokacja[uid][gKolor]));
				Transakcja(T_HPODPIS, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, uid, DaneGracza[playerid][gDzialalnosc5], -1, "-", gettime()+KOREKTA_CZASOWA);
			}
			else if(uidd == 6)
			{
	            Lokacja[uid][gOwnerP] = DaneGracza[playerid][gUID];
				Lokacja[uid][gOwner] = DaneGracza[playerid][gDzialalnosc6];
				new uidg = DaneGracza[playerid][gDzialalnosc6];
				format(Lokacja[uid][gKolor], 10, "%s77", GrupaInfo[uidg][gKolorNicku]);
				ZapiszTeren(uid);
				GangZoneShowForAll(Lokacja[uid][gID], HexToInt(Lokacja[uid][gKolor]));
				Transakcja(T_HPODPIS, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, uid, DaneGracza[playerid][gDzialalnosc6], -1, "-", gettime()+KOREKTA_CZASOWA);
			}
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[ZONE] [%s] [ID: %d] rewritten the zone %d under the group %s", ZmianaNicku(playerid), playerid, uid, GrupaInfo[Lokacja[uid][gOwner]][gNazwa]);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
			ZapiszTeren(uid);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Strefa zosta³ podpisana pod organizacje.", "Zamknij", "");
		}
		else
		{
        	//
		}
		return 1;
	}
	if(dialogid == DIALOG_DRZWI_OPCJE_BP)
	{
	    if(response)
		{
		    new uids = GetPVarInt(playerid, "uiddrzwi");
			BudynekInfo[uids][nWlascicielP] = DaneGracza[playerid][gUID];
			Transakcja(T_HODPIS, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, uids, BudynekInfo[uids][nWlascicielD], -1, "-", gettime()+KOREKTA_CZASOWA);
			BudynekInfo[uids][nWlascicielD] = 0;
			DestroyDynamicPickup(BudynekInfo[uids][nID]);
			if(BudynekInfo[uids][nTyp] == 1)
	 		{
				BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1239;//
				BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
			}
			if(BudynekInfo[uids][nTyp] == 0)
	 		{
				BudynekInfo[uids][nID] = BudynekInfo[uids][nPickup] = 1273;
				BudynekInfo[uids][nID] = CreateDynamicPickup(BudynekInfo[uids][nPickup], 1, BudynekInfo[uids][nX], BudynekInfo[uids][nY], BudynekInfo[uids][nZ], BudynekInfo[uids][nVW]);
			}
			ZapiszNieruchomosc(uids);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[DOOR] [%s] [ID: %d] rewritten the door %s under the player %s", ZmianaNicku(playerid), playerid, BudynekInfo[uids][nAdres], ZmianaNicku(playerid));
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "\nBudynek zosta³ przepisany na t¹ postaæ.\nOd teraz do budynku masz uprawnienia tylko Ty i osoby które dostan¹ od Ciebie uprawnienia!", "Zamknij", "");
   		}
		else
		{
			return 0;
		}
	}
	if(dialogid == DIALOG_DRZWI_OPCJE_PP)
	{
	    if(response)
		{
		    new uids = GetPVarInt(playerid, "uiddrzwi");
			BudynekInfo[uids][nPrzejazd] = 1;
			ZapiszNieruchomosc(uids);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "W³¹czy³eœ przejazd pojazdami w tym budynku.", "Zamknij", "");
   		}
		else
		{
			new uids = GetPVarInt(playerid, "uiddrzwi");
			BudynekInfo[uids][nPrzejazd] = 0;
			ZapiszNieruchomosc(uids);
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Wy³¹czy³eœ przejazd pojazdami w tym budynku.", "Zamknij", "");
			return 0;
		}
	}
	if(dialogid == DIALOG_AREA_OBIEKTY)
	{
	    if(response)
		{
		    new uid = GraczNaTerenie(playerid);
		    new cena = strval(inputtext);
			if(cena < 0)
			{
				new tekst[256];
				format(tekst, sizeof(tekst), "Wpisz iloœæ obiektów któr¹ chcesz przypisaæ do strefy.\n\n- Obecna iloœæ obiektów przypisanych do strefy: %d\n- Obecna iloœæ obiektów które mo¿esz przypisaæ: %d\n\n{FF0000}Pamiêtaj, ¿e przywróciæ obiektów na postaæ nie mo¿na.", Lokacja[uid][gObiekty], DaneGracza[playerid][gObiekty]);
				dShowPlayerDialog(playerid, DIALOG_AREA_OBIEKTY, DIALOG_STYLE_INPUT, "• Informacja:", tekst, "Zatwierdz", "Zamknij");
				return 0;
			}
			if(DaneGracza[playerid][gObiekty] < cena)
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie posiadasz tylu obiektów by przypisaæ je do tej strefy.\nMo¿esz dokupiæ obiekty w sklepie 24/7!", "Zamknij", "");
			    return 0;
			}
			if(Lokacja[uid][gObiekty]+cena > 50)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie mo¿esz przekroczyæ limitu 50 obiektów na strefie!", "Zamknij", "");
			    return 0;
			}
			Transakcja(T_HOBIEKT, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, 0, uid, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
			Lokacja[uid][gObiekty] += cena;
			DaneGracza[playerid][gObiekty] -= cena;
			ZapiszTeren(uid);
			ZapiszGracza(playerid);
			ZapiszGraczaGlobal(playerid, 10);
			GangZoneStopFlashForPlayer(playerid, uid);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[ZONE] [%s] [ID: %d] Added %d object to the zone %d", ZmianaNicku(playerid), playerid, cena, uid);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Pomyœlnie przypisa³eœ swoje obiekty do strefy, od teraz mo¿esz kontynuowaæ prace nad stref¹.", "Rozumiem", "");
   		}
		else
		{
			return 0;
		}
	}
	if(dialogid == DIALOG_DRZWI_OPCJE_OB)
	{
	    if(response)
		{
		    new uids = GetPVarInt(playerid, "uiddrzwi");
		    new cena = strval(inputtext);
			if(cena < 0)
			{
				new tekst[256];
				format(tekst, sizeof(tekst), "Wpisz iloœæ obiektów któr¹ chcesz przypisaæ do budynku.\n\n- Obecna iloœæ obiektów przypisanych do budynku: %d\n- Obecna iloœæ obiektów które mo¿esz przypisaæ: %d\n\n{FF0000}Pamiêtaj, ¿e przywróciæ obiektów na postaæ nie mo¿na.", BudynekInfo[uids][nLiczbaMebli], DaneGracza[playerid][gObiekty]);
				dShowPlayerDialog(playerid, DIALOG_DRZWI_OPCJE_OB, DIALOG_STYLE_INPUT, "• Informacja:", tekst, "Zatwierdz", "Zamknij");
				return 0;
			}
			if(DaneGracza[playerid][gObiekty] < cena)
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie posiadasz tylu obiektów by przypisaæ je do tego budynku.\nMo¿esz dokupiæ obiekty w sklepie 24/7!", "Zamknij", "");
			    return 0;
			}
			Transakcja(T_HOBIEKT, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, 0, uids, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
			BudynekInfo[uids][nLiczbaMebli] += cena;
			DaneGracza[playerid][gObiekty] -= cena;
			ZapiszNieruchomosc(uids);
			ZapiszGracza(playerid);
			ZapiszGraczaGlobal(playerid, 10);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[DOOR] [%s] [ID: %d] Added %d object to the door %s (%d)", ZmianaNicku(playerid), playerid, cena, BudynekInfo[uids][nAdres], uids);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Pomyœlnie przypisa³eœ swoje obiekty do tego budynku, od teraz mo¿esz kontynuowaæ prace nad wnêtrzem.", "Rozumiem", "");
   		}
		else
		{
			return 0;
		}
	}
	if(dialogid == DIALOG_DRZWI_OPCJE_HIFI)
	{
	    if(response)
		{
		    new uids = GetPVarInt(playerid, "uiddrzwi");
			if(DaneGracza[playerid][gPORTFEL] < 2499)
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie staæ ciê na zakup systemu audio do tego budynku.", "Zamknij", "");
			    return 0;
			}
			Dodajkase(playerid, -2500);
			Transakcja(T_HAUDIO, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, 2500, uids, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
			BudynekInfo[uids][nAudio] = 0;
			strdel(zapyt, 0, 1024);
			format(zapyt, sizeof(zapyt), "UPDATE `jochym_nieruchomosci` SET `AUDIO` = '%d' WHERE `ID` = '%d'",
			BudynekInfo[uids][nAudio],
			uids);
			mysql_check();
			mysql_query2(zapyt);
			mysql_free_result();
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[DOOR] [%s] [ID: %d] Buy system HIFI to the door %s (%d)", ZmianaNicku(playerid), playerid, BudynekInfo[uids][nAdres], uids);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Zakupi³eœ system audio do swojego budynku za kwote 2500$\n\nW³ó¿ p³ytê do systemu HIFI.", "Zamknij", "");
   		}
		else
		{
			return 0;
		}
	}
	if(dialogid == DIALOG_DRZWI_OPCJE_SZAFA)
	{
	    if(response)
		{
		    new uids = GetPVarInt(playerid, "uiddrzwi");
			if(DaneGracza[playerid][gPORTFEL] < 2000)
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie staæ ciê na zakup szafy do tego budynku.", "Zamknij", "");
			    return 0;
			}
			Dodajkase(playerid, -2000);
			Transakcja(T_HSZAFA, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, 2000, uids, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
			BudynekInfo[uids][nSzafa] = 0;
			strdel(zapyt, 0, 1024);
			format(zapyt, sizeof(zapyt), "UPDATE `jochym_nieruchomosci` SET `SZAFA` = '%d' WHERE `ID` = '%d'",
			BudynekInfo[uids][nSzafa],
			uids);
			mysql_check();
			mysql_query2(zapyt);
			mysql_free_result();
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[DOOR] [%s] [ID: %d] Buy system safe to the door %s (%d)", ZmianaNicku(playerid), playerid, BudynekInfo[uids][nAdres], uids);
			Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "\nZakupi³eœ szafe do swojego budynku za kwote 2000$\n\nAby coœ od³o¿yæ w szafê u¿yj /p - przedmiot - odló¿ do szafy", "Zamknij", "");
   		}
		else
		{
			return 0;
		}
	}
	if(dialogid == DIALOG_DRZWI_OPCJE_NP)
	{
	    if(response)
		{
		    new uids = GetPVarInt(playerid, "uiddrzwi");
		    new cena = strval(inputtext);
			if(cena < 0)
			{
				dShowPlayerDialog(playerid, DIALOG_DRZWI_OPCJE_NP, DIALOG_STYLE_INPUT, "• Informacja:", "Wpisz iloœæ napisów które chcesz dokupiæ do swojego budynku?\nCena jednego napisu 100$.", "Zatwierdz", "Zamknij");
				return 0;
			}
			if(DaneGracza[playerid][gPORTFEL] < 100*cena)
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie staæ ciê na zakup napisu do tego budynku.", "Zamknij", "");
			    return 0;
			}
			Dodajkase(playerid, -100*cena);
			Transakcja(T_HNAPIS, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, 100*cena, uids, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
			BudynekInfo[uids][nLiczbaNapisow] += cena;
			ZapiszNieruchomosc(uids);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Zakupi³eœ napisy do budynku.", "Zamknij", "");
   		}
		else
		{
			return 0;
		}
	}
	if(dialogid == DIALOG_HOTEL_PRZED)
	{
		if(!response)
		{
			cmd_wymelduj(playerid, "");
		}	
		else
		{
		new uids = GetPVarInt(playerid, "CENAPRZ");
		if(DaneGracza[playerid][gPORTFEL] < BudynekInfo[uids][nHotel])
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie posiadasz wystarczaj¹cej gotówki aby wynaj¹æ pokój w tym Hotelu.", "Zamknij", "");
			return 0;
		}
		DaneGracza[playerid][gZamHot] = gettime()+CZAS_LETNI + (86400*3);
		Dodajkase(playerid, -BudynekInfo[uids][nHotel]);
		GrupaInfo[BudynekInfo[uids][nWlascicielD]][gSaldo] += BudynekInfo[uids][nHotel];
		ZapiszSaldo(BudynekInfo[uids][nWlascicielD]);
		DaneGracza[playerid][gWynajem] = BudynekInfo[uids][nUID];
		ZapiszGracza(playerid);
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Gratulacje przed³u¿y³eœ pobyt w Hotelu.", "Zamknij", "");
		}
	}
	if(dialogid == DIALOG_HOTEL_CENA)
	{
	    if( !response )
	        return 1;
		new uids = GetPVarInt(playerid, "uiddrzwi");
		new cena = strval(inputtext);
		if(cena > 200 || cena < 0)
		{
			dShowPlayerDialog(playerid, DIALOG_HOTEL_CENA, DIALOG_STYLE_INPUT, "• Informacja:", "Wpisz kwote za jak¹ ma siê wynajmowaæ pokój w twoim hotelu.\nKwota nie powinna przekraczaæ 200$", "Zatwierdz", "Zamknij");
			return 0;
		}
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nowa cena wynajmu pokoju zosta³a ustawiona.", "Zatwierdz", "Zamknij");
		BudynekInfo[uids][nHotel] = cena;
		ZapiszNieruchomosc(uids);
	}
	if(dialogid == DIALOG_BANKOMAT)
	{
	    if( !response )
	        return 1;
        switch(listitem)
		{
			case 0:
			{
				/*if(DaneGracza[playerid][gSTAN_KONTA] >= 5000)
				{
					if(!Osiagniecia(playerid, OSIAGNIECIE_5K))
					{
						CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
						TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
						TextDrawSetString(TextNaDrzwi[playerid], "~y~OSIAGNIECIE~n~~w~Uczciwe zarobione pieniadze (5000$) ~g~+100QP");
						TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
						DaneGracza[playerid][gOsiagniecia][OSIAGNIECIE_5K] = 1;
						DaneGracza[playerid][gGAMESCORE] += 100;
						SetPlayerScore(playerid,DaneGracza[playerid][gGAMESCORE]);
						ZapiszGraczaGlobal(playerid, 1);
					}
				}
				if(DaneGracza[playerid][gSTAN_KONTA] >= 25000)
				{
					if(!Osiagniecia(playerid, OSIAGNIECIE_25K))
					{
						CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
						TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
						TextDrawSetString(TextNaDrzwi[playerid], "~y~OSIAGNIECIE~n~~w~Bogacz (+25000$) ~g~+1000QP");
						TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
						DaneGracza[playerid][gOsiagniecia][OSIAGNIECIE_25K] = 1;
						DaneGracza[playerid][gGAMESCORE] += 1000;
						SetPlayerScore(playerid,DaneGracza[playerid][gGAMESCORE]);
						ZapiszGraczaGlobal(playerid, 1);
					}
				}*/
			    new stri[256];
   			 	format(stri, sizeof(stri), "Twój stan konta to: %d$",DaneGracza[playerid][gSTAN_KONTA]);
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Bank:", stri, "Zamknij", "");
				return 1;
			}
			case 1:
			{
				dShowPlayerDialog(playerid, DIALOG_BANKOMAT_WYPLAC, DIALOG_STYLE_INPUT, "• Bank:", "Podaj kwotê jak¹ chcesz wyp³aciæ:", "Wyplac", "Zamknij");
				return 1;
			}
			case 2:
			{
				dShowPlayerDialog(playerid, DIALOG_BANKOMAT_WPLAC, DIALOG_STYLE_INPUT, "• Bank:", "Podaj kwotê jak¹ chcesz wp³aciæ:", "Wplac", "Zamknij");
				return 1;
			}
			case 3:
			{
				dShowPlayerDialog(playerid, DIALOG_BANKOMAT_PRZELEW, DIALOG_STYLE_INPUT, "• Bank:", "Podaj numer konta bankowego by przelaæ swoje pieni¹dze, koszt jednego przelewu wynosi: 10$", "Dalej", "Zamknij");
				return 1;
			}
			case 4:
			{
				new found = 0, grupa_bank[512];
				for(new i = 1; i < MAX_GROUP; i++)
				{
					if(DaneGracza[playerid][gDzialalnosc1] == i || DaneGracza[playerid][gDzialalnosc2] == i || DaneGracza[playerid][gDzialalnosc3] == i || DaneGracza[playerid][gDzialalnosc4] == i || DaneGracza[playerid][gDzialalnosc5] == i || DaneGracza[playerid][gDzialalnosc6] == i)
					{
						if(found == 0)
						{
							format(grupa_bank, sizeof(grupa_bank), "%d\t» %s",GrupaInfo[i][gUID], GrupaInfo[i][gNazwa]);
						}
						else
						{
							format(grupa_bank, sizeof(grupa_bank), "%s\n%d\t» %s", grupa_bank, GrupaInfo[i][gUID], GrupaInfo[i][gNazwa]);
						}
						found++;
					}
				}
				if(found != 0) dShowPlayerDialog(playerid, DIALOG_BANK_GRUPA, DIALOG_STYLE_LIST, "• Bank:", grupa_bank, "Wybierz", "Zamknij");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aktualnie nie jesteœ w z¹dnej grupie.", "Zamknij", "");
				return 1;
			}
			case 5:
			{
				if(DaneGracza[playerid][gDzialalnosc1] == 0 && DaneGracza[playerid][gDzialalnosc2] == 0 && DaneGracza[playerid][gDzialalnosc3] == 0 && DaneGracza[playerid][gDzialalnosc4] == 0 && DaneGracza[playerid][gDzialalnosc5] == 0 && DaneGracza[playerid][gDzialalnosc6] == 0)
				{
					if(DaneGracza[playerid][gZasilek] > gettime()+CZAS_LETNI)
					{
						GameTextForPlayer(playerid, "~r~Odebrales juz zasilek, pamietaj zasilek mozna odebrac raz na 24h.", 3000, 5);
					}
					else
					{
						DaneGracza[playerid][gZasilek] = gettime()+CZAS_LETNI + (24*60*60);
						Dodajkase(playerid, 50);
						GameTextForPlayer(playerid, "~w~Odebrales zasilek: ~g~~h~+50$.", 3000, 5);
						ZapiszGracza(playerid);
					}
				}
				else
				{
					GameTextForPlayer(playerid, "~r~Zasilek moga odebrac tylko osoby bezrobotne.", 3000, 5);
				}
				return 1;
			}
			case 6:
			{//Sp³aæ d³ug
				ZaladujZadluzenia();
				new str[5048], temp = 0, akcja[128];
				format(str, sizeof(str), "{848484}#\t{848484}Czas sp³aty\t{848484}Kwota\t{848484}Powod zadluzenia");
				ForeachEx(id, MAX_DLUG)
				{
					if(Zadluzenie[id][dUID] == DaneGracza[playerid][gUID] && Zadluzenie[id][dAktywne] == 1)
					{
						temp++;
						new rok, miesiac, dzien, godzina, minuta, sekunda;
						sekundytodata(Zadluzenie[id][dTime2], rok, miesiac, dzien, godzina, minuta, sekunda);
						format(akcja, sizeof(akcja), "%s", Zadluzenie[id][dAkcja]);
						format(str, sizeof(str), "%s\n%d\t%d.%d.%d  %d:%d:%d\t%d$\t%s", str, Zadluzenie[id][dID], dzien, miesiac, rok, godzina-czasHistory, minuta, sekunda, Zadluzenie[id][dMoney], akcja);
					}
				}
				if(temp == 0)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie znaleziono ¿adnych zad³u¿eñ dla twojego konta bankowego!", "Zamknij", "");
					return 0;
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_DLUG, DIALOG_STYLE_TABLIST_HEADERS, "• Zadlu¿enia:", str, "Sp³aæ", "Anuluj");
					return 1;
				}
			}
			case 7:
			{//Historia transakcji
				ZaladujHistory();
				new str[5048], temp = 0, TypTranskacji[128];
				format(str, sizeof(str), "{848484}Data i Czas\t{848484}Kwota\t{848484}Typ transakcji");
				ForeachEx(id, MAX_HISTORY)
				{
					if(History[id][hUID] == DaneGracza[playerid][gUID])
					{
						temp++;
						new rok, miesiac, dzien, godzina, minuta, sekunda;
						sekundytodata(History[id][hTime], rok, miesiac, dzien, godzina, minuta, sekunda);
						if(History[id][hTyp] == 0)
						{
							format(TypTranskacji, sizeof(TypTranskacji), "{FF3366}Wyp³ata z konta bankowego{FFFFFF}");
						}
						if(History[id][hTyp] == 1)
						{
							format(TypTranskacji, sizeof(TypTranskacji), "{66FF66}Wp³ata na konto bankowe{FFFFFF}");
						}
						if(History[id][hTyp] == 2)
						{
							format(TypTranskacji, sizeof(TypTranskacji), "{FF3366}Wys³anie przelewu z konta bankowego{FFFFFF}");
						}
						if(History[id][hTyp] == 3)
						{
							format(TypTranskacji, sizeof(TypTranskacji), "{66FF66}Odebranie przelewu na konto bankowe{FFFFFF}");
						}
						if(History[id][hTyp] == 4)
						{
							format(TypTranskacji, sizeof(TypTranskacji), "{66FF66}Odebranie zasi³ku{FFFFFF}");
						}
						if(History[id][hTyp] == 5)
						{
							format(TypTranskacji, sizeof(TypTranskacji), "{66FF66}Odebranie wyp³aty na konto bankowe{FFFFFF}");
						}
						format(str, sizeof(str), "%s\n%d.%d.%d  %d:%d:%d\t%d$\t%s", str, dzien, miesiac, rok, godzina-czasHistory, minuta, sekunda, History[id][hMoney], TypTranskacji);
					}
				}
				if(temp == 0)
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie znaleziono ¿adnych wykonanych transakcji na Twoim koncie bankowym!", "Zamknij", "");
					return 0;
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_TABLIST_HEADERS, "• Historia transakcji:", str, "Rozumiem", "");
					return 1;
				}
			}
			case 8:
			{//Historia przelewów
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Opcja niedostêpna!", "Zamknij", "");
				return 1;
			}
		}
	}
	if(dialogid == DIALOG_DLUG)
	{
		if(response)
		{
			new uid = strval(inputtext);
			SetPVarInt(playerid, "DlugID", uid);
			new str[512], oferowal[64], akcja[128];
			new rok, miesiac, dzien, godzina, minuta, sekunda;
			sekundytodata(Zadluzenie[uid][dTime], rok, miesiac, dzien, godzina, minuta, sekunda);
			new rok2, miesiac2, dzien2, godzina2, minuta2, sekunda2;
			sekundytodata(Zadluzenie[uid][dTime2], rok2, miesiac2, dzien2, godzina2, minuta2, sekunda2);
			if(Zadluzenie[uid][dOferowal] == -1)
			{
				format(oferowal, sizeof(oferowal), "Urzad Miasta");
			}
			else
			{
				format(oferowal, sizeof(oferowal), "%s", ImieWlasciciela(Zadluzenie[uid][dOferowal]));
			}
			format(akcja, sizeof(akcja), "%s", Zadluzenie[uid][dAkcja]);
			format(str, sizeof(str), "Sp³ata zad³u¿enia.\n\nD³ug zosta³ nadany z dat¹: %d.%d.%d  %d:%d:%d\nOkres sp³aty d³ugu: %d.%d.%d  %d:%d:%d\nNadawca zad³u¿enia: %s\nKwota zad³u¿enia: %d$\nOpis zad³u¿enia: %s", dzien, miesiac, rok, godzina-czasHistory, minuta, sekunda, dzien2, miesiac2, rok2, godzina2-czasHistory, minuta2, sekunda2, oferowal, Zadluzenie[uid][dMoney], akcja);
			dShowPlayerDialog(playerid, DIALOG_DLUG_SPLAC, DIALOG_STYLE_MSGBOX, "• D³ug:", str, "Sp³aæ", "Anuluj");
			return 1;
		}
	}
	if(dialogid == DIALOG_DLUG_SPLAC)
	{
		if(response)
		{
			new uid = GetPVarInt(playerid, "DlugID");
			Oferuj(playerid, playerid, 0, 0, 0, 0, OFEROWANIE_DLUGSPLATA, Zadluzenie[uid][dMoney], "", 0);
			SetPVarInt(playerid, "SplataOferta", 1);
			return 1;
		}
		else
		{
			SetPVarInt(playerid, "SplataOferta", 0);
			return 0;
		}
	}
	if(dialogid == DIALOG_BANKOMAT_MODEL)
	{
	    if( !response )
	        return 1;
        switch(listitem)
		{
			case 0:
			{
				/*if(DaneGracza[playerid][gSTAN_KONTA] >= 5000)
				{
					if(!Osiagniecia(playerid, OSIAGNIECIE_5K))
					{
						CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
						TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
						TextDrawSetString(TextNaDrzwi[playerid], "~y~OSIAGNIECIE~n~~w~Uczciwe zarobione pieniadze (+5000$) ~g~+100QP");
						TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
						DaneGracza[playerid][gOsiagniecia][OSIAGNIECIE_5K] = 1;
						DaneGracza[playerid][gGAMESCORE] += 100;
						SetPlayerScore(playerid,DaneGracza[playerid][gGAMESCORE]);
						ZapiszGraczaGlobal(playerid, 1);
					}
				}
				if(DaneGracza[playerid][gSTAN_KONTA] >= 25000)
				{
					if(!Osiagniecia(playerid, OSIAGNIECIE_25K))
					{
						CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
						TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
						TextDrawSetString(TextNaDrzwi[playerid], "~y~OSIAGNIECIE~n~~w~Bogacz (+25000$) ~g~+1000QP");
						TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
						DaneGracza[playerid][gOsiagniecia][OSIAGNIECIE_25K] = 1;
						DaneGracza[playerid][gGAMESCORE] += 1000;
						SetPlayerScore(playerid,DaneGracza[playerid][gGAMESCORE]);
						ZapiszGraczaGlobal(playerid, 1);
					}
				}*/
			    new stri[256];
   			 	format(stri, sizeof(stri), "Twój stan konta to: %d$",DaneGracza[playerid][gSTAN_KONTA]);
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Bank:", stri, "Zamknij", "");
				return 1;
			}
			case 1:
			{
				dShowPlayerDialog(playerid, DIALOG_BANKOMAT_WYPLAC, DIALOG_STYLE_INPUT, "• Bank:", "Podaj kwotê jak¹ chcesz wyp³aciæ:", "Wyplac", "Zamknij");
				return 1;
			}
			case 2:
			{
				dShowPlayerDialog(playerid, DIALOG_BANKOMAT_PRZELEW, DIALOG_STYLE_INPUT, "• Bank:", "Podaj numer konta bankowego by przelaæ swoje pieni¹dze, koszt jednego przelewu wynosi: 10$", "Dalej", "Zamknij");
				return 1;
			}
			case 3:
			{
				new found = 0, grupa_bank[512];
				for(new i = 1; i < MAX_GROUP; i++)
				{
					if(DaneGracza[playerid][gDzialalnosc1] == i || DaneGracza[playerid][gDzialalnosc2] == i || DaneGracza[playerid][gDzialalnosc3] == i || DaneGracza[playerid][gDzialalnosc4] == i || DaneGracza[playerid][gDzialalnosc5] == i || DaneGracza[playerid][gDzialalnosc6] == i)
					{
						if(found == 0)
						{
							format(grupa_bank, sizeof(grupa_bank), "%d\t» %s",GrupaInfo[i][gUID], GrupaInfo[i][gNazwa]);
						}
						else
						{
							format(grupa_bank, sizeof(grupa_bank), "%s\n%d\t» %s", grupa_bank, GrupaInfo[i][gUID], GrupaInfo[i][gNazwa]);
						}
						found++;
					}
				}
				if(found != 0) dShowPlayerDialog(playerid, DIALOG_BANK_GRUPA2, DIALOG_STYLE_LIST, "• Bank:", grupa_bank, "Wybierz", "Zamknij");
				else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Aktualnie nie jesteœ w z¹dnej grupie.", "Zamknij", "");
				return 1;
			}
			case 4:
			{
				if(DaneGracza[playerid][gDzialalnosc1] == 0 && DaneGracza[playerid][gDzialalnosc2] == 0 && DaneGracza[playerid][gDzialalnosc3] == 0 && DaneGracza[playerid][gDzialalnosc4] == 0 && DaneGracza[playerid][gDzialalnosc5] == 0 && DaneGracza[playerid][gDzialalnosc6] == 0)
				{
					if(DaneGracza[playerid][gZasilek] > gettime()+CZAS_LETNI)
					{
						GameTextForPlayer(playerid, "~r~Odebrales juz zasilek, pamietaj zasilek mozna odebrac raz na 24h.", 3000, 5);
					}
					else
					{
						DaneGracza[playerid][gZasilek] = gettime()+CZAS_LETNI + (24*60*60);
						Dodajkase(playerid, 50);
						GameTextForPlayer(playerid, "~w~Odebrales zasilek: ~g~~h~+50$.", 3000, 5);
						ZapiszGracza(playerid);
					}
				}
				else
				{
					GameTextForPlayer(playerid, "~r~Zasilek moga odebrac tylko osoby bezrobotne.", 3000, 5);
				}
				return 1;
			}
		}
	}
	if(dialogid == DIALOG_HOTEL)
	{
		if( !response )
			return 1;
		new vw = GetPlayerVirtualWorld(playerid);
		new uids = GetPVarInt(playerid, "uiddrzwi");
		if(DaneGracza[playerid][gPORTFEL] < (BudynekInfo[uids][nHotel]+50))
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Nie posiadasz wystarczaj¹cej gotówki aby wynaj¹æ pokój w tym Hotelu.", "Zamknij", "");
			return 0;
		}
		/*if(!Osiagniecia(playerid, OSIAGNIECIE_ZAMELDOWANIE))
		{
			CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
			TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
			TextDrawSetString(TextNaDrzwi[playerid], "~y~OSIAGNIECIE~n~~w~Zameldowanie ~g~+20QP");
			TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
			DaneGracza[playerid][gOsiagniecia][OSIAGNIECIE_ZAMELDOWANIE] = 1;
			DaneGracza[playerid][gGAMESCORE] += 20;
			SetPlayerScore(playerid,DaneGracza[playerid][gGAMESCORE]);
			ZapiszGraczaGlobal(playerid, 1);
		}*/
		DaneGracza[playerid][gZamHot] = gettime()+CZAS_LETNI + (86400*3);
		Dodajkase(playerid, -(BudynekInfo[vw][nHotel]+50));
		GrupaInfo[BudynekInfo[vw][nWlascicielD]][gSaldo] += (BudynekInfo[vw][nHotel]+50);
		ZapiszSaldo(BudynekInfo[vw][nWlascicielD]);
		DaneGracza[playerid][gWynajem] = BudynekInfo[vw][nUID];
		ZapiszGracza(playerid);
		strdel(zapyt, 0, 1024);
	    format(zapyt, sizeof(zapyt),"UPDATE `jochym_postacie` SET `WYNAJEM`='%d' WHERE `ID`='%d'", DaneGracza[playerid][gWynajem], DaneGracza[playerid][gUID]);
	    mysql_query(zapyt);
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Gratulacje zameldowa³eœ siê w Hotelu.", "Zamknij", "");
	}
	if(dialogid == DIALOG_SZAFA)
	{
		if( !response )
			return 1;
		new uid = strval(inputtext);
		new uids = GetPVarInt(playerid, "uiddrzwi");
		if(PrzedmiotInfo[uid][pTypWlas] != TYP_SZAFA || PrzedmiotInfo[uid][pOwner] != uids)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Brak przedmiotu", "Zamknij", "");
			return 0;
		}
		PrzedmiotInfo[uid][pTypWlas] = TYP_WLASCICIEL;
		PrzedmiotInfo[uid][pOwner] = DaneGracza[playerid][gUID];
		ZapiszPrzedmiot(uid);
		format(tekst_global, sizeof(tekst_global), "* %s wyci¹ga coœ z szafy.", ZmianaNicku(playerid));
		SendWrappedMessageToPlayerRange(playerid, FIOLETOWY, tekst_global, 10);
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 0, 0, 0, 0, 0);
		new akcja[126];
		format(akcja,sizeof(akcja),"*wyci¹ga coœ z szafy*");
		SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
		new akcja2[126];
		format(akcja2,sizeof(akcja2),"wyciaga cos z szafy");
		TextDrawSetString(AkcjaTD[playerid], akcja2);
		TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
		CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
		return 1;
	}
	if(dialogid == DIALOG_BANK_GRUPA)
	{
		if( !response )
			return 1;
		new uid = strval(inputtext);
		SetPVarInt(playerid, "UidGrupyBank", uid);
		dShowPlayerDialog(playerid, DIALOG_BANK_GRUPA_OPCJE, DIALOG_STYLE_LIST, "• Bank:", "» Stan konta\n» Wyp³aæ pieni¹dze\n» Wp³aæ pieni¹dze", "Wybierz", "Zamknij");
		return 1;
	}
	if(dialogid == DIALOG_BANK_GRUPA2)
	{
		if( !response )
			return 1;
		new uid = strval(inputtext);
		SetPVarInt(playerid, "UidGrupyBank", uid);
		dShowPlayerDialog(playerid, DIALOG_BANK_GRUPA_OPCJE, DIALOG_STYLE_LIST, "• Bank:", "» Stan konta\n» Wyp³aæ pieni¹dze", "Wybierz", "Zamknij");
		return 1;
	}
	if(dialogid == DIALOG_BANK_GRUPA_OPCJE)
	{
	    if( !response )
	        return 1;
        switch(listitem)
		{
			case 0:
			{
				new uidg = GetPVarInt(playerid, "UidGrupyBank");
			    new stri[256];
   			 	format(stri, sizeof(stri), "Stan konta grupy: %d$",GrupaInfo[uidg][gSaldo]);
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Bank:", stri, "Zamknij", "");
				return 1;
			}
			case 1:
			{
				new uidg = GetPVarInt(playerid, "UidGrupyBank");
				if(GrupaInfo[uidg][gOwnerUID] == DaneGracza[playerid][gUID] || ZarzadzanieGrupaUID(playerid, uidg))
				{
					dShowPlayerDialog(playerid, DIALOG_BANK_GRUPA_WYPLAC, DIALOG_STYLE_INPUT, "• Bank:", "Podaj kwotê jak¹ chcesz wyp³aciæ:", "Wyplac", "Zamknij");
					return 1;
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Niestety nie masz uprawnien do wyp³acania pieniêdzy ten dzialalnoœci!", "Zamknij", "");
					return 0;
				}
			}
			case 2:
			{
				dShowPlayerDialog(playerid, DIALOG_BANK_GRUPA_WPLAC, DIALOG_STYLE_INPUT, "• Bank:", "Podaj kwotê jak¹ chcesz wp³aciæ:", "Wplac", "Zamknij");
				return 1;
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_BANK_GRUPA_WPLAC)
	{
		if( !response )
			return 1;
		new cash = strval(inputtext);
		new uidg = GetPVarInt(playerid, "UidGrupyBank");
		if(cash < 0) return 1;
		if(cash > DaneGracza[playerid][gPORTFEL])
		{
		    GameTextForPlayer(playerid, "~r~Kwota ~w~ktora podales jest niepoprawna.", 3000, 5);
			dShowPlayerDialog(playerid, DIALOG_BANK_GRUPA_WPLAC, DIALOG_STYLE_INPUT, "• Bank:", "Podaj kwotê jak¹ chcesz wp³aciæ:", "Wplac", "Zamknij");
			return 1;
		}
		GrupaInfo[uidg][gSaldo] += cash;
		Dodajkase(playerid, -cash);
		new stri[256];
		format(stri, sizeof(stri), "~b~Wplacono: ~w~$%d",cash);
		GameTextForPlayer(playerid, stri, 3000, 5);
		ZapiszSaldo(uidg);
		ZapiszGracza(playerid);
		StworzWykres(playerid, cash, 2, DaneGracza[playerid][gUID], DaneGracza[playerid][gGUID], uidg);
		StatykujTransakcje(uidg, playerid, 501, "Wplacil", cash);
		new logtekst[256];
		format(logtekst, sizeof(logtekst), "[BANK] [%s] [ID: %d] Deposit to group bank accound +%d$ of the group %s (%d)", ZmianaNicku(playerid), playerid, cash, GrupaInfo[uidg][gNazwa], uidg);
		Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		return 1;
	}
	if(dialogid == DIALOG_BANK_GRUPA_WYPLAC)
	{
		if( !response )
			return 1;
		new cash = strval(inputtext);
		new uidg = GetPVarInt(playerid, "UidGrupyBank");
		if(cash < 0) return 1;
		if(cash > GrupaInfo[uidg][gSaldo])
		{
		    GameTextForPlayer(playerid, "~r~Kwota ~w~ktora podales jest niepoprawna.", 3000, 5);
			dShowPlayerDialog(playerid, DIALOG_BANK_GRUPA_WYPLAC, DIALOG_STYLE_INPUT, "• Bank:", "Podaj kwotê jak¹ chcesz wyp³aciæ:", "Wyplac", "Zamknij");
			return 1;
		}
		/*if(GrupaInfo[uidg][gTyp] == 1 || GrupaInfo[uidg][gTyp] == 4 || GrupaInfo[uidg][gTyp] == 7 || GrupaInfo[uidg][gTyp] == 10 || GrupaInfo[uidg][gTyp] == 14 || GrupaInfo[uidg][gTyp] == 19)
		{
		    GameTextForPlayer(playerid, "Twoja grupa nie moze tego zrobic!.", 3000, 5);
		    return 1;
		}*/
		GrupaInfo[uidg][gSaldo] -= cash;
		Dodajkase(playerid, cash);
		new stri[256];
		format(stri, sizeof(stri), "~b~Wyplacono: ~w~$%d",cash);
		GameTextForPlayer(playerid, stri, 3000, 5);
		ZapiszSaldo(uidg);
		ZapiszGracza(playerid);
		StworzWykres(playerid, -cash, 3, DaneGracza[playerid][gUID], DaneGracza[playerid][gGUID], uidg);
		StatykujTransakcje(uidg, playerid, 501, "Wyplacil", cash);
		new logtekst[256];
		format(logtekst, sizeof(logtekst), "[BANK] [%s] [ID: %d] He dropped out -%d$ of the group %s (%d)", ZmianaNicku(playerid), playerid, cash, GrupaInfo[uidg][gNazwa], uidg);
		Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		return 1;
	}
	if(dialogid == DIALOG_BANKOMAT_WYPLAC)
	{
		if( !response )
			return 1;
		new cash = strval(inputtext);
		if(cash < 0) return 1;
		if(cash > DaneGracza[playerid][gSTAN_KONTA])
		{
		    GameTextForPlayer(playerid, "~r~Kwota ~w~ktora podales jest niepoprawna.", 3000, 5);
			dShowPlayerDialog(playerid, DIALOG_BANKOMAT_WYPLAC, DIALOG_STYLE_INPUT, "• Bank:", "Podaj kwotê jak¹ chcesz wyp³aciæ:", "Okej", "Zamknij");
			return 1;
		}
		if(GetPVarInt(playerid, "DlugGracza") != 0 && GetPVarInt(playerid, "ZadluzeniePoTerminie") != 0 && GetPVarInt(playerid, "SplataOferta") == 0)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zadluzenie konta bankowego:", "Musisz sp³aciæ zad³u¿enia na swoim koncie bankowym!", "Rozumiem", "");
			return 0;
		}
		DaneGracza[playerid][gSTAN_KONTA] -= cash;
		Dodajkase(playerid, cash);
		new stri[256];
		format(stri, sizeof(stri), "~b~Wyplacono: ~w~$%d",cash);
		GameTextForPlayer(playerid, stri, 3000, 5);
		ZapiszGracza(playerid);
		ZapiszBankKasa(playerid);
		Transakcja(T_BWYPLATA, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, cash, -1, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
		DodajHistorie(0, DaneGracza[playerid][gUID], -cash, gettime()+CZAS_LETNI);
		new logtekst[256];
		format(logtekst, sizeof(logtekst), "[BANK] [%s] [ID: %d] He dropped out -%d$ of bank account", ZmianaNicku(playerid), playerid, cash);
		Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		return 1;
	}
	if(dialogid == DIALOG_BANKOMAT_PRZELEW)
	{
		if( !response )
			return 1;
		new nr = strval(inputtext);
		if(nr < 99999999 || nr > 999999999)
		{
		    GameTextForPlayer(playerid, "~r~Numer konta ~w~ktora podales jest niepoprawny.", 3000, 5);
			return 1;
		}
		new find = -1;
		ForeachEx(i, MAX_PLAYERS)
		{
			if(IsPlayerConnected(i))
			{
				if(zalogowany[i] == true)
				{
					new gnr[256];
					format(gnr, sizeof(gnr), "%d",DaneGracza[i][gNUMER_KONTA]);
					new wnr[256];
					format(wnr, sizeof(wnr), "%d",nr);
					if(ComparisonString(gnr, wnr))
					{
						find = i;
						break;
					}
				}
			}
		}
		if(find == -1)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ten gracz nie jest zalogowany!", "Zamknij", "");
		    return 0;
		}else{
			if(find == playerid) return 1;
			if(zalogowany[playerid] == false)
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ten gracz nie jest zalogowany!", "Zamknij", "");
				return 0;
			}
			SetPVarInt(playerid, "idprzelew", find);
			new stri[256];
			format(stri, sizeof(stri), "Podaj kwotê któr¹ chcesz przelaæ:\nGracz: %s",ZmianaNicku(find));
			dShowPlayerDialog(playerid, DIALOG_BANKOMAT_PRZELEW_N, DIALOG_STYLE_INPUT, "• Bank:", stri, "Przelej", "Zamknij");
		}
		return 1;
	}
	if(dialogid == DIALOG_BANKOMAT_PRZELEW_N)
	{
		if( !response )
			return 1;
		new nr = strval(inputtext);
		if(nr > DaneGracza[playerid][gSTAN_KONTA] || nr <= 0)
		{
		    GameTextForPlayer(playerid, "~r~Nie posiadasz takiej kwoty.", 3000, 5);
		    return 0;
		}
		if(GetPVarInt(playerid, "DlugGracza") != 0 && GetPVarInt(playerid, "ZadluzeniePoTerminie") != 0 && GetPVarInt(playerid, "SplataOferta") == 0)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zadluzenie konta bankowego:", "Musisz sp³aciæ zad³u¿enia na swoim koncie bankowym!", "Rozumiem", "");
			return 0;
		}
		new uids = GetPVarInt(playerid, "uiddrzwi");
    	new uid = BudynekInfo[uids][nWlascicielD];
    	GrupaInfo[uid][gSaldo] += 10;
    	ZapiszSaldo(uid);
		new id = GetPVarInt(playerid, "idprzelew");
		if(zalogowany[id] == false)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Ten gracz nie jest zalogowany!", "Zamknij", "");
			return 0;
		}
		DaneGracza[playerid][gSTAN_KONTA] -= nr;
		DaneGracza[id][gSTAN_KONTA] += nr;
		ZapiszBankKasa(id);
		ZapiszBankKasa(playerid);
		Transakcja(T_BPRZELEW, DaneGracza[playerid][gUID], DaneGracza[id][gUID], DaneGracza[playerid][gGUID], DaneGracza[id][gGUID], nr, -1, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
		DodajHistorie(2, DaneGracza[playerid][gUID], -nr, gettime()+CZAS_LETNI);
		DodajHistorie(3, DaneGracza[id][gUID], nr, gettime()+CZAS_LETNI);
		new stri[126];
		format(stri, sizeof(stri), "[BANK] {7fb763}Otrzyma³eœ ${ffffff}%d na swoje konto z numeru konta %d:",nr, DaneGracza[playerid][gNUMER_KONTA]);
		SendClientMessage(id,0xFF007f00,stri);
		format(stri, sizeof(stri), "[BANK] {7fb763}Wys³a³eœ ${ffffff}%d na konto o numerze %d:",nr, DaneGracza[id][gNUMER_KONTA]);
		SendClientMessage(playerid,0xFF007f00,stri);
		new logtekst[256];
		format(logtekst, sizeof(logtekst), "[BANK] [%s] [ID: %d] Transfer to bank accound -%d$ to %s (%d)", ZmianaNicku(playerid), playerid, nr, ZmianaNicku(id), id);
		Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		format(logtekst, sizeof(logtekst), "[BANK] [%s] [ID: %d] Transfer to bank accound +%d$ to %s (%d)", ZmianaNicku(playerid), playerid, nr, ZmianaNicku(id), id);
		Transakcja(T_CDRZWI, DaneGracza[id][gUID], -1, DaneGracza[id][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		DeletePVar(playerid,"idprzelew");
		return 1;
	}
    if(dialogid == DIALOG_BANKOMAT_WPLAC)
	{
		if( !response )
			return 1;
		new cash = strval(inputtext);
		if(cash < 0) return 1;
		if(cash > DaneGracza[playerid][gPORTFEL])
		{
		    GameTextForPlayer(playerid, "~r~Kwota ~w~ktora podales jest niepoprawna.", 3000, 5);
			dShowPlayerDialog(playerid, DIALOG_BANKOMAT_WPLAC, DIALOG_STYLE_INPUT, "• Bank:", "Podaj kwotê jak¹ chcesz wp³aciæ:", "Wplac", "Zamknij");
			return 1;
		}
		DaneGracza[playerid][gSTAN_KONTA] += cash;
		Dodajkase(playerid, -cash);
		new stri[256];
		format(stri, sizeof(stri), "~b~Wplacono: ~w~$%d",cash);
		GameTextForPlayer(playerid, stri, 3000, 5);
		ZapiszGracza(playerid);
		ZapiszBankKasa(playerid);
		Transakcja(T_BWPLATA, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, cash, -1, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
		DodajHistorie(1, DaneGracza[playerid][gUID], cash, gettime()+CZAS_LETNI);
		new logtekst[256];
		format(logtekst, sizeof(logtekst), "[BANK] [%s] [ID: %d] Payment to bank account +%d$ ", ZmianaNicku(playerid), playerid, cash);
		Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
		return 1;
	}
	if(dialogid == DIALOG_HURTOWNIA)
	{
		if( !response )
			return 1;
        if(listitem == 0)
		{
			return 0;
		}
		else
		{
			new uid = strval(inputtext);
			SetPVarInt(playerid, "UIDHURT", uid);
			dShowPlayerDialog(playerid, DIALOG_HURTOWNIA_NEXT, DIALOG_STYLE_INPUT, "• Hurtownia:", "Wpisz iloœæ paczek, które chcesz zamówiæ (maks: 10):", "Dalej", "Zamknij");
		}
	}
	if(dialogid == DIALOG_BEZPIECZNIK)
	{
		new vw = GetPlayerVirtualWorld(playerid);
		if(AntySpam[playerid][2] == 1)
		{
			return 0;
		}
		AntySpam[playerid][2] = 1;
		SetTimerEx("SpamKomend3",5000,0,"d",playerid);
		if(response)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Bezpiecznik w³¹czony poprawnie", "Zamknij", "");
			BudynekInfo[vw][nBezpiecznik] = 1;
			WlaczSwiatlo(vw, playerid);
			ZapiszElektryke(vw);
			ZapiszNieruchomosc(vw);
			return 1;
		}
		else
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Bezpiecznik wy³¹czony poprawnie", "Zamknij", "");
			BudynekInfo[vw][nBezpiecznik] = 0;
			WlaczSwiatlo(vw, playerid);
			ZapiszElektryke(vw);
			ZapiszNieruchomosc(vw);
			return 1;
		}
	}
	if(dialogid == DIALOG_SWIATLODOM)
	{
		new vw = GetPlayerVirtualWorld(playerid);
		if(AntySpam[playerid][2] == 1)
		{
			return 0;
		}
		AntySpam[playerid][2] = 1;
		SetTimerEx("SpamKomend3",5000,0,"d",playerid);
		if(response)
		{
		    if(BudynekInfo[vw][nBezpiecznik] == 1)
		    {
			    GameTextForPlayer(playerid, "~w~~h~Swiatlo ~n~~r~przelaczone.", 3000, 5);
				WlaczSwiatlo(vw, playerid);
				ZapiszElektryke(vw);
				ZapiszNieruchomosc(vw);
			}
			else
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Bezpieczniki w tym budynku s¹ wy³¹czone!", "Zamknij", "");
			    return 1;
			}
			return 1;
		}
		else
		{
		    if(BudynekInfo[vw][nBezpiecznik] == 1)
		    {
			    GameTextForPlayer(playerid, "~w~~h~Swiatlo ~n~~r~przelaczone.", 3000, 5);
				WylaczSwiatlo(vw, playerid);
				ZapiszElektryke(vw);
				ZapiszNieruchomosc(vw);
			}
			else
			{
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Bezpieczniki w tym budynku s¹ wy³¹czone!", "Zamknij", "");
			    return 1;
			}
			return 1;
		}
	}
	if(dialogid == DIALOG_HURTOWNIA_NEXT)
	{
		if( !response )
			return 1;
		new uid = strval(inputtext);
		if(uid <= 0 || uid > 10)
		{
		    dShowPlayerDialog(playerid, DIALOG_HURTOWNIA_NEXT, DIALOG_STYLE_INPUT, "• Hurtownia:", "Wpisz iloœc paczek które chcesz zamówiæ:\nIloœæ sztuk nie mo¿e byæ wiêksza od 10, lub mniejsza od zera.", "Dalej", "Zamknij");
		    return 0;
		}
		SetPVarInt(playerid, "ILOSCHURT", uid);
		dShowPlayerDialog(playerid, DIALOG_HURTOWNIA_KWOTA, DIALOG_STYLE_INPUT, "• Hurtownia:", "Podaj kwotê za jak¹ chcesz sprzedawaæ jeden taki produkt:", "Dalej", "Zamknij");
	}
	if(dialogid == DIALOG_HURTOWNIA_KWOTA)
	{
		if( !response )
			return 1;
		new uid = strval(inputtext);
		if(uid <= HurtowniaInfo[GetPVarInt(playerid, "UIDHURT")][hCena])
		{
		    dShowPlayerDialog(playerid, DIALOG_HURTOWNIA_KWOTA, DIALOG_STYLE_INPUT, "• Hurtownia:", "Podaj kwotê za jak¹ chcesz sprzedawaæ jeden taki produkt:\nKwota nie mo¿e byæ mniejsza b¹dz równa cenie hurtowej.", "Dalej", "Zamknij");
		    return 0;
		}
		SetPVarInt(playerid, "CENACHURT", uid);
		SprzedajPrzedmiotH(playerid);
	}
	if(dialogid == DIALOG_CENNIK_INFORMACJA)
	{
		if( !response )
	    {
			return 1;
		}
		new uid = strval(inputtext);
		new akcjame[126];
		format(akcjame,sizeof(akcjame),"spogl¹da na cennik i wskazuje palcem na %s", MagazynInfo[uid][mNazwa]);
		cmd_fasdasfdfive(playerid, akcjame);
		new akcja[126];
		format(akcja,sizeof(akcja),"*spoglada na cennik i wskazuje palcem na %s*", MagazynInfo[uid][mNazwa]);
		SetPlayerChatBubble(playerid, akcja, FIOLETOWY, 10.0, 4000);
		new akcja2[126];
		format(akcja2,sizeof(akcja2),"spoglada na cennik i wskazuje palcem na %s", MagazynInfo[uid][mNazwa]);
		TextDrawSetString(AkcjaTD[playerid], akcja2);
		TextDrawShowForPlayer(playerid, AkcjaTD[playerid]);
		CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
		return 1;
	}
	if(dialogid == DIALOG_GASTRO_KUP_ILOSC)
	{
		if( !response )
	    {
	        DeletePVar(playerid, "idgrpodaj");
			return 1;
		}
		new ilosc = strval(inputtext);
		new id = GetPVarInt(playerid, "idgrpodaj");
		new uid = GetPVarInt(playerid, "UIDPrzedmiotuOffer");
		if(ilosc < MagazynInfo[uid][mIlosc] && ilosc == 0 && ilosc > 10)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_INPUT, "• Podaj:", "Iloœæ nie mo¿e przekraczaæ stanu który znajduje siê w magazynie oraz nie mo¿e wynosiæ wiêcej ni¿ 10!", "Rozumiem", "Zamknij");
		    return 0;
		}
		else
		{
		    Transakcja(T_OGASTRO, DaneGracza[playerid][gUID], DaneGracza[id][gUID], DaneGracza[playerid][gGUID], DaneGracza[id][gGUID], MagazynInfo[uid][mCena], MagazynInfo[uid][mTyp], MagazynInfo[uid][mWar1], MagazynInfo[uid][mWar2], "-", gettime()+KOREKTA_CZASOWA);
		    Oferuj(playerid, GetPVarInt(playerid, "idgrpodaj"), uid, MagazynInfo[uid][mTyp], MagazynInfo[uid][mWar1], MagazynInfo[uid][mWar2], OFEROWANIE_PODAJ, MagazynInfo[uid][mCena]*ilosc, MagazynInfo[uid][mNazwa], ilosc);
		    return 1;
		}
	}
	if(dialogid == DIALOG_GASTRO_KUP)
	{
	    if( !response )
	    {
	        DeletePVar(playerid, "idgrpodaj");
			return 1;
		}
		new uid = strval(inputtext);
		if(MagazynInfo[uid][mIlosc] == 0)
		{
		    GameTextForPlayer(playerid, "~r~Nie ma takiego przedmiotu.", 3000, 5);
		    return 0;
		}
		SetPVarInt(playerid, "UIDPrzedmiotuOffer", uid);
  		dShowPlayerDialog(playerid, DIALOG_GASTRO_KUP_ILOSC, DIALOG_STYLE_INPUT, "• Podaj:", "Podaj iloœæ produktów które chcesz sprzedaæ graczu.", "Dalej", "Zamknij");
		return 1;
	}
	if(dialogid == DIALOG_AUTOMAT_KUP)
	{
	    if( !response )
	    {
	        DeletePVar(playerid, "idgrpodaj");
			return 1;
		}
		new uid = strval(inputtext);
		if(MagazynInfo[uid][mIlosc] == 0)
		{
		    GameTextForPlayer(playerid, "~r~Nie ma takiego przedmiotu.", 3000, 5);
		    return 0;
		}
		//new text[246], text2[30];
		new id = GetPVarInt(playerid, "idgrpodaj");
		//sscanf(MagazynInfo[uid][mNazwa], "p<(>s[246]s[30]", text, text2);
		new cena = MagazynInfo[uid][mCena];
		new wynik = ( cena / 100 ) * 25;
		new cenagr = cena - wynik;
		new cenapl = cena + wynik;
		SetPVarInt(playerid, "Cenapl", cenapl);
		SetPVarInt(playerid, "Cenagr", cenagr);
		Transakcja(T_OGASTRO, DaneGracza[playerid][gUID], DaneGracza[id][gUID], DaneGracza[playerid][gGUID], DaneGracza[id][gGUID], cenapl, MagazynInfo[uid][mTyp], MagazynInfo[uid][mWar1], MagazynInfo[uid][mWar2], "-", gettime()+KOREKTA_CZASOWA);
		Oferuj(playerid, GetPVarInt(playerid, "idgrpodaj"), uid, MagazynInfo[uid][mTyp], MagazynInfo[uid][mWar1], MagazynInfo[uid][mWar2], OFEROWANIE_PODAJ, cenapl, MagazynInfo[uid][mNazwa], 1);
		return 1;
	}
	if(dialogid == DIALOG_MAGAZYNG)
	{
	    if(response == 1)
	    {
	        new uid = strval(inputtext);
	        ZaladujMagazyny();
			ZapiszMagazyn(uid);
	        new grupa = MagazynInfo[uid][mOwner];
	        if(GrupaInfo[grupa][gOwnerUID] == DaneGracza[playerid][gUID] || ZarzadzanieGrupa(playerid))
	        {
	            new uidb = GetPlayerVirtualWorld(playerid);
	            if(BudynekInfo[uidb][nWlascicielD] == grupa)
	            {
		    		Oferuj(playerid, -1, uid, MagazynInfo[uid][mTyp], MagazynInfo[uid][mWar1], MagazynInfo[uid][mWar2], OFEROWANIE_MAGAZYN, 0, MagazynInfo[uid][mNazwa], 0);
				}
				else
				{
				    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "» •» Informacja:", "Magazyn nie znajduje siê w tym budynku.", "Zamknij", "");
				}
			}
			else
			{
                GameTextForPlayer(playerid, "~r~Brak uprawnien!", 3000, 5);
                return 0;
			}
		}
		else
		{
		    GameTextForPlayer(playerid, "~r~Opusciles magazyn!", 3000, 5);
		    return 0;
		}
	}
	if(dialogid == DIALOG_KARTOTEKA_OPCJE)
	{
	    if( !response )
			return 1;
		SetPVarInt(playerid, "UIDWPISU", strval(inputtext));
		dShowPlayerDialog(playerid, DIALOG_KARTOTEKA_OPCJE_NEXT, DIALOG_STYLE_LIST, "• Kartoteka:", "» Informacja o wpisie\n» Dodaj wpis\n» Usuñ wpis", "Wybierz", "Zamknij");
		return 1;
	}
	if(dialogid == DIALOG_POMOC)
	{
	    if( !response )
			return 1;
		switch(listitem)
		{
			case 0:
			{
				PoczatekGry(playerid);
			}
			case 1:
			{
				PodstawoweKomendy(playerid);
			}
			case 2:
			{
				Animacje(playerid);
			}
			case 3:
			{
				PrzedmiotyPomoc(playerid);
			}
			case 4:
			{
				Pojazdy(playerid);
			}
			case 5:
			{
				BW(playerid);
			}
			case 6:
			{
				Oferty(playerid);
			}	
			case 7:
			{
				PracaInfo(playerid);
			}
			case 8:
			{
			    // Odstêp w GUI
			}
			case 9://grupa 1
			{
				new stats[1524];
			    new gr1 = DaneGracza[playerid][gDzialalnosc1];
			    if(GrupaInfo[gr1][gTyp] == 1)//Policja
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /skuj, /przeszukaj, /blokada, /blokuj, /alkomat, /przetrzymaj, /kartoteka", stats);
					format(stats, sizeof(stats), "%s\n(..) /kolczatka, /o blokade, /o mandat, /o pozwolenie bron, @[slot], ![slot], /d", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 2)//Zmotoryzowana
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /zwiaz, /worek, /przetrzymaj, /zabierz, /wyscig, /o wyscig, /taguj", stats);
					format(stats, sizeof(stats), "%s\n(..) Organizacje przestêpcze mog¹ zamawiaæ przedmioty w melinie i handlowaæ, zapamiêtaj.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 3)//Warsztat
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /p [nazwa czêœci], /podaj, /o naprawe, /o lakierowanie", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by zamawiaæ czêœci do warsztatu.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 4)//24/7
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /kup", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by zamawiaæ produkty do biznesu za pomoc¹ telefonu!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 5)//Salon
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /salon", stats);
					format(stats, sizeof(stats), "%s\n(..) Salon to samoobs³ugowy biznes!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 6)//Ubrania
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak komend.", stats);
					//format(stats, sizeof(stats), "%s\n(..) Salon to samoobs³ugowy biznes!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 7)//Bank
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak komend", stats);
					//format(stats, sizeof(stats), "%s\n(..) Salon to samoobs³ugowy biznes!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 8)//Elektryk
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o elektryk, /swiatlo, /bezpiecznik", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by w budynku klienta zamotnowaæ nastêpuj¹ce obiekty: (model: 364, 1958)!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 9)//Gastronomia
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by zamówiæ produkty przez telefon, by pracownicy mieli co sprzedaæ!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 10)//San News
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /news, /wywiad, /reklama, /live.", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by nie wypisywaæ g³upot, wszystko jest obserwowane przez Administracjê!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 11)//Mafie
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /zwiaz, /worek, /przetrzymaj, /zabierz", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by przestrzegaæ Gang Rulez! Ta grupa ma mo¿liwoœæ zamawiania BRONI", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 12)//Hotel
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /pokoj", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj ¿e jest to biznes samoobs³ugowy, dbaj o jego wygl¹d wewnêtrzny a bêdziesz mia³ klientów!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 13)//Rodzinka
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj ¿e jest to Rodzinka/Party, mo¿ecie pod tym panelem razem dorabiaæ siê maj¹tku!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 14)//Medycyna
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /o poczytalnoœæ ,@[slot], ![slot], /d", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 15)//Taxi
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o przejazd", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o oferowaniu przejazdu, po przyjeciu jego klient mo¿e na ESC -> MAPA, zaznaczyæ miejsce docelowe!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 16)//Gangi
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /zwiaz, /worek, /przetrzymaj, /zabierz, /taguj", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by przestrzegaæ Gang Rulez! Ta grupa ma mo¿liwoœæ zamawiania narkotyków", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 17)//Silownia
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj ¿eby gracz wykona³ trening musisz mu podaæ karnet si³owy!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 18)//Binco
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak komend.", stats);
					format(stats, sizeof(stats), "%s\n(..) Sklep z ubraniami to samoobs³ugowy biznes lecz dbaj o jego wygl¹d by miec klientów!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 19)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o dokument, /o oplate, /d, @[slot], ![slot].", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o ubraniu s³u¿bowym, opisie postaci oraz odegraniu akcji RP.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 20)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o ochrone, /kamera, /kamerax, /kameray, /kameraz", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamietaj o zamontowaniu kamer w lokalu (model: 1622, 1616, 1886) oraz ustawieniu ich!\nZa pomoc¹ komend: /kamera - /kamerax, /kameray, /kameraz", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 21)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak.", stats);
					//format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o ubraniu s³u¿bowym, opisie postaci oraz odegraniu akcji RP.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 22)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak.", stats);
					//format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o ubraniu s³u¿bowym, opisie postaci oraz odegraniu akcji RP.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 25)//Siec
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 26)//Strzelnica
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr1][gTyp] == 27)//Strzelnica
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
				if(GrupaInfo[gr1][gTyp] == 28)//Strzelnica
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot], /o tatuaz", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			}
			case 10://grupa 2
			{
			    new stats[1524];
			    new gr2 = DaneGracza[playerid][gDzialalnosc2];
			    if(GrupaInfo[gr2][gTyp] == 1)//Policja
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /skuj, /przeszukaj, /blokada, /blokuj, /alkomat, /przetrzymaj, /kartoteka", stats);
					format(stats, sizeof(stats), "%s\n(..) /kolczatka, /o blokade, /o mandat, /o pozwolenie bron, @[slot], ![slot], /d", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 2)//Zmotoryzowana
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /zwiaz, /worek, /przetrzymaj, /zabierz, /wyscig, /o wyscig, /taguj", stats);
					format(stats, sizeof(stats), "%s\n(..) Organizacje przestêpcze mog¹ zamawiaæ przedmioty w melinie i handlowaæ, zapamiêtaj.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 3)//Warsztat
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /p [nazwa czêœci], /podaj, /o naprawe, /o lakierowanie", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by zamawiaæ czêœci do warsztatu.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 4)//24/7
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /kup", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by zamawiaæ produkty do biznesu za pomoc¹ telefonu!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 5)//Salon
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /salon", stats);
					format(stats, sizeof(stats), "%s\n(..) Salon to samoobs³ugowy biznes!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 6)//Ubrania
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak komend.", stats);
					//format(stats, sizeof(stats), "%s\n(..) Salon to samoobs³ugowy biznes!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 7)//Bank
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak komend", stats);
					//format(stats, sizeof(stats), "%s\n(..) Salon to samoobs³ugowy biznes!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 8)//Elektryk
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o elektryk, /swiatlo, /bezpiecznik", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by w budynku klienta zamotnowaæ nastêpuj¹ce obiekty: (model: 364, 1958)!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 9)//Gastronomia
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by zamówiæ produkty przez telefon, by pracownicy mieli co sprzedaæ!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 10)//San News
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /news, /wywiad, /reklama, /live.", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by nie wypisywaæ g³upot, wszystko jest obserwowane przez Administracjê!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 11)//Mafie
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /zwiaz, /worek, /przetrzymaj, /zabierz", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by przestrzegaæ Gang Rulez! Ta grupa ma mo¿liwoœæ zamawiania BRONI", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 12)//Hotel
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /pokoj", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj ¿e jest to biznes samoobs³ugowy, dbaj o jego wygl¹d wewnêtrzny a bêdziesz mia³ klientów!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 13)//Rodzinka
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj ¿e jest to Rodzinka/Party, mo¿ecie pod tym panelem razem dorabiaæ siê maj¹tku!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 14)//Medycyna
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /o poczytalnoœæ ,@[slot], ![slot], /d", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 15)//Taxi
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o przejazd", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o oferowaniu przejazdu, po przyjeciu jego klient mo¿e na ESC -> MAPA, zaznaczyæ miejsce docelowe!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 16)//Gangi
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /zwiaz, /worek, /przetrzymaj, /zabierz, /taguj", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by przestrzegaæ Gang Rulez! Ta grupa ma mo¿liwoœæ zamawiania narkotyków", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 17)//Silownia
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj ¿eby gracz wykona³ trening musisz mu podaæ karnet si³owy!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 18)//Binco
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak komend.", stats);
					format(stats, sizeof(stats), "%s\n(..) Sklep z ubraniami to samoobs³ugowy biznes lecz dbaj o jego wygl¹d by miec klientów!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 19)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o dokument, /o oplate, /d, @[slot], ![slot].", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o ubraniu s³u¿bowym, opisie postaci oraz odegraniu akcji RP.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 20)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o ochrone, /kamera, /kamerax, /kameray, /kameraz", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamietaj o zamontowaniu kamer w lokalu (model: 1622, 1616, 1886) oraz ustawieniu ich!\nZa pomoc¹ komend: /kamera - /kamerax, /kameray, /kameraz", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 21)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak.", stats);
					//format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o ubraniu s³u¿bowym, opisie postaci oraz odegraniu akcji RP.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 22)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak.", stats);
					//format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o ubraniu s³u¿bowym, opisie postaci oraz odegraniu akcji RP.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 25)//Siec
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 26)//Strzelnica
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 27)//Strzelnica
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr2][gTyp] == 28)//Strzelnica
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot], /o tatuaz", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			}
			case 11://grupa 3
			{
                new stats[1524];
				new gr3 = DaneGracza[playerid][gDzialalnosc3];
			    if(GrupaInfo[gr3][gTyp] == 1)//Policja
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /skuj, /przeszukaj, /blokada, /blokuj, /alkomat, /przetrzymaj, /kartoteka", stats);
					format(stats, sizeof(stats), "%s\n(..) /kolczatka, /o blokade, /o mandat, @[slot], ![slot], /d", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 2)//Zmotoryzowana
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /zwiaz, /worek, /przetrzymaj, /zabierz, /wyscig, /o wyscig, /taguj", stats);
					format(stats, sizeof(stats), "%s\n(..) Organizacje przestêpcze mog¹ zamawiaæ przedmioty w melinie i handlowaæ, zapamiêtaj.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 3)//Warsztat
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /p [nazwa czêœci], /podaj, /o naprawe, /o lakierowanie", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by zamawiaæ czêœci do warsztatu.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 4)//24/7
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /kup", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by zamawiaæ produkty do biznesu za pomoc¹ telefonu!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 5)//Salon
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /salon", stats);
					format(stats, sizeof(stats), "%s\n(..) Salon to samoobs³ugowy biznes!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 6)//Ubrania
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak komend.", stats);
					//format(stats, sizeof(stats), "%s\n(..) Salon to samoobs³ugowy biznes!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 7)//Bank
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak komend", stats);
					//format(stats, sizeof(stats), "%s\n(..) Salon to samoobs³ugowy biznes!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 8)//Elektryk
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o elektryk, /swiatlo, /bezpiecznik", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by w budynku klienta zamotnowaæ nastêpuj¹ce obiekty: (model: 364, 1958)!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 9)//Gastronomia
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by zamówiæ produkty przez telefon, by pracownicy mieli co sprzedaæ!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 10)//San News
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /news, /wywiad, /reklama, /live.", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by nie wypisywaæ g³upot, wszystko jest obserwowane przez Administracjê!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 11)//Mafie
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /zwiaz, /worek, /przetrzymaj, /zabierz", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by przestrzegaæ Gang Rulez! Ta grupa ma mo¿liwoœæ zamawiania BRONI", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 12)//Hotel
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /pokoj", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj ¿e jest to biznes samoobs³ugowy, dbaj o jego wygl¹d wewnêtrzny a bêdziesz mia³ klientów!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 13)//Rodzinka
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj ¿e jest to Rodzinka/Party, mo¿ecie pod tym panelem razem dorabiaæ siê maj¹tku!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 14)//Medycyna
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /o poczytalnoœæ ,@[slot], ![slot], /d", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 15)//Taxi
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o przejazd", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o oferowaniu przejazdu, po przyjeciu jego klient mo¿e na ESC -> MAPA, zaznaczyæ miejsce docelowe!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 16)//Gangi
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /zwiaz, /worek, /przetrzymaj, /zabierz, /taguj", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by przestrzegaæ Gang Rulez! Ta grupa ma mo¿liwoœæ zamawiania narkotyków", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 17)//Silownia
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj ¿eby gracz wykona³ trening musisz mu podaæ karnet si³owy!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 18)//Binco
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak komend.", stats);
					format(stats, sizeof(stats), "%s\n(..) Sklep z ubraniami to samoobs³ugowy biznes lecz dbaj o jego wygl¹d by miec klientów!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 19)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o dokument, /o oplate, /d, @[slot], ![slot].", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o ubraniu s³u¿bowym, opisie postaci oraz odegraniu akcji RP.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 20)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o ochrone, /kamera, /kamerax, /kameray, /kameraz", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamietaj o zamontowaniu kamer w lokalu (model: 1622, 1616, 1886) oraz ustawieniu ich!\nZa pomoc¹ komend: /kamera - /kamerax, /kameray, /kameraz", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 21)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak.", stats);
					//format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o ubraniu s³u¿bowym, opisie postaci oraz odegraniu akcji RP.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 22)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak.", stats);
					//format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o ubraniu s³u¿bowym, opisie postaci oraz odegraniu akcji RP.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 25)//Siec
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 26)//Strzelnica
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 27)//Strzelnica
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr3][gTyp] == 28)//Strzelnica
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot], /o tatuaz", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			}
			case 12://grupa 4
			{
			    new stats[1524];
				new gr4 = DaneGracza[playerid][gDzialalnosc4];
			    if(GrupaInfo[gr4][gTyp] == 1)//Policja
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /skuj, /przeszukaj, /blokada, /blokuj, /alkomat, /przetrzymaj, /kartoteka", stats);
					format(stats, sizeof(stats), "%s\n(..) /kolczatka, /o blokade, /o mandat, /o pozwolenie bron, @[slot], ![slot], /d", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 2)//Zmotoryzowana
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /zwiaz, /worek, /przetrzymaj, /zabierz, /wyscig, /o wyscig, /taguj", stats);
					format(stats, sizeof(stats), "%s\n(..) Organizacje przestêpcze mog¹ zamawiaæ przedmioty w melinie i handlowaæ, zapamiêtaj.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 3)//Warsztat
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /p [nazwa czêœci], /podaj, /o naprawe, /o lakierowanie", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by zamawiaæ czêœci do warsztatu.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 4)//24/7
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /kup", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by zamawiaæ produkty do biznesu za pomoc¹ telefonu!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 5)//Salon
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /salon", stats);
					format(stats, sizeof(stats), "%s\n(..) Salon to samoobs³ugowy biznes!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 6)//Ubrania
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak komend.", stats);
					//format(stats, sizeof(stats), "%s\n(..) Salon to samoobs³ugowy biznes!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 7)//Bank
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak komend", stats);
					//format(stats, sizeof(stats), "%s\n(..) Salon to samoobs³ugowy biznes!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 8)//Elektryk
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o elektryk, /swiatlo, /bezpiecznik", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by w budynku klienta zamotnowaæ nastêpuj¹ce obiekty: (model: 364, 1958)!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 9)//Gastronomia
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by zamówiæ produkty przez telefon, by pracownicy mieli co sprzedaæ!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 10)//San News
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /news, /wywiad, /reklama, /live.", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by nie wypisywaæ g³upot, wszystko jest obserwowane przez Administracjê!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 11)//Mafie
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /zwiaz, /worek, /przetrzymaj, /zabierz", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by przestrzegaæ Gang Rulez! Ta grupa ma mo¿liwoœæ zamawiania BRONI", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 12)//Hotel
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /pokoj", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj ¿e jest to biznes samoobs³ugowy, dbaj o jego wygl¹d wewnêtrzny a bêdziesz mia³ klientów!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 13)//Rodzinka
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj ¿e jest to Rodzinka/Party, mo¿ecie pod tym panelem razem dorabiaæ siê maj¹tku!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 14)//Medycyna
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /o poczytalnoœæ ,@[slot], ![slot], /d", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 15)//Taxi
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o przejazd", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o oferowaniu przejazdu, po przyjeciu jego klient mo¿e na ESC -> MAPA, zaznaczyæ miejsce docelowe!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 16)//Gangi
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /zwiaz, /worek, /przetrzymaj, /zabierz, /taguj", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by przestrzegaæ Gang Rulez! Ta grupa ma mo¿liwoœæ zamawiania narkotyków", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 17)//Silownia
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj ¿eby gracz wykona³ trening musisz mu podaæ karnet si³owy!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 18)//Binco
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak komend.", stats);
					format(stats, sizeof(stats), "%s\n(..) Sklep z ubraniami to samoobs³ugowy biznes lecz dbaj o jego wygl¹d by miec klientów!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 19)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o dokument, /o oplate, /d, @[slot], ![slot].", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o ubraniu s³u¿bowym, opisie postaci oraz odegraniu akcji RP.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 20)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o ochrone, /kamera, /kamerax, /kameray, /kameraz", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamietaj o zamontowaniu kamer w lokalu (model: 1622, 1616, 1886) oraz ustawieniu ich!\nZa pomoc¹ komend: /kamera - /kamerax, /kameray, /kameraz", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 21)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak.", stats);
					//format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o ubraniu s³u¿bowym, opisie postaci oraz odegraniu akcji RP.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 22)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak.", stats);
					//format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o ubraniu s³u¿bowym, opisie postaci oraz odegraniu akcji RP.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 25)//Siec
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 26)//Strzelnica
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 27)//Strzelnica
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr4][gTyp] == 28)//Strzelnica
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot], /o tatuaz", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			}
			case 13://grupa 5
			{
			    new stats[1524];
				new gr5 = DaneGracza[playerid][gDzialalnosc5];
			    if(GrupaInfo[gr5][gTyp] == 1)//Policja
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /skuj, /przeszukaj, /blokada, /blokuj, /alkomat, /przetrzymaj, /kartoteka", stats);
					format(stats, sizeof(stats), "%s\n(..) /kolczatka, /o blokade, /o mandat, /o pozwolenie bron, @[slot], ![slot], /d", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 2)//Zmotoryzowana
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /zwiaz, /worek, /przetrzymaj, /zabierz, /wyscig, /o wyscig, /taguj", stats);
					format(stats, sizeof(stats), "%s\n(..) Organizacje przestêpcze mog¹ zamawiaæ przedmioty w melinie i handlowaæ, zapamiêtaj.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 3)//Warsztat
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /p [nazwa czêœci], /podaj, /o naprawe, /o lakierowanie", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by zamawiaæ czêœci do warsztatu.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 4)//24/7
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /kup", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by zamawiaæ produkty do biznesu za pomoc¹ telefonu!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 5)//Salon
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /salon", stats);
					format(stats, sizeof(stats), "%s\n(..) Salon to samoobs³ugowy biznes!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 6)//Ubrania
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak komend.", stats);
					//format(stats, sizeof(stats), "%s\n(..) Salon to samoobs³ugowy biznes!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 7)//Bank
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak komend", stats);
					//format(stats, sizeof(stats), "%s\n(..) Salon to samoobs³ugowy biznes!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 8)//Elektryk
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o elektryk, /swiatlo, /bezpiecznik", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by w budynku klienta zamotnowaæ nastêpuj¹ce obiekty: (model: 364, 1958)!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 9)//Gastronomia
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by zamówiæ produkty przez telefon, by pracownicy mieli co sprzedaæ!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 10)//San News
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /news, /wywiad, /reklama, /live.", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by nie wypisywaæ g³upot, wszystko jest obserwowane przez Administracjê!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 11)//Mafie
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /zwiaz, /worek, /przetrzymaj, /zabierz", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by przestrzegaæ Gang Rulez! Ta grupa ma mo¿liwoœæ zamawiania BRONI", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 12)//Hotel
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /pokoj", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj ¿e jest to biznes samoobs³ugowy, dbaj o jego wygl¹d wewnêtrzny a bêdziesz mia³ klientów!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 13)//Rodzinka
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj ¿e jest to Rodzinka/Party, mo¿ecie pod tym panelem razem dorabiaæ siê maj¹tku!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 14)//Medycyna
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /o poczytalnoœæ ,@[slot], ![slot], /d", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 15)//Taxi
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o przejazd", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o oferowaniu przejazdu, po przyjeciu jego klient mo¿e na ESC -> MAPA, zaznaczyæ miejsce docelowe!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 16)//Gangi
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /zwiaz, /worek, /przetrzymaj, /zabierz, /taguj", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by przestrzegaæ Gang Rulez! Ta grupa ma mo¿liwoœæ zamawiania narkotyków", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 17)//Silownia
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj ¿eby gracz wykona³ trening musisz mu podaæ karnet si³owy!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 18)//Binco
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak komend.", stats);
					format(stats, sizeof(stats), "%s\n(..) Sklep z ubraniami to samoobs³ugowy biznes lecz dbaj o jego wygl¹d by miec klientów!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 19)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o dokument, /o oplate, /d, @[slot], ![slot].", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o ubraniu s³u¿bowym, opisie postaci oraz odegraniu akcji RP.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 20)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o ochrone, /kamera, /kamerax, /kameray, /kameraz", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamietaj o zamontowaniu kamer w lokalu (model: 1622, 1616, 1886) oraz ustawieniu ich!\nZa pomoc¹ komend: /kamera - /kamerax, /kameray, /kameraz", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 21)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak.", stats);
					//format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o ubraniu s³u¿bowym, opisie postaci oraz odegraniu akcji RP.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 22)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak.", stats);
					//format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o ubraniu s³u¿bowym, opisie postaci oraz odegraniu akcji RP.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 25)//Siec
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 26)//Strzelnica
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 27)//Strzelnica
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr5][gTyp] == 28)//Strzelnica
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot], /o tatuaz", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			}
			case 14://grupa 6
			{
			    new stats[1524];
				new gr6 = DaneGracza[playerid][gDzialalnosc6];
			    if(GrupaInfo[gr6][gTyp] == 1)//Policja
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /skuj, /przeszukaj, /blokada, /blokuj, /alkomat, /przetrzymaj, /kartoteka", stats);
					format(stats, sizeof(stats), "%s\n(..) /kolczatka, /o blokade, /o mandat, /o pozwolenie bron, @[slot], ![slot], /d", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 2)//Zmotoryzowana
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /zwiaz, /worek, /przetrzymaj, /zabierz, /wyscig, /o wyscig, /taguj, ![slot], @[slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Organizacje przestêpcze mog¹ zamawiaæ przedmioty w melinie i handlowaæ, zapamiêtaj.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 3)//Warsztat
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /p [nazwa czêœci], /podaj, /o naprawe, /o lakierowanie, ![slot], @[slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by zamawiaæ czêœci do warsztatu.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 4)//24/7
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /kup, ![slot], @[slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by zamawiaæ produkty do biznesu za pomoc¹ telefonu!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 5)//Salon
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /salon, ![slot], @[slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Salon to samoobs³ugowy biznes!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 6)//Ubrania
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: ![slot], @[slot]", stats);
					//format(stats, sizeof(stats), "%s\n(..) Salon to samoobs³ugowy biznes!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 7)//Bank
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: ![slot], @[slot]", stats);
					//format(stats, sizeof(stats), "%s\n(..) Salon to samoobs³ugowy biznes!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 8)//Elektryk
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o elektryk, /swiatlo, /bezpiecznik, ![slot], @[slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by w budynku klienta zamotnowaæ nastêpuj¹ce obiekty: (model: 364, 1958)!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 9)//Gastronomia
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, ![slot], @[slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by zamówiæ produkty przez telefon, by pracownicy mieli co sprzedaæ!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 10)//San News
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /news, /wywiad, /reklama, /live, ![slot], @[slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by nie wypisywaæ g³upot, wszystko jest obserwowane przez Administracjê!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 11)//Mafie
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /zwiaz, /worek, /przetrzymaj, /zabierz, ![slot], @[slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by przestrzegaæ Gang Rulez! Ta grupa ma mo¿liwoœæ zamawiania BRONI", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 12)//Hotel
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /pokoj, ![slot], @[slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj ¿e jest to biznes samoobs³ugowy, dbaj o jego wygl¹d wewnêtrzny a bêdziesz mia³ klientów!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 13)//Rodzinka
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: ![slot], @[slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj ¿e jest to Rodzinka/Party, mo¿ecie pod tym panelem razem dorabiaæ siê maj¹tku!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 14)//Medycyna
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /o poczytalnoœæ ,@[slot], ![slot], /d", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 15)//Taxi
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o przejazd, ![slot], @[slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o oferowaniu przejazdu, po przyjeciu jego klient mo¿e na ESC -> MAPA, zaznaczyæ miejsce docelowe!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 16)//Gangi
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /zwiaz, /worek, /przetrzymaj, /zabierz, /taguj, ![slot], @[slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj by przestrzegaæ Gang Rulez! Ta grupa ma mo¿liwoœæ zamawiania narkotyków", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 17)//Silownia
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj ¿eby gracz wykona³ trening musisz mu podaæ karnet si³owy!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 18)//Binco
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: ![slot], @[slot], przebierz.", stats);
					format(stats, sizeof(stats), "%s\n(..) Sklep z ubraniami to samoobs³ugowy biznes lecz dbaj o jego wygl¹d by miec klientów!", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 19)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o dokument, /o oplate, /d, @[slot], ![slot].", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o ubraniu s³u¿bowym, opisie postaci oraz odegraniu akcji RP.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 20)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /o ochrone, /kamera, /kamerax, /kameray, /kameraz, ![slot], @[slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamietaj o zamontowaniu kamer w lokalu (model: 1622, 1616, 1886) oraz ustawieniu ich!\nZa pomoc¹ komend: /kamera - /kamerax, /kameray, /kameraz", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 21)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak.", stats);
					//format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o ubraniu s³u¿bowym, opisie postaci oraz odegraniu akcji RP.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 22)//Rz¹d
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: Brak.", stats);
					//format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o ubraniu s³u¿bowym, opisie postaci oraz odegraniu akcji RP.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 25)//Siec
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 26)//Strzelnica
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 27)//Strzelnica
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot]", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			    if(GrupaInfo[gr6][gTyp] == 28)//Strzelnica
			    {
			        format(stats, sizeof(stats), "%s\nKomendy: /podaj, /cennik, @[slot], ![slot], /o tatuaz", stats);
					format(stats, sizeof(stats), "%s\n(..) Pamiêtaj o zamawianiu potrzebnych produktów za pomoc¹ telefonu, oraz przy podawaniu o odegraniu akcji RP!.", stats);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Pomoc:", stats, "Zamknij", "");
					return 1;
			    }
			}
			case 16://Komendy Administracji
			{
			    KomendyAdmina(playerid);
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_KARTOTEKA_OPCJE_NEXT)
	{
	    if( !response )
			return 1;
		switch(listitem)
		{
			case 0:
			{
				new uid_wpisu = GetPVarInt(playerid, "UIDWPISU");
				new strkart[256];
				format(strkart, sizeof(strkart), "Typ wpisu: %s\nData: %s\nGodzina: %s\nWpisa³: %s (UID: %d, GUID: %d)"
				,typ_wpisu_kartoteka[KartotekaInfo[uid_wpisu][kTyp]]
				,KartotekaInfo[uid_wpisu][kData]
				,KartotekaInfo[uid_wpisu][kGodzina]
				,KartotekaInfo[uid_wpisu][kNickN]
				,KartotekaInfo[uid_wpisu][kUIDN]
				,KartotekaInfo[uid_wpisu][kGUIDN]);
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Kartoteka:", strkart, "Zamknij", "");
			}
			case 1:
			{
				dShowPlayerDialog(playerid, DIALOG_KARTOTEKA_WPIS_NEXT, DIALOG_STYLE_INPUT, "• Kartoteka:", "Podaj powód wpisu:", "Wpisz", "Zamknij");
			}
			case 2:
			{
				if(!ZarzadzanieKartoteka(playerid) && GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA)
				{
					GameTextForPlayer(playerid, "~r~Brak uprawnien.", 3000, 5);
					return 0;
				}
				new uid_wpisu = GetPVarInt(playerid, "UIDWPISU");
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Wpis zosta³ usuniêty.", "Zamknij", "");
				UsunKartoteka(uid_wpisu);
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_KARTOTEKA_WPIS)
	{
	    if( !response )
			return 1;
		dShowPlayerDialog(playerid, DIALOG_KARTOTEKA_WPIS_NEXT, DIALOG_STYLE_INPUT, "• Kartoteka:", "Podaj powód wpisu:", "Wpisz", "Zamknij");
		return 1;
	}
	if(dialogid == DIALOG_KARTOTEKA_WPIS_NEXT)
	{
	    if( !response )
			return 1;
		if(strlen(inputtext) < 3)
		{
			dShowPlayerDialog(playerid, DIALOG_KARTOTEKA_WPIS_NEXT, DIALOG_STYLE_INPUT, "• Kartoteka:", "Podaj powód wpisu:", "Wpisz", "Zamknij");
			return 0;
		}
		DodajKartoteke(playerid, GetPVarInt(playerid, "IDKART"), 0, inputtext);
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Wpis zosta³ dodany.", "Zamknij", "");
		return 1;
	}
	if(dialogid == DIALOG_PRZEBIERZ)
	{
	    if( !response )
			return 1;
		switch(listitem)
		{
			case 0:
			{
			    ForeachEx(i, MAX_PRZEDMIOT)
		        {
		            if(PrzedmiotInfo[i][pTyp] == P_UBRANIE && PrzedmiotInfo[i][pUzywany] == 1 && PrzedmiotInfo[i][pOwner] == DaneGracza[playerid][gUID])
		            {
		                dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Masz ju¿ u¿yte ubranie z listy przedmiotów, sci¹gnij je by siê przebraæ.", "Zamknij", "");
			    		return 1;
		            }
		        }
				DaneGracza[playerid][gOSkin] = 0;
				DaneGracza[playerid][gLskin] = DaneGracza[playerid][gSKIN];
			    SetPlayerSkin(playerid, DaneGracza[playerid][gSKIN]);
				return 1;
			}
			case 1:
			{
			    ForeachEx(i, MAX_PRZEDMIOT)
		        {
		            if(PrzedmiotInfo[i][pTyp] == P_UBRANIE && PrzedmiotInfo[i][pUzywany] == 1 && PrzedmiotInfo[i][pOwner] == DaneGracza[playerid][gUID])
		            {
		                dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Masz ju¿ u¿yte ubranie z listy przedmiotów, sci¹gnij je by siê przebraæ.", "Zamknij", "");
			    		return 1;
		            }
		        }
				if(DaneGracza[playerid][gPrzynaleznosci][2] == -1)
				{
					GameTextForPlayer(playerid, "~r~Twoje ubranie sluzbowe nie zostalo przydzielone.", 3000, 5);
					return 0;
				}
				DaneGracza[playerid][gLskin] = DaneGracza[playerid][gPrzynaleznosci][2];
				SetPlayerSkin(playerid, DaneGracza[playerid][gLskin]);
				return 1;
			}
			case 2:
			{
			    ForeachEx(i, MAX_PRZEDMIOT)
		        {
		            if(PrzedmiotInfo[i][pTyp] == P_UBRANIE && PrzedmiotInfo[i][pUzywany] == 1 && PrzedmiotInfo[i][pOwner] == DaneGracza[playerid][gUID])
		            {
		                dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Masz ju¿ u¿yte ubranie z listy przedmiotów, sci¹gnij je by siê przebraæ.", "Zamknij", "");
			    		return 1;
		            }
		        }
				if(DaneGracza[playerid][gPrzynaleznosci][8] == -1)
				{
					GameTextForPlayer(playerid, "~r~Twoje ubranie sluzbowe nie zostalo przydzielone.", 3000, 5);
					return 0;
				}
				DaneGracza[playerid][gLskin] = DaneGracza[playerid][gPrzynaleznosci][8];
				SetPlayerSkin(playerid, DaneGracza[playerid][gLskin]);
				return 1;
			}
			case 3:
			{
			    ForeachEx(i, MAX_PRZEDMIOT)
		        {
		            if(PrzedmiotInfo[i][pTyp] == P_UBRANIE && PrzedmiotInfo[i][pUzywany] == 1 && PrzedmiotInfo[i][pOwner] == DaneGracza[playerid][gUID])
		            {
		                dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Masz ju¿ u¿yte ubranie z listy przedmiotów, sci¹gnij je by siê przebraæ.", "Zamknij", "");
			    		return 1;
		            }
		        }
				if(DaneGracza[playerid][gPrzynaleznosci][14] == -1)
				{
					GameTextForPlayer(playerid, "~r~Twoje ubranie sluzbowe nie zostalo przydzielone.", 3000, 5);
					return 0;
				}
				DaneGracza[playerid][gLskin] = DaneGracza[playerid][gPrzynaleznosci][14];
				SetPlayerSkin(playerid, DaneGracza[playerid][gLskin]);
				return 1;
			}
			case 4:
			{
			    ForeachEx(i, MAX_PRZEDMIOT)
		        {
		            if(PrzedmiotInfo[i][pTyp] == P_UBRANIE && PrzedmiotInfo[i][pUzywany] == 1 && PrzedmiotInfo[i][pOwner] == DaneGracza[playerid][gUID])
		            {
		                dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Masz ju¿ u¿yte ubranie z listy przedmiotów, sci¹gnij je by siê przebraæ.", "Zamknij", "");
			    		return 1;
		            }
		        }
				if(DaneGracza[playerid][gPrzynaleznosci][20] == -1)
				{
					GameTextForPlayer(playerid, "~r~Twoje ubranie sluzbowe nie zostalo przydzielone.", 3000, 5);
					return 0;
				}
				DaneGracza[playerid][gLskin] = DaneGracza[playerid][gPrzynaleznosci][20];
				SetPlayerSkin(playerid, DaneGracza[playerid][gLskin]);
				return 1;
			}
			case 5:
			{
			    ForeachEx(i, MAX_PRZEDMIOT)
		        {
		            if(PrzedmiotInfo[i][pTyp] == P_UBRANIE && PrzedmiotInfo[i][pUzywany] == 1 && PrzedmiotInfo[i][pOwner] == DaneGracza[playerid][gUID])
		            {
		                dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Masz ju¿ u¿yte ubranie z listy przedmiotów, sci¹gnij je by siê przebraæ.", "Zamknij", "");
			    		return 1;
		            }
		        }
				if(DaneGracza[playerid][gPrzynaleznosci][26] == -1)
				{
					GameTextForPlayer(playerid, "~r~Twoje ubranie sluzbowe nie zostalo przydzielone.", 3000, 5);
					return 0;
				}
				DaneGracza[playerid][gLskin] = DaneGracza[playerid][gPrzynaleznosci][26];
				SetPlayerSkin(playerid, DaneGracza[playerid][gLskin]);
				return 1;
			}
			case 6:
			{
			    ForeachEx(i, MAX_PRZEDMIOT)
		        {
		            if(PrzedmiotInfo[i][pTyp] == P_UBRANIE && PrzedmiotInfo[i][pUzywany] == 1 && PrzedmiotInfo[i][pOwner] == DaneGracza[playerid][gUID])
		            {
		                dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Masz ju¿ u¿yte ubranie z listy przedmiotów, sci¹gnij je by siê przebraæ.", "Zamknij", "");
			    		return 1;
		            }
		        }
				if(DaneGracza[playerid][gPrzynaleznosci][32] == -1)
				{
					GameTextForPlayer(playerid, "~r~Twoje ubranie sluzbowe nie zostalo przydzielone.", 3000, 5);
					return 0;
				}
				DaneGracza[playerid][gLskin] = DaneGracza[playerid][gPrzynaleznosci][32];
				SetPlayerSkin(playerid, DaneGracza[playerid][gLskin]);
				return 1;
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_247_KUP)
	{
	    if( !response )
			return 1;
		new uid = strval(inputtext);

		if(MagazynInfo[uid][mCena] > DaneGracza[playerid][gPORTFEL])
		{
		    GameTextForPlayer(playerid, "~r~Nie posiadasz takiej kwoty.", 3000, 5);
			return 0;
		}
		if(MagazynInfo[uid][mIlosc] == 0)
		{
		    GameTextForPlayer(playerid, "~r~Nie ma takiego przedmiotu.", 3000, 5);
		    return 0;
		}
		Dodajkase(playerid, -MagazynInfo[uid][mCena]);
		new strp[124];
		format(strp, sizeof(strp), "~b~Zakupiono przedmiot:~n~ ~w~%s~n~~y~Koszt: ~w~$%d",MagazynInfo[uid][mNazwa], MagazynInfo[uid][mCena]);
		GameTextForPlayer(playerid, strp, 5000, 5);
		DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, MagazynInfo[uid][mTyp], MagazynInfo[uid][mWar1], MagazynInfo[uid][mWar2], MagazynInfo[uid][mNazwa], DaneGracza[playerid][gUID], 0, -1, MagazynInfo[uid][mWar5], 0, 0,0, "");
		new uids = GetPVarInt(playerid, "uiddrzwi");
    	new uidp = BudynekInfo[uids][nWlascicielD];
    	GrupaInfo[uidp][gSaldo] += MagazynInfo[uid][mCena];
    	Transakcja(T_247K, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, MagazynInfo[uid][mCena], MagazynInfo[uid][mTyp], MagazynInfo[uid][mWar1], uidp, "-", gettime()+KOREKTA_CZASOWA);
		ZapiszSaldo(uidp);
		if(MagazynInfo[uid][mIlosc] == 1)
		{
		    UsunMagazyn(uid);
		    return 1;
		}
		else
		{
		    MagazynInfo[uid][mIlosc]--;
		    ZapiszMagazyn(uid);
		}
		return 1;
	}
	if(dialogid == DIALOG_BANK_KONTO)
	{
	    if( !response )
			return 1;
		if(20 > DaneGracza[playerid][gPORTFEL])
		{
		    GameTextForPlayer(playerid, "~r~Nie posiadasz takiej kwoty.", 3000, 5);
			return 1;
		}
		new uids = GetPVarInt(playerid, "uiddrzwi");
    	new uid = BudynekInfo[uids][nWlascicielD];
    	GrupaInfo[uid][gSaldo] += 20;
		Dodajkase(playerid, -20);

		new nrkarty = 747562131 + DaneGracza[playerid][gUID];
		new test[124];
		strdel(tekst_global, 0, 2048);
		format(test, sizeof(test), "%s", iban(playerid));
		format(tekst_global, sizeof(tekst_global), "%s", test);
		for(new i=4; i < strlen(tekst_global); i+=5)
			strins(tekst_global, " ", i);
        new nrkonta = 100000000 + random(899999999);
        new cos = nrkontasprawdz(nrkonta);
		DodajKontoWBanku(playerid, GrupaInfo[uid][gNazwa], cos, nrkarty, "Los Santos", tekst_global, DaneGracza[playerid][gUID], GrupaInfo[uid][gUID]);
		ZapiszSaldo(uid);
		ZapiszGracza(playerid);
		Transakcja(T_KWB, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, 20, uid, -1, -1, "-", gettime()+KOREKTA_CZASOWA);
		new stri[254];
		format(stri, sizeof(stri), "W³aœnie uda³o ci siê za³o¿yæ konto w banku. \
		\nNumer konta: %d\nNumer karty: %d\nBIC: Los Santos\nIBAN: %s", cos, nrkarty, tekst_global);
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Bank:", stri, "Zamknij", "");
		return 1;
	}
	if(dialogid == DIALOG_SALON_POJAZDOW_KUP)
	{
		if( !response )
	        return 1;
		new uid = strval(inputtext);
		SetPVarInt(playerid, "uidsalon", uid);
		new stri[512];
		format(stri, sizeof(stri), "Czy aby na pewno chcesz kupiæ ten pojazd?\n» {FFFFFF}Pojazd: %s\n» {FFFFFF}Cena: %d$\n» {FFFFFF}Typ: %s\nJeœli jesteœ pewien zakupu wpisz w poni¿sze pole 'potwierdzam' nastêpnie zatwierdz swój wybór.", GetVehicleModelName(HurtowniaInfo[uid][hWar1]), HurtowniaInfo[uid][hCena], TypPojazdow[HurtowniaInfo[uid][hWar2]]);
		dShowPlayerDialog(playerid, DIALOG_SALON_POJAZDOW_KUP_N, DIALOG_STYLE_INPUT, "• Salon Pojazdów:", stri, "Kup", "Odrzuæ");
		
	}
	if(dialogid == DIALOG_ZLOMUJ_KUP)
	{
		if( !response )
	        return 1;
		new uid = strval(inputtext);
		SetPVarInt(playerid, "uidzlom", uid);
		new stri[1024];
		format(stri, sizeof(stri), "Czy aby na pewno chcesz kupiæ ten pojazd z zlomowiska?\n» Pojazd: %s\n» Cena: $%d\n» UID: %d\n» Przebieg: %0.01f\n» Zy¿ycie pojazdu: %0.01f\n» Paliwo: %0.01f\n» HP: %0.01f\nJeœli jesteœ pewien zakupu wpisz w poni¿sze pole 'potwierdzam' nastêpnie zatwierdz swój wybór.", GetVehicleModelName(PojazdInfo[uid][pModel]), PojazdInfo[uid][pMoc], PojazdInfo[uid][pUID], PojazdInfo[uid][pPrzebieg], PojazdInfo[uid][pNaprawy], PojazdInfo[uid][pPaliwo], PojazdInfo[uid][pStan]);
		dShowPlayerDialog(playerid, DIALOG_ZLOMUJ_KUP_N, DIALOG_STYLE_INPUT, "• Zlomowisko:", stri, "Kup", "Odrzuæ");

	}
	if(dialogid == DIALOG_SALON_POJAZDOW_KUP_N)
	{
		if( !response )
	        return 1;
		strtoupper(inputtext);
		new uid = GetPVarInt(playerid, "uidsalon");
		if(ComparisonString(inputtext, "POTWIERDZAM"))
		{
			if(DaneGracza[playerid][gPORTFEL] < HurtowniaInfo[uid][hCena])
			{
			    new stri[512];
				format(stri, sizeof(stri), "Czy aby na pewno chcesz kupiæ ten pojazd?\n» {FFFFFF}Pojazd: %s\n» {FFFFFF}Cena: %d$\n» {FFFFFF}Typ: %s\nJeœli jesteœ pewien zakupu wpisz w poni¿sze pole 'potwierdzam' nastêpnie zatwierdz swój wybór.\nNie posiadasz przy sobie takiej gotówki.", GetVehicleModelName(HurtowniaInfo[uid][hWar1]), HurtowniaInfo[uid][hCena], TypPojazdow[HurtowniaInfo[uid][hWar2]]);
				dShowPlayerDialog(playerid, DIALOG_SALON_POJAZDOW_KUP_N, DIALOG_STYLE_INPUT, "• Salon Pojazdów:", stri, "Kup", "Odrzuæ");
			}
			else
			{
				Dodajkase(playerid, -HurtowniaInfo[uid][hCena]);
				new uids = GetPVarInt(playerid, "uiddrzwi");
				new guid = BudynekInfo[uids][nWlascicielD];
				GrupaInfo[guid][gSaldo] += HurtowniaInfo[uid][hCena]/10/2;
				ZapiszSaldo(guid);
				DodajPrzedmiot(DaneGracza[playerid][gUID], TYP_WLASCICIEL, HurtowniaInfo[uid][hTypP], HurtowniaInfo[uid][hWar1], HurtowniaInfo[uid][hWar2], HurtowniaInfo[uid][hNazwa], DaneGracza[playerid][gUID], 0, -1, HurtowniaInfo[uid][hCena], 0, 0, 0, "");
				new stri[512];
				format(stri, sizeof(stri),  "Gratulujemy nowo zakupionego pojazdu z salonu!\nKluczyki twojego pojazdu znajduj¹ siê w twoim ekwipunku (/p), aktywuj swój pojazd u¿ywaj¹c ich.\nAktywuj¹c ju¿ swój pojazd udaj siê na magazyn pojazdów.");
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:",  stri, "Zamknij", "");
				DeletePVar(playerid,"uidsalon");
			}
		}
		else
		{
			new stri[512];
			format(stri, sizeof(stri), "Czy aby na pewno chcesz kupiæ ten pojazd?\n» {FFFFFF}Pojazd: %s\n» {FFFFFF}Cena: %d$\n» {FFFFFF}Typ: %s\nJeœli jesteœ pewien zakupu wpisz w poni¿sze pole 'potwierdzam' nastêpnie zatwierdz swój wybór.\nTreœæ potwierdzaj¹ca nie jest poprawna.", GetVehicleModelName(HurtowniaInfo[uid][hWar1]), HurtowniaInfo[uid][hCena], TypPojazdow[HurtowniaInfo[uid][hWar2]]);
			dShowPlayerDialog(playerid, DIALOG_SALON_POJAZDOW_KUP_N, DIALOG_STYLE_INPUT, "• Salon Pojazdów:", stri, "Kup", "Odrzuæ");
		}
	}
	if(dialogid == DIALOG_ZLOMUJ_KUP_N)
	{
		if( !response )
	        return 1;
		strtoupper(inputtext);
		new uid = GetPVarInt(playerid, "uidzlom");
		if(ComparisonString(inputtext, "POTWIERDZAM"))
		{
			if(DaneGracza[playerid][gPORTFEL] < PojazdInfo[uid][pMoc])
			{
			    new stri[1024];
				format(stri, sizeof(stri), "Czy aby na pewno chcesz kupiæ ten pojazd z zlomowiska?\n» Pojazd: %s\n» Cena: $%d\n» UID: %d\n» Przebieg: %0.01f\n» Zy¿ycie pojazdu: %0.01f\n» Paliwo: %0.01f\n» HP: %0.01f\nJeœli jesteœ pewien zakupu wpisz w poni¿sze pole 'potwierdzam' nastêpnie zatwierdz swój wybór.", GetVehicleModelName(PojazdInfo[uid][pModel]), PojazdInfo[uid][pMoc], PojazdInfo[uid][pUID], PojazdInfo[uid][pPrzebieg], PojazdInfo[uid][pNaprawy], PojazdInfo[uid][pPaliwo], PojazdInfo[uid][pStan]);
				dShowPlayerDialog(playerid, DIALOG_ZLOMUJ_KUP_N, DIALOG_STYLE_INPUT, "• Zlomowisko:", stri, "Kup", "Odrzuæ");
			}
			else
			{
				Dodajkase(playerid, -PojazdInfo[uid][pMoc]);
				PojazdInfo[uid][pOwnerPostac] = DaneGracza[playerid][gUID];
				PojazdInfo[uid][pOwnerDzialalnosc] = 0;
				if(PojazdInfo[uid][pNaprawy] >= 15000)
				{
					PojazdInfo[uid][pNaprawy] += -7000;
				}
				if(PojazdInfo[uid][pTempomat] != 0)
				{
					PojazdInfo[uid][pTempomat] = 0;
				}
				ZapiszPojazd(uid, 1);
				ZapiszPojazd(uid, 2);
				new stri[512];
				format(stri, sizeof(stri),  "Gratulacje zakupu u¿ywanego pojazdu z z³omowiska, mo¿esz go w ka¿dej chwili u¿yæ znajduje siê on pod komend¹ /v!");
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Zlomowisko:",  stri, "Zamknij", "");
				DeletePVar(playerid,"uidsalon");
			}
		}
		else
		{
			new stri[1024];
			format(stri, sizeof(stri), "Czy aby na pewno chcesz kupiæ ten pojazd z zlomowiska?\n» Pojazd: %s\n» Cena: $%d\n» UID: %d\n» Przebieg: %0.01f\n» Zy¿ycie pojazdu: %0.01f\n» Paliwo: %0.01f\n» HP: %0.01f\nJeœli jesteœ pewien zakupu wpisz w poni¿sze pole 'potwierdzam' nastêpnie zatwierdz swój wybór.", GetVehicleModelName(PojazdInfo[uid][pModel]), PojazdInfo[uid][pMoc], PojazdInfo[uid][pUID], PojazdInfo[uid][pPrzebieg], PojazdInfo[uid][pNaprawy], PojazdInfo[uid][pPaliwo], PojazdInfo[uid][pStan]);
			dShowPlayerDialog(playerid, DIALOG_ZLOMUJ_KUP_N, DIALOG_STYLE_INPUT, "• Zlomowisko:", stri, "Kup", "Odrzuæ");
		}
	}
	if(dialogid == DIALOG_SALON_POJAZDOW)
	{
		if( !response )
	        return 1;
        switch(listitem)
		{
			case 0:
			{
				Salon(playerid, 4, SALON_TANIE);
			}
			case 1:
			{
				Salon(playerid, 4, SALON_POPULARNE_TANIE);
			}
			case 2:
			{
				Salon(playerid, 4, SALON_POPULARNE);
			}
			case 3:
			{
				Salon(playerid, 4, SALON_POPULARNE_LUKSUSOWE);
			}
			case 4:
			{
				Salon(playerid, 4, SALON_SPORT_EXCLUSIVE);
			}
			case 5:
			{
				Salon(playerid, 4, SALON_LODZIE);
			}
			case 6:
			{
				Salon(playerid, 4, SALON_JEDNOSLADY);
			}
			case 7:
			{
				Salon(playerid, 4, SALON_SAMOLOTY_HELI);
			}
			case 8:
			{
				if(!GraczPremium(playerid))
				{
					dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:" ,"Nie posiadasz konta premium.", "Zamknij", "" );
					return 0;
				}
				Salon(playerid, 4, SALON_SPECJALNE);
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_DZIALALNOSCI_OPCJE)
	{
		if( !response )
	        return 1;
  		new nrs = GetPVarInt(playerid, "NRZLISTY");
        switch(listitem)
		{
			case 0:
			{
			    if(nrs == 1)
			    {
	       			cmd_duty(playerid, "1");
	       			return 1;
       			}
       			else if(nrs == 2)
			    {
	       			cmd_duty(playerid, "2");
	       			return 1;
       			}
       			else if(nrs == 3)
			    {
	       			cmd_duty(playerid, "3");
	       			return 1;
       			}
       			else if(nrs == 4)
			    {
	       			cmd_duty(playerid, "4");
	       			return 1;
       			}
       			else if(nrs == 5)
			    {
	       			cmd_duty(playerid, "5");
	       			return 1;
       			}
       			else if(nrs == 6)
			    {
	       			cmd_duty(playerid, "6");
	       			return 1;
       			}
				return 1;
			}
			case 1:
			{
			    new stri[256], strin[256];
			    if(nrs == 1)
			    {
			        new uid = DaneGracza[playerid][gDzialalnosc1];
                    format(stri, sizeof(stri), "UID:\t\t\t\t%d\nSlot:\t\t\t\t%d\nBud¿et grupy:\t\t\t$%d\nTyp grupy:\t\t\t%s\nW³aœciciel:\t\t\t%s\n\n1\t{%s}Kolor czatu OOC\n\n1\t{%s}Kolor nicków",GrupaInfo[uid][gUID], 1, GrupaInfo[uid][gSaldo], NazwyDzialalnosci[GrupaInfo[uid][gTyp]], NickGraczaGlobalSQL(GrupaInfo[uid][gOwner]), GrupaInfo[uid][gKolorCzatu], GrupaInfo[uid][gKolorNicku]);
					format(strin, sizeof(strin), "• %s:",GrupaInfo[uid][gNazwa]);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, strin, stri, "Zamknij", "");
			    }
			    else if(nrs == 2)
			    {
                    new uid = DaneGracza[playerid][gDzialalnosc2];
                    format(stri, sizeof(stri), "UID:\t\t\t\t%d\nSlot:\t\t\t\t%d\nBud¿et grupy:\t\t\t$%d\nTyp grupy:\t\t\t%s\nW³aœciciel:\t\t\t%s\n\n1\t{%s}Kolor czatu OOC\n\n1\t{%s}Kolor nicków",GrupaInfo[uid][gUID], 2, GrupaInfo[uid][gSaldo], NazwyDzialalnosci[GrupaInfo[uid][gTyp]], NickGraczaGlobalSQL(GrupaInfo[uid][gOwner]), GrupaInfo[uid][gKolorCzatu], GrupaInfo[uid][gKolorNicku]);
					format(strin, sizeof(strin), "• %s:",GrupaInfo[uid][gNazwa]);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, strin, stri, "Zamknij", "");
			    }
			    else if(nrs == 3)
			    {
                    new uid = DaneGracza[playerid][gDzialalnosc3];
					format(stri, sizeof(stri), "UID:\t\t\t\t%d\nSlot:\t\t\t\t%d\nBud¿et grupy:\t\t\t$%d\nTyp grupy:\t\t\t%s\nW³aœciciel:\t\t\t%s\n\n1\t{%s}Kolor czatu OOC\n\n1\t{%s}Kolor nicków",GrupaInfo[uid][gUID], 3, GrupaInfo[uid][gSaldo], NazwyDzialalnosci[GrupaInfo[uid][gTyp]], NickGraczaGlobalSQL(GrupaInfo[uid][gOwner]), GrupaInfo[uid][gKolorCzatu], GrupaInfo[uid][gKolorNicku]);
					format(strin, sizeof(strin), "• %s:",GrupaInfo[uid][gNazwa]);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, strin, stri, "Zamknij", "");
			    }
			    else if(nrs == 4)
			    {
                    new uid = DaneGracza[playerid][gDzialalnosc4];
                    format(stri, sizeof(stri), "UID:\t\t\t\t%d\nSlot:\t\t\t\t%d\nBud¿et grupy:\t\t\t$%d\nTyp grupy:\t\t\t%s\nW³aœciciel:\t\t\t%s\n\n1\t{%s}Kolor czatu OOC\n\n1\t{%s}Kolor nicków",GrupaInfo[uid][gUID], 4, GrupaInfo[uid][gSaldo], NazwyDzialalnosci[GrupaInfo[uid][gTyp]], NickGraczaGlobalSQL(GrupaInfo[uid][gOwner]), GrupaInfo[uid][gKolorCzatu], GrupaInfo[uid][gKolorNicku]);
					format(strin, sizeof(strin), "• %s:",GrupaInfo[uid][gNazwa]);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, strin, stri, "Zamknij", "");
			    }
			    else if(nrs == 5)
			    {
			        new uid = DaneGracza[playerid][gDzialalnosc5];
                    format(stri, sizeof(stri), "UID:\t\t\t\t%d\nSlot:\t\t\t\t%d\nBud¿et grupy:\t\t\t$%d\nTyp grupy:\t\t\t%s\nW³aœciciel:\t\t\t%s\n\n1\t{%s}Kolor czatu OOC\n\n1\t{%s}Kolor nicków",GrupaInfo[uid][gUID], 5, GrupaInfo[uid][gSaldo], NazwyDzialalnosci[GrupaInfo[uid][gTyp]], NickGraczaGlobalSQL(GrupaInfo[uid][gOwner]), GrupaInfo[uid][gKolorCzatu], GrupaInfo[uid][gKolorNicku]);
					format(strin, sizeof(strin), "• %s:",GrupaInfo[uid][gNazwa]);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, strin, stri, "Zamknij", "");
			    }
			    else if(nrs == 6)
			    {
			        new uid = DaneGracza[playerid][gDzialalnosc6];
			        format(stri, sizeof(stri), "UID:\t\t\t\t%d\nSlot:\t\t\t\t%d\nBud¿et grupy:\t\t\t$%d\nTyp grupy:\t\t\t%s\nW³aœciciel:\t\t\t%s\n\n1\t{%s}Kolor czatu OOC\n\n1\t{%s}Kolor nicków",GrupaInfo[uid][gUID], 6, GrupaInfo[uid][gSaldo], NazwyDzialalnosci[GrupaInfo[uid][gTyp]], NickGraczaGlobalSQL(GrupaInfo[uid][gOwner]), GrupaInfo[uid][gKolorCzatu], GrupaInfo[uid][gKolorNicku]);
					format(strin, sizeof(strin), "• %s:",GrupaInfo[uid][gNazwa]);
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, strin, stri, "Zamknij", "");
				}
				return 1;
			}
			case 2:
			{
			    if(nrs == 1)
			    {
			    	Magazyn(playerid, DIALOG_MAGAZYNG, "• Grupa » Magazyn:", TYP_MAGAZYN, DaneGracza[playerid][gDzialalnosc1], "Wyci¹gnij", "Zamknij");
				}
				else if(nrs == 2)
			    {
			    	Magazyn(playerid, DIALOG_MAGAZYNG, "• Grupa » Magazyn:", TYP_MAGAZYN, DaneGracza[playerid][gDzialalnosc2], "Wyci¹gnij", "Zamknij");
				}
				else if(nrs == 3)
			    {
			    	Magazyn(playerid, DIALOG_MAGAZYNG, "• Grupa » Magazyn:", TYP_MAGAZYN, DaneGracza[playerid][gDzialalnosc3], "Wyci¹gnij", "Zamknij");
				}
				else if(nrs == 4)
			    {
			    	Magazyn(playerid, DIALOG_MAGAZYNG, "• Grupa » Magazyn:", TYP_MAGAZYN, DaneGracza[playerid][gDzialalnosc4], "Wyci¹gnij", "Zamknij");
				}
				else if(nrs == 5)
			    {
			    	Magazyn(playerid, DIALOG_MAGAZYNG, "• Grupa » Magazyn:", TYP_MAGAZYN, DaneGracza[playerid][gDzialalnosc5], "Wyci¹gnij", "Zamknij");
				}
				else if(nrs == 6)
			    {
			    	Magazyn(playerid, DIALOG_MAGAZYNG, "• Grupa » Magazyn:", TYP_MAGAZYN, DaneGracza[playerid][gDzialalnosc6], "Wyci¹gnij", "Zamknij");
				}
				return 1;
			}
			case 3:
			{
			    if(nrs == 1)
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
									format(str, sizeof(str), "%s\n[ID: %d]\t%s", str, i, ImieGracza2(i));
								}
							}
						}
					}
					if(temp == 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Brak pracowników na s³u¿bie.", "Zamknij", "");
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Lista pracowników online:", str, "Zamknij", "");
					return 1;
				}
				else if(nrs == 2)
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
									format(str, sizeof(str), "%s\n[ID: %d]\t%s", str, i, ImieGracza2(i));
								}
							}
						}
					}
					if(temp == 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Brak pracowników na s³u¿bie.", "Zamknij", "");
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Lista pracowników online:", str, "Zamknij", "");
					return 1;
				}
				else if(nrs == 3)
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
									format(str, sizeof(str), "%s\n[ID: %d]\t%s", str, i, ImieGracza2(i));
								}
							}
						}
					}
					if(temp == 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Brak pracowników na s³u¿bie.", "Zamknij", "");
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Lista pracowników online:", str, "Zamknij", "");
					return 1;
				}
				else if(nrs == 4)
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
									format(str, sizeof(str), "%s\n[ID: %d]\t%s", str, i, ImieGracza2(i));
								}
							}
						}
					}
					if(temp == 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Brak pracowników na s³u¿bie.", "Zamknij", "");
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Lista pracowników online:", str, "Zamknij", "");
					return 1;
				}
				else if(nrs == 5)
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
									format(str, sizeof(str), "%s\n[ID: %d]\t%s", str, i, ImieGracza2(i));
								}
							}
						}
					}
					if(temp == 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Brak pracowników na s³u¿bie.", "Zamknij", "");
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Lista pracowników online:", str, "Zamknij", "");
					return 1;
				}
				else if(nrs == 6)
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
									format(str, sizeof(str), "%s\n[ID: %d]\t%s", str, i, ImieGracza2(i));
								}
							}
						}
					}
					if(temp == 0) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Brak pracowników na s³u¿bie.", "Zamknij", "");
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Lista pracowników online:", str, "Zamknij", "");
					return 1;
				}
				return 1;
			}
			case 4:
			{
				//new	list_vehicles[512], find = 0;
				if(nrs == 1)
				{
					cmd_g(playerid, "1 v");
				}
				else if(nrs == 2)
				{
					cmd_g(playerid, "2 v");
				}
				else if(nrs == 3)
				{
					cmd_g(playerid, "3 v");
				}
				else if(nrs == 4)
				{
					cmd_g(playerid, "4 v");
				}
				else if(nrs == 5)
				{
					cmd_g(playerid, "5 v");
				}
				else if(nrs == 6)
				{
					cmd_g(playerid, "6 v");
				}
				return 1;
			}
		}
	}
	if(dialogid == DIALOG_POKER_ZETONY)
	{
		if(!response)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Anulowa³eœ zakup ¿etonów bez których nie mo¿esz rozpocz¹æ gry.", "Zamknij", "");
			new id_pokera = DaneGracza[playerid][gPoker];
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[id_pokera][objPoker][i] == playerid)
				{
					ObiektInfo[id_pokera][objPoker][i] = -1;
					DaneGracza[playerid][gPoker] = 0;
					DaneGracza[playerid][gPokerStanowisko] = 0;
					break;
				}
			}
			Frezuj(playerid,1);
			SetCameraBehindPlayer(playerid);
			WpisalKase[playerid] = 0;
			GraWPokera[playerid] = 0;
			return 0;
		}
		else
		{
			new kasa_na_zetony = strval(inputtext);
			if(kasa_na_zetony < 100)
			{
				dShowPlayerDialog(playerid, DIALOG_POKER_ZETONY, DIALOG_STYLE_INPUT, "• Informacja:", "W³asnie do³¹czy³eœ do gry w pokera, w poni¿sze pole wpisz kwotê jaka ma byæ przeznaczona na zakup ¿etonów.\n100$ to 1000$ w ¿etonach, maksymalna iloœæ 2000$.\nZnalezione B³êdy: Zbyt ma³a kwota wp³aty.", "Zatwierdz", "Zamknij");
				return 0;
			}
			else if(kasa_na_zetony > 2000)
			{
				dShowPlayerDialog(playerid, DIALOG_POKER_ZETONY, DIALOG_STYLE_INPUT, "• Informacja:", "W³asnie do³¹czy³eœ do gry w pokera, w poni¿sze pole wpisz kwotê jaka ma byæ przeznaczona na zakup ¿etonów.\n100$ to 1000$ w ¿etonach, maksymalna iloœæ 2000$.\nZnalezione B³êdy: Zbyt du¿a kwota wp³aty.", "Zatwierdz", "Zamknij");
				return 0;
			}
			else if(DaneGracza[playerid][gPORTFEL] < kasa_na_zetony)
			{
				dShowPlayerDialog(playerid, DIALOG_POKER_ZETONY, DIALOG_STYLE_INPUT, "• Informacja:", "W³asnie do³¹czy³eœ do gry w pokera, w poni¿sze pole wpisz kwotê jaka ma byæ przeznaczona na zakup ¿etonów.\n100$ to 1000$ w ¿etonach, maksymalna iloœæ 2000$.\nZnalezione B³êdy: Nie posiadasz tyle pieniêdzy.", "Zatwierdz", "Zamknij");
				return 0;
			}
			else
			{
				GraWPokera[playerid] = 1;
				WpisalKase[playerid] = 0;
				new id_pokera = DaneGracza[playerid][gPoker];
				DaneGracza[playerid][gPokerZetony] = kasa_na_zetony*10;
				Dodajkase(playerid, -kasa_na_zetony);
				PrzeliczZetony(playerid, id_pokera, 0, 0);
				for(new i = 0; i < 6; i++)
				{
					Streamer_Update(ObiektInfo[id_pokera][objPoker][i]);
				}
				RozpocznijPokera(playerid, id_pokera);
			}
		}
	}
	if(dialogid == DIALOG_POKER_PRZEBIJ)
	{
		if(!response)
		{
			if(WybralMozliwoscPoker[playerid] != 0)
			{
				SelectTextDraw(playerid, 0xFFFFFFFF);
			}
			return 0;
		}
		else
		{
			new kwota = strval(inputtext);
			if(kwota < 10)
			{
				dShowPlayerDialog(playerid, DIALOG_POKER_PRZEBIJ, DIALOG_STYLE_INPUT, "• Informacja:", "Wpisz kwotê któr¹ chcesz przebiæ zak³ad.\nZnalezione B³êdy: Zbyt ma³a kwota przebicia.", "Zatwierdz", "Zamknij");
				return 0;
			}
			else if(kwota > DaneGracza[playerid][gPokerZetony])
			{
				dShowPlayerDialog(playerid, DIALOG_POKER_PRZEBIJ, DIALOG_STYLE_INPUT, "• Informacja:", "Wpisz kwotê któr¹ chcesz przebiæ zak³ad.\nZnalezione B³êdy: Kwota przebicia jest wieksza niz posiadane ¿etony..", "Zatwierdz", "Zamknij");
				return 0;
			}
			new roznica = ObiektInfo[DaneGracza[playerid][gPoker]][gPokerInfo][13] - DaneGracza[playerid][gPokerPostawione];
			if(roznica >= (kwota+10))
			{
				dShowPlayerDialog(playerid, DIALOG_POKER_PRZEBIJ, DIALOG_STYLE_INPUT, "• Informacja:", "Wpisz kwotê któr¹ chcesz przebiæ zak³ad.\nZnalezione B³êdy: Kwota przebicia jest mniejsza ni¿ zak³ad do wyrównania..", "Zatwierdz", "Zamknij");
				return 0;
			}
			else
			{
				WybralMozliwoscPoker[playerid] = 0;
				PlayerTextDrawHide(playerid,Poker2[playerid]);
				PlayerTextDrawHide(playerid,Poker3[playerid]);
				PlayerTextDrawHide(playerid,Poker4[playerid]);
				PlayerTextDrawHide(playerid,Poker5[playerid]);
				PlayerTextDrawHide(playerid,Poker6[playerid]);
				DaneGracza[playerid][gPokerPostawione] += kwota;
				ObiektInfo[DaneGracza[playerid][gPoker]][gPokerInfo][13] = DaneGracza[playerid][gPokerPostawione];
				DaneGracza[playerid][gPokerZetony] -= kwota;
				ObiektInfo[DaneGracza[playerid][gPoker]][gPokerInfo][1] += kwota;
				new ilosc_nie_all = SprawdzNieAllinow(DaneGracza[playerid][gPoker]);
				if(ilosc_nie_all < 2)
				{
					ObiektInfo[DaneGracza[playerid][gPoker]][gPokerInfo][14] = playerid;
				}
				else
				{
					new poprzedni = SprawdzPoprzedniego(DaneGracza[playerid][gPokerStanowisko]);
					new poprzedni2 = DaneGracza[playerid][gPokerStanowisko];
					for(new i = 0; i < 6; i++)
					{
						if(ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][poprzedni] == -1 || DaneGracza[ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][poprzedni]][gInformacjePoker][0] == 1)
						{
							switch(poprzedni2)
							{
								case 0:{
									poprzedni2 = 2;
								}
								case 1:{
									poprzedni2 = 3;
								}
								case 2:{
									poprzedni2 = 5;
								}
								case 3:{
									poprzedni2 = 4;
								}
								case 4:{
									poprzedni2 = 0;
								}
								case 5:{
									poprzedni2 = 1;
								}
							}
							poprzedni = SprawdzPoprzedniego(poprzedni2);
						}
					}
					ObiektInfo[DaneGracza[playerid][gPoker]][gPokerInfo][14] = ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][poprzedni];
				}
				new kasa[128];
				if(DaneGracza[playerid][gPokerZetony] == 0)
				{
					DaneGracza[playerid][gInformacjePoker][0] = 1;
					format(kasa, sizeof(kasa), "All-in ~r~($%d)", kwota);
				}
				else if(roznica > 0)
				{
					format(kasa, sizeof(kasa), "Przebija ~r~$%d", kwota);
				}
				else
				{
					format(kasa, sizeof(kasa), "Stawia ~r~$%d", kwota);
				}
				NadajTextTextdraw(playerid, DaneGracza[playerid][gPoker], kasa);
				for(new i = 0; i < 30; i++)
				{
					if(DaneGracza[playerid][gPokerObj][i] != 0)
					{
						DestroyDynamicObject(DaneGracza[playerid][gPokerObj][i]);
						DaneGracza[playerid][gPokerObj][i] = 0;
					}
				}
				for(new i = 0; i < 30; i++)
				{
					if(DaneGracza[playerid][gNumeryObiektowPostawionych][i] != 0)
					{
						DestroyDynamicObject(DaneGracza[playerid][gNumeryObiektowPostawionych][i]);
						DaneGracza[playerid][gNumeryObiektowPostawionych][i] = 0;
					}
				}
				PrzeliczZetony(playerid, DaneGracza[playerid][gPoker], 0, 0);
				PrzeliczZetony(playerid, DaneGracza[playerid][gPoker], DaneGracza[playerid][gPokerPostawione], 5);
			}
			OdswiezTexdrawyPoker(DaneGracza[playerid][gPoker], 0);
			new ilosc = SprawdzIloscGraczy(DaneGracza[playerid][gPoker]);
			if(ilosc >= 2)
			{
				SprawdzKolejGracza(playerid);
			}
			else
			{
				KoniecRundy(DaneGracza[playerid][gPoker]);
			}
		}
	}
	if(dialogid == DIALOG_POKER_OPUSC)
	{
		if(!response)
		{
			if(WpisalKase[playerid] == 0)
			{
				SelectTextDraw(playerid, 0xFFFFFFFF);
			}
			return 0;
		}
		else
		{
			WybralMozliwoscPoker[playerid] = 0;
			GraWPokera[playerid] = 0;
			WpisalKase[playerid] = 0;
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "W³asnie opuœci³eœ stolik, twoje ¿etony zosta³y zamienione na prawdziwe pieni¹dze.", "Zamknij", "");
			if(DaneGracza[playerid][gPokerZetony] != -1)
			{
				new kasa = DaneGracza[playerid][gPokerZetony] / 10;
				Dodajkase(playerid, kasa);
				DaneGracza[playerid][gPokerZetony] = -1;
			}
			new id_pokera = DaneGracza[playerid][gPoker];
			for(new i = 0; i < 30; i++)
			{
				if(DaneGracza[playerid][gPokerObj][i] != 0)
				{
					DestroyDynamicObject(DaneGracza[playerid][gPokerObj][i]);
					DaneGracza[playerid][gPokerObj][i] = 0;
					DaneGracza[playerid][gNumeryObiektowPostawionych][i] = 0;
				}
			}
			CancelSelectTextDraw(playerid);
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[id_pokera][objPoker][i] != -1)
				{
					UsunBaryGracz(ObiektInfo[id_pokera][objPoker][i]);
				}
			}
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[id_pokera][objPoker][i] == playerid)
				{
					ObiektInfo[id_pokera][gAktualniGracze][i] = -1;
					break;
				}
			}
			new ilosc_oczekujacych_graczy = 0;
			if(DaneGracza[playerid][gRundaPokerCzas] != 0)
			{
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[id_pokera][objPoker][i] != -1 && DaneGracza[ObiektInfo[id_pokera][objPoker][i]][gRundaPokerCzas] != 0)
					{
						ilosc_oczekujacych_graczy++;
					}
				}
				DaneGracza[playerid][gRundaPokerCzas] = 0;
				if(ilosc_oczekujacych_graczy < 2)
				{
					for(new i = 0; i < 6; i++)
					{
						if(ObiektInfo[id_pokera][objPoker][i] != -1)
						{
							DaneGracza[ObiektInfo[id_pokera][objPoker][i]][gRundaPokerCzas] = 0;
							RozpocznijPokera(ObiektInfo[id_pokera][objPoker][i], DaneGracza[ObiektInfo[id_pokera][objPoker][i]][gPoker]);
						}
					}
				}
			}	
			OdswiezTexdrawyPoker(id_pokera, 0);
			new ilosc = SprawdzIloscGraczy(id_pokera);
			if(ilosc >= 2)
			{
				SprawdzKolejGracza(playerid);
			}
			else
			{
				KoniecRundy(id_pokera);
			}
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[id_pokera][objPoker][i] == playerid)
				{
					ObiektInfo[id_pokera][objPoker][i] = -1;
					DaneGracza[playerid][gPoker] = 0;
					DaneGracza[playerid][gPokerStanowisko] = -1;
					DaneGracza[playerid][gPokerPostawione] = 0;
					DaneGracza[playerid][gPokerKarty][0] = 0;
					DaneGracza[playerid][gPokerKarty][1] = 0;
					DaneGracza[playerid][gInformacjePoker][0] = 0;
					DaneGracza[playerid][gInformacjePoker][1] = 0;
					DaneGracza[playerid][gInformacjePoker][2] = 0;
					DaneGracza[playerid][gInformacjePoker][3] = 0;
					DaneGracza[playerid][gInformacjePoker][4] = 0;
					DaneGracza[playerid][gInformacjePoker][5] = 0;
					DaneGracza[playerid][gInformacjePoker][6] = 0;
					break;
				}
			}
			PlayerTextDrawHide(playerid,KartyGracza[playerid]);
			PlayerTextDrawHide(playerid,KartyGracza1[playerid]);
			PlayerTextDrawHide(playerid,KartyGracza11[playerid]);
			PlayerTextDrawHide(playerid,KartyGracza2[playerid]);
			PlayerTextDrawHide(playerid,KartyGracza22[playerid]);
			PlayerTextDrawHide(playerid,KartyGracza3[playerid]);
			PlayerTextDrawHide(playerid,KartyGracza33[playerid]);
			PlayerTextDrawHide(playerid,KartyGracza4[playerid]);
			PlayerTextDrawHide(playerid,KartyGracza44[playerid]);
			PlayerTextDrawHide(playerid,KartyGracza5[playerid]);
			PlayerTextDrawHide(playerid,KartyGracza55[playerid]);
			PlayerTextDrawHide(playerid,KartyGracza6[playerid]);
			PlayerTextDrawHide(playerid,KartyGracza66[playerid]);
			PlayerTextDrawHide(playerid,Poker1[playerid]);
			PlayerTextDrawHide(playerid,Poker2[playerid]);
			PlayerTextDrawHide(playerid,Poker3[playerid]);
			PlayerTextDrawHide(playerid,Poker4[playerid]);
			PlayerTextDrawHide(playerid,Poker5[playerid]);
			PlayerTextDrawHide(playerid,Poker6[playerid]);
			PlayerTextDrawHide(playerid,KartaGracza1[playerid]);
			PlayerTextDrawHide(playerid,KartaGracza2[playerid]);
			PlayerTextDrawHide(playerid,KartaGracza3[playerid]);
			PlayerTextDrawHide(playerid,KartaGracza4[playerid]);
			PlayerTextDrawHide(playerid,KartaGracza5[playerid]);
			PlayerTextDrawHide(playerid,KartaGracza6[playerid]);
			PlayerTextDrawHide(playerid,KartaGracza7[playerid]);
			PlayerTextDrawHide(playerid,KartaGracza8[playerid]);
			PlayerTextDrawHide(playerid,KartaGracza9[playerid]);
			PlayerTextDrawHide(playerid,KartaGracza10[playerid]);
			PlayerTextDrawHide(playerid,KartaGracza11[playerid]);
			PlayerTextDrawHide(playerid,KartaGracza12[playerid]);
			PlayerTextDrawHide(playerid,KartaGracza13[playerid]);
			PlayerTextDrawHide(playerid,KartaGracza14[playerid]);
			PlayerTextDrawHide(playerid,WylosowaneKarty[playerid]);
			PlayerTextDrawHide(playerid,WylosowaneKarty1[playerid]);
			PlayerTextDrawHide(playerid,WylosowaneKarty2[playerid]);
			PlayerTextDrawHide(playerid,WylosowaneKarty3[playerid]);
			PlayerTextDrawHide(playerid,WylosowaneKarty4[playerid]);
			PlayerTextDrawHide(playerid,WylosowaneKarty5[playerid]);
			Frezuj(playerid,1);
			SetCameraBehindPlayer(playerid);
			return 0;
		}
	}
	if(dialogid == DIALOG_BUDKA)
	{
		if(!response)
		{
			ObiektInfo[UzywaBudkiUID[playerid]][objPoker][0] = 0;
		}
		else
		{
			if(listitem > 3)
			{
				ObiektInfo[UzywaBudkiUID[playerid]][objPoker][0] = 0;
				DeletePVar(playerid,"uidbudka");
			}
			switch(listitem)
			{
				case 0:
				{
					ObiektInfo[UzywaBudkiUID[playerid]][objPoker][0] = 0;
					DeletePVar(playerid,"uidbudka");
				}
				case 1:
				{
					new find = 0, budka_lista[512];
					ForeachEx(i, MAX_GROUP)
					{
						if(GrupaInfo[i][gUID] != 0)
						{
							if(GrupaInfo[i][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[i][gTyp] == DZIALALNOSC_SANNEWS || GrupaInfo[i][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[i][gTyp] == DZIALALNOSC_RZADOWA)
							{
								new findduty = 0;
								ForeachEx(playeridg, MAX_PLAYERS)
								{
									if(IsPlayerConnected(playeridg))
									{
										if(zalogowany[playeridg] == true)
										{
											if(DaneGracza[playeridg][gSluzba] == GrupaInfo[i][gUID])
											{
												findduty++;
											}
										}
									}
								}
								if(findduty != 0)
								{
									format(budka_lista, sizeof(budka_lista), "%s\n%d\t»  %s (Osoby na s³u¿bie: %d)", budka_lista, GrupaInfo[i][gUID], GrupaInfo[i][gNazwa], findduty);
									find++;
								}
							}
						}
					}
					if(find != 0)
					{
						dShowPlayerDialog(playerid, DIALOG_BUDKA_SL, DIALOG_STYLE_LIST, "• Budka telefoniczna:", budka_lista, "Wybierz", "Zamknij");
					}
					else
					{
						ObiektInfo[UzywaBudkiUID[playerid]][objPoker][0] = 0;
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Budka telefoniczna:", "Aktualnie nie ma s³u¿b porz¹dkowych na s³u¿bie.", "Wybierz", "Zamknij");
					}
				}
				case 2:
				{
					new find = 0, budka_lista[1024];
					ForeachEx(i, MAX_GROUP)
					{
						if(GrupaInfo[i][gUID] != 0)
						{
							if(GrupaInfo[i][gTyp] != DZIALALNOSC_SANNEWS && GrupaInfo[i][gTyp] != DZIALALNOSC_POLICYJNA && GrupaInfo[i][gTyp] != DZIALALNOSC_ZMOTORYZOWANA && GrupaInfo[i][gTyp] != DZIALALNOSC_MAFIE && GrupaInfo[i][gTyp] != DZIALALNOSC_RODZINKA && GrupaInfo[i][gTyp] != DZIALALNOSC_MEDYCZNA && GrupaInfo[i][gTyp] != DZIALALNOSC_GANGI && GrupaInfo[i][gTyp] != DZIALALNOSC_RZADOWA)
							{
								new findduty = 0;
								ForeachEx(playeridg, MAX_PLAYERS)
								{
									if(IsPlayerConnected(playeridg))
									{
										if(zalogowany[playeridg] == true)
										{
											if(DaneGracza[playeridg][gSluzba] == GrupaInfo[i][gUID])
											{
												findduty++;
											}
										}
									}
								}
								if(findduty != 0)
								{
									format(budka_lista, sizeof(budka_lista), "%s\n%d\t»  %s (Osoby na s³u¿bie: %d)", budka_lista, GrupaInfo[i][gUID], GrupaInfo[i][gNazwa], findduty);
									find++;
								}
							}
						}
					}
					if(find != 0)
					{
						dShowPlayerDialog(playerid, DIALOG_BUDKA_SL, DIALOG_STYLE_LIST, "• Budka telefoniczna:", budka_lista, "Wybierz", "Zamknij");
					}
					else
					{
						ObiektInfo[UzywaBudkiUID[playerid]][objPoker][0] = 0;
						dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Budka telefoniczna:", "Aktualnie nie ma ¿adnych Grup na s³u¿bie.", "Wybierz", "Zamknij");
					}
				}
				case 3:
				{
					ObiektInfo[UzywaBudkiUID[playerid]][objPoker][0] = 0;
					DeletePVar(playerid,"uidbudka");
					//dShowPlayerDialog(playerid, DIALOG_BUDKA_DZWON_KAL, DIALOG_STYLE_INPUT, "• Budka telefoniczna:", "Podaj numer, do którego chcesz siê dodzwoniæ.", "Zadzwoñ", "Zamknij");
				}
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_BUDKA_DZWON_KAL)
	{
		if(!response)
		{
			ObiektInfo[UzywaBudkiUID[playerid]][objPoker][0] = 0;
			DeletePVar(playerid,"uidbudka");
		}
		else
		{
			if(strval(inputtext) > 10000)
			{	
				new a = 0;
				new uid = strval(inputtext);
				if(uid == DaneGracza[playerid][gTelefon])
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Telefon:", "Nie ma takiego numeru.", "Zamknij", "");
				    return 0;
				}
				ForeachEx(id, MAX_PLAYERS)
				{
					if(IsPlayerConnected(id))
					{
						if(zalogowany[id] == true)
						{
							if(DaneGracza[id][gTelefon] == uid && zalogowany[id] == true)
							{
								if(Dzwoni[id] == 1)
								{
									cmd_do(playerid, "Sygna³ zajêtoœci...");
									a++;
									ObiektInfo[UzywaBudkiUID[playerid]][objPoker][0] = 0;
									DeletePVar(playerid,"uidbudka");
									break;
								}
								else
								{
									TextDrawHideForPlayer(id, TextNaDrzwi[id]);
									cmd_do(id, "Dzwoni telefon");
									new str[256];
									format(str, sizeof(str), "~w~Ktos do Ciebie dzwoni!~n~Numer: %d(Budka)~n~~n~~y~Uzyj telefonu,~n~by odebrac lub odrzucic~n~polaczenie.",UzywaBudkiUID[playerid]);
									TextDrawSetString(TextNaDrzwi2[id], str);
									TextDrawShowForPlayer(id, TextNaDrzwi2[id]);
									Dzwoni[id] = -1;
									DzwoniID[id] = playerid;
									DzwoniID[playerid] = id;
									Dzwoni[playerid] = 1;
									dzwon[playerid] = SetTimerEx("Dzwonie", 10000, 0, "i", playerid);
									new str2[256];
									format(str2, sizeof(str2), "~w~Budka Telefoniczna!~n~Numer: %d",DaneGracza[id][gTelefon]);
									TextDrawSetString(TextNaDrzwi2[playerid], str2);
									TextDrawShowForPlayer(playerid, TextNaDrzwi2[playerid]);
									a++;
									break;
								}
							}
						}
					}
				}
				if(a == 0)
				{
					cmd_do(playerid, "Brak sygna³u...");
					ObiektInfo[UzywaBudkiUID[playerid]][objPoker][0] = 0;
					DeletePVar(playerid,"uidbudka");
				}
			}
			else
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Podany numer jest nieprawid³owy.", "Zamknij", "");
				ObiektInfo[UzywaBudkiUID[playerid]][objPoker][0] = 0;
				DeletePVar(playerid,"uidbudka");
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_BUDKA_SL)
	{
		if(!response)
		{
			ObiektInfo[UzywaBudkiUID[playerid]][objPoker][0] = 0;
		}
		else
		{
			SetPVarInt(playerid, "uidbudka", strval(inputtext));
			if(DaneGracza[playerid][gPORTFEL] < 10)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Budka telefoniczna:", "Nie masz wystarczaj¹cej iloœæi pieniêdzy aby wykonaæ to po³¹czenie.", "Wybierz", "Zamknij");
				return 0;
			}
			else
			{
				dShowPlayerDialog(playerid, DIALOG_BUDKA_SL_ZG, DIALOG_STYLE_INPUT, "• Informacja:", "Podaj treœæ zg³oszenia nastêpnie zatwierdz wiadomoœæ.", "Zatwierdz", "Zamknij");
			}
		}
		return 1;
	}
	if(dialogid == 8851)
	{
	    SelectTextDraw(playerid, 0x00AAFFFF);
	    return 1;
	}
	if(dialogid == 8850)
	{
	    new str[64];
		if(!response) return SelectTextDraw(playerid, 0x00AAFFFF);

		if(!IsNumerich(inputtext) || strval(inputtext) < 1)
			return ShowPlayerDialog(playerid, 8850, DIALOG_STYLE_INPUT, "{FF0000}Vegas Game", "{FF0000}Podana kwota jest nieprawid³owa!{FFFFFF}\n\nWprowadŸ kwotê, któr¹ chcesz wp³aciæ:", "Wp³aæ", "Anuluj");

		if(strval(inputtext) > GetPlayerMoney(playerid))
			return ShowPlayerDialog(playerid, 8850, DIALOG_STYLE_INPUT, "{FF0000}Vegas Game", "{FF0000}Nie masz tyle pieniêdzy!{FFFFFF}\n\nWprowadŸ kwotê, któr¹ chcesz wp³aciæ:", "Wp³aæ", "Anuluj");

		if(strval(inputtext) < 10)
			return ShowPlayerDialog(playerid, 8850, DIALOG_STYLE_INPUT, "{FF0000}Vegas Game", "{FF0000}Minimalna wp³ata to 10$!{FFFFFF}\n\nWprowadŸ kwotê, któr¹ chcesz wp³aciæ:", "Wp³aæ", "Anuluj");


		SetPVarInt(playerid, "Vegas_Bank", GetPVarInt(playerid, "Vegas_Bank") + strval(inputtext));
		format(str, sizeof str, "Bank:~n~$%d", GetPVarInt(playerid, "Vegas_Bank"));
		TextDrawSetString(Vegas_Player[playerid][1], str);
		Dodajkase(playerid, strval(inputtext) * -1);
		SelectTextDraw(playerid, 0x00AAFFFF);
		return 1;
	}
	if(dialogid == DIALOG_BUDKA_SL_ZG)
	{
		if(!response)
		{
			ObiektInfo[UzywaBudkiUID[playerid]][objPoker][0] = 0;
			DeletePVar(playerid,"uidbudka");
		}
		else
		{
			if(strlen(inputtext) < 3)
			{
				dShowPlayerDialog(playerid, DIALOG_BUDKA_SL_ZG, DIALOG_STYLE_INPUT, "• Informacja:", "Podaj treœæ zg³oszenia nastêpnie zatwierdz wiadomoœæ.", "Zatwierdz", "Zamknij");
				return 0;
			}
			ForeachEx(i, MAX_PLAYERS)
			{
			    if(IsPlayerConnected(i))
			    {
				    if(zalogowany[i] == true)
					{
						if(DaneGracza[i][gSluzba]  == GetPVarInt(playerid, "uidbudka"))
						{
							SendClientMessage(i, SZARY, "Centrala - Wp³ynê³o nowe zg³oszenie!");
						}
					}
				}
			}
			//911 zg³oszenie
			new Float:x, Float:y, Float: z;
			GetPlayerPos(playerid, x, y ,z);
			new astr[512];
			format(astr, sizeof(astr), "INSERT INTO `jochym_zgloszenia` (`UID`, `NUMER`, `NICK`, `X`, `Y`, `Z`, `TRESC`, `ODEBRAL`, `ZAKONCZONE`) VALUES ('%d', '%d', '%s', '%f', '%f', '%f', '%s', '%d', '%d')"
			, DaneGracza[playerid][gUID], 0, "Budka telefoniczna (Anonimowe)", x, y, z, inputtext, 0, 0);
			mysql_check();
			mysql_query2(astr);
			mysql_free_result();
			ObiektInfo[UzywaBudkiUID[playerid]][objPoker][0] = 0;
			DeletePVar(playerid,"uidbudka");
			Dodajkase(playerid, -10);
			ZapiszGracza(playerid);
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Informacja:", "Zg³oszenie zosta³o wys³ane, a op³ata zosta³a pobrana.", "Zamknij", "");
		}
		return 1;
	}
	return 1;
}
