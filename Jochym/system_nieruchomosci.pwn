AntiDeAMX();
enum nInfo
{
	nUID,
	nID,
	nWlascicielP,
	nWlascicielD,
	nAdres[50],
	Float:nPowieszchnia,
	nTyp,
	nLiczbaMebli,
	Float:nX,
	Float:nY,
	Float:nZ,
 	nVW,
	nINT,
    Float:nXW,
    Float:nYW,
    Float:nZW,
	nVWW,
	nINTW,
	nStworzoneObiekty,
	nPickup,
	nUkryty,
	nZamek,
	nPrzejazd,
	nIconaID,
	nRadio[100],
	nSzafa,
	nAudio,
	nOdpis,
	nLiczbaNapisow,
	Float:nMX[2],
    Float:nMY[2],
    Float:nMZ[2],
    Float:na,
    Float:naw,
	nSwiatlo,
	nMapa,
	nElektryka[500],
	nBezpiecznik,
	nToken[256],
	nHotel,
	nObiekty[2048],
	nOplata,
	Float:nIRX,
	Float:nIRY,
	Float:nIRZ,
	Float:nORX,
	Float:nORY,
	Float:nORZ,
	nHaracz,
	nHaraczC,
	nIR,
	nPickupUkryty,
	nArea,
	nNagroda,
}
new BudynekInfo[MAX_NIERUCHOMOSCI][nInfo];
forward WyjscieZBudynku(playerid, drzwiid, vehicle, vw);
public WyjscieZBudynku(playerid, drzwiid, vehicle, vw)
{
	if(silka[playerid] != 0)
	{
	    SendClientMessage(playerid, 0xFFFF00FF,"Nie mo¿esz opuœciæ budynku gdy æwiczysz na si³owni, zakoñcz æwiczenie!");
	    return 0;
	}
	if(PosiadanaBron[playerid] != 0)
	{
	 	new uid = DaneGracza[playerid][gBronUID];
	 	if(PrzedmiotInfo[uid][pWar4] == -2)
		{
		    SendClientMessage(playerid, 0xFFFF00FF,"Musisz schowaæ broñ ASG by opuœciæ budynek!");
		    return 0;
		}
	}
	if(vehicle != 0)
	{
		TextDrawHideForPlayer(playerid, Light);
		SetVehiclePos(vehicle, BudynekInfo[drzwiid][nX], BudynekInfo[drzwiid][nY], BudynekInfo[drzwiid][nZ]);
		SetVehicleZAngle(vehicle, BudynekInfo[drzwiid][na]);
		SetPlayerVirtualWorld(playerid, BudynekInfo[drzwiid][nVW]);
		SetVehicleVirtualWorld(vehicle, BudynekInfo[drzwiid][nVW]);
		SetPlayerInterior(playerid, BudynekInfo[drzwiid][nINT]);
		LinkVehicleToInterior(vehicle, BudynekInfo[drzwiid][nINT]);
		/*new grupa = BudynekInfo[drzwiid][nWlascicielD];
		if(grupa != 0 && DutyAdmina[playerid] == 0)
  		{
  		    if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_ZMOTORYZOWANA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_MAFIE || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_GANGI || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_POLICYJNA)
  		    {
				if(DaneGracza[playerid][gDzialalnosc1] == grupa)
			    {
				    if(DaneGracza[playerid][gSluzba] != 0)
				    {
				        ZapiszDuty(DaneGracza[playerid][gSluzba], playerid, DutyNR[playerid]);
				    	DutyDZ[playerid] = 0;
				    	DutyNR[playerid] = 0;
				    	DaneGracza[playerid][gSluzba] = 0;
				    	GameTextForPlayer(playerid, "Schodzisz ze sluzby.", 3000, 5);
				    	TextDrawHideForPlayer(playerid, Duty[playerid]);
				    	SetPVarInt(playerid, "Incognito", 0);
				    }
				}
				if(DaneGracza[playerid][gDzialalnosc2] == grupa)
			    {
				    if(DaneGracza[playerid][gSluzba] != 0)
				    {
				        ZapiszDuty(DaneGracza[playerid][gSluzba], playerid, DutyNR[playerid]);
				    	DutyDZ[playerid] = 0;
				    	DutyNR[playerid] = 0;
				    	DaneGracza[playerid][gSluzba] = 0;
				    	GameTextForPlayer(playerid, "Schodzisz ze sluzby.", 3000, 5);
				    	TextDrawHideForPlayer(playerid, Duty[playerid]);
				    	SetPVarInt(playerid, "Incognito", 0);
				    }
				}
				if(DaneGracza[playerid][gDzialalnosc3] == grupa)
			    {
				    if(DaneGracza[playerid][gSluzba] != 0)
				    {
				        ZapiszDuty(DaneGracza[playerid][gSluzba], playerid, DutyNR[playerid]);
				    	DutyDZ[playerid] = 0;
				    	DutyNR[playerid] = 0;
				    	DaneGracza[playerid][gSluzba] = 0;
				    	GameTextForPlayer(playerid, "Schodzisz ze sluzby.", 3000, 5);
				    	TextDrawHideForPlayer(playerid, Duty[playerid]);
				    	SetPVarInt(playerid, "Incognito", 0);
				    }
				}
				if(DaneGracza[playerid][gDzialalnosc4] == grupa)
			    {
				    if(DaneGracza[playerid][gSluzba] != 0)
				    {
				        ZapiszDuty(DaneGracza[playerid][gSluzba], playerid, DutyNR[playerid]);
				    	DutyDZ[playerid] = 0;
				    	DutyNR[playerid] = 0;
				    	DaneGracza[playerid][gSluzba] = 0;
				    	GameTextForPlayer(playerid, "Schodzisz ze sluzby.", 3000, 5);
				    	TextDrawHideForPlayer(playerid, Duty[playerid]);
				    	SetPVarInt(playerid, "Incognito", 0);
				    }
				}
				if(DaneGracza[playerid][gDzialalnosc5] == grupa)
			    {
				    if(DaneGracza[playerid][gSluzba] != 0)
				    {
				        ZapiszDuty(DaneGracza[playerid][gSluzba], playerid, DutyNR[playerid]);
				    	DutyDZ[playerid] = 0;
				    	DutyNR[playerid] = 0;
				    	DaneGracza[playerid][gSluzba] = 0;
				    	GameTextForPlayer(playerid, "Schodzisz ze sluzby.", 3000, 5);
				    	TextDrawHideForPlayer(playerid, Duty[playerid]);
				    	SetPVarInt(playerid, "Incognito", 0);
				    }
				}
				if(DaneGracza[playerid][gDzialalnosc6] == grupa)
			    {
				    if(DaneGracza[playerid][gSluzba] != 0)
				    {
				        ZapiszDuty(DaneGracza[playerid][gSluzba], playerid, DutyNR[playerid]);
				    	DutyDZ[playerid] = 0;
				    	DutyNR[playerid] = 0;
				    	DaneGracza[playerid][gSluzba] = 0;
				    	GameTextForPlayer(playerid, "Schodzisz ze sluzby.", 3000, 5);
				    	TextDrawHideForPlayer(playerid, Duty[playerid]);
				    	SetPVarInt(playerid, "Incognito", 0);
				    }
				}
			}
		}*/
		if(BudynekInfo[drzwiid][nWlascicielD] > 0)
  		{
			new ilosc;
		    ForeachEx(n, MAX_PLAYERS)
			{
				if(IsPlayerConnected(n))
				{
					if(zalogowany[n] == true)
					{
						if(GetPlayerVirtualWorld(n) == drzwiid)
						{
							ilosc++;
						}
					}
				}
			}
			if(ilosc == 0)
			{
				new typ = GrupaInfo[BudynekInfo[drzwiid][nWlascicielD]][gTyp];
				if(typ == 1)//Policyjna
				{
				    DestroyDynamicMapIcon(BudynekInfo[drzwiid][nUID]);
				    BudynekInfo[drzwiid][nIconaID] = 0;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 3)//Warsztat
				{
				    DestroyDynamicMapIcon(BudynekInfo[drzwiid][nUID]);
				    BudynekInfo[drzwiid][nIconaID] = 0;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 9)//Gastronomia
				{
				    DestroyDynamicMapIcon(BudynekInfo[drzwiid][nUID]);
				    BudynekInfo[drzwiid][nIconaID] = 0;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 10)//San News
				{
				    DestroyDynamicMapIcon(BudynekInfo[drzwiid][nUID]);
				    BudynekInfo[drzwiid][nIconaID] = 0;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 14)//Medyczna
				{
				    DestroyDynamicMapIcon(BudynekInfo[drzwiid][nUID]);
				    BudynekInfo[drzwiid][nIconaID] = 0;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 17)//Silownia
				{
				    DestroyDynamicMapIcon(BudynekInfo[drzwiid][nUID]);
				    BudynekInfo[drzwiid][nIconaID] = 0;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 20)//Ochrona
				{
				    DestroyDynamicMapIcon(BudynekInfo[drzwiid][nUID]);
				    BudynekInfo[drzwiid][nIconaID] = 0;
				    ZapiszNieruchomosc(drzwiid);
				}
			}
		}
		new log[256];
		format(log, sizeof(log), "[DOOR-CAR] [%s] [ID: %d] Exits %s (UID: %d)", ZmianaNicku(playerid), playerid, BudynekInfo[drzwiid][nAdres], BudynekInfo[drzwiid][nUID]);
		Transakcja(T_IC, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, log, gettime()+KOREKTA_CZASOWA);
		ForeachEx(x, MAX_PLAYERS)
		{
			if(IsPlayerConnected(x))
			{
				if(zalogowany[x] == true)
				{
					if(GetPlayerVehicleID(x) == GetPlayerVehicleID(playerid) && !GraczPrzetrzymywany(x))
					{
						SetPlayerVirtualWorld(x, BudynekInfo[drzwiid][nVW]);
						SetPlayerInterior(x, BudynekInfo[drzwiid][nINT]);
						if(Discman[x] == 0)
						{
							if(IsPlayerInAnyVehicle(x))
							{
								new vehicleid=GetPlayerVehicleID(x);
								new uid = SprawdzCarUID(vehicleid);
								if(PojazdInfo[uid][pAudioStream] == 0)
								{
									StopAudioStreamForPlayer(x);
								}
							}
							else
							{
								StopAudioStreamForPlayer(x);
							}
						}
					}
				}
			}
		}
		return 1;
	}
	else
	{
		if(GraczPrzetrzymywany(playerid))
		{
			GameTextForPlayer(playerid, "~r~Osoby przetrzymywane nie moga przechodzic przez drzwi.", 3000, 5);
			return 0;
		}
		OstatnieDrzwi[playerid] = drzwiid;
		Teleportuj(playerid, BudynekInfo[drzwiid][nX], BudynekInfo[drzwiid][nY], BudynekInfo[drzwiid][nZ]);
		SetPlayerFacingAngle(playerid, BudynekInfo[drzwiid][na]);
		SetPlayerWeather(playerid, 2);
		SetPlayerVirtualWorld(playerid, vw);
		SetPlayerInterior(playerid, BudynekInfo[drzwiid][nINT]);
		TextDrawHideForPlayer(playerid, Light);
		/*new grupa = BudynekInfo[drzwiid][nWlascicielD];
		if(grupa != 0 && DutyAdmina[playerid] == 0)
  		{
  		    if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_ZMOTORYZOWANA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_MAFIE || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_GANGI || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_POLICYJNA)
  		    {
				if(DaneGracza[playerid][gDzialalnosc1] == grupa)
			    {
				    if(DaneGracza[playerid][gSluzba] != 0)
				    {
				        ZapiszDuty(DaneGracza[playerid][gSluzba], playerid, DutyNR[playerid]);
				    	DutyDZ[playerid] = 0;
				    	DutyNR[playerid] = 0;
				    	DaneGracza[playerid][gSluzba] = 0;
				    	GameTextForPlayer(playerid, "Schodzisz ze sluzby.", 3000, 5);
				    	TextDrawHideForPlayer(playerid, Duty[playerid]);
				    	SetPVarInt(playerid, "Incognito", 0);
				    }
				}
				if(DaneGracza[playerid][gDzialalnosc2] == grupa)
			    {
				    if(DaneGracza[playerid][gSluzba] != 0)
				    {
				        ZapiszDuty(DaneGracza[playerid][gSluzba], playerid, DutyNR[playerid]);
				    	DutyDZ[playerid] = 0;
				    	DutyNR[playerid] = 0;
				    	DaneGracza[playerid][gSluzba] = 0;
				    	GameTextForPlayer(playerid, "Schodzisz ze sluzby.", 3000, 5);
				    	TextDrawHideForPlayer(playerid, Duty[playerid]);
				    	SetPVarInt(playerid, "Incognito", 0);
				    }
				}
				if(DaneGracza[playerid][gDzialalnosc3] == grupa)
			    {
				    if(DaneGracza[playerid][gSluzba] != 0)
				    {
				        ZapiszDuty(DaneGracza[playerid][gSluzba], playerid, DutyNR[playerid]);
				    	DutyDZ[playerid] = 0;
				    	DutyNR[playerid] = 0;
				    	DaneGracza[playerid][gSluzba] = 0;
				    	GameTextForPlayer(playerid, "Schodzisz ze sluzby.", 3000, 5);
				    	TextDrawHideForPlayer(playerid, Duty[playerid]);
				    	SetPVarInt(playerid, "Incognito", 0);
				    }
				}
				if(DaneGracza[playerid][gDzialalnosc4] == grupa)
			    {
				    if(DaneGracza[playerid][gSluzba] != 0)
				    {
				        ZapiszDuty(DaneGracza[playerid][gSluzba], playerid, DutyNR[playerid]);
				    	DutyDZ[playerid] = 0;
				    	DutyNR[playerid] = 0;
				    	DaneGracza[playerid][gSluzba] = 0;
				    	GameTextForPlayer(playerid, "Schodzisz ze sluzby.", 3000, 5);
				    	TextDrawHideForPlayer(playerid, Duty[playerid]);
				    	SetPVarInt(playerid, "Incognito", 0);
				    }
				}
				if(DaneGracza[playerid][gDzialalnosc5] == grupa)
			    {
				    if(DaneGracza[playerid][gSluzba] != 0)
				    {
				        ZapiszDuty(DaneGracza[playerid][gSluzba], playerid, DutyNR[playerid]);
				    	DutyDZ[playerid] = 0;
				    	DutyNR[playerid] = 0;
				    	DaneGracza[playerid][gSluzba] = 0;
				    	GameTextForPlayer(playerid, "Schodzisz ze sluzby.", 3000, 5);
				    	TextDrawHideForPlayer(playerid, Duty[playerid]);
				    	SetPVarInt(playerid, "Incognito", 0);
				    }
				}
				if(DaneGracza[playerid][gDzialalnosc6] == grupa)
			    {
				    if(DaneGracza[playerid][gSluzba] != 0)
				    {
				        ZapiszDuty(DaneGracza[playerid][gSluzba], playerid, DutyNR[playerid]);
				    	DutyDZ[playerid] = 0;
				    	DutyNR[playerid] = 0;
				    	DaneGracza[playerid][gSluzba] = 0;
				    	GameTextForPlayer(playerid, "Schodzisz ze sluzby.", 3000, 5);
				    	TextDrawHideForPlayer(playerid, Duty[playerid]);
				    	SetPVarInt(playerid, "Incognito", 0);
				    }
				}
			}
		}*/
		if(BudynekInfo[drzwiid][nWlascicielD] > 0)
  		{
			new ilosc;
		    ForeachEx(n, MAX_PLAYERS)
			{
				if(IsPlayerConnected(n))
				{
					if(zalogowany[n] == true)
					{
						if(GetPlayerVirtualWorld(n) == drzwiid)
						{
							ilosc++;
						}
					}
				}
			}
			if(ilosc == 0)
			{
				new typ = GrupaInfo[BudynekInfo[drzwiid][nWlascicielD]][gTyp];
				if(typ == 1)//Policyjna
				{
				    DestroyDynamicMapIcon(BudynekInfo[drzwiid][nUID]);
				    BudynekInfo[drzwiid][nIconaID] = 0;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 3)//Warsztat
				{
				    DestroyDynamicMapIcon(BudynekInfo[drzwiid][nUID]);
				    BudynekInfo[drzwiid][nIconaID] = 0;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 9)//Gastronomia
				{
				    DestroyDynamicMapIcon(BudynekInfo[drzwiid][nUID]);
				    BudynekInfo[drzwiid][nIconaID] = 0;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 10)//San News
				{
				    DestroyDynamicMapIcon(BudynekInfo[drzwiid][nUID]);
				    BudynekInfo[drzwiid][nIconaID] = 0;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 14)//Medyczna
				{
				    DestroyDynamicMapIcon(BudynekInfo[drzwiid][nUID]);
				    BudynekInfo[drzwiid][nIconaID] = 0;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 17)//Silownia
				{
				    DestroyDynamicMapIcon(BudynekInfo[drzwiid][nUID]);
				    BudynekInfo[drzwiid][nIconaID] = 0;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 20)//Ochrona
				{
				    DestroyDynamicMapIcon(BudynekInfo[drzwiid][nUID]);
				    BudynekInfo[drzwiid][nIconaID] = 0;
				    ZapiszNieruchomosc(drzwiid);
				}
			}
		}
		new log[256];
		format(log, sizeof(log), "[DOOR] [%s] [ID: %d] Exits %s (UID: %d)", ZmianaNicku(playerid), playerid, BudynekInfo[drzwiid][nAdres], drzwiid);
		Transakcja(T_IC, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, log, gettime()+KOREKTA_CZASOWA);
		//StopAudioStreamForPlayer(playerid);
		if(Discman[playerid] == 0)
		{
			if(IsPlayerInAnyVehicle(playerid))
			{
				new vehicleid=GetPlayerVehicleID(playerid);
				new uid = SprawdzCarUID(vehicleid);
				if(PojazdInfo[uid][pAudioStream] == 0)
				{
					StopAudioStreamForPlayer(playerid);
				}
			}
			else
			{
				StopAudioStreamForPlayer(playerid);
			}
		}
		if(DaneGracza[playerid][gFreeze] == 0)
  		{
			Frezuj(playerid, 0);
			SetTimerEx("Frez", 3000, 0, "d", playerid);
		}
	}
	return 1;
}
forward WejscieDoBudynku(playerid, drzwiid, vehicle, vw);
public WejscieDoBudynku(playerid, drzwiid, vehicle, vw)
{
	if(Rolki[playerid] != 0)
	{
		GameTextForPlayer(playerid, "~r~Nie mozesz z rolkami wchodzic do budynkow.", 3000, 5);
		return 1;
	}
	if(vw < 10000)
	{
		if(BudynekInfo[drzwiid][nOplata] < gettime()+CZAS_LETNI && BudynekInfo[drzwiid][nOplata] != -1)
		{
		    new gr = GrupaInfo[BudynekInfo[drzwiid][nWlascicielD]][gTyp];
		    if(gr != 1 || gr != 14 || gr != 19)
			{
				//new tekst_globals[512], tekst_global[512];
				WyjscieZBudynku(playerid, drzwiid, vehicle, vw);
				SetPlayerVirtualWorld(playerid, BudynekInfo[drzwiid][nVW]);
				SetPlayerInterior(playerid, BudynekInfo[drzwiid][nINT]);
				new rok, miesiac, dzien, godzina, minuta, sekunda;
				sekundytodata(BudynekInfo[drzwiid][nOplata], rok, miesiac, dzien, godzina, minuta, sekunda);
				format(tekst_global, sizeof(tekst_global), "Nie mo¿esz wejœæ do budynku, poniewa¿ jego podatek nie by³ op³acony od %02d-%02d-%d, %02d:%02d\nJe¿eli jesteœ jego w³aœcicielem, udaj siê do urzêdu w celu op³aty budynku nr. %d.\n\nBudynek zostanie skasowany po up³ywie 30. dni od ostatniej wp³aty podatku.", dzien, miesiac, rok, godzina, minuta, drzwiid);
				format(tekst_globals, sizeof(tekst_globals), "• TIP:", dzien, miesiac, rok, godzina, minuta);
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, tekst_globals, tekst_global, "Rozumiem", "");
			    //SetPVarInt(playerid, "OKIENKOOPLATY", drzwiid);
				return 0;
			}
		}
	}
	if(vehicle != 0)
	{
	    OstatnieDrzwi[playerid] = drzwiid;
	    if(BudynekInfo[drzwiid][nSwiatlo] == 1)
		{
			TextDrawShowForPlayer(playerid, Light);
		}
		SetPlayerVirtualWorld(playerid, BudynekInfo[drzwiid][nVWW]);
		SetVehicleVirtualWorld(vehicle, BudynekInfo[drzwiid][nVWW]);
		SetVehiclePos(vehicle, BudynekInfo[drzwiid][nXW], BudynekInfo[drzwiid][nYW], BudynekInfo[drzwiid][nZW]);
		SetVehicleZAngle(vehicle, BudynekInfo[drzwiid][naw]);
		SetPlayerInterior(playerid, BudynekInfo[drzwiid][nINTW]);
		LinkVehicleToInterior(vehicle, BudynekInfo[drzwiid][nINTW]);
		SetVehicleVelocity(vehicle, 0.0, 0.0, 0.1);
		SetPVarInt(playerid, "uiddrzwi", drzwiid);
		new grupa = BudynekInfo[drzwiid][nWlascicielD];
	    if(grupa != 0 && DutyAdmina[playerid] == 0)
	    {
		    if(DaneGracza[playerid][gDzialalnosc1] == grupa)
		    {
			    if(DaneGracza[playerid][gSluzba] == 0)
			    {
			        DaneGracza[playerid][gSluzba] = DaneGracza[playerid][gDzialalnosc1];
			        DutyNR[playerid] = 1;
					if(DutyAdmina[playerid] == 1)
					{
						ZapiszGraczaGlobal(playerid, 8);
						DutyAdmina[playerid] = 0;
					}
			        new dutyr[124];
			        format(dutyr, sizeof(dutyr), "~w~Wchodzisz na sluzbe~n~~b~~h~~h~%s", GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
			        GameTextForPlayer(playerid, dutyr, 3000, 5);
			        new msg[254];
					format(msg,254,"%s (%s)",ImieGracza2(playerid) ,GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
					TextDrawSetString(Duty[playerid], msg);
					TextDrawShowForPlayer(playerid, Duty[playerid]);
			        if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_SANNEWS ||
					GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_GANGI || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_RZADOWA)
			        {
			        	DutyDZ[playerid] = 1;
		        	}
					RefreshNick(playerid);
			    }
		    }
	 		if(DaneGracza[playerid][gDzialalnosc2] == grupa)
	 		{
		        if(DaneGracza[playerid][gSluzba] == 0)
			    {
			        DaneGracza[playerid][gSluzba] = DaneGracza[playerid][gDzialalnosc2];
			        DutyNR[playerid] = 2;
					if(DutyAdmina[playerid] == 1)
					{
						ZapiszGraczaGlobal(playerid, 8);
						DutyAdmina[playerid] = 0;
					}
			        new dutyr[124];
			        format(dutyr, sizeof(dutyr), "~w~Wchodzisz na sluzbe~n~~b~~h~~h~%s", GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
			        GameTextForPlayer(playerid, dutyr, 3000, 5);
			       new msg[254];
					format(msg,254,"%s (%s)",ImieGracza2(playerid) ,GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
					TextDrawSetString(Duty[playerid], msg);
					TextDrawShowForPlayer(playerid, Duty[playerid]);
			        if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_SANNEWS ||
					GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_GANGI || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_RZADOWA)
			        {
			        	DutyDZ[playerid] = 2;
		        	}
					RefreshNick(playerid);
			    }
	 		}
	 		if(DaneGracza[playerid][gDzialalnosc3] == grupa)
	 		{
		        if(DaneGracza[playerid][gSluzba] == 0)
			    {
			        DaneGracza[playerid][gSluzba] = DaneGracza[playerid][gDzialalnosc3];
			        DutyNR[playerid] = 3;
					if(DutyAdmina[playerid] == 1)
					{
						ZapiszGraczaGlobal(playerid, 8);
						DutyAdmina[playerid] = 0;
					}
			        new dutyr[124];
			        format(dutyr, sizeof(dutyr), "~w~Wchodzisz na sluzbe~n~~b~~h~~h~%s", GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
			        GameTextForPlayer(playerid, dutyr, 3000, 5);
			        new msg[254];
					format(msg,254,"%s (%s)",ImieGracza2(playerid) ,GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
					TextDrawSetString(Duty[playerid], msg);
					TextDrawShowForPlayer(playerid, Duty[playerid]);
			        if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_SANNEWS ||
					GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_GANGI || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_RZADOWA)
			        {
			        	DutyDZ[playerid] = 3;
		        	}
					RefreshNick(playerid);
				}
	 		}
		  	if(DaneGracza[playerid][gDzialalnosc4] == grupa && GraczPremium(playerid))
		  	{
		        if(DaneGracza[playerid][gSluzba] == 0)
			    {
			        DaneGracza[playerid][gSluzba] = DaneGracza[playerid][gDzialalnosc4];
			        DutyNR[playerid] = 4;
					if(DutyAdmina[playerid] == 1)
					{
						ZapiszGraczaGlobal(playerid, 8);
						DutyAdmina[playerid] = 0;
					}
			        new dutyr[124];
			        format(dutyr, sizeof(dutyr), "~w~Wchodzisz na sluzbe~n~~b~~h~~h~%s", GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
			        GameTextForPlayer(playerid, dutyr, 3000, 5);
			        new msg[254];
					format(msg,254,"%s (%s)",ImieGracza2(playerid) ,GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
					TextDrawSetString(Duty[playerid], msg);
					TextDrawShowForPlayer(playerid, Duty[playerid]);
			        if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_SANNEWS ||
					GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_GANGI || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_RZADOWA)
			        {
			        	DutyDZ[playerid] = 4;
		        	}
					RefreshNick(playerid);
			    }
		  	}
		   	if(DaneGracza[playerid][gDzialalnosc5] == grupa && GraczPremium(playerid))
		   	{
		        if(DaneGracza[playerid][gSluzba] == 0)
			    {
			        DaneGracza[playerid][gSluzba] = DaneGracza[playerid][gDzialalnosc5];
			        DutyNR[playerid] = 5;
					if(DutyAdmina[playerid] == 1)
					{
						ZapiszGraczaGlobal(playerid, 8);
						DutyAdmina[playerid] = 0;
					}
			        new dutyr[124];
			        format(dutyr, sizeof(dutyr), "~w~Wchodzisz na sluzbe~n~~b~~h~~h~%s", GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
			        GameTextForPlayer(playerid, dutyr, 3000, 5);
			        new msg[254];
					format(msg,254,"%s (%s)",ImieGracza2(playerid) ,GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
					TextDrawSetString(Duty[playerid], msg);
					TextDrawShowForPlayer(playerid, Duty[playerid]);
			        if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_SANNEWS ||
					GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_GANGI || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_RZADOWA)
			        {
			        	DutyDZ[playerid] = 5;
		        	}
					RefreshNick(playerid);
				}
		   	}
		    if(DaneGracza[playerid][gDzialalnosc6] == grupa && GraczPremium(playerid))
		    {
		        if(DaneGracza[playerid][gSluzba] == 0)
			    {
			        DaneGracza[playerid][gSluzba] = DaneGracza[playerid][gDzialalnosc6];
			        DutyNR[playerid] = 6;
					if(DutyAdmina[playerid] == 1)
					{
						ZapiszGraczaGlobal(playerid, 8);
						DutyAdmina[playerid] = 0;
					}
			        new dutyr[124];
			        format(dutyr, sizeof(dutyr), "~w~Wchodzisz na sluzbe~n~~b~~h~~h~%s", GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
			        GameTextForPlayer(playerid, dutyr, 3000, 5);
			        new msg[254];
					format(msg,254,"%s (%s)",ImieGracza2(playerid) ,GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
					TextDrawSetString(Duty[playerid], msg);
					TextDrawShowForPlayer(playerid, Duty[playerid]);
			        if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_SANNEWS ||
					GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_GANGI || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_RZADOWA)
			        {
			        	DutyDZ[playerid] = 6;
		        	}
					RefreshNick(playerid);
			    }
		    }
		}
		new log[256];
		format(log, sizeof(log), "[DOOR-CAR] [%s] [ID: %d] Enters %s (UID: %d)", ZmianaNicku(playerid), playerid, BudynekInfo[drzwiid][nAdres], BudynekInfo[drzwiid][nUID]);
		Transakcja(T_IC, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, log, gettime()+KOREKTA_CZASOWA);
		new year, month, day;
		getdate(year, month, day);
        if(BudynekInfo[drzwiid][nWlascicielD] > 0)
  		{
			new ilosc;
			if(BudynekInfo[drzwiid][nNagroda] != day)
			{
				ForeachEx(n, MAX_PLAYERS)
				{
					if(IsPlayerConnected(n))
					{
						if(zalogowany[n] == true)
						{
							if(GetPlayerVirtualWorld(n) == drzwiid)
							{
								ilosc++;
							}
						}
					}
				}
				if(ilosc == 10)
				{
					new msg[128];
					format(msg,128,"%s otrzyma³o dotacjê 5.000$ za zgromadzenie 10 osób w budynku.", GrupaInfo[BudynekInfo[drzwiid][nWlascicielD]][gNazwa]);
					SendClientMessageToAll(0xFFFF0000, msg);
					GrupaInfo[BudynekInfo[drzwiid][nWlascicielD]][gSaldo] += 5000;
					BudynekInfo[drzwiid][nNagroda] = day;
					ZapiszNieruchomosc(drzwiid);
				}
				if(ilosc == 25)
				{
					new msg[128];
					format(msg,128,"%s otrzyma³o dotacjê 10.000$ za zgromadzenie 25 osób w budynku.", GrupaInfo[BudynekInfo[drzwiid][nWlascicielD]][gNazwa]);
					SendClientMessageToAll(0xFFFF0000, msg);
					GrupaInfo[BudynekInfo[drzwiid][nWlascicielD]][gSaldo] += 10000;
					BudynekInfo[drzwiid][nNagroda] = day;
					ZapiszNieruchomosc(drzwiid);
				}
			}
			if(ilosc >= 1)
			{
				new typ = GrupaInfo[BudynekInfo[drzwiid][nWlascicielD]][gTyp];
				if(typ == 1)//Policyjna
				{
				    new ikona = 30;
				    BudynekInfo[drzwiid][nUID] = CreateDynamicMapIcon(BudynekInfo[drzwiid][nX], BudynekInfo[drzwiid][nY], BudynekInfo[drzwiid][nZ], ikona, 0, BudynekInfo[drzwiid][nVW]);
				    BudynekInfo[drzwiid][nIconaID] = 1;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 3)//Warsztat
				{
				    new ikona = 27;
				    BudynekInfo[drzwiid][nUID] = CreateDynamicMapIcon(BudynekInfo[drzwiid][nX], BudynekInfo[drzwiid][nY], BudynekInfo[drzwiid][nZ], ikona, 0, BudynekInfo[drzwiid][nVW]);
				    BudynekInfo[drzwiid][nIconaID] = 1;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 9)//Gastronomia
				{
				    new ikona = 50;
				    BudynekInfo[drzwiid][nUID] = CreateDynamicMapIcon(BudynekInfo[drzwiid][nX], BudynekInfo[drzwiid][nY], BudynekInfo[drzwiid][nZ], ikona, 0, BudynekInfo[drzwiid][nVW]);
				    BudynekInfo[drzwiid][nIconaID] = 1;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 10)//San News
				{
				    new ikona = 48;
				    BudynekInfo[drzwiid][nUID] = CreateDynamicMapIcon(BudynekInfo[drzwiid][nX], BudynekInfo[drzwiid][nY], BudynekInfo[drzwiid][nZ], ikona, 0, BudynekInfo[drzwiid][nVW]);
				    BudynekInfo[drzwiid][nIconaID] = 1;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 14)//Medyczna
				{
				    new ikona = 22;
				    BudynekInfo[drzwiid][nUID] = CreateDynamicMapIcon(BudynekInfo[drzwiid][nX], BudynekInfo[drzwiid][nY], BudynekInfo[drzwiid][nZ], ikona, 0, BudynekInfo[drzwiid][nVW]);
				    BudynekInfo[drzwiid][nIconaID] = 1;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 17)//Silownia
				{
				    new ikona = 54;
				    BudynekInfo[drzwiid][nUID] = CreateDynamicMapIcon(BudynekInfo[drzwiid][nX], BudynekInfo[drzwiid][nY], BudynekInfo[drzwiid][nZ], ikona, 0, BudynekInfo[drzwiid][nVW]);
				    BudynekInfo[drzwiid][nIconaID] = 1;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 20)//Ochrona
				{
				    new ikona = 18;
				    BudynekInfo[drzwiid][nUID] = CreateDynamicMapIcon(BudynekInfo[drzwiid][nX], BudynekInfo[drzwiid][nY], BudynekInfo[drzwiid][nZ], ikona, 0, BudynekInfo[drzwiid][nVW]);
				    BudynekInfo[drzwiid][nIconaID] = 1;
				    ZapiszNieruchomosc(drzwiid);
				}
			}
		}
		ForeachEx(x, MAX_PLAYERS)
		{
			if(IsPlayerConnected(x))
			{
				if(zalogowany[x] == true)
				{
					if(GetPlayerVehicleID(x) == GetPlayerVehicleID(playerid) && !GraczPrzetrzymywany(x))
					{
						SetPlayerVirtualWorld(x, BudynekInfo[drzwiid][nVWW]);
						SetPlayerInterior(x, BudynekInfo[drzwiid][nINTW]);
						if(BudynekInfo[drzwiid][nAudio] == 1)
						{
							if(Discman[x] == 0)
							{
								if(IsPlayerInAnyVehicle(x))
								{
									new vehicleid=GetPlayerVehicleID(x);
									new uid = SprawdzCarUID(vehicleid);
									if(PojazdInfo[uid][pAudioStream] == 0)
									{
										if(GetPVarInt(x,"spawn"))
										{
											DeletePVar(x,"spawn");
										}
										StopAudioStreamForPlayer(x);
										PlayAudioStreamForPlayer(x, BudynekInfo[drzwiid][nRadio], 0, 0, 0, 14.0, 0);
									}
								}
								else
								{
									if(GetPVarInt(x,"spawn"))
									{
										DeletePVar(x,"spawn");
									}
									StopAudioStreamForPlayer(x);
									PlayAudioStreamForPlayer(x, BudynekInfo[drzwiid][nRadio], 0, 0, 0, 14.0, 0);
								}
							}
						}
					}
				}
			}
		}
	    return 1;
	}
	else
	{
		if(GraczPrzetrzymywany(playerid))
		{
			return 0;
		}
	    OstatnieDrzwi[playerid] = drzwiid;
	    if(BudynekInfo[drzwiid][nSwiatlo] == 1)
		{
			TextDrawShowForPlayer(playerid, Light);
		}
		new uid = BudynekInfo[drzwiid][nWlascicielD];
		if(GrupaInfo[uid][gTyp] == DZIALALNOSC_BANK)
		{
		    CzasWyswietlaniaTextuNaDrzwiach[playerid] = 20;
			TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
			TextDrawSetString(TextNaDrzwi[playerid], "Wlasnie wszedles do:~n~ ~g~Los Santos Bank~n~ ~w~wpisz ''~y~~h~/bank~w~'' aby zalozyc konto badz z niego skorzystac.");
			TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
		}
		if(GrupaInfo[uid][gTyp] == DZIALALNOSC_BINCO)
		{
		    CzasWyswietlaniaTextuNaDrzwiach[playerid] = 20;
			TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
			TextDrawSetString(TextNaDrzwi[playerid], "Wlasnie wszedles do:~n~ ~g~Sklepu z ubraniami~n~ ~w~wpisz ''~y~~h~/ubranie~w~'' aby kupic nowe ubranie lub~n~zmienic swoje ''~y~~h~/akcesoria~w~''.");
			TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
		}
		if(GrupaInfo[uid][gTyp] == DZIALALNOSC_247)
		{
		    CzasWyswietlaniaTextuNaDrzwiach[playerid] = 20;
			TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
			TextDrawSetString(TextNaDrzwi[playerid], "Wlasnie wszedles do:~n~ ~g~24/7~n~ ~w~podejdz do aktora i kliknij klawisz Y.");
			TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
		}
		if(GrupaInfo[uid][gTyp] == DZIALALNOSC_HOTEL)
		{
			new nazwadrzwis[254];
			format(nazwadrzwis, sizeof(nazwadrzwis), "Wlasnie wszedles do:~n~ ~g~Hotelu~n~ ~w~wpisz ''~y~~h~/pokoj~w~'' aby sie zameldowac.");
		    CzasWyswietlaniaTextuNaDrzwiach[playerid] = 20;
			TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
			TextDrawSetString(TextNaDrzwi[playerid], nazwadrzwis);
			TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
		}
		if(GrupaInfo[uid][gTyp] == DZIALALNOSC_SALON)
		{
			new nazwadrzwis[254];
			format(nazwadrzwis, sizeof(nazwadrzwis), "Wlasnie wszedles do:~n~ ~g~Salonu~n~ ~w~podejdz do aktora i kliknij klawisz Y.");
		    CzasWyswietlaniaTextuNaDrzwiach[playerid] = 20;
			TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
			TextDrawSetString(TextNaDrzwi[playerid], nazwadrzwis);
			TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
		}
		SetPlayerVirtualWorld(playerid, vw);
		SetPlayerInterior(playerid, BudynekInfo[drzwiid][nINTW]);
		Teleportuj(playerid, BudynekInfo[drzwiid][nXW], BudynekInfo[drzwiid][nYW], BudynekInfo[drzwiid][nZW]);
		SetPlayerFacingAngle(playerid, BudynekInfo[drzwiid][naw]);
		SetPlayerWeather(playerid, 2);
		SetPlayerVirtualWorld(playerid, vw);
		SetPVarInt(playerid, "uiddrzwi", 0);
		new log[256];
		format(log, sizeof(log), "[DOOR] [%s] [ID: %d] Enters %s (UID: %d)", ZmianaNicku(playerid), playerid, BudynekInfo[drzwiid][nAdres], drzwiid);
		Transakcja(T_IC, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, log, gettime()+KOREKTA_CZASOWA);
		new grupa = BudynekInfo[drzwiid][nWlascicielD];
		if(grupa != 0 && DutyAdmina[playerid] == 0)
  		{
		    if(DaneGracza[playerid][gDzialalnosc1] == grupa)
		    {
			    if(DaneGracza[playerid][gSluzba] == 0)
			    {
			        DaneGracza[playerid][gSluzba] = DaneGracza[playerid][gDzialalnosc1];
			        DutyNR[playerid] = 1;
					if(DutyAdmina[playerid] == 1)
					{
						ZapiszGraczaGlobal(playerid, 8);
						DutyAdmina[playerid] = 0;
					}
			        new dutyr[124];
			        format(dutyr, sizeof(dutyr), "~w~Wchodzisz na sluzbe~n~~b~~h~~h~%s", GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
			        GameTextForPlayer(playerid, dutyr, 3000, 5);
			        new msg[254];
					format(msg,254,"%s (%s)",ImieGracza2(playerid) ,GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
					TextDrawSetString(Duty[playerid], msg);
					TextDrawShowForPlayer(playerid, Duty[playerid]);
			        if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_SANNEWS ||
					GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_GANGI || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_RZADOWA)
			        {
			        	DutyDZ[playerid] = 1;
		        	}
					RefreshNick(playerid);
			    }
		    }
	 		if(DaneGracza[playerid][gDzialalnosc2] == grupa)
	 		{
		        if(DaneGracza[playerid][gSluzba] == 0)
			    {
			        DaneGracza[playerid][gSluzba] = DaneGracza[playerid][gDzialalnosc2];
			        DutyNR[playerid] = 2;
					if(DutyAdmina[playerid] == 1)
					{
						ZapiszGraczaGlobal(playerid, 8);
						DutyAdmina[playerid] = 0;
					}
			        new dutyr[124];
			        format(dutyr, sizeof(dutyr), "~w~Wchodzisz na sluzbe~n~~b~~h~~h~%s", GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
			        GameTextForPlayer(playerid, dutyr, 3000, 5);
			        new msg[254];
					format(msg,254,"%s (%s)",ImieGracza2(playerid) ,GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
					TextDrawSetString(Duty[playerid], msg);
					TextDrawShowForPlayer(playerid, Duty[playerid]);
			        if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_SANNEWS ||
					GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_GANGI || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_RZADOWA)
			        {
			        	DutyDZ[playerid] = 2;
		        	}
					RefreshNick(playerid);
			    }
	 		}
	 		if(DaneGracza[playerid][gDzialalnosc3] == grupa)
	 		{
		        if(DaneGracza[playerid][gSluzba] == 0)
			    {
			        DaneGracza[playerid][gSluzba] = DaneGracza[playerid][gDzialalnosc3];
			        DutyNR[playerid] = 3;
					if(DutyAdmina[playerid] == 1)
					{
						ZapiszGraczaGlobal(playerid, 8);
						DutyAdmina[playerid] = 0;
					}
			        new dutyr[124];
			        format(dutyr, sizeof(dutyr), "~w~Wchodzisz na sluzbe~n~~b~~h~~h~%s", GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
			        GameTextForPlayer(playerid, dutyr, 3000, 5);
			        new msg[254];
					format(msg,254,"%s (%s)",ImieGracza2(playerid) ,GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
					TextDrawSetString(Duty[playerid], msg);
					TextDrawShowForPlayer(playerid, Duty[playerid]);
			        if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_SANNEWS ||
					GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_GANGI || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_RZADOWA)
			        {
			        	DutyDZ[playerid] = 3;
		        	}
					RefreshNick(playerid);
				}
	 		}
		  	if(DaneGracza[playerid][gDzialalnosc4] == grupa && GraczPremium(playerid))
		  	{
		        if(DaneGracza[playerid][gSluzba] == 0)
			    {
			        DaneGracza[playerid][gSluzba] = DaneGracza[playerid][gDzialalnosc4];
			        DutyNR[playerid] = 4;
					if(DutyAdmina[playerid] == 1)
					{
						ZapiszGraczaGlobal(playerid, 8);
						DutyAdmina[playerid] = 0;
					}
			        new dutyr[124];
			        format(dutyr, sizeof(dutyr), "~w~Wchodzisz na sluzbe~n~~b~~h~~h~%s", GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
			        GameTextForPlayer(playerid, dutyr, 3000, 5);
			        new msg[254];
					format(msg,254,"%s (%s)",ImieGracza2(playerid) ,GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
					TextDrawSetString(Duty[playerid], msg);
					TextDrawShowForPlayer(playerid, Duty[playerid]);
			        if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_SANNEWS ||
					GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_GANGI || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_RZADOWA)
			        {
			        	DutyDZ[playerid] = 4;
		        	}
					RefreshNick(playerid);
			    }
		  	}
		   	if(DaneGracza[playerid][gDzialalnosc5] == grupa && GraczPremium(playerid))
		   	{
		        if(DaneGracza[playerid][gSluzba] == 0)
			    {
			        DaneGracza[playerid][gSluzba] = DaneGracza[playerid][gDzialalnosc5];
			        DutyNR[playerid] = 5;
					if(DutyAdmina[playerid] == 1)
					{
						ZapiszGraczaGlobal(playerid, 8);
						DutyAdmina[playerid] = 0;
					}
			        new dutyr[124];
			        format(dutyr, sizeof(dutyr), "~w~Wchodzisz na sluzbe~n~~b~~h~~h~%s", GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
			        GameTextForPlayer(playerid, dutyr, 3000, 5);
			        new msg[254];
					format(msg,254,"%s (%s)",ImieGracza2(playerid) ,GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
					TextDrawSetString(Duty[playerid], msg);
					TextDrawShowForPlayer(playerid, Duty[playerid]);
			        if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_SANNEWS ||
					GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_GANGI || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_RZADOWA)
			        {
			        	DutyDZ[playerid] = 5;
		        	}
					RefreshNick(playerid);
				}
		   	}
		    if(DaneGracza[playerid][gDzialalnosc6] == grupa && GraczPremium(playerid))
		    {
		        if(DaneGracza[playerid][gSluzba] == 0)
			    {
			        DaneGracza[playerid][gSluzba] = DaneGracza[playerid][gDzialalnosc6];
			        DutyNR[playerid] = 6;
					if(DutyAdmina[playerid] == 1)
					{
						ZapiszGraczaGlobal(playerid, 8);
						DutyAdmina[playerid] = 0;
					}
			        new dutyr[124];
			        format(dutyr, sizeof(dutyr), "~w~Wchodzisz na sluzbe~n~~b~~h~~h~%s", GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
			        GameTextForPlayer(playerid, dutyr, 3000, 5);
			        new msg[254];
					format(msg,254,"%s (%s)",ImieGracza2(playerid) ,GrupaInfo[DaneGracza[playerid][gSluzba]][gNazwa]);
					TextDrawSetString(Duty[playerid], msg);
					TextDrawShowForPlayer(playerid, Duty[playerid]);
			        if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_ZMOTORYZOWANA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_SANNEWS ||
					GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_GANGI || GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] == DZIALALNOSC_RZADOWA)
			        {
			        	DutyDZ[playerid] = 6;
		        	}
					RefreshNick(playerid);
			    }
		    }
		}
		new year, month, day;
		getdate(year, month, day);
        if(BudynekInfo[drzwiid][nWlascicielD] > 0)
  		{
			new ilosc;
			if(BudynekInfo[drzwiid][nNagroda] != day)
			{
				ForeachEx(n, MAX_PLAYERS)
				{
					if(IsPlayerConnected(n))
					{
						if(zalogowany[n] == true)
						{
							if(GetPlayerVirtualWorld(n) == drzwiid)
							{
								ilosc++;
							}
						}
					}
				}
				if(ilosc == 10)
				{
					new msg[128];
					format(msg,128,"%s otrzyma³o dotacjê 5.000$ za zgromadzenie 10 osób w budynku.", GrupaInfo[BudynekInfo[drzwiid][nWlascicielD]][gNazwa]);
					SendClientMessageToAll(0xFFFF0000, msg);
					GrupaInfo[BudynekInfo[drzwiid][nWlascicielD]][gSaldo] += 5000;
					BudynekInfo[drzwiid][nNagroda] = day;
					ZapiszNieruchomosc(drzwiid);
				}
				if(ilosc == 25)
				{
					new msg[128];
					format(msg,128,"%s otrzyma³o dotacjê 10.000$ za zgromadzenie 25 osób w budynku.", GrupaInfo[BudynekInfo[drzwiid][nWlascicielD]][gNazwa]);
					SendClientMessageToAll(0xFFFF0000, msg);
					GrupaInfo[BudynekInfo[drzwiid][nWlascicielD]][gSaldo] += 10000;
					BudynekInfo[drzwiid][nNagroda] = day;
					ZapiszNieruchomosc(drzwiid);
				}
			}
			if(ilosc >= 1)
			{
				new typ = GrupaInfo[BudynekInfo[drzwiid][nWlascicielD]][gTyp];
				if(typ == 1)//Policyjna
				{
				    new ikona = 30;
				    BudynekInfo[drzwiid][nUID] = CreateDynamicMapIcon(BudynekInfo[drzwiid][nX], BudynekInfo[drzwiid][nY], BudynekInfo[drzwiid][nZ], ikona, 0, BudynekInfo[drzwiid][nVW]);
				    BudynekInfo[drzwiid][nIconaID] = 1;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 3)//Warsztat
				{
				    new ikona = 27;
				    BudynekInfo[drzwiid][nUID] = CreateDynamicMapIcon(BudynekInfo[drzwiid][nX], BudynekInfo[drzwiid][nY], BudynekInfo[drzwiid][nZ], ikona, 0, BudynekInfo[drzwiid][nVW]);
				    BudynekInfo[drzwiid][nIconaID] = 1;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 9)//Gastronomia
				{
				    new ikona = 50;
				    BudynekInfo[drzwiid][nUID] = CreateDynamicMapIcon(BudynekInfo[drzwiid][nX], BudynekInfo[drzwiid][nY], BudynekInfo[drzwiid][nZ], ikona, 0, BudynekInfo[drzwiid][nVW]);
				    BudynekInfo[drzwiid][nIconaID] = 1;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 10)//San News
				{
				    new ikona = 48;
				    BudynekInfo[drzwiid][nUID] = CreateDynamicMapIcon(BudynekInfo[drzwiid][nX], BudynekInfo[drzwiid][nY], BudynekInfo[drzwiid][nZ], ikona, 0, BudynekInfo[drzwiid][nVW]);
				    BudynekInfo[drzwiid][nIconaID] = 1;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 14)//Medyczna
				{
				    new ikona = 22;
				    BudynekInfo[drzwiid][nUID] = CreateDynamicMapIcon(BudynekInfo[drzwiid][nX], BudynekInfo[drzwiid][nY], BudynekInfo[drzwiid][nZ], ikona, 0, BudynekInfo[drzwiid][nVW]);
				    BudynekInfo[drzwiid][nIconaID] = 1;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 17)//Silownia
				{
				    new ikona = 54;
				    BudynekInfo[drzwiid][nUID] = CreateDynamicMapIcon(BudynekInfo[drzwiid][nX], BudynekInfo[drzwiid][nY], BudynekInfo[drzwiid][nZ], ikona, 0, BudynekInfo[drzwiid][nVW]);
				    BudynekInfo[drzwiid][nIconaID] = 1;
				    ZapiszNieruchomosc(drzwiid);
				}
				if(typ == 20)//Ochrona
				{
				    new ikona = 18;
				    BudynekInfo[drzwiid][nUID] = CreateDynamicMapIcon(BudynekInfo[drzwiid][nX], BudynekInfo[drzwiid][nY], BudynekInfo[drzwiid][nZ], ikona, 0, BudynekInfo[drzwiid][nVW]);
				    BudynekInfo[drzwiid][nIconaID] = 1;
				    ZapiszNieruchomosc(drzwiid);
				}
			}
		}
	}
	if(BudynekInfo[drzwiid][nAudio] == 1)
	{
		if(Discman[playerid] == 0)
		{
			if(IsPlayerInAnyVehicle(playerid))
			{
				new vehicleid=GetPlayerVehicleID(playerid);
				new uid = SprawdzCarUID(vehicleid);
				if(PojazdInfo[uid][pAudioStream] == 0)
				{
					if(GetPVarInt(playerid,"spawn"))
					{
						DeletePVar(playerid,"spawn");
					}
					StopAudioStreamForPlayer(playerid);
					PlayAudioStreamForPlayer(playerid, BudynekInfo[drzwiid][nRadio], 0, 0, 0, 14.0, 0);
				}
			}
			else
			{
				if(GetPVarInt(playerid,"spawn"))
				{
					DeletePVar(playerid,"spawn");
				}
				StopAudioStreamForPlayer(playerid);
				PlayAudioStreamForPlayer(playerid, BudynekInfo[drzwiid][nRadio], 0, 0, 0, 14.0, 0);
			}
		}
	}
	if(DaneGracza[playerid][gFreeze] == 0)
 	{
		Frezuj(playerid, 0);
		SetTimerEx("Frez", 3000, 0, "d", playerid);
	}
	BramkiPiszczace(playerid);
	return 1;
}
CMD:drzwi(playerid, params[])
{
	//printf("U¿yta komenda drzwi");
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
	strdel(tekst_global, 0, 2048);
	strdel(tekst_globals, 0, 2048);
	new vw = GetPlayerVirtualWorld(playerid);
	new id = -1;
	if(vw == 0)
	{
		for(new h = 0; h < sizeof(BudynekInfo); h++)
		{
			if(BudynekInfo[h][nUID] != 0)
			{
				if(Dystans(2.0, playerid, BudynekInfo[h][nX], BudynekInfo[h][nY], BudynekInfo[h][nZ]) && BudynekInfo[h][nVW] == GetPlayerVirtualWorld(playerid) || Dystans(3.0, playerid, BudynekInfo[h][nXW], BudynekInfo[h][nYW], BudynekInfo[h][nZW]) && BudynekInfo[h][nVWW] == GetPlayerVirtualWorld(playerid))
				{
					id = h;
				}
			}
		}
		if(id == -1)
		{
			id = 0;
		}
	}
	else
	{
		id = vw;
	}
	if(id == -1 || id == 0)
	{
	    strdel(tekst_global, 0, 2048);
		format(tekst_global, sizeof(tekst_global), "{a9c4e4}Podaj rodzaj.\n\tRodzaj: 0/1, gdzie 0 to dom, a 1 to biznes.\n\nPAMIÊTAJ, musisz stac twarz¹ do budynku - miejsce, w którym stoisz stanie siê wejœciem.\nFormat: (rodzaj - 0/1)\n{FF0000}Uwaga: Tworzenie budynków w miejsach, w których nie ma drzwi,\nbêdzie karane skasowaniem budynku bez zwrotu pieniêdzy.");
		dShowPlayerDialog(playerid,DIALOG_DRZWI_STWORZ,DIALOG_STYLE_INPUT,"• Drzwi:",tekst_global,"Stworz","Anuluj");
		return 1;
	}
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
		format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}P{FFFFFF}rze³aduj obiekty budynku {FF0000}(NOWE)", tekst_global);
		//format(tekst_global, sizeof(tekst_global), "%s\n{DEDEDE}»  {FFE5B4}W{FFFFFF}ykonaj kopiê wnêtrza {FF0000}(NOWE)", tekst_global);
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
    return 1;
}
public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
	new nazwadrzwi[128];
	new uid = SprawdzDrzwiUID(pickupid);
	CzasWyswietlaniaTextuNaDrzwiach[playerid] = 2;
	if(BudynekInfo[uid][nTyp] == 0 || BudynekInfo[uid][nTyp] == 1 || BudynekInfo[uid][nTyp] == 4)
	{
		if(BudynekInfo[uid][nTyp] == 4)
		{
			format(nazwadrzwi, sizeof(nazwadrzwi), "%s~n~~n~~r~Uzyj przedmiotu lub~n~~n~~y~~h~wpisz /p ~n~[nazwa przedmiotu]", BudynekInfo[uid][nAdres]);
		}
		else
		{
			if(BudynekInfo[uid][nZamek] == 0)
			{
				format(nazwadrzwi, sizeof(nazwadrzwi), "%s~n~~n~~y~Drzwi sa zamkniete.", BudynekInfo[uid][nAdres]);
			}
			else
			{
			    new ilosc;
			    ForeachEx(n, MAX_PLAYERS)
				{
					if(IsPlayerConnected(n))
					{
						if(zalogowany[n] == true)
						{
							if(GetPlayerVirtualWorld(n) == uid && GetPlayerState(n) != PLAYER_STATE_SPECTATING)
							{
								ilosc++;
							}
						}
					}
				}
				if((DaneGracza[playerid][gAdmGroup] == 4 || DaneGracza[playerid][gAdmGroup] == 7 || DaneGracza[playerid][gAdmGroup] == 8) && DutyAdmina[playerid] == 1)
    			{
					format(nazwadrzwi, sizeof(nazwadrzwi), "%s (%d)~n~~n~~y~Aby wejsc, wcisnij jednoczesnie~w~~h~LEWY ALT + ~k~~PED_SPRINT~~n~~n~~w~%d osob w srodku", BudynekInfo[uid][nAdres], uid, ilosc);
				}
				else
				{
				    format(nazwadrzwi, sizeof(nazwadrzwi), "%s~n~~n~~y~Aby wejsc, wcisnij jednoczesnie~w~~h~LEWY ALT + ~k~~PED_SPRINT~~n~~n~~w~%d osob w srodku", BudynekInfo[uid][nAdres], ilosc);
				}
				if(BudynekInfo[uid][nIconaID] == 1)
				{
					if(ilosc == 0)
					{
						new typ = GrupaInfo[BudynekInfo[uid][nWlascicielD]][gTyp];
						if(typ == 1)//Policyjna
						{
						    DestroyDynamicMapIcon(BudynekInfo[uid][nUID]);
						    BudynekInfo[uid][nIconaID] = 0;
					    	ZapiszNieruchomosc(uid);
						}
						if(typ == 3)//Warsztat
						{
						    DestroyDynamicMapIcon(BudynekInfo[uid][nUID]);
						    BudynekInfo[uid][nIconaID] = 0;
					    	ZapiszNieruchomosc(uid);
						}
						if(typ == 9)//Gastronomia
						{
						    DestroyDynamicMapIcon(BudynekInfo[uid][nUID]);
						    BudynekInfo[uid][nIconaID] = 0;
					    	ZapiszNieruchomosc(uid);
						}
						if(typ == 10)//San News
						{
						    DestroyDynamicMapIcon(BudynekInfo[uid][nUID]);
						    BudynekInfo[uid][nIconaID] = 0;
					    	ZapiszNieruchomosc(uid);
						}
						if(typ == 14)//Medyczna
						{
						    DestroyDynamicMapIcon(BudynekInfo[uid][nUID]);
						    BudynekInfo[uid][nIconaID] = 0;
					    	ZapiszNieruchomosc(uid);
						}
						if(typ == 17)//Silownia
						{
						    DestroyDynamicMapIcon(BudynekInfo[uid][nUID]);
						    BudynekInfo[uid][nIconaID] = 0;
					    	ZapiszNieruchomosc(uid);
						}
						if(typ == 20)//Ochrona
						{
						    DestroyDynamicMapIcon(BudynekInfo[uid][nUID]);
						    BudynekInfo[uid][nIconaID] = 0;
					    	ZapiszNieruchomosc(uid);
						}
					}
				}
			}
		}
 	}
	else if(BudynekInfo[uid][nTyp] == 10)
	{
		format(nazwadrzwi, sizeof(nazwadrzwi), "%s~n~~n~~b~~h~~h~Zlomowisko~n~~n~~y~~h~/zlomowisko", BudynekInfo[uid][nAdres]);
	}
	else if(BudynekInfo[uid][nTyp] == 20)
	{
		format(nazwadrzwi, sizeof(nazwadrzwi), "%s~n~~n~~b~~h~~h~$%d/doba~n~~n~~y~~h~/namiot", BudynekInfo[uid][nAdres],BudynekInfo[uid][nHotel]);
	}
	else if(BudynekInfo[uid][nTyp] == -1)
	{
		//format(nazwadrzwi, sizeof(nazwadrzwi), "%s~n~~n~~b~~h~~h~$%d/doba~n~~n~~y~~h~/namiot", BudynekInfo[uid][nAdres],BudynekInfo[uid][nHotel]);
	}
 	else
 	{
 	    format(nazwadrzwi, sizeof(nazwadrzwi), "~n~~n~~b~~h~~h~%s~n~~n~~y~~h~", BudynekInfo[uid][nAdres]);
 	}
	TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
	TextDrawSetString(TextNaDrzwi[playerid], nazwadrzwi);
	TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
	return 1;
}
forward StworzDrzwi(playerid, ownerpostac, ownerdzialalnosc, adres[32], typ, pickup, Float:sx, Float:sy, Float:sz, Float:sxx, Float:syy, Float:szz, Float:m2);
public StworzDrzwi(playerid, ownerpostac, ownerdzialalnosc, adres[32], typ, pickup, Float:sx, Float:sy, Float:sz, Float:sxx, Float:syy, Float:szz, Float:m2)
{
    if(strlen(adres) >= 32) return 1;
	new Float:X, Float:Y, Float:Z, Int, Vw;
	GetPlayerPos(playerid, X, Y, Z);
	Int = GetPlayerInterior(playerid);
	Vw = GetPlayerVirtualWorld(playerid);
	new Float:angles;
	GetPlayerFacingAngle(playerid, angles);
    new itemid = GetFreeSQLUID("jochym_nieruchomosci", "ID");
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_nieruchomosci` (`ID`, `UID_POSTACI`, `ADRES`, `POWIERZCHNIA`, `TYP`, `X`, `Y`, `Z`, `VW`, `INT`, `XW`, `YW`, `ZW`, `VWW`, `INTW`, `STWORZONYCH_OBIEKTOW`, `PICKUP`, `UKRYTY`, `PRZEJAZD`, `URL`, `MX`, `MY`, `MZ`, `MXX`, `MYY`, `MZZ`, `A`, `AW`, `Area`) VALUES ('%d', '%d', '%s', '%f', '%d', '%f', '%f', '%f', '%d', '%d', '%f', '%f', '%f', '%d', '%d', '%d', '%d', '%d', '%d', '%s', '%f', '%f', '%f', '%f', '%f', '%f', '%f', '%f', '%d')",
	itemid, ownerpostac, adres, m2, typ, X, Y, Z, Vw, Int, 501.957794, -70.564796, 998.757812, itemid, 11, 0, pickup, 0, 0, "Brak plyty w systemie audio.", sx, sy, sz, sxx, syy, szz, angles, 0, GraczNaTerenie(playerid));
	mysql_check();
	mysql_query2(zapyt);
	format(zapyt2, sizeof(zapyt2), "INSERT INTO `jochym_elektryka` (`ID_NIERUCHOMOSCI`) VALUES ('%d')",
	itemid);
	mysql_check();
	mysql_query2(zapyt2);
	BudynekInfo[itemid][naw] = 0;
	BudynekInfo[itemid][na] = angles;
	BudynekInfo[itemid][nXW] = sx;
    BudynekInfo[itemid][nYW] = sy;
    BudynekInfo[itemid][nZW] = sz;
	BudynekInfo[itemid][nVWW] = itemid;
	format(BudynekInfo[itemid][nAdres], 50, "%s", adres);
	BudynekInfo[itemid][nUID] = itemid;
	BudynekInfo[itemid][nWlascicielP] = ownerpostac;
	BudynekInfo[itemid][nWlascicielD] = ownerdzialalnosc;
	BudynekInfo[itemid][nPowieszchnia] = m2;
	BudynekInfo[itemid][nTyp] = typ;
	BudynekInfo[itemid][nLiczbaMebli] = 0;
	BudynekInfo[itemid][nX] = X;
	BudynekInfo[itemid][nY] = Y;
	BudynekInfo[itemid][nZ] = Z;
	BudynekInfo[itemid][nVW] = Vw;
	BudynekInfo[itemid][nINT] = Int;
	BudynekInfo[itemid][nStworzoneObiekty] = 0;
	BudynekInfo[itemid][nPickup] = pickup;
	BudynekInfo[itemid][nUkryty] = 0;
	BudynekInfo[itemid][nZamek] = 0;
	BudynekInfo[itemid][nPrzejazd] = 0;
	format(BudynekInfo[itemid][nRadio], 100, "Brak plyty w systemie audio.");
	BudynekInfo[itemid][nSzafa] = -1;
	BudynekInfo[itemid][nAudio] = -1;
	BudynekInfo[itemid][nMX][0] = sx;
	BudynekInfo[itemid][nMY][0] = sy;
	BudynekInfo[itemid][nMZ][0] = sz;
	BudynekInfo[itemid][nMX][1] = sxx;
	BudynekInfo[itemid][nMY][1] = syy;
	BudynekInfo[itemid][nMZ][1] = szz;
	BudynekInfo[itemid][nSwiatlo] = 0;
	BudynekInfo[itemid][nMapa] = 0;
	BudynekInfo[itemid][nIRX] = 0;
	BudynekInfo[itemid][nIRY] = 0;
	BudynekInfo[itemid][nIRZ] = 0;
	BudynekInfo[itemid][nORX] = 0;
	BudynekInfo[itemid][nORY] = 0;
	BudynekInfo[itemid][nORZ] = 0;
	BudynekInfo[itemid][nHaracz] = 0;
	BudynekInfo[itemid][nHaraczC] = 0;
	BudynekInfo[itemid][nIR] = 0;
	BudynekInfo[itemid][nPickupUkryty] = 0;
	BudynekInfo[itemid][nArea] = GraczNaTerenie(playerid);
	BudynekInfo[itemid][nNagroda] = 0;
	BudynekInfo[itemid][nID] = CreateDynamicPickup(BudynekInfo[itemid][nPickup], 1, BudynekInfo[itemid][nX], BudynekInfo[itemid][nY], BudynekInfo[itemid][nZ], BudynekInfo[itemid][nVW]);
	ZapiszNieruchomosc(itemid);
	new logtekst[256];
	format(logtekst, sizeof(logtekst), "[DOOR] [%s] [ID: %d] Buy new door %s, meters %.2f, types %d", ZmianaNicku(playerid), playerid, adres, m2, typ);
	Transakcja(T_CDRZWI, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
	mysql_free_result();
	return itemid;
}
forward SprawdzDrzwiUID(uid);
public SprawdzDrzwiUID(uid)
{
	for(new i = 1;i < MAX_NIERUCHOMOSCI; i++)
		if(BudynekInfo[i][nID] == uid)
			return i;
	return 1;
}
forward ZaladujNieruchomosci();
public ZaladujNieruchomosci()
{
	new result[1024], i = 0;
    format(zapyt, sizeof(zapyt), "SELECT * FROM `jochym_nieruchomosci`");
    mysql_check();
	mysql_query2(zapyt);
    mysql_store_result();
    while(mysql_fetch_row(result))
	{
	    new uid, zero[248];
    	sscanf(result, "p<|>d", uid);
		sscanf(result,  "p<|>ddds[50]fdds[50]ds[20]fffddfffdddddds[50]ddddffffffdffdddffffffdddddd", BudynekInfo[uid][nUID],
		    BudynekInfo[uid][nWlascicielP],
		    BudynekInfo[uid][nWlascicielD],
		    BudynekInfo[uid][nAdres],
		    BudynekInfo[uid][nPowieszchnia],
			BudynekInfo[uid][nTyp],
			BudynekInfo[uid][nOdpis],
			zero,
			BudynekInfo[uid][nLiczbaMebli],
			zero,
			BudynekInfo[uid][nX],
			BudynekInfo[uid][nY],
			BudynekInfo[uid][nZ],
			BudynekInfo[uid][nVW],
		    BudynekInfo[uid][nINT],
			BudynekInfo[uid][nXW],
			BudynekInfo[uid][nYW],
			BudynekInfo[uid][nZW],
			BudynekInfo[uid][nVWW],
		    BudynekInfo[uid][nINTW],
			zero,
			BudynekInfo[uid][nPickup],
		    BudynekInfo[uid][nUkryty],
		    BudynekInfo[uid][nPrzejazd],
			BudynekInfo[uid][nRadio],
			BudynekInfo[uid][nSzafa],
		    BudynekInfo[uid][nAudio],
		    BudynekInfo[uid][nZamek],
			BudynekInfo[uid][nLiczbaNapisow],
			BudynekInfo[uid][nMX][0],
			BudynekInfo[uid][nMY][0],
			BudynekInfo[uid][nMZ][0],
			BudynekInfo[uid][nMX][1],
			BudynekInfo[uid][nMY][1],
			BudynekInfo[uid][nMZ][1],
			BudynekInfo[uid][nSwiatlo],
			BudynekInfo[uid][na],
			BudynekInfo[uid][naw],
			BudynekInfo[uid][nMapa],
			BudynekInfo[uid][nHotel],
			BudynekInfo[uid][nOplata],
			BudynekInfo[uid][nIRX],
			BudynekInfo[uid][nIRY],
			BudynekInfo[uid][nIRZ],
			BudynekInfo[uid][nORX],
			BudynekInfo[uid][nORY],
			BudynekInfo[uid][nORZ],
			BudynekInfo[uid][nHaracz],
			BudynekInfo[uid][nHaraczC],
			BudynekInfo[uid][nIR],
			BudynekInfo[uid][nPickupUkryty],
			BudynekInfo[uid][nArea],
			BudynekInfo[uid][nNagroda]);
		if(BudynekInfo[uid][nVW] != 0)
		{
			BudynekInfo[uid][nOplata] = -1;
		}
		BudynekInfo[uid][nID] = CreateDynamicPickup(BudynekInfo[uid][nPickup], 1, BudynekInfo[uid][nX], BudynekInfo[uid][nY], BudynekInfo[uid][nZ], BudynekInfo[uid][nVW]);
		i++;
	}
	mysql_free_result();
	printf("Nieruchomosci       - %d", i);
}
stock DrzwiWBudynku(uid, Float:x, Float:y, Float:z)
{
	new highestx, highesty, lowestx, lowesty;
	new retarn = 1;
	if(BudynekInfo[uid][nMX][0] > BudynekInfo[uid][nMX][1])
	{
		highestx = 0;
		lowestx = 1;
	}
	else if(BudynekInfo[uid][nMX][0] < BudynekInfo[uid][nMX][1])
	{
		highestx = 1;
		lowestx = 0;
	}
	if(BudynekInfo[uid][nMY][0] > BudynekInfo[uid][nMY][1])
	{
		highesty = 0;
		lowesty = 1;
	}
	else if(BudynekInfo[uid][nMY][0] < BudynekInfo[uid][nMY][1])
	{
		highesty = 1;
		lowesty = 0;
	}
	if(BudynekInfo[uid][nMX][highestx] > x && BudynekInfo[uid][nMX][lowestx] < x)
	{
	    if(BudynekInfo[uid][nMY][highesty] > y && BudynekInfo[uid][nMY][lowesty] < y)
		{
		    if(z >= BudynekInfo[uid][nMZ][0]-2 && z <= BudynekInfo[uid][nMZ][1]+2)
			{
				retarn = 2;
			}
		}
 	}
	return retarn;
}
stock GraczWBudynku(playerid, uid)
{
	new highestx, highesty, lowestx, lowesty;
	new retarn = 1;
	if(BudynekInfo[uid][nMX][0] > BudynekInfo[uid][nMX][1])
	{
		highestx = 0;
		lowestx = 1;
	}
	else if(BudynekInfo[uid][nMX][0] < BudynekInfo[uid][nMX][1])
	{
		highestx = 1;
		lowestx = 0;
	}
	if(BudynekInfo[uid][nMY][0] > BudynekInfo[uid][nMY][1])
	{
		highesty = 0;
		lowesty = 1;
	}
	else if(BudynekInfo[uid][nMY][0] < BudynekInfo[uid][nMY][1])
	{
		highesty = 1;
		lowesty = 0;
	}
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	if(BudynekInfo[uid][nMX][highestx] > x && BudynekInfo[uid][nMX][lowestx] < x)
	{
	    if(BudynekInfo[uid][nMY][highesty] > y && BudynekInfo[uid][nMY][lowesty] < y)
		{
		    if(z >= BudynekInfo[uid][nMZ][0]-2 && z <= BudynekInfo[uid][nMZ][1]+2)
			{
				retarn = 2;
			}
		}
 	}
	return retarn;
}
forward ZapiszNieruchomosc(uid);
public ZapiszNieruchomosc(uid)
{
	strdel(zapyt, 0, 1024);
	format(zapyt, sizeof(zapyt), "UPDATE `jochym_nieruchomosci` SET `UID_POSTACI` = '%d', `UID_DZIALALNOSCI` = '%d', `ADRES` = '%s', `POWIERZCHNIA` = '%f', `TYP` = '%d', `LICZBA_MEBLI` = '%d', `X` = '%f', `Y` = '%f', `Z` = '%f', `VW` = '%d', `INT` = '%d', `XW` = '%f', `YW` = '%f', `ZW` = '%f', `VWW` = '%d', `INTW` = '%d', `STWORZONYCH_OBIEKTOW` = '%d', `PICKUP` = '%d', `UKRYTY` = '%d', `PRZEJAZD` = '%d', `URL` = '%s', `AUDIO` = '%d', `ZAMEK` = '%d', `LNAPISOW` = '%d' WHERE `ID` = '%d'",
	BudynekInfo[uid][nWlascicielP],
	BudynekInfo[uid][nWlascicielD],
	BudynekInfo[uid][nAdres],
	BudynekInfo[uid][nPowieszchnia],
	BudynekInfo[uid][nTyp],
	BudynekInfo[uid][nLiczbaMebli],
	BudynekInfo[uid][nX],
	BudynekInfo[uid][nY],
	BudynekInfo[uid][nZ],
	BudynekInfo[uid][nVW],
	BudynekInfo[uid][nINT],
	BudynekInfo[uid][nXW],
	BudynekInfo[uid][nYW],
	BudynekInfo[uid][nZW],
	BudynekInfo[uid][nVWW],
	BudynekInfo[uid][nINTW],
	BudynekInfo[uid][nStworzoneObiekty],
	BudynekInfo[uid][nPickup],
	BudynekInfo[uid][nUkryty],
	BudynekInfo[uid][nPrzejazd],
	BudynekInfo[uid][nRadio],
	BudynekInfo[uid][nAudio],
	BudynekInfo[uid][nZamek],
	BudynekInfo[uid][nLiczbaNapisow],
	uid);
	mysql_check();
	mysql_query2(zapyt);
	mysql_free_result();

	strdel(zapyt, 0, 1024);
	format(zapyt, sizeof(zapyt), "UPDATE `jochym_nieruchomosci` SET `ODPIS` = '%d', `MX` = '%f', `MY` = '%f', `MZ` = '%f', `MXX` = '%f', `MYY` = '%f', `MZZ` = '%f', `SWIATLO` = '%d', `A` = '%f', `AW` = '%f', `Mapa` = '%d', `OPLATA` = '%d', `IRX` = '%f', `IRY` = '%f', `IRZ` = '%f', `ORX` = '%f', `ORY` = '%f', `ORZ` = '%f', `Haracz` = '%d', `HaraczC` = '%d', `IR` = '%d', `PICKUPUKRYTY` = '%d', `Area` = '%d', `Nagroda` = '%d' WHERE `ID` = '%d'",
	BudynekInfo[uid][nOdpis],
	BudynekInfo[uid][nMX][0],
	BudynekInfo[uid][nMY][0],
	BudynekInfo[uid][nMZ][0],
	BudynekInfo[uid][nMX][1],
	BudynekInfo[uid][nMY][1],
	BudynekInfo[uid][nMZ][1],
	BudynekInfo[uid][nSwiatlo],
	BudynekInfo[uid][na],
	BudynekInfo[uid][naw],
	BudynekInfo[uid][nMapa],
	BudynekInfo[uid][nOplata],
	BudynekInfo[uid][nIRX],
	BudynekInfo[uid][nIRY],
	BudynekInfo[uid][nIRZ],
	BudynekInfo[uid][nORX],
	BudynekInfo[uid][nORY],
	BudynekInfo[uid][nORZ],
	BudynekInfo[uid][nHaracz],
	BudynekInfo[uid][nHaraczC],
	BudynekInfo[uid][nIR],
	BudynekInfo[uid][nPickupUkryty],
	BudynekInfo[uid][nArea],
	BudynekInfo[uid][nNagroda],
	uid);
	mysql_check();
	mysql_query2(zapyt);
	mysql_free_result();
	return 1;
}
stock UaktualnijObiektyWBudynku(vw)
{
	new sql3[200];
	format(sql3, sizeof(sql3), "SELECT `LICZBA_MEBLI`, `STWORZONYCH_OBIEKTOW` FROM `jochym_nieruchomosci` WHERE `ID` = '%d'", vw);
	mysql_query(sql3);
	mysql_store_result();
	mysql_fetch_row(sql3);
	sscanf(sql3, "p<|>dd", BudynekInfo[vw][nLiczbaMebli],BudynekInfo[vw][nStworzoneObiekty]);
	return 1;
}
forward UsunNieruchomosc(uid);
public UsunNieruchomosc(uid)
{
    new sql[100];
	format( sql, sizeof( sql ), "DELETE FROM `jochym_nieruchomosci` WHERE `ID` = %d", uid );
	mysql_query( sql );
	DestroyDynamicMapIcon(BudynekInfo[uid][nIconaID]);
	ForeachEx(n, BudynekInfo[uid][nStworzoneObiekty])
	{
		UsunObiekt(BudynekInfo[uid][nObiekty][n]);
	}
	DestroyDynamicPickup(BudynekInfo[uid][nID]);
	BudynekInfo[uid][nID] = 0;
	BudynekInfo[uid][nWlascicielP] = 0;
	BudynekInfo[uid][nWlascicielD] = 0;
	BudynekInfo[uid][nAdres] = 0;
	BudynekInfo[uid][nPowieszchnia] = 0;
	BudynekInfo[uid][nTyp] = 0;
	BudynekInfo[uid][nLiczbaMebli] = 0;
	BudynekInfo[uid][nX] = 0;
	BudynekInfo[uid][nY] = 0;
	BudynekInfo[uid][nZ] = 0;
	BudynekInfo[uid][nVW] = 0;
	BudynekInfo[uid][nINT] = 0;
	BudynekInfo[uid][nXW] = 0;
	BudynekInfo[uid][nYW] = 0;
	BudynekInfo[uid][nZW] = 0;
	BudynekInfo[uid][nVWW] = 0;
	BudynekInfo[uid][nINTW] = 0;
	BudynekInfo[uid][nStworzoneObiekty] = 0;
	BudynekInfo[uid][nPickup] = 0;
	BudynekInfo[uid][nUkryty] = 0;
	BudynekInfo[uid][nPrzejazd] = 0;
	BudynekInfo[uid][nRadio] = 0;
	BudynekInfo[uid][nSzafa] = 0;
	BudynekInfo[uid][nAudio] = 0;
	BudynekInfo[uid][nZamek] = 0;
	BudynekInfo[uid][nLiczbaNapisow] = 0;
	BudynekInfo[uid][nOdpis] = 0;
	BudynekInfo[uid][nMX][0] = 0;
	BudynekInfo[uid][nMY][0] = 0;
	BudynekInfo[uid][nMZ][0] = 0;
	BudynekInfo[uid][nMX][1] = 0;
	BudynekInfo[uid][nMY][1] = 0;
	BudynekInfo[uid][nMZ][1] = 0;
	BudynekInfo[uid][nSwiatlo] = 0;
	BudynekInfo[uid][na] = 0;
	BudynekInfo[uid][naw] = 0;
	BudynekInfo[uid][nMapa] = 0;
	BudynekInfo[uid][nIRX] = 0;
	BudynekInfo[uid][nIRY] = 0;
	BudynekInfo[uid][nIRZ] = 0;
	BudynekInfo[uid][nORX] = 0;
	BudynekInfo[uid][nORY] = 0;
	BudynekInfo[uid][nORZ] = 0;
	BudynekInfo[uid][nHaracz] = 0;
	BudynekInfo[uid][nHaraczC] = 0;
	BudynekInfo[uid][nIR] = 0;
	BudynekInfo[uid][nPickupUkryty] = 0;
	BudynekInfo[uid][nArea] = 0;
	BudynekInfo[uid][nNagroda] = 0;
	return 1;
}

stock BramkiPiszczace(playerid)
{
	new id_budynku = GetPlayerVirtualWorld(playerid), uids = 0, Float:radius = 3, tak = 0;
	if(id_budynku != 0)
	{
		for(new i = 0; i < 2048; i++)
		{
			if(uids == 0)
			{
				ForeachEx(h, BudynekInfo[id_budynku][nStworzoneObiekty])
				{
					if(Dystans(radius, playerid, ObiektInfo[BudynekInfo[id_budynku][nObiekty][h]][objPozX],ObiektInfo[BudynekInfo[id_budynku][nObiekty][h]][objPozY],ObiektInfo[BudynekInfo[id_budynku][nObiekty][h]][objPozZ]) && ObiektInfo[BudynekInfo[id_budynku][nObiekty][h]][objModel] == 2412)
					{
						uids = BudynekInfo[id_budynku][nObiekty][h];
						break;
					}
				}
				radius += 0.5;
			}
			else
			{
				tak = 1;
			}
		}
		if(tak == 1)
		{
			new PosiadaBron = 0;
			ForeachEx(eq, MAX_PRZEDMIOT)
			{
				if(PrzedmiotInfo[eq][pOwner] == DaneGracza[playerid][gUID] && PrzedmiotInfo[eq][pUID] != 0 && PrzedmiotInfo[eq][pTypWlas] == TYP_WLASCICIEL && PrzedmiotInfo[eq][pTyp] == 1 && PrzedmiotInfo[eq][pWar1] >= 22 && PrzedmiotInfo[eq][pWar1] <= 34)
				{
					PosiadaBron = 1;
				}
			}
			if(PosiadaBron == 1)
			{
				new akcja[128];
				ForeachEx(id, MAX_PLAYERS)
				{
					if(IsPlayerInRangeOfPoint(id, 50.0, BudynekInfo[id_budynku][nXW], BudynekInfo[id_budynku][nYW], BudynekInfo[id_budynku][nZW]) && id != playerid)
					{
						format(akcja, sizeof(akcja), "** Bramka wykrywaj¹ca metal uaktywni³a siê - s³ychac sygna³. **");
						SendClientMessage(id, KOLOR_DO, akcja);
						Transakcja(T_DO, DaneGracza[id][gUID], -1, DaneGracza[id][gGUID], -1, -1, -1, -1, -1, akcja, gettime()+KOREKTA_CZASOWA);
					}
				}
				format(akcja, sizeof(akcja), "** Bramka wykrywaj¹ca metal uaktywni³a siê - s³ychac sygna³. **");
				SendClientMessage(playerid, KOLOR_DO, akcja);
				return 1;
			}
		}
	}
	return 1;
}
