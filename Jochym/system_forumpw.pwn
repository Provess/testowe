AntiDeAMX();
stock PwForum(uid, toid, fromid, subject[], message[], dateline)
{
	strdel(zapyt, 0, 1024);
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_privatemessages` SET `uid` = '%d', `toid` = '%d', `fromid` = '%d', `folder` = '%d', `subject` = '%s', `message` = '%s', `dateline` = '%d', `includesig` = '%d', `receipt` = '%d'", uid, toid, fromid, 1, subject, message, dateline,1,1);
	mysql_query(zapyt);
	strdel(zapyt2, 0, 1024);
	format(zapyt2, sizeof(zapyt2), "UPDATE `jochym_users` SET `unreadpms` = 'unreadpms' + 1, `pmnotice` = '2' WHERE `uid` = '%d'", toid);
    mysql_query(zapyt2);
}
stock Zaproszenie(playerid, oferujacy, grupa_uid, grupa_nazwa[], typ_grupy)
{
	strdel(zapyt, 0, 1024);
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_zaproszenia` SET `UID` = '%d', `GUID` = '%d', `1UID` = '%d', `1GUID` = '%d', `GRUPA_UID` = '%d', `NAZWA_GRUPY` = '%s', `TYP_GRUPY` = '%d'",
	DaneGracza[playerid][gUID],DaneGracza[playerid][gGUID],DaneGracza[oferujacy][gUID],DaneGracza[oferujacy][gGUID], grupa_uid, grupa_nazwa, typ_grupy);
	mysql_query(zapyt);
}
stock StatykujTransakcje(dzialalnosc, playerid, oferujacy, co_dal[], zaile)
{
	strdel(zapyt, 0, 1024);
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_statystyki` SET `UID_DZIALALNOSCI` = '%d', `KTO_UID` = '%d', `KTO_GUID` = '%d', `KOMU_UID` = '%d', `KOMU_GUID` = '%d', `CO` = '%s', `ZA_ILE` = '%d', `DATA` = '%d'",
	dzialalnosc, DaneGracza[playerid][gUID], DaneGracza[playerid][gGUID],DaneGracza[oferujacy][gUID],DaneGracza[oferujacy][gGUID], co_dal, zaile, gettime()+CZAS_LETNI);
	mysql_query(zapyt);
}
