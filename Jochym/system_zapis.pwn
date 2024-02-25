AntiDeAMX();
forward ZapiszGraczaGlobal(playerid, nr);
public ZapiszGraczaGlobal(playerid, nr)
{
	if(IsPlayerConnected(playerid) && DaneGracza[playerid][gUID] != 0 && zalogowany[playerid] == true)
	{
		if(nr == 1)
		{
			strdel(zapyt, 0, 100);
			format(zapyt, sizeof(zapyt),
			"UPDATE `ips_core_members` SET `gamescore`=%d WHERE `member_id`='%d'",
			DaneGracza[playerid][gGAMESCORE],
			DaneGracza[playerid][gGUID]);
			mysql_query(zapyt);
		}
		if(nr == 2)
		{
			strdel(zapyt, 0, 100);
			format(zapyt, sizeof(zapyt),
			"UPDATE `ips_core_members` SET `block_ooc`=%d WHERE `member_id`='%d'",
			DaneGracza[playerid][gOOC],
			DaneGracza[playerid][gGUID]);
			mysql_query(zapyt);
		}
		if(nr == 3)
		{
			strdel(zapyt, 0, 100);
			format(zapyt, sizeof(zapyt),
			"UPDATE `ips_core_members` SET `block_run`=%d WHERE `member_id`='%d'",
			DaneGracza[playerid][gRUN],
			DaneGracza[playerid][gGUID]);
			mysql_query(zapyt);
		}
		if(nr == 4)
		{
			strdel(zapyt, 0, 100);
			format(zapyt, sizeof(zapyt),
			"UPDATE `ips_core_members` SET `ban_active`=%d WHERE `member_id`='%d'",
			DaneGracza[playerid][gBAN],
			DaneGracza[playerid][gGUID]);
			mysql_query(zapyt);
		}
		if(nr == 5)
		{
			strdel(zapyt, 0, 100);
			format(zapyt, sizeof(zapyt),
			"UPDATE `ips_core_members` SET `block_veh`=%d WHERE `member_id`='%d'",
			DaneGracza[playerid][gVEH],
			DaneGracza[playerid][gGUID]);
			mysql_query(zapyt);
		}
		if(nr == 6)
		{
			strdel(zapyt, 0, 100);
			format(zapyt, sizeof(zapyt),
			"UPDATE `ips_core_members` SET `block_gun` = %d WHERE `member_id`='%d'",
			DaneGracza[playerid][gGUN],
			DaneGracza[playerid][gGUID]);
			mysql_query(zapyt);
		}
		if(nr == 7)
		{
			strdel(zapyt, 0, 100);
			format(zapyt, sizeof(zapyt),
			"UPDATE `ips_core_members` SET `klatwa` = %d WHERE `member_id`='%d'",
			DaneGracza[playerid][gKLATWA],
			DaneGracza[playerid][gGUID]);
			mysql_query(zapyt);
		}
		if(nr == 8)
		{
			strdel(zapyt, 0, 100);
			format(zapyt, sizeof(zapyt),
			"UPDATE `ips_core_members` SET `sluzba` = %d WHERE `member_id`='%d'",
			DaneGracza[playerid][gSLUZBAA],
			DaneGracza[playerid][gGUID]);
			mysql_query(zapyt);
		}
  		if(nr == 9)
		{
			strdel(zapyt, 0, 100);
			format(zapyt, sizeof(zapyt),
			"UPDATE `ips_core_members` SET `premium` = %d WHERE `member_id`='%d'",
			DaneGracza[playerid][gPREMIUM],
			DaneGracza[playerid][gGUID]);
			mysql_query(zapyt);
		}
		if(nr == 10)
		{
		    strdel(zapyt, 0, 100);
			format(zapyt, sizeof(zapyt),
			"UPDATE `ips_core_members` SET `obiekty` = %d WHERE `member_id`='%d'",
			DaneGracza[playerid][gObiekty],
			DaneGracza[playerid][gGUID]);
			mysql_query(zapyt);
		}
	}
	return 1;
}
forward ZapiszWGrze(playerid);
public ZapiszWGrze(playerid)
{
	if(IsPlayerConnected(playerid) && DaneGracza[playerid][gUID] != 0 && zalogowany[playerid] == true)
	{
		strdel(zapyt, 0, 100);
	    format(zapyt, sizeof(zapyt),
		"UPDATE `jochym_postacie` SET `WGRZE`='%d' WHERE `ID`='%d'",
		DaneGracza[playerid][gWGRZE],
		DaneGracza[playerid][gUID]);
	    mysql_query(zapyt);
		mysql_free_result();
	}
	return 1;
}
forward ZapiszGracza(playerid);
public ZapiszGracza(playerid)
{
	if(IsPlayerConnected(playerid) && DaneGracza[playerid][gUID] != 0 && zalogowany[playerid] == true)
	{
	    //DaneGracza[playerid][gOSTATNIO_NA_SERWERZE] = gettime()+CZAS_LETNI;
		DaneGracza[playerid][gPromile] = GetPlayerDrunkLevel(playerid);
		strdel(zapyt, 0, 512);
	    format(zapyt, sizeof(zapyt),
		"UPDATE `jochym_postacie` SET `CZAS_ONLINE`='%d', `ZDROWIE`='%f', `SKIN`='%d', `LSKIN`='%d', `OSTATNIO_NA_SERWERZE`='%d', `PORTFEL`='%d', `WAGA`='%d', `BW`='%d', `X`='%f', `Y`='%f', `Z`='%f', `VW`='%d', `INT`='%d', `BRON`='%d', `UIDBRON`='%d', `DO_PELNEJ_GODZINY`='%d', `AJ` = '%d', `QS` = '%d', `PROMILE` = '%d', `PKT` = '%d', `PRZETRZYMANIE` = '%d', `PUID` = '%d', `PX` = '%f', `PY` = '%f', `PZ` = '%f', `GLOD` = '%d', `EDYTOR` = '%d', `KONTO_W_BANKU` = '%d', `AKTYWNE` = '%d' WHERE `ID`='%d'",
		DaneGracza[playerid][gCZAS_ONLINE],
		DaneGracza[playerid][gZDROWIE],
		DaneGracza[playerid][gSKIN],
		DaneGracza[playerid][gLskin],
		DaneGracza[playerid][gOSTATNIO_NA_SERWERZE],
		DaneGracza[playerid][gPORTFEL],
		DaneGracza[playerid][gWAGA],
		DaneGracza[playerid][gBW],
		DaneGracza[playerid][gX],
		DaneGracza[playerid][gY],
		DaneGracza[playerid][gZ],
		DaneGracza[playerid][gVW],
		DaneGracza[playerid][gINT],
		DaneGracza[playerid][gBronAmmo],
		DaneGracza[playerid][gBronUID],
		DaneGracza[playerid][gDoPelnejGodziny],
		DaneGracza[playerid][gAJ],
		DaneGracza[playerid][gQS],
		DaneGracza[playerid][gPromile],
		DaneGracza[playerid][gPktKarne],
		DaneGracza[playerid][gPrzetrzmanie],
		DaneGracza[playerid][gPUID],
		DaneGracza[playerid][gPX],
		DaneGracza[playerid][gPY],
		DaneGracza[playerid][gPZ],
		DaneGracza[playerid][gGlod],
		DaneGracza[playerid][gEdytor],
		DaneGracza[playerid][gKONTO_W_BANKU],
		DaneGracza[playerid][gAKTYWNE],
		DaneGracza[playerid][gUID]);
	    mysql_query(zapyt);
		mysql_free_result();
		
		new dol[124],dols[124];
		format(dol, sizeof(dol), "%s%d", dol, DaneGracza[playerid][gDokumenty][0]);
		format(dols, sizeof(dols), "%s%d", dols, DaneGracza[playerid][gOsiagniecia][0]);
		for(new u = 1; u < D_PENTLA_SAVE; u++)
		{
			format(dol, sizeof(dol), "%s*%d", dol, DaneGracza[playerid][gDokumenty][u]);
		}
		for(new u = 1; u < 30; u++)
		{
			format(dols, sizeof(dols), "%s*%d", dols, DaneGracza[playerid][gOsiagniecia][u]);
		}
		
		strdel(zapyt, 0, 512);
		format(zapyt, sizeof(zapyt),"UPDATE `jochym_postacie` SET `OSTATNI_TRENING` = '%d', `SZTUKA_WALKI` = '%d', `NR_TRENINGU` = '%d', `TRENOWANA_SZTUKA` = '%d', `CZAS_TRWANIA` = '%d', `UZALEZNIENIE` = '%f', `PRACA_TYP` = '%d', `SILA` = '%d', `DOKUMENTY` = '%s',`TELEFON` = '%d', `OSIAGNIECIA` = '%s', `DODATEK1` = '%d', `DODATEK2` = '%d', `ZASILEK` = '%d', `ZAMELDOWANIE` = '%d', `TYP_CHODZENIA` = '%d', `BETA_TESTER` = '%d', `GODZIN` = '%d', `MINUT` = '%d', `OSkin` = '%d' WHERE `ID`='%d'",
		DaneGracza[playerid][gOstatniTrening],
		DaneGracza[playerid][gStylWalki],
		DaneGracza[playerid][gNrTreningu],
		DaneGracza[playerid][gTrenowanyStyl],
		DaneGracza[playerid][gCzasTrwaniaUzaleznienia],
		DaneGracza[playerid][gUzaleznienie],
		DaneGracza[playerid][gPracaTyp],
		DaneGracza[playerid][gSILA],
		dol,
		DaneGracza[playerid][gTelefon],
		dols,
		DaneGracza[playerid][gPrzyczepiony1],
		DaneGracza[playerid][gPrzyczepiony2],
		DaneGracza[playerid][gZasilek],
		DaneGracza[playerid][gZamHot],
		DaneGracza[playerid][gTYPCHODZENIA],
		DaneGracza[playerid][gBetaTester],
		DaneGracza[playerid][gGODZIN],
		DaneGracza[playerid][gMINUT],
		DaneGracza[playerid][gOSkin],
		DaneGracza[playerid][gUID]);
	    mysql_query(zapyt);
		mysql_free_result();

		strdel(zapyt, 0, 512);
		format(zapyt, sizeof(zapyt),"UPDATE `jochym_postacie` SET `RASA` = '%d', `AKCES` = '%d', `OBIEKTY` = '%d', `POSZ` = '%d', `REPUTACJA` = '%d', `0` = '%d', `1` = '%d', `2` = '%d', `3` = '%d', `4` = '%d', `5` = '%d', `6` = '%d', `7` = '%d', `8` = '%d', `9` = '%d', `10` = '%d', `TRENOWAL` = '%d', `STRZELNICA` = '%d', `TATUAZE` = '%d', `POZWOLENIE` = '%d', `BUDOWANIE` = '%d', `WYTRYCH` = '%d' WHERE `ID`='%d'",
		DaneGracza[playerid][gRASA],
		DaneGracza[playerid][gAKCES],
		DaneGracza[playerid][gObiekty],
		DaneGracza[playerid][gPOSZ],
		DaneGracza[playerid][gReputacja],
		DaneGracza[playerid][g0],
		DaneGracza[playerid][g1],
		DaneGracza[playerid][g2],
		DaneGracza[playerid][g3],
		DaneGracza[playerid][g4],
		DaneGracza[playerid][g5],
		DaneGracza[playerid][g6],
		DaneGracza[playerid][g7],
		DaneGracza[playerid][g8],
		DaneGracza[playerid][g9],
		DaneGracza[playerid][g10],
		DaneGracza[playerid][gTrenowal],
		DaneGracza[playerid][gStrzelnica],
		DaneGracza[playerid][gTatuaze],
		DaneGracza[playerid][gPozwolenie],
		DaneGracza[playerid][gBudowanie],
		DaneGracza[playerid][gWytrych],
		DaneGracza[playerid][gUID]);
	    mysql_query(zapyt);
		mysql_free_result();
		
		strdel(zapyt, 0, 512);
		format(zapyt, sizeof(zapyt),"UPDATE `jochym_postacie` SET `ZD1` = '%d', `ZD2` = '%d', `ZD3` = '%d', `ZD4` = '%d', `ZD5` = '%d', `ZD6` = '%d', `ZD7` = '%d', `ZD8` = '%d', `ZD9` = '%d', `ZD10` = '%d', `ZD11` = '%d', `ZD12` = '%d', `ZD13` = '%d', `ZD14` = '%d', `FREEZE` = '%d', `BLOKDORYWCZA` = '%d', `PRZYCZEPIONEOBJ` = '%d', `Animacja` = '%s', `Anim` = '%d', `DNA` = '%d' WHERE `ID`='%d'",
		DaneGracza[playerid][gZD1],
		DaneGracza[playerid][gZD2],
		DaneGracza[playerid][gZD3],
		DaneGracza[playerid][gZD4],
		DaneGracza[playerid][gZD5],
		DaneGracza[playerid][gZD6],
		DaneGracza[playerid][gZD7],
		DaneGracza[playerid][gZD8],
		DaneGracza[playerid][gZD9],
		DaneGracza[playerid][gZD10],
		DaneGracza[playerid][gZD11],
		DaneGracza[playerid][gZD12],
		DaneGracza[playerid][gZD13],
		DaneGracza[playerid][gZD14],
		DaneGracza[playerid][gFreeze],
		DaneGracza[playerid][gBlokDorywczej],
		DaneGracza[playerid][gPrzyczepioneObj],
		DaneGracza[playerid][gAnimacja],
		DaneGracza[playerid][gAnim],
		DaneGracza[playerid][gDNA],
		DaneGracza[playerid][gUID]);
	    mysql_query(zapyt);
		mysql_free_result();
		
		strdel(zapyt, 0, 512);
		format(zapyt, sizeof(zapyt),"UPDATE `jochym_postacie` SET `PayDay` = '%d', `PayDay2` = '%d', `PayDay3` = '%d', `PayDay4` = '%d', `PayDay5` = '%d', `PayDay6` = '%d', `AntyPayDay` = '%d', `Przelogowal` = '%d', `Nagroda` = '%d', `Car` = '%d', `Historia` = '%s', `Euro` = '%d' WHERE `ID`='%d'",
		DaneGracza[playerid][gPayDay],
		DaneGracza[playerid][gPayDay2],
		DaneGracza[playerid][gPayDay3],
		DaneGracza[playerid][gPayDay4],
		DaneGracza[playerid][gPayDay5],
		DaneGracza[playerid][gPayDay6],
		DaneGracza[playerid][gAntyPayDay],
		DaneGracza[playerid][gLogin],
		DaneGracza[playerid][gNagroda],
		DaneGracza[playerid][gCar],
		DaneGracza[playerid][gHistoria],
		DaneGracza[playerid][gEuro],
		DaneGracza[playerid][gUID]);
	    mysql_query(zapyt);
		mysql_free_result();
	}
	return 1;
}
forward WyplataDuty(uid, playerid, nr);
public WyplataDuty(uid, playerid, nr)
{
	if(nr == 1)
	{
		strdel(zapyt, 0, 250);
	    format(zapyt, sizeof(zapyt),
		"UPDATE `jochym_pracownicy` SET CZAS_NA_SLUZBIE = 0, KLIENTOW = 0, PREMIA = 0 WHERE `UID_POSTACI`='%d' AND `UID_DZIALALNOSCI`='%d'",
		DaneGracza[playerid][gUID],
		uid);
		mysql_query(zapyt);
		ZaladujWyplateg1(playerid);
		DaneGracza[playerid][gPrzynaleznosci][1] = 0;
		DaneGracza[playerid][gPrzynaleznosci][3] = 0;
		DaneGracza[playerid][gPremia] = 0;
		return 1;
	}
    else if(nr == 2)
	{
		strdel(zapyt, 0, 250);
	    format(zapyt, sizeof(zapyt),
		"UPDATE `jochym_pracownicy` SET CZAS_NA_SLUZBIE = 0, KLIENTOW = 0, PREMIA = 0 WHERE `UID_POSTACI`='%d' AND `UID_DZIALALNOSCI`='%d'",
		DaneGracza[playerid][gUID],
		uid);
		mysql_query(zapyt);
		ZaladujWyplateg2(playerid);
		DaneGracza[playerid][gPrzynaleznosci][7] = 0;
		DaneGracza[playerid][gPrzynaleznosci][9] = 0;
		DaneGracza[playerid][gPremia] = 0;
		return 1;
	}
	else if(nr == 3)
	{
		strdel(zapyt, 0, 250);
	    format(zapyt, sizeof(zapyt),
		"UPDATE `jochym_pracownicy` SET CZAS_NA_SLUZBIE = 0, KLIENTOW = 0, PREMIA = 0 WHERE `UID_POSTACI`='%d' AND `UID_DZIALALNOSCI`='%d'",
		DaneGracza[playerid][gUID],
		uid);
		mysql_query(zapyt);
		ZaladujWyplateg3(playerid);
		DaneGracza[playerid][gPrzynaleznosci][13] = 0;
		DaneGracza[playerid][gPrzynaleznosci][15] = 0;
		DaneGracza[playerid][gPremia] = 0;
		return 1;
	}
	else if(nr == 4)
	{
		strdel(zapyt, 0, 250);
	    format(zapyt, sizeof(zapyt),
		"UPDATE `jochym_pracownicy` SET CZAS_NA_SLUZBIE = 0, KLIENTOW = 0, PREMIA = 0 WHERE `UID_POSTACI`='%d' AND `UID_DZIALALNOSCI`='%d'",
		DaneGracza[playerid][gUID],
		uid);
		mysql_query(zapyt);
		ZaladujWyplateg4(playerid);
		DaneGracza[playerid][gPrzynaleznosci][19] = 0;
		DaneGracza[playerid][gPrzynaleznosci][21] = 0;
		DaneGracza[playerid][gPremia] = 0;
		return 1;
	}
	else if(nr == 5)
	{
		strdel(zapyt, 0, 250);
	    format(zapyt, sizeof(zapyt),
		"UPDATE `jochym_pracownicy` SET CZAS_NA_SLUZBIE = 0, KLIENTOW = 0, PREMIA = 0 WHERE `UID_POSTACI`='%d' AND `UID_DZIALALNOSCI`='%d'",
		DaneGracza[playerid][gUID],
		uid);
		mysql_query(zapyt);
		ZaladujWyplateg5(playerid);
		DaneGracza[playerid][gPrzynaleznosci][25] = 0;
		DaneGracza[playerid][gPrzynaleznosci][27] = 0;
		DaneGracza[playerid][gPremia] = 0;
		return 1;
	}
	else if(nr == 6)
	{
		strdel(zapyt, 0, 250);
	    format(zapyt, sizeof(zapyt),
		"UPDATE `jochym_pracownicy` SET CZAS_NA_SLUZBIE = 0, KLIENTOW = 0, PREMIA = 0 WHERE `UID_POSTACI`='%d' AND `UID_DZIALALNOSCI`='%d'",
		DaneGracza[playerid][gUID],
		uid);
		mysql_query(zapyt);
		ZaladujWyplateg6(playerid);
		DaneGracza[playerid][gPrzynaleznosci][31] = 0;
		DaneGracza[playerid][gPrzynaleznosci][33] = 0;
		DaneGracza[playerid][gPremia] = 0;
		return 1;
	}
	return 1;
}
forward ZapiszDuty(uid, playerid, nr);
public ZapiszDuty(uid, playerid, nr)
{
	if(nr == 1)
	{
		strdel(zapyt, 0, 250);
	    format(zapyt, sizeof(zapyt),
		"UPDATE `jochym_pracownicy` SET CZAS_NA_SLUZBIE = CZAS_NA_SLUZBIE + %d, KLIENTOW = KLIENTOW + %d, PREMIA = PREMIA + %d WHERE `UID_POSTACI`='%d' AND `UID_DZIALALNOSCI`='%d'",
		DaneGracza[playerid][gPrzynaleznosci][1],
		DaneGracza[playerid][gPrzynaleznosci][3],
		DaneGracza[playerid][gPremia],
		DaneGracza[playerid][gUID],
		uid);
		mysql_query(zapyt);
		ZaladujWyplateg1(playerid);
		/*new debugmode[512];
		format(debugmode, sizeof(debugmode), "ZapiszDuty (1) - Czas na sluzie: (%d) + %d", GetPVarInt(playerid, "w1"), DaneGracza[playerid][gPrzynaleznosci][1]);
		Debug(1, debugmode);*/
		DaneGracza[playerid][gPrzynaleznosci][1] = 0;
		DaneGracza[playerid][gPrzynaleznosci][3] = 0;
		DaneGracza[playerid][gPremia] = 0;
		return 1;
	}
    else if(nr == 2)
	{
		strdel(zapyt, 0, 250);
	    format(zapyt, sizeof(zapyt),
		"UPDATE `jochym_pracownicy` SET CZAS_NA_SLUZBIE = CZAS_NA_SLUZBIE + %d, KLIENTOW = KLIENTOW + %d, PREMIA = PREMIA + %d WHERE `UID_POSTACI`='%d' AND `UID_DZIALALNOSCI`='%d'",
		DaneGracza[playerid][gPrzynaleznosci][7],
		DaneGracza[playerid][gPrzynaleznosci][9],
		DaneGracza[playerid][gPremia],
		DaneGracza[playerid][gUID],
		uid);
		mysql_query(zapyt);
		ZaladujWyplateg2(playerid);
		/*new debugmode[512];
		format(debugmode, sizeof(debugmode), "ZapiszDuty (2) - Czas na sluzie: (%d) + %d", GetPVarInt(playerid, "w2"), DaneGracza[playerid][gPrzynaleznosci][7]);
		Debug(1, debugmode);*/
		DaneGracza[playerid][gPrzynaleznosci][7] = 0;
		DaneGracza[playerid][gPrzynaleznosci][9] = 0;
		DaneGracza[playerid][gPremia] = 0;
		return 1;
	}
	else if(nr == 3)
	{
		strdel(zapyt, 0, 250);
	    format(zapyt, sizeof(zapyt),
		"UPDATE `jochym_pracownicy` SET CZAS_NA_SLUZBIE = CZAS_NA_SLUZBIE + %d, KLIENTOW = KLIENTOW + %d, PREMIA = PREMIA + %d WHERE `UID_POSTACI`='%d' AND `UID_DZIALALNOSCI`='%d'",
		DaneGracza[playerid][gPrzynaleznosci][13],
		DaneGracza[playerid][gPrzynaleznosci][15],
		DaneGracza[playerid][gPremia],
		DaneGracza[playerid][gUID],
		uid);
		mysql_query(zapyt);
		ZaladujWyplateg3(playerid);
		/*new debugmode[512];
		format(debugmode, sizeof(debugmode), "ZapiszDuty (3) - Czas na sluzie: (%d) + %d", GetPVarInt(playerid, "w3"), DaneGracza[playerid][gPrzynaleznosci][13]);
		Debug(1, debugmode);*/
		DaneGracza[playerid][gPrzynaleznosci][13] = 0;
		DaneGracza[playerid][gPrzynaleznosci][15] = 0;
		DaneGracza[playerid][gPremia] = 0;
		return 1;
	}
	else if(nr == 4)
	{
		strdel(zapyt, 0, 250);
	    format(zapyt, sizeof(zapyt),
		"UPDATE `jochym_pracownicy` SET CZAS_NA_SLUZBIE = CZAS_NA_SLUZBIE + %d, KLIENTOW = KLIENTOW + %d, PREMIA = PREMIA + %d WHERE `UID_POSTACI`='%d' AND `UID_DZIALALNOSCI`='%d'",
		DaneGracza[playerid][gPrzynaleznosci][19],
		DaneGracza[playerid][gPrzynaleznosci][21],
		DaneGracza[playerid][gPremia],
		DaneGracza[playerid][gUID],
		uid);
		mysql_query(zapyt);
		ZaladujWyplateg4(playerid);
		/*new debugmode[512];
		format(debugmode, sizeof(debugmode), "ZapiszDuty (4) - Czas na sluzie: (%d) + %d", GetPVarInt(playerid, "w4"), DaneGracza[playerid][gPrzynaleznosci][19]);
		Debug(1, debugmode);*/
		DaneGracza[playerid][gPrzynaleznosci][19] = 0;
		DaneGracza[playerid][gPrzynaleznosci][21] = 0;
		DaneGracza[playerid][gPremia] = 0;
		return 1;
	}
	else if(nr == 5)
	{
		strdel(zapyt, 0, 250);
	    format(zapyt, sizeof(zapyt),
		"UPDATE `jochym_pracownicy` SET CZAS_NA_SLUZBIE = CZAS_NA_SLUZBIE + %d, KLIENTOW = KLIENTOW + %d, PREMIA = PREMIA + %d WHERE `UID_POSTACI`='%d' AND `UID_DZIALALNOSCI`='%d'",
		DaneGracza[playerid][gPrzynaleznosci][25],
		DaneGracza[playerid][gPrzynaleznosci][27],
		DaneGracza[playerid][gPremia],
		DaneGracza[playerid][gUID],
		uid);
		mysql_query(zapyt);
		ZaladujWyplateg5(playerid);
		/*new debugmode[512];
		format(debugmode, sizeof(debugmode), "ZapiszDuty (5) - Czas na sluzie: (%d) + %d", GetPVarInt(playerid, "w5"), DaneGracza[playerid][gPrzynaleznosci][25]);
		Debug(1, debugmode);*/
		DaneGracza[playerid][gPrzynaleznosci][25] = 0;
		DaneGracza[playerid][gPrzynaleznosci][27] = 0;
		DaneGracza[playerid][gPremia] = 0;
		return 1;
	}
	else if(nr == 6)
	{
		strdel(zapyt, 0, 250);
	    format(zapyt, sizeof(zapyt),
		"UPDATE `jochym_pracownicy` SET CZAS_NA_SLUZBIE = CZAS_NA_SLUZBIE + %d, KLIENTOW = KLIENTOW + %d, PREMIA = PREMIA + %d WHERE `UID_POSTACI`='%d' AND `UID_DZIALALNOSCI`='%d'",
		DaneGracza[playerid][gPrzynaleznosci][31],
		DaneGracza[playerid][gPrzynaleznosci][33],
		DaneGracza[playerid][gPremia],
		DaneGracza[playerid][gUID],
		uid);
		mysql_query(zapyt);
		ZaladujWyplateg6(playerid);
		/*new debugmode[512];
		format(debugmode, sizeof(debugmode), "ZapiszDuty (6) - Czas na sluzie: (%d) + %d", GetPVarInt(playerid, "w6"), DaneGracza[playerid][gPrzynaleznosci][31]);
		Debug(1, debugmode);*/
		DaneGracza[playerid][gPrzynaleznosci][31] = 0;
		DaneGracza[playerid][gPrzynaleznosci][33] = 0;
		DaneGracza[playerid][gPremia] = 0;
		return 1;
	}
	return 1;
}
