AntiDeAMX();
stock encode_tires(tire1, tire2, tire3, tire4) {

    return tire1 | (tire2 << 1) | (tire3 << 2) | (tire4 << 3);

}
new NazwyAut[212][32] = {
"Landstalker","Bravura","Buffalo","Linerunner","Perenniel","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana",
"Infernus","Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat",
"Mr Whoopee","BF Injection","Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks",
"Hotknife","Trailer","Previon","Coach","Cabbie","Stallion","Rumpo","RC Bandit","Romero","Packer","Monster","Admiral",
"Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder","Reefer","Tropic","Flatbed","Yankee","Caddy",
"Solair","Berkley's RC Van","Skimmer","PCJ-600","Faggio","Freeway","RC Baron","RC Raider","Glendale","Oceanic",
"Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR-350","Walton","Regina",
"Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","News Chopper","Rancher","FBI Rancher",
"Virgo","Greenwood","Jetmax","Hotring","Sandking","Blista Compact","Police Maverick","Boxville","Benson","Mesa",
"RC Goblin","Hotring Racer","Hotring Racer","Bloodring Banger","Rancher","Super GT","Elegant","Journey","Bike",
"Mountain Bike","Beagle","Cropdust","Stunt","Tanker","RoadTrain","Nebula","Majestic","Buccaneer","Shamal","Hydra",
"FCR-900","NRG-500","HPV1000","Cement Truck","Tow Truck","Fortune","Cadrona","FBI Truck","Willard","Forklift","Tractor",
"Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover","Sadler",
"Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor",
"Monster","Monster","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RC Tiger","Flash","Tahoma","Savanna",
"Bandito","Freight","Trailer","Kart","Mower","Duneride","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley",
"Stafford","BF-400","Newsvan","Tug","Trailer","Emperor","Wayfarer","Euros","Hotdog","Club","Trailer","Trailer",
"Andromeda","Dodo","RC Cam","Launch","Police Car","Police Car","Police Car","Police Ranger","Picador","S.W.A.T. Van",
"Alpha","Phoenix","Glendale","Sadler","Luggage Trailer","Luggage Trailer","Stair Trailer","Boxville","Farm Plow","Utility Trailer"};

public OnVehicleSpawn(vehicleid)
{
	Tuning(vehicleid);
	new uid = SprawdzCarUID(vehicleid);
	if(PojazdInfo[uid][pStan] < 300)
	{
		PojazdInfo[uid][pStan] = 300;
	}
	if(PojazdInfo[uid][pPJ] != -1)
	{
		ChangeVehiclePaintjob(vehicleid, PojazdInfo[uid][pPJ]);
	}
	SetVehicleHealth(vehicleid, PojazdInfo[uid][pStan]);
	new engine, lights, alarm, doors, bonnet, boot, objective;
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, false, false, false, PojazdInfo[uid][pLock], false, false, false);
	SetVehicleParamsCarWindows(vehicleid, PojazdInfo[uid][pSzyba], PojazdInfo[uid][pSzyba2], PojazdInfo[uid][pSzyba3], PojazdInfo[uid][pSzyba4]);
	UpdateVehicleDamageStatus(vehicleid, PojazdInfo[uid][pUszkodzenie1], PojazdInfo[uid][pUszkodzenie2], PojazdInfo[uid][pUszkodzenie3], PojazdInfo[uid][pUszkodzenie4]);
	GetVehiclePos(vehicleid, handbrake_pos[vehicleid][0], handbrake_pos[vehicleid][1], handbrake_pos[vehicleid][2]);
	GetVehicleZAngle(vehicleid, handbrake_pos[vehicleid][3]);
	SetVehicleVelocity(vehicleid, 0, 0, 0);
	return 1;
}
public OnPlayerStateChange(playerid, newstate, oldstate)
{
    SetPVarInt(playerid, "AntyVehicle", 1);
    RemovePlayerMapIcon(playerid,0);
	SetTimerEx("SprawdzCzyGraczBuguje",7000,0,"d",playerid);
	new i = GetPVarInt(playerid, "AreaPlyeri");
    new areaid = GetPVarInt(playerid, "AreaPlayer");
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
	    new vehicleid=GetPlayerVehicleID(playerid);
	    if(!Wlascicielpojazdu(vehicleid, playerid))
		{
		    GameTextForPlayer(playerid, "~r~Nie posiadasz uprawnien do prowadzenia tego pojazdu!", 3000, 5);
		    RemovePlayerFromVehicle(playerid);
			RemovePlayerFromVehicle(playerid);
			Frezuj(playerid, 0);
			Frezuj(playerid, 1);
		    return 1;
		}
	}
    if(GetPVarInt(playerid, "WZIALPACZKA") == 1 || GetPVarInt(playerid, "WZIALPACZKA") == 3)
    {
        GameTextForPlayer(playerid, "~r~Odloz paczke do pojazdu by wsiasc.", 3000, 5);
		RemovePlayerFromVehicle(playerid);
		Frezuj(playerid, 0);
		Frezuj(playerid, 1);
        return 1;
    }
	if(GetPVarType(i, "bboxareaid"))
    {
		new vehicleid=GetPlayerVehicleID(playerid);
		new uida = SprawdzCarUID(vehicleid);
		SetPVarInt(playerid, "AreaPlayer", 1);
		if(PojazdInfo[uida][pAudioStream] == 0 && Discman[playerid] == 0)
		{
            if(areaid == GetPVarInt(i, "bboxareaid"))
            {
                StopAudioStreamForPlayer(playerid);
                return 1;
            }
		}
	}
    if(GetPVarType(i, "bboxareaidveh"))
    {
		new vehicleid=GetPlayerVehicleID(playerid);
		new uida = SprawdzCarUID(vehicleid);
  		SetPVarInt(playerid, "AreaPlayer", 0);
		if(PojazdInfo[uida][pAudioStream] == 0 && Discman[playerid] == 0)
		{
            if(areaid == GetPVarInt(i, "bboxareaidveh"))
            {
                StopAudioStreamForPlayer(playerid);
                return 1;
            }
		}
    }
    new vehicleid=GetPlayerVehicleID(playerid);
    new uid = SprawdzCarUID(vehicleid);
    if( newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER )
	{
	    if( GetPVarInt(playerid, "AntyVehicle") )
	    {
	        SetPVarInt(playerid, "AntyVehicle", 0);
	    }
		else
		{
		    new armour[256];
			format(armour, sizeof(armour), ""PREFIXAC".AntyCheat: Nieautoryzowane wejscie do pojazdu v4 (%d)", vehicleid);
			NadajKare(playerid,-1, 0, armour, -1);
		}
	}
	if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid)==PLAYER_STATE_DRIVER)
	{
	    if(!Rowery(vehicleid))
	    {
		    if(PojazdInfo[uid][pBoost] != 0)
			{
				new string[128];
				format(string, sizeof(string), "Predkosc: %dkm/h~n~Paliwo: %0.01fl~n~~b~Boost:~w~ %0.1fbar", Predkosc(playerid), PojazdInfo[uid][pPaliwo], PojazdInfo[uid][pBoost]);
				TextDrawSetString(VehicleTDP[playerid], string);
				TextDrawShowForPlayer(playerid, VehicleTDP[playerid]);
			}
			else
			{
				new string[128];
				format(string, sizeof(string), "Predkosc: %dkm/h~n~Paliwo: %0.01fl", Predkosc(playerid), PojazdInfo[uid][pPaliwo]);
				TextDrawSetString(VehicleTDP[playerid], string);
				TextDrawShowForPlayer(playerid, VehicleTDP[playerid]);
			}
		}
		SetPVarInt(playerid, "IsPlayerInAnyVehicle", 1);
	}
    if(IsPlayerInAnyVehicle(playerid) || GetPlayerState(playerid) == PLAYER_STATE_PASSENGER)
	{
		if(PojazdInfo[uid][pSilnik] != 0)
		{
		    if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER)
			{
				SetProgressBarValue(Bar:PasekPaliwa[playerid], PojazdInfo[uid][pStan]);
				ShowProgressBarForPlayer(playerid, PasekPaliwa[playerid]);
				if(GetVehicleComponentInSlot(GetPlayerVehicleID(playerid), GetVehicleComponentType(1010)) == 1010)
				{
					if(PojazdInfo[uid][pPaliwoGaz] != 0)
					{
						DestroyProgressBar(PasekNitro[playerid]);
						PasekNitro[playerid] = CreateProgressBar(527.0,432.0,106.0,_, 0x00FF00FF, 100.0);
						SetProgressBarValue(Bar:PasekNitro[playerid], PojazdInfo[uid][pPaliwoGaz]);
						ShowProgressBarForPlayer(playerid, PasekNitro[playerid]);
					}
				}
			}
			return 1;
		}
	    if(PojazdInfo[uid][pCB] == 1)
		{
		    new kanstr[124];
			format(kanstr, sizeof(kanstr), "~y~CB Radio ~>~~w~ Czestotliwosc %d", PojazdInfo[uid][pKanal]);
			TextDrawShowForPlayer(playerid, CB);
			TextDrawSetString(CB, kanstr);
		}
		if(GetPlayerVehicleSeat(playerid) == 0)
		{
			if(PojazdInfo[uid][pPSzyba] == 1 && PojazdInfo[uid][pSzyba] == 1)
		 	{
				if(Nieznajomy[playerid] == 0)
				{
					SetPVarInt(playerid, "Bandana", DaneGracza[playerid][gUID]);
					SetPVarInt(playerid, "UkrytyN", 1);
					RefreshNick(playerid);
				}
		 	}
		}
		if(GetPlayerVehicleSeat(playerid) == 1)
		{
		 	if(PojazdInfo[uid][pPSzyba] == 1 && PojazdInfo[uid][pSzyba2] == 1)
		 	{
				if(Nieznajomy[playerid] == 0)
				{
					SetPVarInt(playerid, "Bandana", DaneGracza[playerid][gUID]);
					SetPVarInt(playerid, "UkrytyN", 1);
					RefreshNick(playerid);
				}
		 	}
		}
	 	if(GetPlayerVehicleSeat(playerid) == 2)
		{
		 	if(PojazdInfo[uid][pPSzyba] == 1 && PojazdInfo[uid][pSzyba3] == 1)
		 	{
				if(Nieznajomy[playerid] == 0)
				{
					SetPVarInt(playerid, "Bandana", DaneGracza[playerid][gUID]);
					SetPVarInt(playerid, "UkrytyN", 1);
					RefreshNick(playerid);
				}
		 	}
		}
	 	if(GetPlayerVehicleSeat(playerid) == 3)
		{
		 	if(PojazdInfo[uid][pPSzyba] == 1 && PojazdInfo[uid][pSzyba4] == 1)
		 	{
				if(Nieznajomy[playerid] == 0)
				{
					SetPVarInt(playerid, "Bandana", DaneGracza[playerid][gUID]);
					SetPVarInt(playerid, "UkrytyN", 1);
					RefreshNick(playerid);
				}
		 	}
		}
	}
	if(newstate == PLAYER_STATE_ONFOOT)
	{
	    TextDrawHideForPlayer(playerid, Licznik[playerid]);
		if(GetPlayerVirtualWorld(playerid) != 0 && BudynekInfo[GetPlayerVirtualWorld(playerid)][nAudio] == 1)
		{
			if(Discman[playerid] == 0)
			{
				if(GetPVarInt(playerid,"spawn"))
				{
					DeletePVar(playerid,"spawn");
				}
				StopAudioStreamForPlayer(playerid);
				PlayAudioStreamForPlayer(playerid, BudynekInfo[GetPlayerVirtualWorld(playerid)][nRadio], 0, 0, 0, 14.0, 0);
			}
		}
		else
		{
			if(Discman[playerid] == 0)
			{
				if(GetPVarInt(playerid, "AreaPlayer") == 0)
				{
					StopAudioStreamForPlayer(playerid);
				}
			}
		}
	    RefreshNick(playerid);
	}
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
	{
	    BW1[playerid] = GetPlayerVehicleID(playerid);
		BW2[playerid] = GetPlayerVehicleSeat(playerid);
	    if(PojazdInfo[uid][pLock] == 1)
	    {
			RemovePlayerFromVehicle(playerid);
			RemovePlayerFromVehicle(playerid);
			Frezuj(playerid, 0);
			Frezuj(playerid, 1);
	    }
		if((PojazdInfo[uid][pTypPaliwa] == 0 && PojazdInfo[uid][pModel] != 574 && PojazdInfo[uid][pModel] != 509 && PojazdInfo[uid][pModel] != 481 && PojazdInfo[uid][pModel] != 510) && newstate == PLAYER_STATE_DRIVER)
		{
			if(Jednoslady(vehicleid))
			{
				PojazdInfo[uid][pTypPaliwa] = 2;
				ZapiszPojazd(uid, 1);
			}
			else
			{
				PojazdInfo[uid][pTypPaliwa] = 2;
				ZapiszPojazd(uid, 1);
			}
		}
		
		if(Discman[playerid] == 0)
		{
		    if(PojazdInfo[uid][pRok] == 0)
			{
				if(PojazdInfo[uid][pAudioStream] != 0)
				{
					if(GetPVarInt(playerid,"spawn"))
					{
						DeletePVar(playerid,"spawn");
					}
					new uids = PojazdInfo[uid][pAudioStream];
					new audio[128];
					format(audio, sizeof(audio), "%s",PrzedmiotInfo[uids][pWar3]);
					PlayAudioStreamForPlayer(playerid, audio, 0, 0, 0, 14.0, 0);
				}
			}
		}
		if(BlokadaVEH(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz tego zrobiæ, poniewa¿ posiadasz aktywn¹ blokade prowadzenia pojazdów \nJeœli uwa¿asz, ¿e kara zosta³a nadana nies³usznie mo¿esz od niej apelowaæ na forum (www."PROJEKT"{DEDEDE}).", "Zamknij", "");
			RemovePlayerFromVehicle(playerid);
			Frezuj(playerid, 0);
			Frezuj(playerid, 1);
			return 1;
		}
	    if(newstate != PLAYER_STATE_PASSENGER)
		{
		    if(!Rowery(vehicleid))
		    {
			    new msg[64];
				format(msg,254,"~b~LCTRL~w~ by uruchomic silnik~n~~b~LPM~w~ by zapalic swiatla");
				TextDrawSetString(VehicleTD[playerid], msg);
				TextDrawShowForPlayer(playerid, VehicleTD[playerid]);
				SetPVarInt(playerid, "TDSilnika", 1);
			}
			if(!Wlascicielpojazdu(vehicleid, playerid) && GetPVarInt(playerid, "SprzedalPojazd") == 0 && DaneGracza[playerid][gWypozyczonyPojazdCZAS] > gettime()+CZAS_LETNI)
			{
		    	GameTextForPlayer(playerid,"~r~Nie posiadasz kluczy do tego pojazdu!",5000,3);
				RemovePlayerFromVehicle(playerid);
				RemovePlayerFromVehicle(playerid);
				Frezuj(playerid, 0);
				Frezuj(playerid, 1);
				return 1;
			}
			if(GetVehicleModel(vehicleid) == 481 || GetVehicleModel(vehicleid) == 509 || GetVehicleModel(vehicleid) == 510)
		    {
		        new lights,doors,bonnet,boot,objective,engine,alarm;
		        GetVehiclePos(vehicleid,dOstatniX[playerid],dOstatniY[playerid],dOstatniZ[playerid]);
				GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(vehicleid, 1, lights, 0, doors, bonnet, boot, objective);
			}
		}
	}
	return 1;
}
stock PredkoscPojazdu(vehicleid)
{
    new Float:ST[4];
    GetVehicleVelocity(vehicleid,ST[0],ST[1],ST[2]);
    ST[3] = floatsqroot(floatpower(floatabs(ST[0]), 2.0) + floatpower(floatabs(ST[1]), 2.0) + floatpower(floatabs(ST[2]), 2.0)) * 180.3;
    return floatround(ST[3]);
}
stock Predkosc(playerid)
{
    new Float:ST[4];
    if(IsPlayerInAnyVehicle(playerid))
        GetVehicleVelocity(GetPlayerVehicleID(playerid),ST[0],ST[1],ST[2]);
        else GetPlayerVelocity(playerid,ST[0],ST[1],ST[2]);
    ST[3] = floatsqroot(floatpower(floatabs(ST[0]), 2.0) + floatpower(floatabs(ST[1]), 2.0) + floatpower(floatabs(ST[2]), 2.0)) * 180.3;
    return floatround(ST[3]);
}
public OnPlayerExitVehicle(playerid, vehicleid)
{
	SetTimerEx("SprawdzCzyGraczBuguje",7000,0,"d",playerid);
    if(GetPVarInt(playerid, "FirstPerson") == 1)
    {
	 	guyfps[playerid] = 1;
	    FPSMode(playerid);
	}
    TextDrawHideForPlayer(playerid, VehicleTD[playerid]);
    SetPVarInt(playerid, "TDSilnika", 0);
	TextDrawHideForPlayer(playerid, VehicleTDP[playerid]);
	SetPVarInt(playerid, "IsPlayerInAnyVehicle", 0);
	KillTimer(ABTimer[playerid]);
	AB[playerid] = 0;
	HideProgressBarForPlayer(playerid, PasekPaliwa[playerid]);
	HideProgressBarForPlayer(playerid, PasekNitro[playerid]);
	new uid = SprawdzCarUID(vehicleid);
	if(DaneGracza[playerid][gBW] == 0)
	{
		BW1[playerid] = 0;
		BW2[playerid] = -1;
	}
	if(GPS[playerid] == 1)
	{
	    GPS[playerid] = 0;
		ForeachEx(ilosc, MAX_PLAYERS)
		{
			RemovePlayerMapIcon( playerid, ilosc );
		}
		cmd_fasdasfdfive(playerid, "dezaktywuje namierzanie GPS.");
	}
	if(PojazdInfo[uid][pCB] == 1)
	{
    	TextDrawHideForPlayer(playerid, CB);
	}
	if(PojazdInfo[uid][pPSzyba] == 1 && PojazdInfo[uid][pSzyba] == 1)
 	{
 	    SetPVarInt(playerid, "UkrytyN", 0);
 	    if(Nieznajomy[playerid] == 0)
 	    {
			if(GetPVarInt(playerid, "UzywaKominiarki") == 0)
			{
				printf("Zmieniono nickname na: %s", DaneGracza[playerid][gName]);
				SetPlayerName(playerid, DaneGracza[playerid][gName]);
				SetPlayerScore(playerid,DaneGracza[playerid][gGAMESCORE]);
			}
		}
 	    RefreshNick(playerid);
 	}
 	if(PojazdInfo[uid][pPSzyba] == 1 && PojazdInfo[uid][pSzyba2] == 1)
 	{
 	    SetPVarInt(playerid, "UkrytyN", 0);
        if(Nieznajomy[playerid] == 0)
 	    {
			if(GetPVarInt(playerid, "UzywaKominiarki") == 0)
			{
				printf("Zmieniono nickname na: %s", DaneGracza[playerid][gName]);
				SetPlayerName(playerid, DaneGracza[playerid][gName]);
				SetPlayerScore(playerid,DaneGracza[playerid][gGAMESCORE]);
			}
		}
 	    RefreshNick(playerid);
 	}
 	if(PojazdInfo[uid][pPSzyba] == 1 && PojazdInfo[uid][pSzyba3] == 1)
 	{
 	    SetPVarInt(playerid, "UkrytyN", 0);
 	    if(Nieznajomy[playerid] == 0)
 	    {
			if(GetPVarInt(playerid, "UzywaKominiarki") == 0)
			{
				printf("Zmieniono nickname na: %s", DaneGracza[playerid][gName]);
				SetPlayerName(playerid, DaneGracza[playerid][gName]);
				SetPlayerScore(playerid,DaneGracza[playerid][gGAMESCORE]);
			}
		}
 	    RefreshNick(playerid);
 	}
 	if(PojazdInfo[uid][pPSzyba] == 1 && PojazdInfo[uid][pSzyba4] == 1)
 	{
 	    SetPVarInt(playerid, "UkrytyN", 0);
 	    if(Nieznajomy[playerid] == 0)
 	    {
			if(GetPVarInt(playerid, "UzywaKominiarki") == 0)
			{
				printf("Zmieniono nickname na: %s", DaneGracza[playerid][gName]);
				SetPlayerName(playerid, DaneGracza[playerid][gName]);
				SetPlayerScore(playerid,DaneGracza[playerid][gGAMESCORE]);
			}
		}
 	    RefreshNick(playerid);
	}
	if(PojazdInfo[uid][pModel] == 574)
	{
		SetVehicleToRespawn(vehicleid);
		PojazdInfo[uid][pStan] = 1000.0;
		PojazdInfo[uid][pPaliwo] = 100;
		KillTimer(PojazdInfo[uid][pTimer]);
		SetVehicleHealth(vehicleid, PojazdInfo[uid][pStan] );
		RepairVehicle(vehicleid);
		if(Pracuje[playerid] != 0)
		{
			CzasWyswietlaniaTextuNaDrzwiach[playerid] = 30;
			TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
			TextDrawSetString(TextNaDrzwi[playerid], "Wysiadles z pojazdu, zlecenie zostalo anulowane.");
			TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
			DaneGracza[playerid][gCheckopintID] = 0;
			DaneGracza[playerid][gWyscig] = 0;
			DaneGracza[playerid][gCheckopintID] = 0;
			DisablePlayerRaceCheckpoint(playerid);
			DaneGracza[playerid][gKoniecWyscigu] = 0;
			DaneGracza[playerid][gRaceTimeStart] = 0;
		}
		Pracuje[playerid] = 0;
	}
	if(PASY[playerid] == 1)
	{
	    RemovePlayerAttachedObject(playerid, 8);
		RemovePlayerAttachedObject(playerid, 8);
		PASY[playerid] = 0;
	}
	RefreshNick(playerid);
	GetVehiclePos(PojazdInfo[uid][pID],PojazdInfo[uid][pOX],PojazdInfo[uid][pOY],PojazdInfo[uid][pOZ]);
	PojazdInfo[uid][pOVW] = GetVehicleVirtualWorld(PojazdInfo[uid][pID]);
	GetVehicleZAngle(PojazdInfo[uid][pID], PojazdInfo[uid][pOA]);
	ZapiszPojazd(uid, 1);
	//SetPVarInt(playerid, "Teleportacja", 1);
	GPS[playerid] = 0;
	if(GPS[playerid] == 1)
	{
		GPS[playerid] = 0;
		ForeachEx(ilosc, 99)
		{
			RemovePlayerMapIcon( playerid, ilosc );
		}
	}
	new log[256];
	format(log, sizeof(log), "[CARS] [%s] [ID: %d] Exited vehicle %d (%s)", ZmianaNicku(playerid), playerid, PojazdInfo[uid][pUID], GetVehicleModelName(PojazdInfo[uid][pModel]));
	Transakcja(T_IC, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, log, gettime()+KOREKTA_CZASOWA);
	new logtekst[256];
	format(logtekst, sizeof(logtekst), "[CAR] [%s] [ID: %d UID: %d] Exit vehicle %s (%d)", ZmianaNicku(playerid), playerid, DaneGracza[playerid][gUID], GetVehicleModelName(PojazdInfo[uid][pModel]), PojazdInfo[uid][pUID]);
	TransakcjaVeh(T_OVEH, PojazdInfo[uid][pUID], PojazdInfo[uid][pID], DaneGracza[playerid][gUID], DaneGracza[playerid][gGUID], -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
	RefreshNick(playerid);
	SetTimerEx("WychodziZPojazdu",2000,0,"d",playerid);
	ABTimer[playerid] = SetTimerEx("ABTimerer",5000, 0, "d", playerid);
	return 1;
}
stock WlascicielpojazduUID(uid, playerid)
{
	if(PojazdInfo[uid][pOwnerDzialalnosc] == 0 && PojazdInfo[uid][pOwnerPostac] == DaneGracza[playerid][gUID])
	{
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc1] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g1u21") == 1)
    {
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc2] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g2u21") == 1)
    {
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc3] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g3u21") == 1)
    {
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc4] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g4u21") == 1)
    {
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc5] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g5u21") == 1)
    {
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc6] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g6u21") == 1)
    {
		return true;
 	}
	else
	{
		return false;
 	}
}
stock WlascicielpojazduBezWYP(vehid, playerid)
{
	new uid = SprawdzCarUID(vehid);
	if(PojazdInfo[uid][pOwnerDzialalnosc] == 0 && PojazdInfo[uid][pOwnerPostac] == DaneGracza[playerid][gUID])
	{
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc1] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g1u21") == 1)
    {
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc2] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g2u21") == 1)
    {
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc3] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g3u21") == 1)
    {
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc4] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g4u21") == 1)
    {
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc5] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g5u21") == 1)
    {
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc6] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g6u21") == 1)
    {
		return true;
 	}
 	else if(DaneGracza[playerid][gAdmGroup] == 4)//CEO
    {
		return true;
 	}
	else if(DaneGracza[playerid][gAdmGroup] == 14)//Administrator
    {
		return true;
 	}
 	else if(DaneGracza[playerid][gAdmGroup] == 7)//SGM
    {
		return true;
 	}
	else
	{
		return false;
 	}
}
stock Wlascicielpojazduv2(vehid, playerid)
{
	new uid = SprawdzCarUID(vehid);
	if(PojazdInfo[uid][pOwnerDzialalnosc] == 0 && PojazdInfo[uid][pOwnerPostac] == DaneGracza[playerid][gUID])
	{
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc1] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g1u21") == 1)
    {
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc2] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g2u21") == 1)
    {
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc3] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g3u21") == 1)
    {
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc4] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g4u21") == 1)
    {
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc5] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g5u21") == 1)
    {
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc6] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g6u21") == 1)
    {
		return true;
 	}
	else if(DaneGracza[playerid][gWypozyczonyPojazdUID] == uid && DaneGracza[playerid][gWypozyczonyPojazdCZAS] > gettime()+CZAS_LETNI)
	{
		return true;
	}
	else
	{
		return false;
 	}
}
stock Wlascicielpojazdu(vehid, playerid)
{
	new uid = SprawdzCarUID(vehid);
	if(PojazdInfo[uid][pOwnerDzialalnosc] == 0 && PojazdInfo[uid][pOwnerPostac] == DaneGracza[playerid][gUID])
	{
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc1] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g1u21") == 1)
    {
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc2] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g2u21") == 1)
    {
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc3] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g3u21") == 1)
    {
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc4] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g4u21") == 1)
    {
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc5] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g5u21") == 1)
    {
		return true;
 	}
    else if(PojazdInfo[uid][pOwnerPostac] == 0 && DaneGracza[playerid][gDzialalnosc6] == PojazdInfo[uid][pOwnerDzialalnosc] && GetPVarInt(playerid, "g6u21") == 1)
    {
		return true;
 	}
	else if(DaneGracza[playerid][gWypozyczonyPojazdUID] == uid && DaneGracza[playerid][gWypozyczonyPojazdCZAS] > gettime()+CZAS_LETNI)
	{
		return true;
	}
	else if(DaneGracza[playerid][gAdmGroup] == 4 && DutyAdmina[playerid] == 1)//CEO
	{
		return true;
	}
	else if(DaneGracza[playerid][gAdmGroup] == 14 && DutyAdmina[playerid] == 1)//Administrator
	{
		return true;
	}
	else if(DaneGracza[playerid][gAdmGroup] == 7 && DutyAdmina[playerid] == 1)//SGM
    {
		return true;
 	}
	else
	{
		return false;
 	}
}
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	for(new i=0; i< MAX_PLAYERS; i++)
	{
		if (ispassenger) return 1;
		if(IsPlayerInVehicle(i,vehicleid) && GetPlayerState(i) == PLAYER_STATE_DRIVER)
		{
			new Float:X,Float:Y,Float:Z;
			GetPlayerPos(playerid,X,Y,Z);
			GameTextForPlayer(playerid, "~r~Ktos juz prowadzi ten pojazd!", 3000, 5);
			Teleportuj(playerid,X,Y,Z+1);
		}
	}
	//if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	//{
	    if(!Wlascicielpojazdu(vehicleid, playerid) && !ispassenger)
		{
		    GameTextForPlayer(playerid, "~r~Nie posiadasz uprawnien do prowadzenia tego pojazdu!", 3000, 5);
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x,y,z);
			Teleportuj(playerid, x, y, z);
			Frezuj(playerid, 0);
			Frezuj(playerid, 1);
		    return 1;
		}
	//}
	BW1[playerid] = GetPlayerVehicleID(playerid);
	BW2[playerid] = GetPlayerVehicleSeat(playerid);
	SetPVarInt(playerid, "AntyVehicle", 1);
	SetTimerEx("SprawdzCzyGraczBuguje",7000,0,"d",playerid);
	if(GetPVarInt(playerid, "FirstPerson") == 1)
    {
		guyfps[playerid] = 0;
		SetCameraBehindPlayer(playerid);
	    //FPSMode2(playerid);
	}
    RemovePlayerMapIcon(playerid,0);
    new areaid = GetPVarInt(playerid, "AreaPlayer");
    new i = GetPVarInt(playerid, "AreaPlyeri");
	if(GetPVarType(i, "bboxareaid"))
    {
		new uida = SprawdzCarUID(vehicleid);
		SetPVarInt(playerid, "AreaPlayer", 0);
		if(PojazdInfo[uida][pAudioStream] == 0 && Discman[playerid] == 0)
		{
            if(areaid == GetPVarInt(i, "bboxareaid"))
            {
                StopAudioStreamForPlayer(playerid);
                return 1;
            }
		}
	}
    if(GetPVarType(i, "bboxareaidveh"))
    {
		new uida = SprawdzCarUID(vehicleid);
		SetPVarInt(playerid, "AreaPlayer", 0);
		if(PojazdInfo[uida][pAudioStream] == 0 && Discman[playerid] == 0)
		{
            if(areaid == GetPVarInt(i, "bboxareaidveh"))
            {
                StopAudioStreamForPlayer(playerid);
                return 1;
            }
		}
    }
    if(GetPVarInt(playerid, "WZIALPACZKA") == 1 || GetPVarInt(playerid, "WZIALPACZKA") == 3)
    {
        GameTextForPlayer(playerid, "~r~Odloz paczke do pojazdu by wsiasc.", 3000, 5);
		RemovePlayerFromVehicle(playerid);
		Frezuj(playerid, 0);
		Frezuj(playerid, 1);
        return 1;
    }
	if(Rolki[playerid] != 0)
	{
		GameTextForPlayer(playerid, "~r~Nie mozesz z rolkami wchodzic do pojazdow.", 3000, 5);
		RemovePlayerFromVehicle(playerid);
		Frezuj(playerid, 0);
		Frezuj(playerid, 1);
		return 1;
	}
	new veh = SprawdzCarUID(vehicleid);
	if(PojazdInfo[veh][pSilnik] != 0)
	{
	    if(GetPlayerState(playerid) != PLAYER_STATE_PASSENGER)
		{
			SetProgressBarValue(Bar:PasekPaliwa[playerid], PojazdInfo[veh][pStan]);
			ShowProgressBarForPlayer(playerid, PasekPaliwa[playerid]);
			if(GetVehicleComponentInSlot(GetPlayerVehicleID(playerid), GetVehicleComponentType(1010)) == 1010)
			{
				if(PojazdInfo[veh][pPaliwoGaz] != 0)
				{
					DestroyProgressBar(PasekNitro[playerid]);
					PasekNitro[playerid] = CreateProgressBar(527.0,432.0,106.0,_, 0x00FF00FF, 100.0);
					SetProgressBarValue(Bar:PasekNitro[playerid], PojazdInfo[veh][pPaliwoGaz]);
					ShowProgressBarForPlayer(playerid, PasekNitro[playerid]);
				}
			}
		}
		return 1;
	}
	if(PojazdInfo[veh][pModel] == 574 && DaneGracza[playerid][gWyscig] != 0)
	{
		GameTextForPlayer(playerid, "~r~Aby wejsc do Sweepera musisz opuscic wyscig.~n~/opusc", 3000, 5);
		RemovePlayerFromVehicle(playerid);
		Frezuj(playerid, 0);
		Frezuj(playerid, 1);
		return 1;
	}
	if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
	    if(!Wlascicielpojazdu(vehicleid, playerid) && GetPVarInt(playerid, "SprzedalPojazd") == 0 && DaneGracza[playerid][gWypozyczonyPojazdCZAS] > gettime()+CZAS_LETNI)
		{
			new armour[256];
			format(armour, sizeof(armour), ""PREFIXAC".AntyCheat: Nieautoryzowane wejscie do pojazdu v3 (%d)", vehicleid);
			NadajKare(playerid,-1, 0, armour, -1);
		}
	}
	if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid)==PLAYER_STATE_DRIVER)
	{
	    SetPVarInt(playerid, "IsPlayerInAnyVehicle", 1);
	    if(!Rowery(vehicleid))
	    {
			if(PojazdInfo[veh][pBoost] != 0)
			{
				new string[128];
				format(string, sizeof(string), "Predkosc: %dkm/h~n~Paliwo: %0.01fl~n~~b~Boost:~w~ %0.1fbar", Predkosc(playerid), PojazdInfo[veh][pPaliwo], PojazdInfo[veh][pBoost]);
				TextDrawSetString(VehicleTDP[playerid], string);
				TextDrawShowForPlayer(playerid, VehicleTDP[playerid]);
			}
			else
			{
				new string[128];
				format(string, sizeof(string), "Predkosc: %dkm/h~n~Paliwo: %0.01fl", Predkosc(playerid), PojazdInfo[veh][pPaliwo]);
				TextDrawSetString(VehicleTDP[playerid], string);
				TextDrawShowForPlayer(playerid, VehicleTDP[playerid]);
			}
		}
	}
	if(IsPlayerInAnyVehicle(playerid) || GetPlayerState(playerid) == PLAYER_STATE_PASSENGER)
	{
		if(Discman[playerid] == 0)
		{
		    if(PojazdInfo[veh][pRok] == 0)
			{
				if(PojazdInfo[veh][pAudioStream] != 0)
				{
					if(GetPVarInt(playerid,"spawn"))
					{
						DeletePVar(playerid,"spawn");
					}
					new uids = PojazdInfo[veh][pAudioStream];
					new audio[128];
					format(audio, sizeof(audio), "%s",PrzedmiotInfo[uids][pWar3]);
					PlayAudioStreamForPlayer(playerid, audio, 0, 0, 0, 14.0, 0);
				}
			}
		}
		if(DaneGracza[playerid][gKajdankiS] != 0)
		{
		    new str[250];
		    new playerid2 = DaneGracza[playerid][gKajdankiS];
		    DaneGracza[playerid2][gKajdanki] = -1;
			SetPlayerSpecialAction(playerid2,SPECIAL_ACTION_NONE);
			RemovePlayerAttachedObject(playerid2, 1);
		    Frezuj(playerid2, 1);
		  	format(str, sizeof(str), "zdj¹³ kajdanki z r¹k %s.", ZmianaNicku(playerid2));
		    cmd_fasdasfdfive(playerid, str);
		    DaneGracza[playerid][gKajdankiS] = 0;
		}
		if(!Wlascicielpojazdu(vehicleid, playerid) && GetPVarInt(playerid, "SprzedalPojazd") == 0 && DaneGracza[playerid][gWypozyczonyPojazdCZAS] > gettime()+CZAS_LETNI)
		{
			new armour[256];
			format(armour, sizeof(armour), ""PREFIXAC".AntyCheat: Nieautoryzowane wejscie do pojazdu (%d)", vehicleid);
			NadajKare(playerid,-1, 0, armour, -1);
		}
		if(PojazdInfo[veh][pPSzyba] == 1 && PojazdInfo[veh][pSzyba] == 1)
	 	{
			if(Nieznajomy[playerid] == 0)
			{
				SetPVarInt(playerid, "Bandana", DaneGracza[playerid][gUID]);
				SetPVarInt(playerid, "UkrytyN", 1);
				RefreshNick(playerid);
			}
	 	}
		if(PojazdInfo[veh][pCB] == 1)
		{
		    if(PojazdInfo[veh][pMoc] == 0)
		 	{
			    new kanstr[124];
				format(kanstr, sizeof(kanstr), "~y~CB Radio ~>~~w~ Czestotliwosc %d", PojazdInfo[veh][pKanal]);
				TextDrawShowForPlayer(playerid, CB);
				TextDrawSetString(CB, kanstr);
			}
		}
	}
    if(BlokadaVEH(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz tego zrobiæ, poniewa¿ posiadasz aktywn¹ blokade prowadzenia pojazdów \nJeœli uwa¿asz, ¿e kara zosta³a nadana nies³usznie mo¿esz od niej apelowaæ na forum (www."PROJEKT"{DEDEDE}).", "Zamknij", "");
		RemovePlayerFromVehicle(playerid);
		Frezuj(playerid, 0);
		Frezuj(playerid, 1);
		return 1;
	}
	if(!Wlascicielpojazdu(vehicleid, playerid))
	{
	    GameTextForPlayer(playerid, "~r~Nie posiadasz uprawnien do prowadzenia tego pojazdu!", 3000, 5);
	    RemovePlayerFromVehicle(playerid);
		RemovePlayerFromVehicle(playerid);
		Frezuj(playerid, 0);
		Frezuj(playerid, 1);
	    return 1;
	}
	if(!Wlascicielpojazdu(vehicleid, playerid) && ispassenger == 0)
	{
    	GameTextForPlayer(playerid,"~r~Nie posiadasz kluczy do tego pojazdu!",5000,3);
		RemovePlayerFromVehicle(playerid);
		RemovePlayerFromVehicle(playerid);
		Frezuj(playerid, 0);
		Frezuj(playerid, 1);
		return 1;
	}
	new log[256];
	format(log, sizeof(log), "[CARS] [%s] [ID: %d] Entered vehicle %d (%s)", ZmianaNicku(playerid), playerid, PojazdInfo[veh][pUID], GetVehicleModelName(PojazdInfo[veh][pModel]));
	Transakcja(T_IC, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, log, gettime()+KOREKTA_CZASOWA);
	new logtekst[256];
	format(logtekst, sizeof(logtekst), "[CAR] [%s] [ID: %d UID: %d] Entered vehicle %s (%d)", ZmianaNicku(playerid), playerid, DaneGracza[playerid][gUID], GetVehicleModelName(PojazdInfo[veh][pModel]), PojazdInfo[veh][pUID]);
	TransakcjaVeh(T_OVEH, PojazdInfo[veh][pUID], PojazdInfo[veh][pID], DaneGracza[playerid][gUID], DaneGracza[playerid][gGUID], -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
    return 1;
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
    new uid = SprawdzCarUID(vehicleid);
	new uszkodzenia[4];
	GetVehicleDamageStatus(vehicleid, uszkodzenia[0], uszkodzenia[1], uszkodzenia[2], uszkodzenia[3]);
	GetVehicleDamageStatus(vehicleid, uszkodzenia[0], uszkodzenia[1], uszkodzenia[2], uszkodzenia[3]);
	if(uszkodzenia[0] == 0 && PojazdInfo[uid][pUszkodzenie1] != 0 || uszkodzenia[1] == 0 && PojazdInfo[uid][pUszkodzenie2] != 0 || uszkodzenia[3] == 0 && PojazdInfo[uid][pUszkodzenie4] != 0)
	{
		if(uszkodzenia[1] == 0 && PojazdInfo[uid][pUszkodzenie2] != 0)
		{
			new tablica[32], tablica2[32], uszkodzeniasprawdz = PojazdInfo[uid][pUszkodzenie2];
			for(new i = 0; i < 32; i++)
			{
				tablica[i] = uszkodzenia[1] % 2;
				tablica2[i] = uszkodzeniasprawdz % 2;
				if(i == 16 && tablica2[i] == 1 && tablica[i] == 0)
				{
					return 0;
				}
				if(i == 24 && tablica2[i] == 1 && tablica[i] == 0)
				{
					return 0;
				}
				uszkodzenia[1] /= 2;
				uszkodzeniasprawdz /= 2;
			}
		}
		if(AntyCheatWizualizacja[playerid] == 0)
		{
		    if(DaneGracza[playerid][gAdmGroup] != 4)
			{
				new world = GetVehicleVirtualWorld(vehicleid);
				UpdateVehicleDamageStatus(vehicleid, PojazdInfo[uid][pUszkodzenie1], PojazdInfo[uid][pUszkodzenie2], PojazdInfo[uid][pUszkodzenie3], PojazdInfo[uid][pUszkodzenie4]);
				SetVehicleVirtualWorld(vehicleid,9999);
				SetVehicleVirtualWorld(vehicleid,world);
				GetVehicleDamageStatus(vehicleid, PojazdInfo[uid][pUszkodzenie1], PojazdInfo[uid][pUszkodzenie2], PojazdInfo[uid][pUszkodzenie3], PojazdInfo[uid][pUszkodzenie4]);
				return 1;
			}
		}
	}
	else
	{
		new Float:Rozmiar[3], Float:Srodek[3];
		GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, Rozmiar[0], Rozmiar[1], Rozmiar[2]);
		GetVehiclePos(vehicleid, Srodek[0], Srodek[1], Srodek[2]);
		new tablica[32], tablica2[32], tablica3[32], tablica4[32], uszkodzeniasprawdz = PojazdInfo[uid][pUszkodzenie2], uszkodzeniasprawdz2 = PojazdInfo[uid][pUszkodzenie1];
		for(new i = 0; i < 32; i++)
		{
			tablica[i] = uszkodzenia[1] % 2;
			tablica2[i] = uszkodzeniasprawdz % 2;
			tablica3[i] = uszkodzenia[0] % 2;
			tablica4[i] = uszkodzeniasprawdz2 % 2;
			if(i == 1 && tablica[i] == 1 && tablica2[i] == 0)
			{
				new Float:Pozycje[3];
				Pozycje[0] = Srodek[0];
				Pozycje[1] = Srodek[1];
				Pozycje[2] = Srodek[2];
				ForeachEx(h, MAX_PLAYERS)
				{
					if(IsPlayerConnected(h))
					{
						if(zalogowany[h] == true)
						{
							if(IsPlayerInRangeOfPoint(h, 5.0, Pozycje[0], Pozycje[1], Pozycje[2]) && !IsPlayerInAnyVehicle(h))
							{
								if(UzylLPM[h] == 1)
								{
									SetPVarInt(h, "Karoseria", GetPVarInt(h, "Karoseria")+1);
									if(GetPVarInt(h, "Karoseria") >= 2)
									{
										new world = GetVehicleVirtualWorld(vehicleid);
										UpdateVehicleDamageStatus(vehicleid, PojazdInfo[uid][pUszkodzenie1], PojazdInfo[uid][pUszkodzenie2], PojazdInfo[uid][pUszkodzenie3], PojazdInfo[uid][pUszkodzenie4]);
										SetVehicleVirtualWorld(vehicleid,9999);
										SetVehicleVirtualWorld(vehicleid,world);
										GetVehicleDamageStatus(vehicleid, PojazdInfo[uid][pUszkodzenie1], PojazdInfo[uid][pUszkodzenie2], PojazdInfo[uid][pUszkodzenie3], PojazdInfo[uid][pUszkodzenie4]);
										Frezuj(h, 0);
										SetTimerEx("Frez", 3000, 0, "d", h);
										NadajKare(h,-1, 1, ""PREFIXAC".AntyCheat: Rozwalenie karoseri pojazdu MK", 0);
										SetPVarInt(h, "Karoseria", 0);
									}
								}
							}
						}
					}
				}
			}
			if(i == 9 && tablica[i] == 1 && tablica2[i] == 0)
			{
				new Float:Pozycje[3];
				Pozycje[0] = Srodek[0];
				Pozycje[1] = Srodek[1];
				Pozycje[2] = Srodek[2];
				ForeachEx(h, MAX_PLAYERS)
				{
					if(IsPlayerConnected(h))
					{
						if(zalogowany[h] == true)
						{
							if(IsPlayerInRangeOfPoint(h, 5.0, Pozycje[0], Pozycje[1], Pozycje[2]) && !IsPlayerInAnyVehicle(h))
							{
								if(UzylLPM[h] == 1)
								{
									SetPVarInt(h, "Karoseria", GetPVarInt(h, "Karoseria")+1);
									if(GetPVarInt(h, "Karoseria") >= 2)
									{
										new world = GetVehicleVirtualWorld(vehicleid);
										UpdateVehicleDamageStatus(vehicleid, PojazdInfo[uid][pUszkodzenie1], PojazdInfo[uid][pUszkodzenie2], PojazdInfo[uid][pUszkodzenie3], PojazdInfo[uid][pUszkodzenie4]);
										SetVehicleVirtualWorld(vehicleid,9999);
										SetVehicleVirtualWorld(vehicleid,world);
										GetVehicleDamageStatus(vehicleid, PojazdInfo[uid][pUszkodzenie1], PojazdInfo[uid][pUszkodzenie2], PojazdInfo[uid][pUszkodzenie3], PojazdInfo[uid][pUszkodzenie4]);
										Frezuj(h, 0);
										SetTimerEx("Frez", 3000, 0, "d", h);
										NadajKare(h,-1, 1, ""PREFIXAC".AntyCheat: Rozwalenie karoseri pojazdu BG", 0);
										SetPVarInt(h, "Karoseria", 0);
									}
								}
							}
						}
					}
				}
			}
			if(i == 17 && tablica[i] == 1 && tablica2[i] == 0)
			{
				new Float:Pozycje[3];
				Pozycje[0] = Srodek[0];
				Pozycje[1] = Srodek[1];
				Pozycje[2] = Srodek[2];
				ForeachEx(h, MAX_PLAYERS)
				{
					if(IsPlayerConnected(h))
					{
						if(zalogowany[h] == true)
						{
							if(IsPlayerInRangeOfPoint(h, 3.0, Pozycje[0], Pozycje[1], Pozycje[2]) && !IsPlayerInAnyVehicle(h))
							{
								if(UzylLPM[h] == 1)
								{
									SetPVarInt(h, "Karoseria", GetPVarInt(h, "Karoseria")+1);
									if(GetPVarInt(h, "Karoseria") >= 2)
									{
										new world = GetVehicleVirtualWorld(vehicleid);
										UpdateVehicleDamageStatus(vehicleid, PojazdInfo[uid][pUszkodzenie1], PojazdInfo[uid][pUszkodzenie2], PojazdInfo[uid][pUszkodzenie3], PojazdInfo[uid][pUszkodzenie4]);
										SetVehicleVirtualWorld(vehicleid,9999);
										SetVehicleVirtualWorld(vehicleid,world);
										GetVehicleDamageStatus(vehicleid, PojazdInfo[uid][pUszkodzenie1], PojazdInfo[uid][pUszkodzenie2], PojazdInfo[uid][pUszkodzenie3], PojazdInfo[uid][pUszkodzenie4]);
										Frezuj(h, 0);
										SetTimerEx("Frez", 3000, 0, "d", h);
										NadajKare(h,-1, 1, ""PREFIXAC".AntyCheat: Rozwalenie karoseri pojazdu DK", 0);
										SetPVarInt(h, "Karoseria", 0);
									}
								}
							}
						}
					}
				}
			}
			if(i == 25 && tablica[i] == 1 && tablica2[i] == 0)
			{
				new Float:Pozycje[3];
				Pozycje[0] = Srodek[0];
				Pozycje[1] = Srodek[1];
				Pozycje[2] = Srodek[2];
				ForeachEx(h, MAX_PLAYERS)
				{
					if(IsPlayerConnected(h))
					{
						if(zalogowany[h] == true)
						{
							if(IsPlayerInRangeOfPoint(h, 3.0, Pozycje[0], Pozycje[1], Pozycje[2]) && !IsPlayerInAnyVehicle(h))
							{
								if(UzylLPM[h] == 1)
								{
									SetPVarInt(h, "Karoseria", GetPVarInt(h, "Karoseria")+1);
									if(GetPVarInt(h, "Karoseria") >= 2)
									{
										new world = GetVehicleVirtualWorld(vehicleid);
										UpdateVehicleDamageStatus(vehicleid, PojazdInfo[uid][pUszkodzenie1], PojazdInfo[uid][pUszkodzenie2], PojazdInfo[uid][pUszkodzenie3], PojazdInfo[uid][pUszkodzenie4]);
										SetVehicleVirtualWorld(vehicleid,9999);
										SetVehicleVirtualWorld(vehicleid,world);
										GetVehicleDamageStatus(vehicleid, PojazdInfo[uid][pUszkodzenie1], PojazdInfo[uid][pUszkodzenie2], PojazdInfo[uid][pUszkodzenie3], PojazdInfo[uid][pUszkodzenie4]);
										Frezuj(h, 0);
										SetTimerEx("Frez", 3000, 0, "d", h);
										NadajKare(h,-1, 1, ""PREFIXAC".AntyCheat: Rozwalenie karoseri pojazdu DP", 0);
										SetPVarInt(h, "Karoseria", 0);
									}
								}
							}
						}
					}
				}
			}
			if(i == 20 && tablica3[i] == 1 && tablica4[i] == 0)
			{
				new Float:Pozycje[3];
				Pozycje[0] = Srodek[0];
				Pozycje[1] = Srodek[1];
				Pozycje[2] = Srodek[2];
				ForeachEx(h, MAX_PLAYERS)
				{
					if(IsPlayerConnected(h))
					{
						if(zalogowany[h] == true)
						{
							if(IsPlayerInRangeOfPoint(h, 5.0, Pozycje[0], Pozycje[1], Pozycje[2]) && !IsPlayerInAnyVehicle(h))
							{
								if(UzylLPM[h] == 1)
								{
									SetPVarInt(h, "Karoseria", GetPVarInt(h, "Karoseria")+1);
									if(GetPVarInt(h, "Karoseria") >= 2)
									{
										new world = GetVehicleVirtualWorld(vehicleid);
										UpdateVehicleDamageStatus(vehicleid, PojazdInfo[uid][pUszkodzenie1], PojazdInfo[uid][pUszkodzenie2], PojazdInfo[uid][pUszkodzenie3], PojazdInfo[uid][pUszkodzenie4]);
										SetVehicleVirtualWorld(vehicleid,9999);
										SetVehicleVirtualWorld(vehicleid,world);
										GetVehicleDamageStatus(vehicleid, PojazdInfo[uid][pUszkodzenie1], PojazdInfo[uid][pUszkodzenie2], PojazdInfo[uid][pUszkodzenie3], PojazdInfo[uid][pUszkodzenie4]);
										Frezuj(h, 0);
										SetTimerEx("Frez", 3000, 0, "d", h);
										NadajKare(h,-1, 1, ""PREFIXAC".AntyCheat: Rozwalenie karoseri pojazdu ZP", 0);
										SetPVarInt(h, "Karoseria", 0);
									}
								}
							}
						}
					}
				}
			}
			if(i == 24 && tablica3[i] == 1 && tablica4[i] == 0)
			{
				new Float:Pozycje[3];
				Pozycje[0] = Srodek[0];
				Pozycje[1] = Srodek[1];
				Pozycje[2] = Srodek[2];
				ForeachEx(h, MAX_PLAYERS)
				{
					if(IsPlayerConnected(h))
					{
						if(zalogowany[h] == true)
						{
							if(IsPlayerInRangeOfPoint(h, 5.0, Pozycje[0], Pozycje[1], Pozycje[2]) && !IsPlayerInAnyVehicle(h))
							{
								if(UzylLPM[h] == 1)
								{
									SetPVarInt(h, "Karoseria", GetPVarInt(h, "Karoseria")+1);
									if(GetPVarInt(h, "Karoseria") >= 2)
									{
										new world = GetVehicleVirtualWorld(vehicleid);
										UpdateVehicleDamageStatus(vehicleid, PojazdInfo[uid][pUszkodzenie1], PojazdInfo[uid][pUszkodzenie2], PojazdInfo[uid][pUszkodzenie3], PojazdInfo[uid][pUszkodzenie4]);
										SetVehicleVirtualWorld(vehicleid,9999);
										SetVehicleVirtualWorld(vehicleid,world);
										GetVehicleDamageStatus(vehicleid, PojazdInfo[uid][pUszkodzenie1], PojazdInfo[uid][pUszkodzenie2], PojazdInfo[uid][pUszkodzenie3], PojazdInfo[uid][pUszkodzenie4]);
										Frezuj(h, 0);
										SetTimerEx("Frez", 3000, 0, "d", h);
										NadajKare(h,-1, 1, ""PREFIXAC".AntyCheat: Rozwalenie karoseri pojazdu ZT", 0);
										SetPVarInt(h, "Karoseria", 0);
									}
								}
							}
						}
					}
				}
			}
			uszkodzenia[1] /= 2;
			uszkodzeniasprawdz /= 2;
			uszkodzenia[0] /= 2;
			uszkodzeniasprawdz2 /= 2;
		}
		GetVehicleDamageStatus(vehicleid, PojazdInfo[uid][pUszkodzenie1], PojazdInfo[uid][pUszkodzenie2], PojazdInfo[uid][pUszkodzenie3], PojazdInfo[uid][pUszkodzenie4]);
	}
    return 1;
}
public OnVehicleDeath(vehicleid, killerid)
{
	new	Float:nVHP;
	GetVehicleHealth(vehicleid, nVHP );
	new uid = SprawdzCarUID(vehicleid);
	DestroyDynamicObject(PojazdInfo[uid][pKogut]);
	if(killerid != INVALID_PLAYER_ID)
	{
	    if(!Wlascicielpojazdu(vehicleid, killerid))
		{
			NadajKare(killerid, -1, 0, ""PREFIXAC".AntyCheat: Vehicle killer", 0);
			PojazdInfo[uid][pStan] = 1000.0;
			SetVehicleHealth(vehicleid, 1000);
			return 1;
		}
	}
	if(!Wlascicielpojazdu(vehicleid, killerid))
	{
		NadajKare(killerid, -1, 0, ""PREFIXAC".AntyCheat: Vehicle killer v2", 0);
		PojazdInfo[uid][pStan] = 1000.0;
		SetVehicleHealth(vehicleid, 1000);
		return 1;
	}
	if(PojazdInfo[uid][pModel] == 574)
	{
		SetVehicleToRespawn(vehicleid);
		PojazdInfo[uid][pStan] = 1000.0;
		PojazdInfo[uid][pPaliwo] = 100;
		SetVehicleHealth(vehicleid, PojazdInfo[uid][pStan] );
		RepairVehicle(vehicleid);
	}
	else
	{
		DestroyVehicle(vehicleid);
		PojazdInfo[uid][pSpawn] = 0;
		PojazdInfo[uid][pStan] = 300.0;
		SetVehicleHealth(vehicleid, PojazdInfo[uid][pStan] );
	}
	PojazdInfo[uid][pHolowany] = 0;
	new rok, miesiac, dzien, godzina, minuta, sekunda;
	sekundytodata(gettime()-(3600*4), rok, miesiac, dzien, godzina, minuta, sekunda);
	printf("[UID_POJAZDU:%d][%02d-%02d-%d, %02d:%02d][Wybuch Pojazdu] Gracz: %s (UID: %d, GUID: %d) doprowadzil pojazd (UID: %d) do wybuchu, HP: %f.",uid, dzien, miesiac, rok, godzina, minuta, ZmianaNicku(killerid), DaneGracza[killerid][gUID], DaneGracza[killerid][gGUID], uid, nVHP);
	Transakcja(T_VEHDEST, DaneGracza[killerid][gUID], -1, DaneGracza[killerid][gGUID], -1, nVHP, uid, vehicleid, PojazdInfo[uid][pStan], "-", gettime()+KOREKTA_CZASOWA);
	new logtekst[256];
	format(logtekst, sizeof(logtekst), "[CAR] [%s] [ID: %d UID: %d] doprowadzi³ pojazd %s (%d) do wybuchu HP: %f.", ZmianaNicku(killerid), killerid, DaneGracza[killerid][gUID], GetVehicleModelName(PojazdInfo[uid][pModel]), PojazdInfo[uid][pUID], nVHP);
	TransakcjaVeh(T_OVEH, PojazdInfo[uid][pUID], PojazdInfo[uid][pID], DaneGracza[killerid][gUID], DaneGracza[killerid][gGUID], -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
	PojazdInfo[uid][pID] = 0;
	ZapiszPojazd(uid, 1);
	ZapiszPojazd(uid, 2);
	KillTimer(PojazdInfo[uid][pTimer]);
	UpdateDynamic3DTextLabelText(Vopis[PojazdInfo[uid][pID]], 0xAAAAFFFF, " ");
    return 1;
}
forward ZaladujPojazdy();
public ZaladujPojazdy()
{
	new result[512], iz = 0;
	format(zapyt, sizeof(zapyt), "SELECT * FROM `jochym_pojazdy`");
    mysql_check();
	mysql_query2(zapyt);
    mysql_store_result();
    while(mysql_fetch_row(result))
	{
	    new uid;
		sscanf(result, "p<|>d", uid);
		sscanf(result,  "p<|>ddddddffs[20]dddds[20]dfffddfddfdddddddfdffffdddddddddddfdddddddfd",
		PojazdInfo[uid][pUID],
		PojazdInfo[uid][pOwnerPostac],
		PojazdInfo[uid][pOwnerDzialalnosc],
		PojazdInfo[uid][pModel],
		PojazdInfo[uid][pKolor],
		PojazdInfo[uid][pKolor2],
		PojazdInfo[uid][pStan],
		PojazdInfo[uid][pPrzebieg],
		PojazdInfo[uid][pDodatki],
		PojazdInfo[uid][pGaz],
		PojazdInfo[uid][pTypPojazdu],
		PojazdInfo[uid][pTypPaliwa],
		PojazdInfo[uid][pMoc],
		PojazdInfo[uid][pTablice],
		PojazdInfo[uid][pRok],
		PojazdInfo[uid][pX],
		PojazdInfo[uid][pY],
		PojazdInfo[uid][pZ],
		PojazdInfo[uid][pVw],
		PojazdInfo[uid][pInt],
		PojazdInfo[uid][pAngle],
		PojazdInfo[uid][pSpawn],
		PojazdInfo[uid][pLpg],
		PojazdInfo[uid][pPaliwo],
		PojazdInfo[uid][pLock],
		PojazdInfo[uid][pSilnik],// 24 down
		PojazdInfo[uid][pUszkodzenie1],
		PojazdInfo[uid][pUszkodzenie2],
		PojazdInfo[uid][pUszkodzenie3],
		PojazdInfo[uid][pUszkodzenie4],
		PojazdInfo[uid][pBlokada],
		PojazdInfo[uid][pNaprawy],//up 32 , 26 down
		PojazdInfo[uid][pPJ],
		PojazdInfo[uid][pOX],
		PojazdInfo[uid][pOY],
		PojazdInfo[uid][pOZ],
		PojazdInfo[uid][pOA],
		PojazdInfo[uid][pPrzepchany],
		PojazdInfo[uid][pTempomat],
		PojazdInfo[uid][pAudio],
		PojazdInfo[uid][pAlarm],
		PojazdInfo[uid][pImmo],
		PojazdInfo[uid][pCB],
		PojazdInfo[uid][pKanal],
		PojazdInfo[uid][pSzyba],
		PojazdInfo[uid][pAukcja],
		PojazdInfo[uid][pTablicaON],
		PojazdInfo[uid][pOVW],
		PojazdInfo[uid][pPaliwoGaz],
		PojazdInfo[uid][pGPS],
		PojazdInfo[uid][pPSzyba],
		PojazdInfo[uid][pSzyba2],
		PojazdInfo[uid][pSzyba3],
		PojazdInfo[uid][pSzyba4],
		PojazdInfo[uid][pGlosnik],
		PojazdInfo[uid][pNitro],
		PojazdInfo[uid][pBoost],
		PojazdInfo[uid][pPID]);
		if(PojazdInfo[uid][pModel] >= 400 && PojazdInfo[uid][pModel] <= 611)
		{
			if(PojazdInfo[uid][pAukcja] > 0)
			{
				PojazdInfo[uid][pOwnerPostac] = PojazdInfo[uid][pAukcja];
				PojazdInfo[uid][pAukcja] = 0;
				new str[124];
				strdel(str, 0, 124);
				format(str, sizeof(str), "UPDATE `jochym_pojazdy` SET `AUKCJA` = '%d' WHERE `ID` = '%d'", PojazdInfo[uid][pAukcja], uid);
				mysql_query(str);
			}
			if(PojazdInfo[uid][pPaliwo] > 101)
			{
				PojazdInfo[uid][pPaliwo] = 100;
			}
			if(PojazdInfo[uid][pModel] == 574)
			{
				PojazdInfo[uid][pSpawn] = 1;
			}
		    if(PojazdInfo[uid][pSpawn] != 0)
			{
				StworzPojazdUID(uid);
			}
			iz++;
		}
	}
	mysql_free_result();
	//printf("1Pojazdy     - %d", iz);
}
forward ZaladujPojazdyGracza(playerid);
public ZaladujPojazdyGracza(playerid)
{
	new result[512], iz = 0;
	format(zapyt, sizeof(zapyt), "SELECT * FROM `jochym_pojazdy` WHERE `UID_POSTACI` = %d AND `UID_DZIALALNOSCI` = 0", DaneGracza[playerid][gUID]);
    mysql_check();
	mysql_query2(zapyt);
    mysql_store_result();

    while(mysql_fetch_row(result))
	{
	    new uid;
		sscanf(result, "p<|>d", uid);
		sscanf(result,  "p<|>ddddddffs[20]dddds[20]dfffddfddfdddddddfdffffdddddddddddfdddddddfd", 	PojazdInfo[uid][pUID],
															PojazdInfo[uid][pOwnerPostac],
															PojazdInfo[uid][pOwnerDzialalnosc],
															PojazdInfo[uid][pModel],
															PojazdInfo[uid][pKolor],
															PojazdInfo[uid][pKolor2],
															PojazdInfo[uid][pStan],
															PojazdInfo[uid][pPrzebieg],
															PojazdInfo[uid][pDodatki],
															PojazdInfo[uid][pGaz],
															PojazdInfo[uid][pTypPojazdu],
															PojazdInfo[uid][pTypPaliwa],
															PojazdInfo[uid][pMoc],
															PojazdInfo[uid][pTablice],
															PojazdInfo[uid][pRok],
															PojazdInfo[uid][pX],
															PojazdInfo[uid][pY],
															PojazdInfo[uid][pZ],
															PojazdInfo[uid][pVw],
															PojazdInfo[uid][pInt],
															PojazdInfo[uid][pAngle],
															PojazdInfo[uid][pSpawn],
															PojazdInfo[uid][pLpg],
															PojazdInfo[uid][pPaliwo],
															PojazdInfo[uid][pLock],
															PojazdInfo[uid][pSilnik],
															PojazdInfo[uid][pUszkodzenie1],
															PojazdInfo[uid][pUszkodzenie2],
															PojazdInfo[uid][pUszkodzenie3],
															PojazdInfo[uid][pUszkodzenie4],
															PojazdInfo[uid][pBlokada],
															PojazdInfo[uid][pNaprawy],//26
															PojazdInfo[uid][pPJ],
															PojazdInfo[uid][pOX],
															PojazdInfo[uid][pOY],
															PojazdInfo[uid][pOZ],
															PojazdInfo[uid][pOA],
															PojazdInfo[uid][pPrzepchany],
															PojazdInfo[uid][pTempomat],
															PojazdInfo[uid][pAudio],
															PojazdInfo[uid][pAlarm],
															PojazdInfo[uid][pImmo],
															PojazdInfo[uid][pCB],
															PojazdInfo[uid][pKanal],
															PojazdInfo[uid][pSzyba],
															PojazdInfo[uid][pAukcja],
															PojazdInfo[uid][pTablicaON],
															PojazdInfo[uid][pOVW],
															PojazdInfo[uid][pPaliwoGaz],
															PojazdInfo[uid][pGPS],
															PojazdInfo[uid][pPSzyba],
															PojazdInfo[uid][pSzyba2],
															PojazdInfo[uid][pSzyba3],
															PojazdInfo[uid][pSzyba4],
															PojazdInfo[uid][pGlosnik],
															PojazdInfo[uid][pNitro],
															PojazdInfo[uid][pBoost],
															PojazdInfo[uid][pPID]);
		if((PojazdInfo[uid][pModel] >= 400 && PojazdInfo[uid][pModel] <= 611))
		{
			if(PojazdInfo[uid][pAukcja] > 0)
			{
				PojazdInfo[uid][pOwnerPostac] = PojazdInfo[uid][pAukcja];
				PojazdInfo[uid][pAukcja] = 0;
				new str[124];
				strdel(zapyt, 0, 124);
				format(str, sizeof(str), "UPDATE `jochym_pojazdy` SET `AUKCJA` = '%d' WHERE `ID` = '%d'", PojazdInfo[uid][pAukcja], uid);
				mysql_query(str);
			}
			if(PojazdInfo[uid][pPaliwo] > 101)
			{
				PojazdInfo[uid][pPaliwo] = 100;
			}
		    //PojazdInfo[uid][pSpawn] = 0;
			iz++;
		}
	}
	mysql_free_result();
	//printf("2Pojazdy     - %d", iz);
}
forward UsunPojazd(uid);
public UsunPojazd(uid)
{
	format(zapyt, sizeof(zapyt), "DELETE FROM `jochym_pojazdy` WHERE `ID` = '%d'", uid);
	mysql_check();
	mysql_query2(zapyt);
	DestroyDynamicObject(PojazdInfo[uid][pKogut]);
	DestroyVehicle(PojazdInfo[uid][pID]);
	PojazdInfo[uid][pID] = 0;
	PojazdInfo[uid][pUID] = 0;
	PojazdInfo[uid][pOwnerPostac] = 0;
	PojazdInfo[uid][pOwnerDzialalnosc] = 0;
	PojazdInfo[uid][pModel] = 0;
	PojazdInfo[uid][pKolor] = 0;
	PojazdInfo[uid][pKolor2] = 0;
	PojazdInfo[uid][pStan] = 0;
	PojazdInfo[uid][pPrzebieg] = 0;
	PojazdInfo[uid][pDodatki] = 0;
	PojazdInfo[uid][pGaz] = 0;
	PojazdInfo[uid][pTypPojazdu] = 0;
	PojazdInfo[uid][pTypPaliwa] = 0;
	PojazdInfo[uid][pMoc] = 0;
	PojazdInfo[uid][pRok] = 0;
	PojazdInfo[uid][pX] = 0;
	PojazdInfo[uid][pY] = 0;
	PojazdInfo[uid][pZ] = 0;
	PojazdInfo[uid][pVw] = 0;
	PojazdInfo[uid][pInt] = 0;
	PojazdInfo[uid][pAngle] = 0;
	PojazdInfo[uid][pSpawn] = 0;
	PojazdInfo[uid][pLpg] = 0;
	PojazdInfo[uid][pPaliwo] = 0;
	PojazdInfo[uid][pLock] = 0;
	PojazdInfo[uid][pSilnik] = 0;
	PojazdInfo[uid][pUszkodzenie1] = 0;
	PojazdInfo[uid][pUszkodzenie2] = 0;
	PojazdInfo[uid][pUszkodzenie3] = 0;
	PojazdInfo[uid][pUszkodzenie4] = 0;
	PojazdInfo[uid][pBlokada] = 0;
	PojazdInfo[uid][pNaprawy] = 0;
	PojazdInfo[uid][pGPS] = 0;
	PojazdInfo[uid][pPSzyba] = 0;
	PojazdInfo[uid][pSzyba] = 0;
	PojazdInfo[uid][pSzyba2] = 0;
	PojazdInfo[uid][pSzyba3] = 0;
	PojazdInfo[uid][pSzyba4] = 0;
	PojazdInfo[uid][pGlosnik] = 0;
	PojazdInfo[uid][pNitro] = 0;
	PojazdInfo[uid][pBoost] = 0;
	PojazdInfo[uid][pPID] = 0;
	mysql_free_result();
	return 1;
}
forward StworzPojazdUID(uid);
public StworzPojazdUID(uid)
{
	new pointer;
	if(PojazdInfo[uid][pPrzepchany] == 1)
	{
		if(PojazdInfo[uid][pModel] == 538)
		{
			pointer = AddStaticVehicle(PojazdInfo[uid][pModel], PojazdInfo[uid][pX], PojazdInfo[uid][pY], PojazdInfo[uid][pZ], PojazdInfo[uid][pAngle], PojazdInfo[uid][pKolor], PojazdInfo[uid][pKolor2]);
		}
		else
		{
			if(PojazdInfo[uid][pGPS] == 0)
			{
				pointer = CreateVehicle(PojazdInfo[uid][pModel], PojazdInfo[uid][pOX], PojazdInfo[uid][pOY], PojazdInfo[uid][pOZ], PojazdInfo[uid][pOA], PojazdInfo[uid][pKolor], PojazdInfo[uid][pKolor2], -1, 0);
			}
			else
			{
				pointer = CreateVehicle(PojazdInfo[uid][pModel], PojazdInfo[uid][pOX], PojazdInfo[uid][pOY], PojazdInfo[uid][pOZ], PojazdInfo[uid][pOA], PojazdInfo[uid][pKolor], PojazdInfo[uid][pKolor2], -1, 1);
			}
		}
	}
	else
	{
		if(PojazdInfo[uid][pModel] == 538)
		{
			pointer = AddStaticVehicle(PojazdInfo[uid][pModel], PojazdInfo[uid][pX], PojazdInfo[uid][pY], PojazdInfo[uid][pZ], PojazdInfo[uid][pAngle], PojazdInfo[uid][pKolor], PojazdInfo[uid][pKolor2]);
		}
		else
		{
			if(PojazdInfo[uid][pGPS] == 0)
			{
				pointer = CreateVehicle(PojazdInfo[uid][pModel], PojazdInfo[uid][pX], PojazdInfo[uid][pY], PojazdInfo[uid][pZ], PojazdInfo[uid][pAngle], PojazdInfo[uid][pKolor], PojazdInfo[uid][pKolor2], -1, 0);
			}
			else
			{
				pointer = CreateVehicle(PojazdInfo[uid][pModel], PojazdInfo[uid][pX], PojazdInfo[uid][pY], PojazdInfo[uid][pZ], PojazdInfo[uid][pAngle], PojazdInfo[uid][pKolor], PojazdInfo[uid][pKolor2], -1, 1);
			}
		}
	}
	PojazdInfo[uid][pID] = pointer;
	if(ComparisonString(PojazdInfo[uid][pTablice], "Brak"))
	{
		format(PojazdInfo[uid][pTablice], 10, " ");
	}
	if(ComparisonString(PojazdInfo[uid][pTablice], ""))
	{
		format(PojazdInfo[uid][pTablice], 10, " ");
	}
	SetVehicleNumberPlate(pointer, PojazdInfo[uid][pTablice]);
	LinkVehicleToInterior(pointer, PojazdInfo[uid][pInt]);
	SetVehicleVirtualWorld(pointer, PojazdInfo[uid][pVw]);
	PojazdInfo[uid][pAudioStream] = 0;
	PojazdInfo[uid][pSilnik] = 0;
	PojazdInfo[uid][pLock] = 1;
	KillTimer(PojazdInfo[uid][pTimer]);
	SetVehicleParamsEx(pointer, false, false, false, PojazdInfo[uid][pLock], false, false, false);
	SetVehicleParamsCarWindows(pointer, PojazdInfo[uid][pSzyba], PojazdInfo[uid][pSzyba2], PojazdInfo[uid][pSzyba3], PojazdInfo[uid][pSzyba4]);
	OnVehicleSpawn(pointer);
	PojazdInfo[uid][pOVW] = GetVehicleVirtualWorld(PojazdInfo[uid][pID]);
	GetVehicleZAngle(pointer, PojazdInfo[uid][pOA]);
	if(PojazdInfo[uid][pPrzepchany] == 1)
	{
		SetVehiclePos(pointer,PojazdInfo[uid][pOX],PojazdInfo[uid][pOY],PojazdInfo[uid][pOZ]);
		SetVehicleVirtualWorld(pointer, PojazdInfo[uid][pOVW]);
		PojazdInfo[uid][pPrzepchany] = 0;
	}
	else
	{
		SetVehiclePos(pointer,PojazdInfo[uid][pX],PojazdInfo[uid][pY],PojazdInfo[uid][pZ]);
		SetVehicleVirtualWorld(pointer, PojazdInfo[uid][pVw]);
	}
	SetVehicleZAngle(pointer, PojazdInfo[uid][pAngle]);
	Vopis[pointer]= CreateDynamic3DTextLabel(" ",0xAAAAFFDD,0.0,0.0,0.0,15.0,INVALID_PLAYER_ID,pointer,0,-1,-1,-1,100.0);
	GetVehiclePos(pointer,PojazdInfo[uid][pOX],PojazdInfo[uid][pOY],PojazdInfo[uid][pOZ]);
	for(new i = 0; i < MAX_VEH; i++)
	{
		if(PojazdySerwera[i] == 0)
		{
			PojazdySerwera[i] = uid;
			break;
		}
	}
	IloscPojazdow++;
}
forward StworzPojazd(uid, playerid);
public StworzPojazd(uid, playerid)
{
	if(uid != 0)
	{
	    if(PojazdInfo[uid][pSpawn] == 0)
		{
			PojazdInfo[uid][pHolowany] = 0;
			PojazdInfo[uid][pSpawn] = 1;
			StworzPojazdUID(uid);
			ZapiszPojazd(uid, 1);
			GameTextForPlayer(playerid, "~r~Pojazd zostal ~w~zespawnowany.", 3000, 5);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[CAR] [%s] [ID: %d] spawn to car %s (%d)", ZmianaNicku(playerid), playerid, GetVehicleModelName(PojazdInfo[uid][pModel]), PojazdInfo[uid][pUID]);
			Transakcja(T_VSPAWN, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
			format(logtekst, sizeof(logtekst), "[CAR] [%s] [ID: %d] spawn to car %s (%d)", ZmianaNicku(playerid), playerid, GetVehicleModelName(PojazdInfo[uid][pModel]), PojazdInfo[uid][pUID]);
			TransakcjaVeh(T_OVEH, PojazdInfo[uid][pUID], PojazdInfo[uid][pID], DaneGracza[playerid][gUID], DaneGracza[playerid][gGUID], -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
			if(PojazdInfo[uid][pPrzepchany] == 1)
			{
				SetPlayerMapIcon(playerid, 0, PojazdInfo[uid][pOX], PojazdInfo[uid][pOY], PojazdInfo[uid][pOZ], 55, 0, MAPICON_GLOBAL );
			}
			else
			{
			    SetPlayerMapIcon(playerid, 0, PojazdInfo[uid][pX], PojazdInfo[uid][pY], PojazdInfo[uid][pZ], 55, 0, MAPICON_GLOBAL );
			}
		}
		else
		{
			if(PojazdInfo[uid][pTempomat] > (gettime()+CZAS_LETNI))
		 	{
				new rok, miesiac, dzien, godzina, minuta, sekunda, tekst[256];
				sekundytodata(PojazdInfo[uid][pTempomat], rok, miesiac, dzien, godzina, minuta, sekunda);
				format(tekst, sizeof(tekst), "Musisz odczekaæ by unspawnowaæ pojazd, prawdopodobnie mo³eœ spowodowac kolizjê, lub ukraœæ ten pojazd.\nOdspwanowaæ bêdziesz móg³ za: %02dd, %02dh, %02dm, %02ds\n\nZabezpieczenie przed osobami, które chc¹ unikn¹c przeszukania pojazdu lub interakcji z LSPD.", dzien, godzina, minuta, sekunda);
		 	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• Blokada pojazdu:", tekst, "Zamknij", "");
			    return 0;
		 	}
			PojazdInfo[uid][pPrzepchany] = 0;
			PojazdInfo[uid][pHolowany] = 0;
			PojazdInfo[uid][pSpawn] = 0;
			KillTimer(PojazdInfo[uid][pTimer]);
			UsunPojazdUID(uid);
			GameTextForPlayer(playerid, "~r~Pojazd zostal ~w~unspawnowany.", 3000, 5);
			new logtekst[256];
			format(logtekst, sizeof(logtekst), "[CAR] [%s] [ID: %d] unspawn to car %s (%d)", ZmianaNicku(playerid), playerid, GetVehicleModelName(PojazdInfo[uid][pModel]), PojazdInfo[uid][pUID]);
			Transakcja(T_VSPAWN, DaneGracza[playerid][gUID], -1, DaneGracza[playerid][gGUID], -1, -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
			format(logtekst, sizeof(logtekst), "[CAR] [%s] [ID: %d] unspawn to car %s (%d)", ZmianaNicku(playerid), playerid, GetVehicleModelName(PojazdInfo[uid][pModel]), PojazdInfo[uid][pUID]);
			TransakcjaVeh(T_OVEH, PojazdInfo[uid][pUID], PojazdInfo[uid][pID], DaneGracza[playerid][gUID], DaneGracza[playerid][gGUID], -1, -1, -1, -1, logtekst, gettime()+KOREKTA_CZASOWA);
			RemovePlayerMapIcon(playerid,0);
		}
	}
	return 1;
}
forward UsunPojazdUID(uid);
public UsunPojazdUID(uid)
{
	
	new id = GetVehicleTrailer(GetPlayerVehicleID(PojazdInfo[uid][pID]));
	if(id != 0)
	{
		new id_p = SprawdzCarUID(id);
		PojazdInfo[id_p][pHolowany] = 0;
		//GetVehiclePos(PojazdInfo[id_p][pID], PojazdInfo[id_p][pOX], PojazdInfo[id_p][pOY], PojazdInfo[id_p][pOZ]);
		DetachTrailerFromVehicle(PojazdInfo[uid][pID]);
	}
	UpdateDynamic3DTextLabelText(Vopis[PojazdInfo[uid][pID]], 0xAAAAFFFF, " ");
    GetVehicleDamageStatus(PojazdInfo[uid][pID], PojazdInfo[uid][pUszkodzenie1], PojazdInfo[uid][pUszkodzenie2], PojazdInfo[uid][pUszkodzenie3], PojazdInfo[uid][pUszkodzenie4]);
	DestroyDynamicObject(PojazdInfo[uid][pKogut]);
	DestroyVehicle(PojazdInfo[uid][pID]);
	KillTimer(PojazdInfo[uid][pTimer]);
	for(new i = 0; i < MAX_VEH; i++)
	{
		if(PojazdySerwera[i] == uid)
		{
			for(new o = i, d; o < IloscPojazdow; o++)
			{
				d = o+1;
				PojazdySerwera[o] = PojazdySerwera[d];
			}
			break;
		}
	}
	PojazdInfo[uid][pID] = 0;
	IloscPojazdow--;
	ZapiszPojazd(uid, 1);
}
forward ZapiszPojazd(uid, nr);
public ZapiszPojazd(uid, nr)
{
	if(nr == 2)
	{
		new lzapyt[256];
		strdel(lzapyt, 0, 256);
		format(lzapyt, sizeof(lzapyt), "UPDATE `jochym_pojazdy` SET `UID_POSTACI` = '%d', `UID_DZIALALNOSCI` = '%d' WHERE `ID` = '%d'",
		PojazdInfo[uid][pOwnerPostac],
		PojazdInfo[uid][pOwnerDzialalnosc],
		uid);
		mysql_check();
		mysql_query2(lzapyt);
		mysql_free_result();
	}
	if(nr == 1)
	{
		GetVehicleHealth(PojazdInfo[uid][pID], PojazdInfo[uid][pStan]);
		GetVehicleDamageStatus(PojazdInfo[uid][pID], PojazdInfo[uid][pUszkodzenie1], PojazdInfo[uid][pUszkodzenie2], PojazdInfo[uid][pUszkodzenie3], PojazdInfo[uid][pUszkodzenie4]);
		new lzapyt[600];
		strdel(lzapyt, 0, 600);
		format(lzapyt, sizeof(lzapyt), "UPDATE `jochym_pojazdy` SET `MODEL` = '%d', `KOLOR` = '%d', `KOLOR_2` = '%d', `STAN` = '%f', `PRZEBIEG` = '%f', `DODATKI` = '%s', `LICZBA_DRZWI` = '%d', `TYP_POJAZDU` = '%d', `TYP_PALIWA` = '%d', `MOC` = '%d', `NUMER_REJESTRACJI` = '%s', `ROK_PRODUKCJI` = '%d', `X` = '%f', `Y` = '%f', `Z` = '%f', `VW` = '%d', `INT` = '%d', `ANGLE` = '%f', `SPAWN` = '%d', `LPG` = '%d', `PALIWO` = '%f', `LOCK` = '%d' WHERE `ID` = '%d'",
		PojazdInfo[uid][pModel],
		PojazdInfo[uid][pKolor],
		PojazdInfo[uid][pKolor2],
		PojazdInfo[uid][pStan],
		PojazdInfo[uid][pPrzebieg],
		PojazdInfo[uid][pDodatki],
		PojazdInfo[uid][pGaz],
		PojazdInfo[uid][pTypPojazdu],
		PojazdInfo[uid][pTypPaliwa],
		PojazdInfo[uid][pMoc],
		PojazdInfo[uid][pTablice],
		PojazdInfo[uid][pRok],
		PojazdInfo[uid][pX],
		PojazdInfo[uid][pY],
		PojazdInfo[uid][pZ],
		PojazdInfo[uid][pVw],
		PojazdInfo[uid][pInt],
		PojazdInfo[uid][pAngle],
		PojazdInfo[uid][pSpawn],
		PojazdInfo[uid][pLpg],
		PojazdInfo[uid][pPaliwo],
		PojazdInfo[uid][pLock],
		uid);
		mysql_check();
		mysql_query2(lzapyt);
		mysql_free_result();

		strdel(zapyt, 0, 2024);
		format(zapyt, sizeof(zapyt),
		"UPDATE `jochym_pojazdy` SET `SILNIK` = '%d', `USZKODZENIE1` = '%d', `USZKODZENIE2` = '%d', `USZKODZENIE3` = '%d', `USZKODZENIE4` = '%d', `BLOKADA` = '%d', `NAPRAWY` = '%f', `PJ` = '%d', `OX` = '%f', `OY` = '%f', `OZ` = '%f', `OA` = '%f', `PRZEPCHANY` = '%d', `TEMPOMAT` = '%d', `AUDIO` = '%d', `ALARM` = '%d', `IMMO` = '%d', `CB` = '%d', `KANAL` = '%d', `SZYBA` = '%d', `SPAWN` = '%d', `TablicaON` = '%d', `OVW` = '%d', `PALIWOG` = '%f', `GPS` = '%d', `PS` = '%d', `PID` = '%d' WHERE `ID` = '%d'",
		PojazdInfo[uid][pSilnik],
		PojazdInfo[uid][pUszkodzenie1],
		PojazdInfo[uid][pUszkodzenie2],
		PojazdInfo[uid][pUszkodzenie3],
		PojazdInfo[uid][pUszkodzenie4],
		PojazdInfo[uid][pBlokada],
		PojazdInfo[uid][pNaprawy],
		PojazdInfo[uid][pPJ],
		PojazdInfo[uid][pOX],
		PojazdInfo[uid][pOY],
		PojazdInfo[uid][pOZ],
		PojazdInfo[uid][pOA],
		PojazdInfo[uid][pPrzepchany],
		PojazdInfo[uid][pTempomat],
		PojazdInfo[uid][pAudio],
		PojazdInfo[uid][pAlarm],
		PojazdInfo[uid][pImmo],
		PojazdInfo[uid][pCB],
		PojazdInfo[uid][pKanal],
		PojazdInfo[uid][pSzyba],
		PojazdInfo[uid][pSpawn],
		PojazdInfo[uid][pTablicaON],
		PojazdInfo[uid][pOVW],
		PojazdInfo[uid][pPaliwoGaz],
		PojazdInfo[uid][pGPS],
		PojazdInfo[uid][pPSzyba],
		PojazdInfo[uid][pPID],
		uid);
		mysql_check();
		mysql_query2(zapyt);
		mysql_free_result();
		
		new zapyt3[600];
		strdel(zapyt3, 0, 1024);
		format(zapyt3, sizeof(zapyt3),
		"UPDATE `jochym_pojazdy` SET `Szyba2`='%d', `Szyba3`='%d', `Szyba4`='%d', `Glosnik`='%d', `Nitro`='%d', `Boost`='%f' WHERE `ID` = '%d'",
		PojazdInfo[uid][pSzyba2],
		PojazdInfo[uid][pSzyba3],
		PojazdInfo[uid][pSzyba4],
		PojazdInfo[uid][pGlosnik],
		PojazdInfo[uid][pNitro],
		PojazdInfo[uid][pBoost],
		uid);
		mysql_check();
		mysql_query2(zapyt3);
		mysql_free_result();

		
	}
	return 1;
}
forward SprawdzCarUID(carid);
public SprawdzCarUID(carid)
{
	for(new i = 1;i < MAX_VEH; i++)
		if(PojazdInfo[i][pID] == carid)
			return i;
	return 1;
}
forward GetVehicleID(uid);
public GetVehicleID(uid)
{
	if(uid == INVALID_VEHICLE_ID) return false;
	ForeachEx(vehicleid, MAX_VEH)
	{
		if(PojazdInfo[vehicleid][pID] == uid)
	    {
			return vehicleid;
		}
	}
	return 0;
}
stock GetVehicleModelName(modelid)
{
	new tmp = modelid - 400;
	return NazwyAut[tmp];
}
stock GetClosestVehicle(playerid, Float:Distance2 = 1000.0)
{
    Distance2 = floatabs(Distance2);
    if(Distance2 == 0.0) Distance2 = 1000.0;
    new Float:X[2], Float:Y[2], Float:Z[2];
    new Float:NearestPos = Distance2;
    new NearestVehicle = INVALID_VEHICLE_ID;
    GetPlayerPos(playerid, X[0], Y[0], Z[0]);
    for(new i; i<MAX_VEHICLES; i++)
	{
        if(!IsVehicleStreamedIn(i, playerid) || i == GetPlayerVehicleID(playerid)) continue;
        GetVehiclePos(i, X[1], Y[1], Z[1]);
        if(NearestPos > GetDistanceBetweenPoints(X[0], Y[0], Z[0], X[1], Y[1], Z[1])) NearestPos = GetDistanceBetweenPoints(X[0], Y[0], Z[0], X[1], Y[1], Z[1]), NearestVehicle = i;
    }
    if(NearestPos < Distance2) return NearestVehicle;
    return INVALID_VEHICLE_ID;
}
forward DodajPojazd(uids, model, kolor, kolor2, Float:x, Float:y, Float:z, paliwo, Float:a, typ);
public DodajPojazd(uids, model, kolor, kolor2, Float:x, Float:y, Float:z, paliwo, Float:a, typ)
{
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_pojazdy` (`UID_POSTACI`, `MODEL`, `KOLOR`, `KOLOR_2`, `X`, `Y`, `Z`, `PALIWO`, `ANGLE`) VALUES ('%d', '%d', '%d', '%d', '%f', '%f', '%f', '%d', '%f')",
	uids, model, kolor, kolor2, Float:x, Float:y, Float:z, paliwo, a);
	mysql_check();
	mysql_query2(zapyt);
	new uid = mysql_insert_id();
	PojazdInfo[uid][pUID] = uid;
	PojazdInfo[uid][pOwnerPostac] = uids;
	PojazdInfo[uid][pOwnerDzialalnosc] = 0;
	PojazdInfo[uid][pModel] = model;
	PojazdInfo[uid][pKolor] = kolor;
	PojazdInfo[uid][pKolor2] = kolor2;
	PojazdInfo[uid][pStan] = 1000;
	PojazdInfo[uid][pPrzebieg] = 0;
	format(PojazdInfo[uid][pDodatki], 32, "BRAK");
	PojazdInfo[uid][pGaz] = 0;
	PojazdInfo[uid][pTypPojazdu] = typ;
	PojazdInfo[uid][pTypPaliwa] = 0;
	PojazdInfo[uid][pMoc] = 0;
	format(PojazdInfo[uid][pTablice], 32, "Brak");
	PojazdInfo[uid][pX] = x;
	PojazdInfo[uid][pY] = y;
	PojazdInfo[uid][pZ] = z;
	PojazdInfo[uid][pVw] = 0;
	PojazdInfo[uid][pInt] = 0;
	PojazdInfo[uid][pAngle] = a;
	PojazdInfo[uid][pSpawn] = 0;
	PojazdInfo[uid][pLpg] = 0;
	PojazdInfo[uid][pPJ] = -1;
	PojazdInfo[uid][pPaliwo] = paliwo;
	PojazdInfo[uid][pLock] = 0;
	PojazdInfo[uid][pSilnik] = 0;
	PojazdInfo[uid][pUszkodzenie1] = 0;
	PojazdInfo[uid][pUszkodzenie2] = 0;
	PojazdInfo[uid][pUszkodzenie3] = 0;
	PojazdInfo[uid][pUszkodzenie4] = 0;
	PojazdInfo[uid][pBlokada] = 0;
	PojazdInfo[uid][pNaprawy] = 0;
	PojazdInfo[uid][pGPS] = 0;
	PojazdInfo[uid][pPSzyba] = 0;
	PojazdInfo[uid][pSzyba2] = 0;
	PojazdInfo[uid][pSzyba3] = 0;
	PojazdInfo[uid][pSzyba4] = 0;
	PojazdInfo[uid][pGlosnik] = 0;
	PojazdInfo[uid][pNitro] = 0;
	PojazdInfo[uid][pBoost] = 0;
	PojazdInfo[uid][pPID] = 0;
	mysql_free_result();
	return uid;
}
stock PlayerObokPojazdu(playerid,carid)
{
	new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2,Float:Dis;
	if (!IsPlayerConnected(playerid))return -1;
	GetPlayerPos(playerid,x1,y1,z1);
	GetVehiclePos(carid,x2,y2,z2);
	Dis = floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
	return floatround(Dis);
}
