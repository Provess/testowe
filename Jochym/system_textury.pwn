AntiDeAMX();
enum pText
{
	objUID,
	objModel,
	objTyp,
	objIndex,
	objNazwa[124],
	objRozmiar,
	objCzcionka[124],
	objSize,
	objBolt,
	objKol1[124],
	objKol2[124],
	objWysrotkowanie
}
new TextruaInfo[MAX_TEXTUR][pText];
forward ZaladujTextury();
public ZaladujTextury()
{
	new sql[ 500 ], id = false;
	mysql_query( "SELECT * FROM `jochym_textury`" );
	mysql_store_result( );
	while( mysql_fetch_row( sql ) )
	{
	    sscanf( sql, "p<|>i", id );
	    sscanf( sql, "p<|>dddds[124]ds[124]dds[124]s[124]d",
	    TextruaInfo[ id ][ objUID ],
	    TextruaInfo[ id ][ objModel ],
	    TextruaInfo[id][objTyp],
		TextruaInfo[id][objIndex],
		TextruaInfo[id][objNazwa],
		TextruaInfo[id][objRozmiar],
		TextruaInfo[id][objCzcionka],
		TextruaInfo[id][objSize],
		TextruaInfo[id][objBolt],
		TextruaInfo[id][objKol1],
		TextruaInfo[id][objKol2],
		TextruaInfo[id][objWysrotkowanie]
	    );
	    new uid = TextruaInfo[ id ][ objModel ];
	    if(TextruaInfo[id][objTyp] == 1)
	    {
	        new text[246];
	        format(text, sizeof(text), "%s", TextruaInfo[id][objNazwa]);
	        A_MT(text);
			A_KOLS(text);
			A_KOL(text);
	        SetDynamicObjectMaterialText(ObiektInfo[uid][ objSAMP ],TextruaInfo[id][objIndex],text,TextruaInfo[id][objRozmiar],TextruaInfo[id][objCzcionka], TextruaInfo[id][objSize],TextruaInfo[id][objBolt],HexToInt(TextruaInfo[id][objKol1]),HexToInt(TextruaInfo[id][objKol2]),TextruaInfo[id][objWysrotkowanie]);
	    }
	    else if(TextruaInfo[id][objTyp] == 2)
	    {
	        SetDynamicObjectMaterial(ObiektInfo[uid][ objSAMP ], TextruaInfo[id][objIndex], TextruaInfo[id][objRozmiar], TextruaInfo[id][objCzcionka], TextruaInfo[id][objKol1], HexToInt(TextruaInfo[id][objNazwa]));
	    }
	}
	mysql_free_result( );
	printf("Textury   - %d", id);
	return 1;
}
forward ZaladujTexturyx2();
public ZaladujTexturyx2()
{
	new sql[ 500 ], id = false;
	mysql_query( "SELECT * FROM `jochym_textury`" );
	mysql_store_result( );
	while( mysql_fetch_row( sql ) )
	{
	    sscanf( sql, "p<|>i", id );
	    sscanf( sql, "p<|>dddds[124]ds[124]dds[124]s[124]d",
	    TextruaInfo[ id ][ objUID ],
	    TextruaInfo[ id ][ objModel ],
	    TextruaInfo[id][objTyp],
		TextruaInfo[id][objIndex],
		TextruaInfo[id][objNazwa],
		TextruaInfo[id][objRozmiar],
		TextruaInfo[id][objCzcionka],
		TextruaInfo[id][objSize],
		TextruaInfo[id][objBolt],
		TextruaInfo[id][objKol1],
		TextruaInfo[id][objKol2],
		TextruaInfo[id][objWysrotkowanie]
	    );
	}
	mysql_free_result( );
	return 1;
}
stock LoadTexturs(vw)
{
	new sql[ 500 ], id = false;
	mysql_query( "SELECT * FROM `jochym_textury`" );
	mysql_store_result( );
	while( mysql_fetch_row( sql ) )
	{
	    sscanf( sql, "p<|>i", id );
	    sscanf( sql, "p<|>dddds[124]ds[124]dds[124]s[124]d",
	    TextruaInfo[ id ][ objUID ],
	    TextruaInfo[ id ][ objModel ],
	    TextruaInfo[id][objTyp],
		TextruaInfo[id][objIndex],
		TextruaInfo[id][objNazwa],
		TextruaInfo[id][objRozmiar],
		TextruaInfo[id][objCzcionka],
		TextruaInfo[id][objSize],
		TextruaInfo[id][objBolt],
		TextruaInfo[id][objKol1],
		TextruaInfo[id][objKol2],
		TextruaInfo[id][objWysrotkowanie]
	    );
	    new uid = TextruaInfo[ id ][ objModel ];
	    if(ObiektInfo[uid][objvWorld] == vw)
		{
		    if(TextruaInfo[id][objTyp] == 1)
		    {
		        new text[246];
		        format(text, sizeof(text), "%s", TextruaInfo[id][objNazwa]);
		        A_MT(text);
				A_KOLS(text);
				A_KOL(text);
		        SetDynamicObjectMaterialText(ObiektInfo[uid][ objSAMP ],TextruaInfo[id][objIndex],text,TextruaInfo[id][objRozmiar],TextruaInfo[id][objCzcionka], TextruaInfo[id][objSize],TextruaInfo[id][objBolt],HexToInt(TextruaInfo[id][objKol1]),HexToInt(TextruaInfo[id][objKol2]),TextruaInfo[id][objWysrotkowanie]);
		    }
			else if(TextruaInfo[id][objTyp] == 2)
			{
				SetDynamicObjectMaterial(ObiektInfo[uid][ objSAMP ], TextruaInfo[id][objIndex], TextruaInfo[id][objRozmiar], TextruaInfo[id][objCzcionka], TextruaInfo[id][objKol1], HexToInt(TextruaInfo[id][objNazwa]));
			}
	    }
	}
	mysql_free_result( );
	//printf("Textury   - %d", id);
	return 1;
}
stock LoadTexturs2(vw)
{
	new sql[ 500 ], id = false;
	mysql_query( "SELECT * FROM `jochym_textury`" );
	mysql_store_result( );
	while( mysql_fetch_row( sql ) )
	{
	    sscanf( sql, "p<|>i", id );
	    sscanf( sql, "p<|>dddds[124]ds[124]dds[124]s[124]d",
	    TextruaInfo[ id ][ objUID ],
	    TextruaInfo[ id ][ objModel ],
	    TextruaInfo[id][objTyp],
		TextruaInfo[id][objIndex],
		TextruaInfo[id][objNazwa],
		TextruaInfo[id][objRozmiar],
		TextruaInfo[id][objCzcionka],
		TextruaInfo[id][objSize],
		TextruaInfo[id][objBolt],
		TextruaInfo[id][objKol1],
		TextruaInfo[id][objKol2],
		TextruaInfo[id][objWysrotkowanie]
	    );
	    new uid = TextruaInfo[ id ][ objModel ];
	    if(ObiektInfo[uid][objvWorld] == vw)
		{
		    if(TextruaInfo[id][objTyp] == 1)
		    {
		        /*new text[246];
		        format(text, sizeof(text), "%s", TextruaInfo[id][objNazwa]);
		        A_MT(text);
				A_KOLS(text);
				A_KOL(text);*/
		        //SetDynamicObjectMaterialText(ObiektInfo[uid][ objSAMP ],TextruaInfo[id][objIndex],text,TextruaInfo[id][objRozmiar],TextruaInfo[id][objCzcionka], TextruaInfo[id][objSize],TextruaInfo[id][objBolt],HexToInt(TextruaInfo[id][objKol1]),HexToInt(TextruaInfo[id][objKol2]),TextruaInfo[id][objWysrotkowanie]);
		    }
			else if(TextruaInfo[id][objTyp] == 2)
			{
				//SetDynamicObjectMaterial(ObiektInfo[uid][ objSAMP ], TextruaInfo[id][objIndex], TextruaInfo[id][objRozmiar], TextruaInfo[id][objCzcionka], TextruaInfo[id][objKol1], HexToInt(TextruaInfo[id][objNazwa]));
			}
	    }
	}
	mysql_free_result( );
	//printf("Textury   - %d", id);
	return 1;
}
forward DodajTexture(model, typ, index, rozmiar, czcionka[], size, bolt, kol1[], kol2[], wysrodkowanie, nazwa[]);
public DodajTexture(model, typ, index, rozmiar, czcionka[], size, bolt, kol1[], kol2[], wysrodkowanie, nazwa[])
{
	new nazwa_escaped[256];
	mysql_real_escape_string(nazwa, nazwa_escaped);
    if(typ == 1)
	{
		new zs=0, strss[256];
		format(strss, sizeof(strss), "SELECT * FROM `jochym_textury` WHERE `model`=%d AND `typ` = %d", model, 2);
		mysql_query(strss);
		mysql_store_result();
		while(mysql_fetch_row_format(strss, "|"))
		{
			zs++;
		}
		if(zs != 0)
		{
		    new sql[100];
			format( sql, sizeof( sql ), "DELETE FROM `jochym_textury` WHERE `model` = %d", model );
			mysql_query( sql );
		}
		new text[246];
	    format(text, sizeof(text), "%s", nazwa_escaped);
	    A_MT(text);
		A_KOLS(text);
		A_KOL(text);
	    SetDynamicObjectMaterialText(ObiektInfo[model][objSAMP],index,text,rozmiar,czcionka, size,bolt,HexToInt(kol1),HexToInt(kol2),wysrodkowanie);
	}
	if(typ == 2)
	{
		new za=0, stra[256];
		format(stra, sizeof(stra), "SELECT * FROM `jochym_textury` WHERE `model`=%d AND `typ` = %d", model, 1);
		mysql_query(stra);
		mysql_store_result();
		while(mysql_fetch_row_format(stra, "|"))
		{
			za++;
		}
		if(za != 0)
		{
		    new sql[100];
			format( sql, sizeof( sql ), "DELETE FROM `jochym_textury` WHERE `model` = %d", model );
			mysql_query( sql );
		}
		SetDynamicObjectMaterial(ObiektInfo[model][objSAMP], index, rozmiar, czcionka, kol1, HexToInt(nazwa_escaped));
	}
	new z=0, str[256];
	format(str, sizeof(str), "SELECT * FROM `jochym_textury` WHERE `model`=%d AND `index` = %d LIMIT 1", model, index);
	mysql_query(str);
	mysql_store_result();
	while(mysql_fetch_row_format(str, "|"))
	{
		z++;
	}
	if(z == 0)
	{
		new id = GetFreeSQLUID("jochym_textury", "ID");
		format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_textury` (`ID` ,`model` ,`typ` ,`index` ,`rozmiar`,`czcionka`,`size`,`bolt`,`kol1`,`kol2`,`wysrodkowanie`,`nazwa`) VALUES ('%d', '%d', '%d', '%d', '%d', '%s', '%d', '%d', '%s', '%s', '%d', '%s')",
		id, model, typ, index, rozmiar, czcionka, size, bolt, kol1, kol2, wysrodkowanie, nazwa_escaped);
		mysql_check();
		mysql_query(zapyt);
		ZaladujTexturyx2();
	}
	else
	{
		strdel(zapyt, 0, 1024);
	    format(zapyt, sizeof(zapyt), "UPDATE `jochym_textury` SET `model` = '%d', `typ` = '%d', `index` = '%d', `rozmiar` = '%d', `czcionka` = '%s', `size` = '%d', `bolt` = '%d', `kol1` = '%s', `kol2` = '%s', `nazwa` = '%s', `wysrodkowanie` = '%d' WHERE `model` = '%d' AND `index` = '%d'",
		model,
		typ,
		index,
		rozmiar,
		czcionka,
		size, bolt,
		kol1,
		kol2,
		nazwa_escaped,
		wysrodkowanie,
		model,
		index);
		mysql_check();
		mysql_query2(zapyt);
		mysql_free_result();
		ZaladujTexturyx2();
	}
 	return 1;
}

CMD:mmat(playerid, params[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(!ZarzadzanieBudynkiem(GetPlayerVirtualWorld(playerid), playerid))
	{
	    return 0;
	}
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	if(IsPlayerInAnyVehicle(playerid))
	{
		return 0;
	}
	new myobject = GetPVarInt(playerid, "idobiktu");
	if(myobject == 0)
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aktualnie nie edytujesz ¿adnego obiektu.", "Zamknij", "");
	    return 0;
	}
	new index, typ, comm2[256];
	if(sscanf(params, "ddS()[256]", index, typ, comm2))
	{
	    SendClientMessage(playerid, SZARY, "TIP: /mmat [index materia³u] [typ. 0 = tekstura, 1 = tekst] [reszta parametrów zale¿nie od typu]");
	    SendClientMessage(playerid, SZARY, "Dla tekstury: [materialcolor ARGB, 0 = bez zmian] [model obiektu z którego pobieramy teksturê] [txdname] [texturename]");
	    SendClientMessage(playerid, SZARY, "Tekst: [matsize 10-140 s10] [fontsize d.24 max.255] [bold 0/1] [fontcolor ARGB] [backcolor ARGB 0=transp] [align 0-2] [font] [txt]");
	    //ZaladujTexturyx2();
	    ForeachEx(i, MAX_TEXTUR)
        {
            if(TextruaInfo[i][objModel] == myobject)
            {
                if(TextruaInfo[i][objTyp] == 2)
                {
	                new stringmmat[256];
	                format(stringmmat, sizeof(stringmmat), "{008000}/mmat{FFFFFF} %d %d %s %d %s %s", TextruaInfo[i][objIndex], TextruaInfo[i][objTyp], TextruaInfo[i][objNazwa], TextruaInfo[i][objRozmiar], TextruaInfo[i][objCzcionka], TextruaInfo[i][objKol1]);
				}
				else if(TextruaInfo[i][objTyp] == 1)
				{
				    new stringmmat[256];
	                format(stringmmat, sizeof(stringmmat), "{008000}/mmat{FFFFFF} %d %d %d %d %d %s %s %d %s %s", TextruaInfo[i][objIndex], TextruaInfo[i][objTyp], TextruaInfo[i][objRozmiar], TextruaInfo[i][objSize], TextruaInfo[i][objBolt], TextruaInfo[i][objKol1], TextruaInfo[i][objKol2], TextruaInfo[i][objCzcionka], TextruaInfo[i][objNazwa]);
					SendClientMessage(playerid, SZARY, stringmmat);
				}
			}
        }
	    return 1;
	}
	if(typ > 1)
	{
	    dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:","Z³e u¿ycie typu (0 lub 1).", "Zamknij", "" );
		return 0;
	}
	if(index < 0 || index > 15)
	{
		dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:","Z³e u¿ycie indexu (0-15).", "Zamknij", "" );
		return 0;
	}
	if(typ == 0)
	{
		new id, st[124], st2[124], st3[124];
		if(sscanf(comm2, "s[124]ds[124]s[124]", st3, id, st, st2))
		{
		    SendClientMessage(playerid, SZARY, "TIP: /mmat [index materia³u] [typ. 0 = tekstura, 1 = tekst] [reszta parametrów zale¿nie od typu]");
		    SendClientMessage(playerid, SZARY, "Dla tekstury: [materialcolor ARGB, 0 = bez zmian] [model obiektu z którego pobieramy teksturê] [txdname] [texturename]");
		    SendClientMessage(playerid, SZARY, "Tekst: [matsize 10-140 s10] [fontsize d.24 max.255] [bold 0/1] [fontcolor ARGB] [backcolor ARGB 0=transp] [align 0-2] [font] [txt]");
		    return 1;
		}
		DodajTexture(myobject, 2, index, id, st, 0, 0, st2, " ", 0, st3);
		ObiektInfo[myobject][objTekstura] = myobject;
		return 1;
	}
	else
	{
    	new nazwa[124], rozmiar, czcionka[124], size, bold, col[124], colt[124], wys;
    	if(sscanf(comm2, "ddds[124]s[124]ds[124]s[124]", rozmiar, size, bold, col, colt, wys, czcionka, nazwa))
		{
		    SendClientMessage(playerid, SZARY, "TIP: /mmat [index materia³u] [typ. 0 = tekstura, 1 = tekst] [reszta parametrów zale¿nie od typu]");
		    SendClientMessage(playerid, SZARY, "Dla tekstury: [materialcolor ARGB, 0 = bez zmian] [model obiektu z którego pobieramy teksturê] [txdname] [texturename]");
		    SendClientMessage(playerid, SZARY, "Tekst: [matsize 10-140 s10] [fontsize d.24 max.255] [bold 0/1] [fontcolor ARGB] [backcolor ARGB 0=transp] [align 0-2] [font] [txt]");
		    return 1;
		}
		if(size < 24 || size > 255)
		{
			dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:","Z³e u¿ycie fontzise tekstu (24-255).", "Zamknij", "" );
			return 0;
		}
		if(bold < 0 || bold > 1)
		{
			dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:","Z³e u¿ycie pogrubienia (0-1).", "Zamknij", "" );
			return 0;
		}
		if(wys < 0 || wys > 2)
		{
			dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:","Z³e u¿ycie marginesu (0-2).", "Zamknij", "" );
			return 0;
		}
		if(rozmiar == 10 || rozmiar == 20 || rozmiar == 30 || rozmiar == 40 || rozmiar == 50 || rozmiar == 60 || rozmiar == 70 || rozmiar == 80 || rozmiar == 90 || rozmiar == 100 ||
		rozmiar == 110 || rozmiar == 120 || rozmiar == 130 || rozmiar == 140)
		{
			DodajTexture(myobject, 1, index, rozmiar, czcionka, size, bold, col, colt, wys, nazwa);
			ObiektInfo[myobject][objTekstura] = myobject;
		}
		else
		{
			dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:","Z³e u¿ycie matsize (10-140, tylko liczby dziesiêtne).", "Zamknij", "" );
		}
		return 1;
	}
}
