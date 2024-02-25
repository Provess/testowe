AntiDeAMX();

forward CornerAktorDel(playerid, id);
public CornerAktorDel(playerid, id)
{
	new Float:x = -2877;
	new Float:y = 2808;
	new Float:z = 252;
	new Float:ang = 227;
    SetDynamicActorPos(Bot[id][bID], x, y, z);
    SetDynamicActorFacingAngle(Bot[id][bID], ang);
	SetDynamicActorVirtualWorld(Bot[id][bID], GetPlayerVirtualWorld(playerid));
	Bot[id][bX] = x;
	Bot[id][bY] = y;
	Bot[id][bZ] = z;
	Bot[id][bRot] = ang;
	Bot[id][bVW] = GetPlayerVirtualWorld(playerid);
	ZapiszBota(id);
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
	    ApplyDynamicActorAnimation(Bot[id][bID], "DANCING", "DAN_left_A", 4.1, 0, 1, 1, 1, 1);//tancz7
	}
	if(Bot[id][bAnim] == 11)
	{
	    ApplyDynamicActorAnimation(Bot[id][bID], "PED", "IDLE_HBHB", 4.1, 0, 1, 1, 1, 1);//koks
	}
	if(Bot[id][bAnim] == 12)
	{
	    ApplyDynamicActorAnimation(Bot[id][bID], "GRAVEYARD", "mrnF_loop", 4.1, 0, 1, 1, 1, 1);//cry
	}
	return 1;
}

forward CornerAktor(playerid, id);
public CornerAktor(playerid, id)
{
    new Float:x, Float:y, Float:z, Float:ang;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, ang);
	GetXYInFrontOfPoint(x, y, ang+180, 1.2);
    SetDynamicActorPos(Bot[id][bID], x, y, z);
    SetDynamicActorFacingAngle(Bot[id][bID], ang);
	SetDynamicActorVirtualWorld(Bot[id][bID], GetPlayerVirtualWorld(playerid));
	Bot[id][bX] = x;
	Bot[id][bY] = y;
	Bot[id][bZ] = z;
	Bot[id][bRot] = ang;
	Bot[id][bVW] = GetPlayerVirtualWorld(playerid);
	ZapiszBota(id);
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
	    ApplyDynamicActorAnimation(Bot[id][bID], "DANCING", "DAN_left_A", 4.1, 0, 1, 1, 1, 1);//tancz7
	}
	if(Bot[id][bAnim] == 11)
	{
	    ApplyDynamicActorAnimation(Bot[id][bID], "PED", "IDLE_HBHB", 4.1, 0, 1, 1, 1, 1);//koks
	}
	if(Bot[id][bAnim] == 12)
	{
	    ApplyDynamicActorAnimation(Bot[id][bID], "GRAVEYARD", "mrnF_loop", 4.1, 0, 1, 1, 1, 1);//cry
	}
	return 1;
}

forward Cornery(i);
public Cornery(i)
{
 	ForeachEx(id, MAX_CORNER)
 	{
	    if(IsPlayerInRangeOfPoint(i, 3.0, Corner[id][cX], Corner[id][cY], Corner[id][cZ]))
	    {
	        if(GetPVarInt(i, "CornerTime") >= 3)
	        {
	            if(GetPVarInt(i, "AktorZajety") == 0)
	            {
		            CornerAktor(i, 2);
		            OdladujBoty();
					ZaladujBoty();
		            new string[512];
		            format(string, sizeof(string), "Nieznajomy mówi: Siemanko, jestes w stanie zarzucic mi jakiœ proch? Strasznie mnie nos swedzi, yhh.");
			        CzatGlobalny(i, string, 3);
			        format(string, sizeof(string), "[...] poœpiesz siê bo mam g³ód ryju, kumasz?!");
			        CzatGlobalny(i, string, 3);
	                format(string, sizeof(string), "*Nieznajomy spogl¹da na goœcia przed sob¹ niepewnym wzrokiem przy czym delikatnie pociaga nosem*");
					SendWrappedMessageToPlayerRange(i, FIOLETOWY, string, 10);
					GameTextForPlayer(i, "~r~Wybierz co chcesz sprzedac w takiej cenie!", 3000, 5);
					PrzedmiotyNarko(i, i, DIALOG_CORNER_SELL, "• Corner - Sprzedaj narkotyk:", TYP_WLASCICIEL, 0);
					SetPVarInt(i, "AktorZajety", 2);
		            return 1;
				}
	        }
	        else
	        {
				GameTextForPlayer(i, "~r~Stoisz na Cornerze, czekaj na klienta!", 3000, 5);
				SetPVarInt(i, "CornerTime", GetPVarInt(i, "CornerTime")+1);
				return 1;
			}
	    }
	}
	return 1;
}

forward PayDay(i);
public PayDay(i)
{
    new grupa1, grupa2, grupa3, grupa4, grupa5, grupa6;
    grupa1 = GetPVarInt(i, "w1")+DaneGracza[i][gPrzynaleznosci][1];
    grupa2 = GetPVarInt(i, "w2")+DaneGracza[i][gPrzynaleznosci][7];
    grupa3 = GetPVarInt(i, "w3")+DaneGracza[i][gPrzynaleznosci][13];
    grupa4 = GetPVarInt(i, "w4")+DaneGracza[i][gPrzynaleznosci][19];
    grupa5 = GetPVarInt(i, "w5")+DaneGracza[i][gPrzynaleznosci][25];
	grupa6 = GetPVarInt(i, "w6")+DaneGracza[i][gPrzynaleznosci][31];
	new Wyplata = 30;
	new wynagrodzeniepubliczne = 1050;
	new wynagrodzenieprzestepcze = 750;
	new wynagrodzeniebiznesy = 920;
	new wynagrodzeniedodatkowe = 50;
	new Grupa = GrupaInfo[DaneGracza[i][gSluzba]][gTyp];
	new payday[256];
	if(DaneGracza[i][gSluzba] != 0)
	{
		if(GrupaInfo[DaneGracza[i][gSluzba]][gTyp] != DZIALALNOSC_RODZINKA)
		{
			if(Wyplata <= grupa1 / 60)
			{
				if(DaneGracza[i][gSluzba] == DaneGracza[i][gDzialalnosc1])
				{
					if(DaneGracza[i][gPayDay] < gettime()+CZAS_LETNI)
					{
						if(Grupa == DZIALALNOSC_POLICYJNA  || Grupa == DZIALALNOSC_MEDYCZNA || Grupa == DZIALALNOSC_RZADOWA)
						{
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzeniepubliczne);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzeniepubliczne;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzeniepubliczne, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's public %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzeniepubliczne, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w1", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
						if(Grupa == DZIALALNOSC_ZMOTORYZOWANA || Grupa == DZIALALNOSC_MAFIE || Grupa == DZIALALNOSC_GANGI)
						{
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzenieprzestepcze);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzenieprzestepcze;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzenieprzestepcze, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's criminal %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzenieprzestepcze, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w1", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
						if(Grupa == DZIALALNOSC_WARSZTAT || Grupa == DZIALALNOSC_ELEKTRTYKA || Grupa == DZIALALNOSC_GASTRONOMIA || Grupa == DZIALALNOSC_SANNEWS || Grupa == DZIALALNOSC_TAXI|| Grupa == DZIALALNOSC_SILOWNIA|| Grupa == DZIALALNOSC_WYPOZYCZALNIA || Grupa == DZIALALNOSC_STRZELNICA || Grupa == DZIALALNOSC_AMUNATION || Grupa == DZIALALNOSC_TATUAZ)
						{
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzeniebiznesy);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzeniebiznesy;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzeniebiznesy, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's busines %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzeniebiznesy, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w1", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
					}
					else
					{
						format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzeniedodatkowe);
						SendClientMessage(i, SZARY, payday);
						DaneGracza[i][gSTAN_KONTA] += wynagrodzeniedodatkowe;
						ZapiszBankKasa(i);
						DodajHistorie(5, DaneGracza[i][gUID], wynagrodzeniedodatkowe, gettime()+CZAS_LETNI);
						PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
						new logtekst[256];
						format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's busines %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzeniedodatkowe, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
						Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
						SetPVarInt(i, "w1", 0);
						WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
						ZapiszGracza(i);
						return 1;
					}
				}
			}
			if(Wyplata <= grupa2 / 60)
			{
				if(DaneGracza[i][gSluzba] == DaneGracza[i][gDzialalnosc2])
				{
					if(DaneGracza[i][gPayDay2] < gettime()+CZAS_LETNI)
					{
						if(Grupa == DZIALALNOSC_POLICYJNA  || Grupa == DZIALALNOSC_MEDYCZNA || Grupa == DZIALALNOSC_RZADOWA)
						{
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzeniepubliczne);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzeniepubliczne;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzeniepubliczne, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's public %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzeniepubliczne, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w2", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay2] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
						if(Grupa == DZIALALNOSC_ZMOTORYZOWANA || Grupa == DZIALALNOSC_MAFIE || Grupa == DZIALALNOSC_GANGI)
						{
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzenieprzestepcze);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzenieprzestepcze;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzenieprzestepcze, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's criminal %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzenieprzestepcze, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w2", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay2] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
						if(Grupa == DZIALALNOSC_WARSZTAT || Grupa == DZIALALNOSC_ELEKTRTYKA || Grupa == DZIALALNOSC_GASTRONOMIA || Grupa == DZIALALNOSC_SANNEWS || Grupa == DZIALALNOSC_TAXI|| Grupa == DZIALALNOSC_SILOWNIA|| Grupa == DZIALALNOSC_WYPOZYCZALNIA || Grupa == DZIALALNOSC_STRZELNICA || Grupa == DZIALALNOSC_AMUNATION || Grupa == DZIALALNOSC_TATUAZ)
						{
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzeniebiznesy);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzeniebiznesy;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzeniebiznesy, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's busines %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzeniebiznesy, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w2", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay2] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
					}
					else
					{
						format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzeniedodatkowe);
						SendClientMessage(i, SZARY, payday);
						DaneGracza[i][gSTAN_KONTA] += wynagrodzeniedodatkowe;
						ZapiszBankKasa(i);
						DodajHistorie(5, DaneGracza[i][gUID], wynagrodzeniedodatkowe, gettime()+CZAS_LETNI);
						PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
						new logtekst[256];
						format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's busines %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzeniedodatkowe, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
						Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
						SetPVarInt(i, "w2", 0);
						WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
						ZapiszGracza(i);
						return 1;
					}
				}
			}
			if(Wyplata <= grupa3 / 60)
			{
				if(DaneGracza[i][gSluzba] == DaneGracza[i][gDzialalnosc3])
				{
					if(DaneGracza[i][gPayDay3] < gettime()+CZAS_LETNI)
					{
						if(Grupa == DZIALALNOSC_POLICYJNA  || Grupa == DZIALALNOSC_MEDYCZNA || Grupa == DZIALALNOSC_RZADOWA)
						{
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzeniepubliczne);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzeniepubliczne;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzeniepubliczne, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's public %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzeniepubliczne, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w3", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay3] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
						if(Grupa == DZIALALNOSC_ZMOTORYZOWANA || Grupa == DZIALALNOSC_MAFIE || Grupa == DZIALALNOSC_GANGI)
						{
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzenieprzestepcze);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzenieprzestepcze;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzenieprzestepcze, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's criminal %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzenieprzestepcze, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w3", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay3] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
						if(Grupa == DZIALALNOSC_WARSZTAT || Grupa == DZIALALNOSC_ELEKTRTYKA || Grupa == DZIALALNOSC_GASTRONOMIA || Grupa == DZIALALNOSC_SANNEWS || Grupa == DZIALALNOSC_TAXI|| Grupa == DZIALALNOSC_SILOWNIA|| Grupa == DZIALALNOSC_WYPOZYCZALNIA || Grupa == DZIALALNOSC_STRZELNICA || Grupa == DZIALALNOSC_AMUNATION || Grupa == DZIALALNOSC_TATUAZ)
						{
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzeniebiznesy);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzeniebiznesy;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzeniebiznesy, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's busines %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzeniebiznesy, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w3", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay3] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
					}
					else
					{
						format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzeniedodatkowe);
						SendClientMessage(i, SZARY, payday);
						DaneGracza[i][gSTAN_KONTA] += wynagrodzeniedodatkowe;
						ZapiszBankKasa(i);
						DodajHistorie(5, DaneGracza[i][gUID], wynagrodzeniedodatkowe, gettime()+CZAS_LETNI);
						PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
						new logtekst[256];
						format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's busines %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzeniedodatkowe, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
						Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
						SetPVarInt(i, "w3", 0);
						WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
						ZapiszGracza(i);
						return 1;
					}
				}
			}
			if(Wyplata <= grupa4 / 60)
			{
				if(DaneGracza[i][gSluzba] == DaneGracza[i][gDzialalnosc4])
				{
					if(DaneGracza[i][gPayDay4] < gettime()+CZAS_LETNI)
					{
						if(Grupa == DZIALALNOSC_POLICYJNA  || Grupa == DZIALALNOSC_MEDYCZNA || Grupa == DZIALALNOSC_RZADOWA)
						{
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzeniepubliczne);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzeniepubliczne;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzeniepubliczne, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's public %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzeniepubliczne, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w4", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay4] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
						if(Grupa == DZIALALNOSC_ZMOTORYZOWANA || Grupa == DZIALALNOSC_MAFIE || Grupa == DZIALALNOSC_GANGI)
						{
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzenieprzestepcze);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzenieprzestepcze;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzenieprzestepcze, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's criminal %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzenieprzestepcze, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w4", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay4] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
						if(Grupa == DZIALALNOSC_WARSZTAT || Grupa == DZIALALNOSC_ELEKTRTYKA || Grupa == DZIALALNOSC_GASTRONOMIA || Grupa == DZIALALNOSC_SANNEWS || Grupa == DZIALALNOSC_TAXI|| Grupa == DZIALALNOSC_SILOWNIA|| Grupa == DZIALALNOSC_WYPOZYCZALNIA || Grupa == DZIALALNOSC_STRZELNICA || Grupa == DZIALALNOSC_AMUNATION || Grupa == DZIALALNOSC_TATUAZ)
						{
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzeniebiznesy);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzeniebiznesy;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzeniebiznesy, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's busines %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzeniebiznesy, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w4", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay4] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
					}
					else
					{
						format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzeniedodatkowe);
						SendClientMessage(i, SZARY, payday);
						DaneGracza[i][gSTAN_KONTA] += wynagrodzeniedodatkowe;
						ZapiszBankKasa(i);
						DodajHistorie(5, DaneGracza[i][gUID], wynagrodzeniedodatkowe, gettime()+CZAS_LETNI);
						PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
						new logtekst[256];
						format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's busines %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzeniedodatkowe, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
						Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
						SetPVarInt(i, "w4", 0);
						WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
						ZapiszGracza(i);
						return 1;
					}
				}
			}
			if(Wyplata <= grupa5 / 60)
			{
				if(DaneGracza[i][gSluzba] == DaneGracza[i][gDzialalnosc5])
				{
					if(DaneGracza[i][gPayDay5] < gettime()+CZAS_LETNI)
					{
						if(Grupa == DZIALALNOSC_POLICYJNA  || Grupa == DZIALALNOSC_MEDYCZNA || Grupa == DZIALALNOSC_RZADOWA)
						{
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzeniepubliczne);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzeniepubliczne;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzeniepubliczne, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's public %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzeniepubliczne, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w5", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay5] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
						if(Grupa == DZIALALNOSC_ZMOTORYZOWANA || Grupa == DZIALALNOSC_MAFIE || Grupa == DZIALALNOSC_GANGI)
						{
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzenieprzestepcze);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzenieprzestepcze;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzenieprzestepcze, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's criminal %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzenieprzestepcze, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w5", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay5] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
						if(Grupa == DZIALALNOSC_WARSZTAT || Grupa == DZIALALNOSC_ELEKTRTYKA || Grupa == DZIALALNOSC_GASTRONOMIA || Grupa == DZIALALNOSC_SANNEWS || Grupa == DZIALALNOSC_TAXI|| Grupa == DZIALALNOSC_SILOWNIA|| Grupa == DZIALALNOSC_WYPOZYCZALNIA || Grupa == DZIALALNOSC_STRZELNICA || Grupa == DZIALALNOSC_AMUNATION || Grupa == DZIALALNOSC_TATUAZ)
						{
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzeniebiznesy);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzeniebiznesy;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzeniebiznesy, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's busines %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzeniebiznesy, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w5", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay5] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
					}
					else
					{
						format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzeniedodatkowe);
						SendClientMessage(i, SZARY, payday);
						DaneGracza[i][gSTAN_KONTA] += wynagrodzeniedodatkowe;
						ZapiszBankKasa(i);
						DodajHistorie(5, DaneGracza[i][gUID], wynagrodzeniedodatkowe, gettime()+CZAS_LETNI);
						PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
						new logtekst[256];
						format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's busines %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzeniedodatkowe, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
						Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
						SetPVarInt(i, "w5", 0);
						WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
						ZapiszGracza(i);
						return 1;
					}
				}
			}
			if(Wyplata <= grupa6 / 60)
			{
				if(DaneGracza[i][gSluzba] == DaneGracza[i][gDzialalnosc6])
				{
					if(DaneGracza[i][gPayDay6] < gettime()+CZAS_LETNI)
					{
						if(Grupa == DZIALALNOSC_POLICYJNA  || Grupa == DZIALALNOSC_MEDYCZNA || Grupa == DZIALALNOSC_RZADOWA)
						{
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzeniepubliczne);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzeniepubliczne;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzeniepubliczne, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's public %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzeniepubliczne, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w6", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay6] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
						if(Grupa == DZIALALNOSC_ZMOTORYZOWANA || Grupa == DZIALALNOSC_MAFIE || Grupa == DZIALALNOSC_GANGI)
						{
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzenieprzestepcze);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzenieprzestepcze;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzenieprzestepcze, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's criminal %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzenieprzestepcze, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w6", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay6] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
						if(Grupa == DZIALALNOSC_WARSZTAT || Grupa == DZIALALNOSC_ELEKTRTYKA || Grupa == DZIALALNOSC_GASTRONOMIA || Grupa == DZIALALNOSC_SANNEWS || Grupa == DZIALALNOSC_TAXI|| Grupa == DZIALALNOSC_SILOWNIA|| Grupa == DZIALALNOSC_WYPOZYCZALNIA || Grupa == DZIALALNOSC_STRZELNICA || Grupa == DZIALALNOSC_AMUNATION || Grupa == DZIALALNOSC_TATUAZ)
						{
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzeniebiznesy);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzeniebiznesy;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzeniebiznesy, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's busines %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzeniebiznesy, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w6", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay6] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
					}
					else
					{
						format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzeniedodatkowe);
						SendClientMessage(i, SZARY, payday);
						DaneGracza[i][gSTAN_KONTA] += wynagrodzeniedodatkowe;
						ZapiszBankKasa(i);
						DodajHistorie(5, DaneGracza[i][gUID], wynagrodzeniedodatkowe, gettime()+CZAS_LETNI);
						PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
						new logtekst[256];
						format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's busines %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzeniedodatkowe, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
						Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
						SetPVarInt(i, "w6", 0);
						WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
						ZapiszGracza(i);
						return 1;
					}
				}
			}
		}
	}
	return 1;
}

/*forward PayDay(i);
public PayDay(i)
{
    new grupa1, grupa2, grupa3, grupa4, grupa5, grupa6;
    grupa1 = GetPVarInt(i, "w1")+DaneGracza[i][gPrzynaleznosci][1];
    grupa2 = GetPVarInt(i, "w2")+DaneGracza[i][gPrzynaleznosci][7];
    grupa3 = GetPVarInt(i, "w3")+DaneGracza[i][gPrzynaleznosci][13];
    grupa4 = GetPVarInt(i, "w4")+DaneGracza[i][gPrzynaleznosci][19];
    grupa5 = GetPVarInt(i, "w5")+DaneGracza[i][gPrzynaleznosci][25];
	grupa6 = GetPVarInt(i, "w6")+DaneGracza[i][gPrzynaleznosci][31];
	new Wyplata = 30;
	new payday[256];
	if(DaneGracza[i][gSluzba] != 0)
	{
		if(GrupaInfo[DaneGracza[i][gSluzba]][gTyp] != DZIALALNOSC_RODZINKA)
		{
			if(Wyplata <= grupa1 / 60)
			{
				if(DaneGracza[i][gSluzba] == DaneGracza[i][gDzialalnosc1])
				{
					if(DaneGracza[i][gPayDay] < gettime()+CZAS_LETNI)
					{
						if(GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_SANNEWS || GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_RZADOWA)
						{
							new wynagrodzenie = 670+300;
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzenie);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzenie;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzenie, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzenie, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w1", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
						else
						{
							new wynagrodzenie = 420+300;
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzenie);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzenie;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzenie, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzenie, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w1", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
					}
				}
			}
			if(Wyplata <= grupa2 / 60)
			{
				if(DaneGracza[i][gSluzba] == DaneGracza[i][gDzialalnosc2])
				{
					if(DaneGracza[i][gPayDay2] < gettime()+CZAS_LETNI)
					{
						if(GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_SANNEWS || GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_RZADOWA)
						{
							new wynagrodzenie = 670+300;
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzenie);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzenie;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzenie, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzenie, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w1", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay2] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
						else
						{
							new wynagrodzenie = 420+300;
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzenie);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzenie;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzenie, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzenie, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w1", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay2] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
					}
				}
			}
			if(Wyplata <= grupa3 / 60)
			{
				if(DaneGracza[i][gSluzba] == DaneGracza[i][gDzialalnosc3])
				{
					if(DaneGracza[i][gPayDay3] < gettime()+CZAS_LETNI)
					{
						if(GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_SANNEWS || GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_RZADOWA)
						{
							new wynagrodzenie = 670+300;
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzenie);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzenie;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzenie, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzenie, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w1", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay3] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
						else
						{
							new wynagrodzenie = 420+300;
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzenie);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzenie;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzenie, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzenie, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w1", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay3] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
					}
				}
			}
			if(Wyplata <= grupa4 / 60)
			{
				if(DaneGracza[i][gSluzba] == DaneGracza[i][gDzialalnosc4])
				{
					if(DaneGracza[i][gPayDay4] < gettime()+CZAS_LETNI)
					{
						if(GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_SANNEWS || GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_RZADOWA)
						{
							new wynagrodzenie = 670+300;
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzenie);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzenie;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzenie, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzenie, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w1", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay4] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
						else
						{
							new wynagrodzenie = 420+300;
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzenie);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzenie;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzenie, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzenie, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w1", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay4] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
					}
				}
			}
			if(Wyplata <= grupa5 / 60)
			{
				if(DaneGracza[i][gSluzba] == DaneGracza[i][gDzialalnosc5])
				{
					if(DaneGracza[i][gPayDay5] < gettime()+CZAS_LETNI)
					{
						if(GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_SANNEWS || GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_RZADOWA)
						{
							new wynagrodzenie = 670+300;
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzenie);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzenie;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzenie, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzenie, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w1", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay5] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
						else
						{
							new wynagrodzenie = 420+300;
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzenie);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzenie;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzenie, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzenie, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w1", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay5] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
					}
				}
			}
			if(Wyplata <= grupa6 / 60)
			{
				if(DaneGracza[i][gSluzba] == DaneGracza[i][gDzialalnosc1])
				{
					if(DaneGracza[i][gPayDay6] < gettime()+CZAS_LETNI)
					{
						if(GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA || GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_SANNEWS || GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_MEDYCZNA || GrupaInfo[DaneGracza[i][gSluzba]][gTyp] == DZIALALNOSC_RZADOWA)
						{
							new wynagrodzenie = 670+300;
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzenie);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzenie;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzenie, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzenie, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w1", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay6] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
						else
						{
							new wynagrodzenie = 420+300;
							format(payday, sizeof(payday),"{009900}#Bank: {FFFFFF}Na konto wp³ynê³o $%d. Zanotowano opcjê w transakcjach konta bankowego.", wynagrodzenie);
							SendClientMessage(i, SZARY, payday);
							DaneGracza[i][gSTAN_KONTA] += wynagrodzenie;
							ZapiszBankKasa(i);
							DodajHistorie(5, DaneGracza[i][gUID], wynagrodzenie, gettime()+CZAS_LETNI);
							PlayerPlaySound(i, 4201, 0.0, 0.0, 0.0);
							new logtekst[256];
							format(logtekst, sizeof(logtekst), "[PayDay] [%s] [ID: %d] You got your paycheck %d$ into the group's %s (%d) bank account ", ZmianaNicku(i), i, wynagrodzenie, GrupaInfo[DaneGracza[i][gSluzba]][gNazwa], DaneGracza[i][gSluzba]);
							Transakcja(T_CDRZWI, DaneGracza[i][gUID], -1, DaneGracza[i][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
							SetPVarInt(i, "w1", 0);
							WyplataDuty(DaneGracza[i][gSluzba], i, DutyNR[i]);
							DaneGracza[i][gPayDay6] = (gettime()+CZAS_LETNI)+(3600*18);
							DaneGracza[i][gAntyPayDay] = 0;
							ZapiszGracza(i);
							return 1;
						}
					}
				}
			}
		}
	}
	return 1;
}*/

new BudynekRozpraw = 13;
forward Rozprawa(i);
public Rozprawa(i)
{
	if(IsPlayerConnected(i) && DaneGracza[i][gUID] != 0)
	{
	    if(zalogowany[i] == true)
	    {
	        if(GetPVarInt(i, "Rozprawa") > 0 && GetPVarInt(i, "Sedzia") == 0)
			{
				SetPVarInt(i, "Rozprawa", GetPVarInt(i, "Rozprawa")-1);
				if(GetPVarInt(i, "Rozprawa") > 0)
				{
					new str[512];
					new powod[256];
					GetPVarString(i, "SadPowod", powod, sizeof(powod));
		     		ForeachEx(id, IloscGraczy)
					{
					    TextDrawHideForPlayer(id, TextNaDrzwi4[id]);
						format(str, sizeof(str), "~w~Za %dmin zacznie sie rozprawa:~n~~y~LSPD~w~ v ~r~ %s~n~~n~~b~Zlamane prawo:~n~~w~%s~n~~n~Idz do sadu (TT), jesli chcesz zarobic jako przysiegly.", GetPVarInt(i, "Rozprawa"), ImieGracza2(i), powod);
						TextDrawSetString(TextNaDrzwi4[id], str);
						TextDrawShowForPlayer(id, TextNaDrzwi4[id]);
					}
				}
				else
				{
				    ForeachEx(id, IloscGraczy)
					{
				    	TextDrawHideForPlayer(id, TextNaDrzwi4[id]);//Wy³¹czenie TextDrawu
					}
					SetPVarInt(i, "Sedzia", 1);
					SetPVarInt(i, "Rozprawa", 5);
				}
				new ikona = 40;
				BudynekInfo[BudynekRozpraw][nUID] = CreateDynamicMapIcon(BudynekInfo[BudynekRozpraw][nX], BudynekInfo[BudynekRozpraw][nY], BudynekInfo[BudynekRozpraw][nZ], ikona, 0, BudynekInfo[BudynekRozpraw][nVW]);
				BudynekInfo[BudynekRozpraw][nIconaID] = 1;
				ZapiszNieruchomosc(BudynekRozpraw);
			}
			//Nastêpny warunek do trwajacej rozprawy z sêdzi¹.
			if(GetPVarInt(i, "Rozprawa") > 0 && GetPVarInt(i, "Sedzia") == 1)
			{
                SetPVarInt(i, "Rozprawa", GetPVarInt(i, "Rozprawa")-1);
				if(GetPVarInt(i, "Rozprawa") > 0)
				{
				    if(GetPVarInt(i, "Rozprawa") == 5)
					{
					    new str1[126];
                        ForeachEx(id, IloscGraczy)
						{
						    if(GetPlayerVirtualWorld(id) == BudynekRozpraw)
 							{
							    format(str1, sizeof(str1), "{FFFF00}Sêdzia mówi:{FFFFFF} Pozosta³o 5 minut rozprawy. Proszê jury o zajêcie miejsc na ³awie z boku, a powód i pozwanego na miejsce publiczne rozprawy.");
			  					SendClientMessage(id, 0xFFFFFFFF, str1);
			  					if(GrupaInfo[DaneGracza[id][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA)
								{
                                    SetPVarInt(id, "UdzialWRozprawie", 0);
								}
								else
								{
			  						SetPVarInt(id, "UdzialWRozprawie", 1);
			  						SetPVarInt(i, "UdzialWRozprawie", 0);
								}
							}
						}
					}
					if(GetPVarInt(i, "Rozprawa") == 4)
					{
    					new str1a[126];
    					new str1b[126];
    					new powod[256];
						GetPVarString(i, "SadPowod", powod, sizeof(powod));
                        ForeachEx(id, IloscGraczy)
						{
						    if(GetPlayerVirtualWorld(id) == BudynekRozpraw)
 							{
							    format(str1a, sizeof(str1a), "{FFFF00}Sêdzia mówi:{FFFFFF} Rozpoczynam rozprawê LSPD v %s. Powód twierdzi ¿e z³amany zosta³ akt prawny:", ImieGracza2(i));
			  					SendClientMessage(id, 0xFFFFFFFF, str1a);
			  					format(str1b, sizeof(str1b), "... %s", powod);
			  					SendClientMessage(id, 0xFFFFFFFF, str1b);
							}
						}
					}
					if(GetPVarInt(i, "Rozprawa") == 3)
					{
					    new str2[126];
					    new str2a[126];
					    ForeachEx(id, IloscGraczy)
						{
						    if(GetPlayerVirtualWorld(id) == BudynekRozpraw)
 							{
							    format(str2, sizeof(str2), "{FFFF00}Sêdzia mówi:{FFFFFF} Rol¹ jury jest stwierdzenie, czy jest pewnoœæ, ¿e pozwany z³ama³ prawo. W razie w¹tpliwoœci,");
			  					SendClientMessage(id, 0xFFFFFFFF, str2);
							    format(str2a, sizeof(str2a), "... macie obowi¹zek zag³osowaæ, ¿e jest niewinny. Proszê powoda o detale sprawy. Pozosta³y nam 3 minuty do koñca rozprawy!");
			  					SendClientMessage(id, 0xFFFFFFFF, str2a);
			  					if(GrupaInfo[DaneGracza[id][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA)
								{
                                    SetPVarInt(id, "UdzialWRozprawie", 0);
								}
								else
								{
			  						SetPVarInt(id, "UdzialWRozprawie", 0);
			  						SetPVarInt(i, "UdzialWRozprawie", 0);
								}
							}
						}
					}
					if(GetPVarInt(i, "Rozprawa") == 2)
					{
					    new str2[126];
					    ForeachEx(id, IloscGraczy)
						{
						    if(GetPlayerVirtualWorld(id) == BudynekRozpraw)
 							{
							    format(str2, sizeof(str2), "{FFFF00}Sêdzia mówi:{FFFFFF} Prosimy strzeszczenie siê do najwa¿niejszych detalów sprawy, Pozosta³y nam 2 minuty do koñca sprawy!");
			  					SendClientMessage(id, 0xFFFFFFFF, str2);
			  					if(GrupaInfo[DaneGracza[id][gSluzba]][gTyp] == DZIALALNOSC_POLICYJNA)
								{
                                    SetPVarInt(id, "UdzialWRozprawie", 0);
								}
								else
								{
			  						SetPVarInt(id, "UdzialWRozprawie", 0);
			  						SetPVarInt(i, "UdzialWRozprawie", 0);
								}
							}
						}
					}
					if(GetPVarInt(i, "Rozprawa") == 1)
					{
					    new str3[126];
						ForeachEx(id, IloscGraczy)
						{
						    if(GetPlayerVirtualWorld(id) == BudynekRozpraw)
 							{
							    format(str3, sizeof(str3), "{FFFF00}Sêdzia mówi:{FFFFFF} Zosta³a nam minuta rozprawy, proszê o zdecydowanie o winnoœci lub niewinnoœci pozwanego.");
			  					SendClientMessage(id, 0xFFFFFFFF, str3);
								GameTextForPlayer(id, "~r~Zaglosuj!~n~~r~/winny ~w~lub ~g~/niewinny", 8000, 5);
							}
						}
					}
				}
				else
				{
					if(GetPVarInt(i, "Winny") > GetPVarInt(i, "Niewinny"))
					{
					    new koniec[126];
					    ForeachEx(id, IloscGraczy)
						{
                            if(GetPlayerVirtualWorld(id) == BudynekRozpraw)
 							{
							    format(koniec, sizeof(koniec), "{660000}Rozprawa dobieg³a koñca, %s zosta³ uznany winnym musi ponieœæ karê: %d$ oraz %dh odsiadki.", ImieGracza2(i), GetPVarInt(i, "SadGrzywna"), GetPVarInt(i, "SadOdsiadka"));
			  					SendClientMessage(id, 0xFFFFFFFF, koniec);
			  					SetPVarInt(id, "UdzialWRozprawie", 0);
							}
						}
						DaneGracza[i][gPrzetrzmanie] = (gettime()+CZAS_LETNI)+(3600*GetPVarInt(i, "SadOdsiadka"));
						GetPlayerPos(i,DaneGracza[i][gPX],DaneGracza[i][gPY],DaneGracza[i][gPZ]);
						DaneGracza[i][gPUID] = BudynekRozpraw;
						ZapiszGracza(i);
						RefreshNick(i);
						new powod5[256];
						GetPVarString(i, "SadPowod", powod5, sizeof(powod5));
						DodajKartoteke(GetPVarInt(i, "Sad"), i, 2, powod5);
					}
				    else
				    {
				        new koniec2[126];
				        ForeachEx(id, IloscGraczy)
						{
						    if(GetPlayerVirtualWorld(id) == BudynekRozpraw)
 							{
							    format(koniec2, sizeof(koniec2), "{660000}Rozprawa dobieg³a koñca, %s zosta³ uznany niewinnym.", ImieGracza2(i));
			  					SendClientMessage(id, 0xFFFFFFFF, koniec2);
							}
						}
				    }
				    DeletePVar(i, "Rozprawa");
				    DeletePVar(i, "Sad");
				    DeletePVar(i, "Sedzia");
				    DeletePVar(i, "Winny");
				    DeletePVar(i, "NieWinny");
				    DeletePVar(i, "SadGrzywna");
				    DeletePVar(i, "SadOdsiadka");
				    DeletePVar(i, "SadPowod");
					RozprawaSadowa = -1;
				    ForeachEx(id, IloscGraczy)
					{
					    if(GetPVarInt(id, "Glosowal") == 1)
					    {
					        Dodajkase(id, 100);
							ZapiszGracza(id);
					    }
				    	DeletePVar(id, "Glosowal");
					}
					DestroyDynamicMapIcon(BudynekInfo[BudynekRozpraw][nUID]);
					BudynekInfo[BudynekRozpraw][nIconaID] = 0;
					ZapiszNieruchomosc(BudynekRozpraw);
				}
			}
	    }
	}
}

CMD:rozprawa(playerid, cmdtext[])
{
    if(zalogowany[playerid] == false)
    {
		return 0;
    }
	new playerid2, grzywna, odsiadka, powod[64];
	if(sscanf(cmdtext, "ddds[64]", playerid2, grzywna, odsiadka, powod))
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• S¹d:", "/rozprawa [id gracza] [grzywna] [iloœæ odsiadki (w godzinach)] [powód]", "Zamknij", "");
		return 1;
	}
	if(zalogowany[playerid2] == false)
    {
        dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• S¹d:", "Gracz jest nie zalogowany, wiêc nie mo¿esz wywo³aæ rozprawy.", "Zamknij", "");
		return 1;
    }
    if(GetPlayerVirtualWorld(playerid) != BudynekRozpraw)
 	{
 	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• S¹d:", "Nie znajdujesz siê w budynku S¹du, znajdziesz go na mapie pod znacznikiem (TT).", "Zamknij", "");
		return 1;
 	}
 	if(DaneGracza[playerid][gSluzba] == 0)
 	{
 	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• S¹d:", "Nie znajdujesz siê na s³u¿bie!", "Zamknij", "");
		return 1;
 	}
 	if(GrupaInfo[DaneGracza[playerid][gSluzba]][gTyp] != DZIALALNOSC_POLICYJNA)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• S¹d:", "Nie masz uprawnieñ do u¿ywania tej komendy, lub nie nale¿ysz do org. porz¹dkowych.", "Zamknij", "");
		return 1;
	}
	if(!PlayerObokPlayera(playerid, playerid2, 5))
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• S¹d:", "Gracz jest zbyt daleko od Ciebie, wiêc nie mo¿esz wywo³aæ rozprawy.", "Zamknij", "");
		return 1;
	}
	if(playerid == playerid2)
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• S¹d:", "Nie mo¿esz wywo³aæ rozprawy sam na sobie.", "Zamknij", "");
		return 1;
	}
	if(DaneGracza[playerid2][gBW] != 0)
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• S¹d:", "Gracz jest nieprzytomny, wiêc nie mo¿esz wywo³ac na nim rozprawy.", "Zamknij", "");
		return 1;
	}
	UsunNieChcianeZnaki(powod);
	SetPVarInt(playerid2, "Rozprawa", 5);
    SetPVarInt(playerid2, "Sad", playerid);
	SetPVarInt(playerid2, "SadGrzywna", grzywna);
	SetPVarInt(playerid2, "SadOdsiadka", odsiadka);
	SetPVarString(playerid2, "SadPowod", powod);
	SetPVarInt(playerid2, "Sedzia", 0);
	RozprawaSadowa = -1;
	new str[512];
	ForeachEx(id, IloscGraczy)
	{
	    TextDrawHideForPlayer(id, TextNaDrzwi4[id]);
		format(str, sizeof(str), "~w~Za %dmin zacznie sie rozprawa:~n~~y~LSPD~w~ v ~r~ %s~n~~n~~b~Zlamane prawo:~n~~w~%s~n~~n~Idz do sadu (TT), jesli chcesz zarobic jako przysiegly.", GetPVarInt(playerid2, "Rozprawa"), ImieGracza2(playerid2), powod);
		TextDrawSetString(TextNaDrzwi4[id], str);
		TextDrawShowForPlayer(id, TextNaDrzwi4[id]);
	}
	return 1;
}

CMD:winny(playerid, cmdtext[])
{
    if(zalogowany[playerid] == false)
    {
		return 0;
    }
    if(DaneGracza[playerid][gBW] != 0)
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• S¹d:", "Twoja postaæ jest nieprzytomna, nie mo¿esz oddaæ g³osu na rozprawie.", "Zamknij", "");
		return 1;
	}
	if(GetPlayerVirtualWorld(playerid) == BudynekRozpraw)
 	{
		if(GetPVarInt(playerid, "Glosowal") == 0)
		{
		    ForeachEx(id, IloscGraczy)
			{
			    if(GetPVarInt(id, "Sedzia") == 1 && GetPVarInt(id, "Rozprawa") == 1)
				{
				    new winny = GetPVarInt(id, "Winny");
		    		SetPVarInt(id, "Winny", winny+1);
		    		SetPVarInt(playerid, "Glosowal", 1);
		    		GameTextForPlayer(playerid, "~r~Winny", 3000, 5);
				}
			}
		}
		else
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• S¹d:", "Ju¿ zag³osowa³eœ podczas tej rozprawy.", "Zamknij", "");
			return 1;
		}
	}
	else
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• S¹d:", "Nie znajdujesz siê w budynku S¹du, znajdziesz go na mapie pod znacznikiem (TT).", "Zamknij", "");
		return 1;
	}
	return 1;
}

CMD:niewinny(playerid, cmdtext[])
{
    if(zalogowany[playerid] == false)
    {
		return 0;
    }
    if(DaneGracza[playerid][gBW] != 0)
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• S¹d:", "Twoja postaæ jest nieprzytomna, nie mo¿esz oddaæ g³osu na rozprawie.", "Zamknij", "");
		return 1;
	}
	if(GetPlayerVirtualWorld(playerid) == BudynekRozpraw)
 	{
		if(GetPVarInt(playerid, "Glosowal") == 0)
		{
		    ForeachEx(id, IloscGraczy)
			{
			    if(GetPVarInt(id, "Sedzia") == 1 && GetPVarInt(id, "Rozprawa") == 1)
				{
				    new niewinny = GetPVarInt(id, "NieWinny");
		    		SetPVarInt(id, "NieWinny", niewinny+1);
		    		SetPVarInt(playerid, "Glosowal", 1);
		    		GameTextForPlayer(playerid, "~r~Niewinny", 3000, 5);
				}
			}
		}
		else
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• S¹d:", "Ju¿ zag³osowa³eœ podczas tej rozprawy.", "Zamknij", "");
			return 1;
		}
	}
	else
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• S¹d:", "Nie znajdujesz siê w budynku S¹du, znajdziesz go na mapie pod znacznikiem (TT).", "Zamknij", "");
		return 1;
	}
    return 1;
}
