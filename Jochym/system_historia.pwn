enum hHistory
{
	hID,
	hTyp,
	hUID,
	hMoney,
	hTime
}
new History[MAX_HISTORY][hHistory];

forward ZaladujHistory();
public ZaladujHistory()
{
	//czaswykonania = gettime();
	new id = false;
	mysql_query( "SELECT * FROM `jochym_history`" );
	mysql_store_result( );
	while(mysql_fetch_row(zapyt))
	{
	    sscanf(zapyt, "p<|>i", id );
	    sscanf(zapyt, "p<|>ddddd",
	    History[id][hID],
		History[id][hTyp],
		History[id][hUID],
		History[id][hMoney],
		History[id][hTime]);
	}
	mysql_free_result( );
	printf("Historii Transkacji/Przelewow   - %d", id);
	return 1;
}

stock DodajHistorie(typ, uid, money, time)
{
	new itemid = GetFreeSQLUID("jochym_history", "ID");
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_history` (`ID`, `Typ`, `UID`, `Money`, `Time`) VALUES ('%d','%d','%d','%d','%d')",
	itemid, typ, uid, money, time);
	mysql_check();
	mysql_query2(zapyt);
	History[itemid][hID] = itemid;
	History[itemid][hTyp] = typ;
	History[itemid][hUID] = uid;
	History[itemid][hMoney] = money;
	History[itemid][hTime] = time;
	mysql_free_result();
	return itemid;
	
	/* TYP
		0 - wyp³ata z banku (-)
		1 - wp³ata do banku (+)
		2 - wys³anie przelewu na kogoœ numer konta (-)
		3 - odberanie przelew od kogoœ (+)
		4 - Zasilek na konto bankowe.
		5 - Wyp³ata z grupy
	*/
}

enum dDlug
{
	dID,
	dTyp,
	dUID,
	dMoney,
	dTime,
	dAkcja[256],
	dOferowal,
	dTime2,
	dAktywne
}
new Zadluzenie[MAX_DLUG][dDlug];

forward ZaladujZadluzenia();
public ZaladujZadluzenia()
{
	//czaswykonania = gettime();
	new id = false;
	mysql_query( "SELECT * FROM `jochym_dlug`" );
	mysql_store_result( );
	while(mysql_fetch_row(zapyt))
	{
	    sscanf(zapyt, "p<|>i", id );
	    sscanf(zapyt, "p<|>ddddds[256]ddd",
	    Zadluzenie[id][dID],
		Zadluzenie[id][dTyp],
		Zadluzenie[id][dUID],
		Zadluzenie[id][dMoney],
		Zadluzenie[id][dTime],
		Zadluzenie[id][dAkcja],
		Zadluzenie[id][dOferowal],
		Zadluzenie[id][dTime2],
		Zadluzenie[id][dAktywne]);
	}
	mysql_free_result( );
	printf("Zadluzenie   - %d", id);
	return 1;
}

stock DodajZadluzenie(typ, uid, money, time, akcja[256], oferowal, time2, aktywne)
{
	new itemid = GetFreeSQLUID("jochym_dlug", "ID");
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_dlug` (`ID`, `Typ`, `UID`, `Money`, `Time`, `Akcja`, `Oferowal`, `Time2`, `Aktywne`) VALUES ('%d','%d','%d','%d','%d','%s','%d','%d','%d')",
	itemid, typ, uid, money, time, akcja, oferowal, time2, aktywne);
	mysql_check();
	mysql_query2(zapyt);
	Zadluzenie[itemid][dID] = itemid;
	Zadluzenie[itemid][dTyp] = typ;
	Zadluzenie[itemid][dUID] = uid;
	Zadluzenie[itemid][dMoney] = money;
	Zadluzenie[itemid][dTime] = time;
	format(Zadluzenie[itemid][dAkcja], 256, "%s", akcja);
	Zadluzenie[itemid][dOferowal] = oferowal;
	Zadluzenie[itemid][dTime2] = time2;
	Zadluzenie[itemid][dAktywne] = aktywne;
	mysql_free_result();
	ZaladujZadluzenia();
	return itemid;
	
	/* TYP
	0 - Fotoradary
	1 - Dlug gracza
	*/
}

stock ZapiszZadluzenie(id)
{
	strdel(zapyt, 0, 512);
	format(zapyt, sizeof(zapyt),
	"UPDATE `jochym_dlug` SET `Aktywne` = '%d' WHERE `ID`= '%d'",
	Zadluzenie[id][dAktywne],
	Zadluzenie[id][dID]);
	mysql_query(zapyt);
	return 1;
}