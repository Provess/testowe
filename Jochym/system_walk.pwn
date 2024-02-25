			new Gaztxt[124];
			strdel(tekst_global, 0,512);
			strdel(Gaztxt, 0, 124);
            format(tekst_global, sizeof(tekst_global), "%s\n{848484}Opcje pojazdu:", tekst_global);
			format(tekst_global, sizeof(tekst_global), "%s\nZarz¹dzaj radiem", tekst_global);//1
			format(tekst_global, sizeof(tekst_global), "%s\nZarz¹dzaj CB radiem", tekst_global);
			if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER) { format(tekst_global, sizeof(tekst_global), "%s\nWy³¹cz/w³¹cz alarm", tekst_global); } else { format(tekst_global, sizeof(tekst_global), "%s\n{B4B4B4}Wy³¹cz/w³¹cz alarm", tekst_global); }
			format(tekst_global, sizeof(tekst_global), "%s\nZapnij/odepnij pasy", tekst_global);
	        if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER) { format(tekst_global, sizeof(tekst_global), "%s\nWy³¹cz/w³¹cz œwiat³a", tekst_global); } else { format(tekst_global, sizeof(tekst_global), "%s\n{B4B4B4}Wy³¹cz/w³¹cz œwiat³a", tekst_global); }
   			format(tekst_global, sizeof(tekst_global), "%s\nZobacz komponenty pojazdu", tekst_global);
	        format(tekst_global, sizeof(tekst_global), "%s\nPrzepisz pojazd pod grupê", tekst_global);
	        if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER) { format(tekst_global, sizeof(tekst_global), "%s\nWyrzuæ pasa¿era z pojazdu", tekst_global); } else { format(tekst_global, sizeof(tekst_global), "%s\n{B4B4B4}Wyrzuæ pasa¿era z pojazdu", tekst_global); }
	        format(tekst_global, sizeof(tekst_global), "%s\nZarz¹dzaj szybami", tekst_global);
	        if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER) { format(tekst_global, sizeof(tekst_global), "%s\nZarz¹dzaj mask¹", tekst_global); } else { format(tekst_global, sizeof(tekst_global), "%s\n{B4B4B4}Zarz¹dzaj mask¹", tekst_global); }
	        if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER) { format(tekst_global, sizeof(tekst_global), "%s\nZarz¹dzaj baga¿nikiem", tekst_global); } else { format(tekst_global, sizeof(tekst_global), "%s\n{B4B4B4}Zarz¹dzaj baga¿nikiem", tekst_global); }
	        if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER) { format(tekst_global, sizeof(tekst_global), "%s\nZaparkuj pojazd", tekst_global); } else { format(tekst_global, sizeof(tekst_global), "%s\n{B4B4B4}Zaparkuj pojazd", tekst_global); }
	        if(PojazdInfo[veh][pGaz] != 0)
			{
				if(PojazdInfo[veh][pGaz] != 1) Gaztxt="W³¹cz gaz"; else Gaztxt="Wy³¹cz gaz";
				format(tekst_global, sizeof(tekst_global), "%s\n\t{DEDEDE}» %s", tekst_global, Gaztxt);
			}
	        format(tekst_global, sizeof(tekst_global), "%s\n{848484}Dodatki:", tekst_global);
	        if(PojazdInfo[veh][pAlarm] == 0)
	        {
				format(tekst_global, sizeof(tekst_global), "%s\nAlarm:\t\t\t{ed5a5a}Niezamontowane", tekst_global);
			}
			else
			{
			    format(tekst_global, sizeof(tekst_global), "%s\nAlarm:\t\t\t{6aa84f}Zamontowane", tekst_global);
			}
	        if(PojazdInfo[veh][pCB] == 0)
	        {
				format(tekst_global, sizeof(tekst_global), "%s\nCB Radio:\t\t{ed5a5a}Niezamontowane", tekst_global);
			}
			else
			{
			    format(tekst_global, sizeof(tekst_global), "%s\nCB Radio:\t\t{6aa84f}Zamontowane", tekst_global);
			}
	        if(PojazdInfo[veh][pAudio] == 0)
	        {
				format(tekst_global, sizeof(tekst_global), "%s\nSystem audio:\t\t{ed5a5a}Niezamontowane", tekst_global);
			}
			else
			{
			    format(tekst_global, sizeof(tekst_global), "%s\nSystem audio:\t\t{6aa84f}Zamontowane", tekst_global);
			}
	        if(PojazdInfo[veh][pImmo] == 0)
	        {
				format(tekst_global, sizeof(tekst_global), "%s\nImmobiliser:\t\t{ed5a5a}Niezamontowane", tekst_global);
			}
			else
			{
			    format(tekst_global, sizeof(tekst_global), "%s\nImmobiliser:\t\t{6aa84f}Zamontowane", tekst_global);
			}
			if(PojazdInfo[veh][pPSzyba] == 0)
	        {
				format(tekst_global, sizeof(tekst_global), "%s\nPrzyciemnione szyby:\t{ed5a5a}Niezamontowane", tekst_global);
			}
			else
			{
			    format(tekst_global, sizeof(tekst_global), "%s\nPrzyciemnione szyby:\t{6aa84f}Zamontowane", tekst_global);
			}
			new siedzi = GetPlayerVehicleSeat(playerid);
			if(siedzi == 0)
			{
		        if(PojazdInfo[veh][pGPS] == 0)
		        {
					format(tekst_global, sizeof(tekst_global), "%s\nNadajnik GPS:\t\t{ed5a5a}Niezamontowane", tekst_global);
				}
				else
				{
				    format(tekst_global, sizeof(tekst_global), "%s\nNadajnik GPS:\t\t{6aa84f}Zamontowane", tekst_global);
				}
			}
	        dShowPlayerDialog(playerid, DIALOG_MANIPULATION_VEH, DIALOG_STYLE_LIST, "• Pojazdy:", tekst_global, "Wybierz", "Zamknij");
	        
	        /////////////////////
	        
	        strdel(tekst_global, 0,512);
	        format(tekst_global, sizeof(tekst_global), "%s\nPoka¿ informacje", tekst_global);
	        format(tekst_global, sizeof(tekst_global), "%s\nPrzepisz pojazd pod grupê", tekst_global);
	        format(tekst_global, sizeof(tekst_global), "%s\nZobacz komponenty pojazdu", tekst_global);
	        format(tekst_global, sizeof(tekst_global), "%s\nZarz¹dzanie pojazdem", tekst_global);
	        format(tekst_global, sizeof(tekst_global), "%s\nDodatkowe opcje", tekst_global);
	        format(tekst_global, sizeof(tekst_global), "%s\n-----------------", tekst_global);
	        format(tekst_global, sizeof(tekst_global), "%s\nSprzedaj pojazd graczowi", tekst_global);
	        format(tekst_global, sizeof(tekst_global), "%s\nWymieñ siê pojazdem z graczem", tekst_global);
	        dShowPlayerDialog(playerid, DIALOG_MANIPULATION_VEH, DIALOG_STYLE_LIST, "• Pojazdy:", tekst_global, "Wybierz", "Zamknij");
	        
	        
	        /////////////////////
	        
	        
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
					    if(GetPlayerState(KtoJestOnline[playerid]) != PLAYER_STATE_PASSENGER)
						{
							if(!WlascicielpojazduBezWYP(vehicleid, playerid))
							{
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
						if(find == 0) dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie znaleziono ¿adnych komponentów.", "Zamknij", "");
						else dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_LIST, "• Komponenty pojazdu:", items_list, "Zamknij", "");
					}
					if(listitem == 3)//Zarz¹dzanie pojazdem
					{
		                format(tekst_global, sizeof(tekst_global), "%s\nOtwórz maskê", tekst_global);
		                format(tekst_global, sizeof(tekst_global), "%s\nOtwórz baga¿nik", tekst_global);
		                format(tekst_global, sizeof(tekst_global), "%s\nOtwórz drzwi(brak)", tekst_global);
		                format(tekst_global, sizeof(tekst_global), "%s\nOtwórz szyby", tekst_global);
			        	dShowPlayerDialog(playerid, DIALOG_OPCJE_OPC, DIALOG_STYLE_LIST, "• Pojazdy:", tekst_global, "Wybierz", "Zamknij");
					}
					if(listitem == 4)//Dodatkowe opcje
					{
		                format(tekst_global, sizeof(tekst_global), "%s\nZarz¹dzaj radiem", tekst_global);
		                format(tekst_global, sizeof(tekst_global), "%s\nZarz¹dzaj CB radiem", tekst_global);
		                format(tekst_global, sizeof(tekst_global), "%s\nZaparkuj pojazd", tekst_global);
		                format(tekst_global, sizeof(tekst_global), "%s\nWyrzuc gracza z pojazdu", tekst_global);
		                dShowPlayerDialog(playerid, DIALOG_RADIO_OPC, DIALOG_STYLE_LIST, "• Pojazdy:", tekst_global, "Wybierz", "Zamknij");
					}
					if(listitem == 5)//Puste pole
					{
						//
					}
					if(listitem == 6)//Sprzedaj pojazd graczowi
					{
					    //
					}
					if(listitem == 7)//Wymieñ siê pojazdem z graczem
					{
						//
					}

				}
			    return 1;
			}
