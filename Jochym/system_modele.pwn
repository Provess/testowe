enum mModels
{
	mIDS,
	mTyp,
	mBaseID,
	mModel,
	mDFF[128],
	mTXD[128]
}
new Models[MAX_MODEL][mModels];

forward ZaladujModele();
public ZaladujModele()
{
	//czaswykonania = gettime();
	new id = false;
	mysql_query( "SELECT * FROM `jochym_models`" );
	mysql_store_result( );
	while(mysql_fetch_row(zapyt))
	{
	    sscanf(zapyt, "p<|>i", id );
	    sscanf(zapyt, "p<|>dddds[128]s[128]",
	    Models[id][mIDS],
		Models[id][mTyp],
		Models[id][mBaseID],
		Models[id][mModel],
		Models[id][mDFF],
		Models[id][mTXD]);
		if(Models[id][mTyp] == 0)
		{
			AddCharModel(Models[id][mBaseID], Models[id][mModel], Models[id][mDFF], Models[id][mTXD]);
		}
		else
		{
			AddSimpleModel(-1, Models[id][mBaseID], Models[id][mModel], Models[id][mDFF], Models[id][mTXD]);
		}
	}
	mysql_free_result( );
	printf("Za³adowanych modeli 0.3DL   - %d", id);
	return 1;
}

stock UsunModel(id)
{
	format(zapyt, sizeof(zapyt), "DELETE FROM `jochym_models` WHERE `ID` = '%d'", id);
	mysql_check();
	mysql_query2(zapyt);
 	Models[id][mTyp] = 0;
	Models[id][mBaseID] = 0;
	Models[id][mModel] = 0;
	format(Models[id][mDFF], 128, "");
	format(Models[id][mTXD], 128, "");
	return 1;
}

stock DodajModel(typ, baseid, model, dff[128], txd[128])
{
	if(strlen(dff) >= 128 || strlen(txd) >= 128) return 1;
	new itemid = GetFreeSQLUID("jochym_models", "ID");
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_models` (`ID`, `Typ`, `BaseID`, `Model`, `DFF`, `TXD`) VALUES ('%d','%d','%d','%d','%s','%s')",
	itemid, typ, baseid, model, dff, txd);
	mysql_check();
	mysql_query2(zapyt);
	Models[itemid][mIDS] = itemid;
	Models[itemid][mTyp] = typ;
	Models[itemid][mBaseID] = baseid;
	Models[itemid][mModel] = model;
	format(Models[itemid][mDFF], 128, "%s", dff);
	format(Models[itemid][mTXD], 128, "%s", txd);
	mysql_free_result();
	if(Models[itemid][mTyp] == 0)
	{
		AddCharModel(Models[itemid][mBaseID], Models[itemid][mModel], Models[itemid][mDFF], Models[itemid][mTXD]);
	}
	else
	{
		AddSimpleModel(-1, Models[itemid][mBaseID], Models[itemid][mModel], Models[itemid][mDFF], Models[itemid][mTXD]);
	}
	return itemid;
}

CMD:amodel(playerid, cmdtext[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
    if(UprawnieniaCMa(playerid, 3))
	{
		new	comm1[32], comm2[128];
		if(sscanf(cmdtext, "s[32]S()[128]", comm1, comm2))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/amodel [lista, dodaj]", "Zamknij", "");
			return 1;
		}
		else if(!strcmp(comm1,"dodaj",true))
		{
			if(UprawnieniaCEO(playerid, 0))
			{
				new typ, baseid, model, dff[128], txd[128];
				if(sscanf(comm2, "ddds[128]s[128]", typ, baseid, model, dff, txd))
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "Aby dodaæ model 0.3DL wpisz: /model dodaj [typ (0 - skin, 1 - obiekt/budynek] [baseid] [model] [dff] [txd]", "Zamknij", "");
					return 1;
				}
				DodajModel(typ, baseid, model, dff, txd);
				SendClientMessage(playerid, SZARY, "Model zosta³‚ dodany do bazy danych oraz wczytany do gry!");
				return 1;
			}
		}
		else if(!strcmp(comm1, "lista", true))
		{
			new typ;
			if(sscanf(comm2, "d", typ))
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, GUIOPIS "Informacja", "/amodel lista [0 - skiny | 1 - obiekty]", "Zamknij", "");
				return 1;
			}
			ZaladujModele();
			new str[4048], temp = 0;
			format(str, sizeof(str), "{848484}Model\tNazwa modelu");
			ForeachEx(id, MAX_MODEL)
			{
				if(Models[id][mModel] != 0)
				{
					if(Models[id][mTyp] == typ)
					{
						temp++;
						format(str, sizeof(str), "%s\n%d\t%s", str, Models[id][mModel], Models[id][mTXD]);
					}
				}
			}
			if(temp == 0)
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie znaleziono ¿adnych modeli 0.3DL w bazie danych!", "Zamknij", "");
				return 0;
			}
			else
			{
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_TABLIST_HEADERS, "• Zarz¹dzanie modelami 0.3DL:", str, "Zarz¹dzaj", "Anuluj");
				return 1;
			}
		}
	}
	return 1;
}