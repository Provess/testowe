AntiDeAMX();
CMD:mc( playerid, params[ ] )
{
    new vw = GetPlayerVirtualWorld(playerid);
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	new model, id;
	if(GetPlayerVirtualWorld(playerid) == 0)
	{
	    //new uidt = GraczNaTerenie(playerid);
	    if(!ZarzadzanieMAPObiektamiVW0(playerid))
	    {
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie masz uprawnieñ do edycji obiektów na tym terenie.", "Zamknij", "");
		    return 0;
		}
	}
	else
	{
	    if(!ZarzadzanieBudynkiem(GetPlayerVirtualWorld(playerid), playerid))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie masz uprawnieñ do edycji obiektów w tym budynku.", "Zamknij", "");
		    return 0;
		}
	}
    new uidt = GraczNaTerenie(playerid);
	if(Lokacja[uidt][gObiekty] <= 0 && GetPlayerVirtualWorld(playerid) == 0)
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Na tym terenie nie ma dostêpnych mebli\nWejdŸ w zarz¹dzanie terenem (/area) i dodaj parê mebli do terenu by zacz¹æ budowaæ", "Zamknij", "");
		return 0;
	}
	if(BudynekInfo[GetPlayerVirtualWorld(playerid)][nLiczbaMebli] <= 0 && GetPlayerVirtualWorld(playerid) != 0)
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "W tym budynku nie ma dostêpnych mebli\nWejdŸ w zarz¹dzanie drzwiami (/drzwi) i dodaj parê mebli do budynku by zacz¹æ budowaæ.", "Zamknij", "");
		return 0;
	}
	if(BudynekInfo[GetPlayerVirtualWorld(playerid)][nMapa] == 1)
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "W³aœciciel budynku w³aœnie wgrywa mape obiektów do budynku.\nTa opcja jest niedostêpna do czasu zakoñczenia tej operacji.", "Zamknij", "");
		return 0;
	}
	if(IsPlayerInAnyVehicle(playerid))
	{
		return 0;
	}
	if( sscanf( params, "i", model ) )
	    return dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:","Aby stworzyæ obiekt wpisz: /mc [model]", "Zamknij", "" );
	if((model == 1622 || model == 1616 || model == 1886) && DaneGracza[playerid][gZarzadzajElektryka] != vw)
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Stworzenie tego obiektu nie jest mo¿liwe!\nObiekt ten mo¿e stworzyæ ochronarz który oferowa³ us³ugê (1622, 1616, 1886).", "Zamknij", "");
	 	return 0;
	}
	if((model == 364 || model == 1958) && BudynekInfo[vw][nLiczbaNapisow] == 0)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Stworzenie tego obiektu nie jest mo¿liwe!\nObiekt ten mo¿e stworzyæ elektryk który oferowa³ us³ugê (364, 1958).", "Zamknij", "");
	 	return 0;
	}
	if(model == 0)//331
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Obiekt którego ID poda³eœ, nie istnieje!", "Zamknij", "");
		return 0;
	}
	if(GetPVarInt(playerid, "idobiktu") != 0 || GetPVarInt(playerid, "inedit") != 0)
	{
		new uids = GetPVarInt(playerid, "inedit");
	    ZapiszObiekt(uids);
		CancelEdit(playerid);
		OnPlayerText(playerid, "-stopani");
        obiektinedit[uids] = false;
        DeletePVar(playerid,"idobiktu");
        DeletePVar(playerid,"inedit");
        TextDrawHideForPlayer(playerid, OBJ[playerid]);
        Edytors[playerid] = 0;
	}
	if(GetPlayerVirtualWorld(playerid) == 0)
	{
	    Lokacja[uidt][gObiekty] = Lokacja[uidt][gObiekty]-1;
	    ZapiszTeren(uidt);
	}
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z );
	id = DodajObiekt( model, x+1.50, y+1.50, z, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), playerid);
	Streamer_Update(playerid);
	if(DaneGracza[playerid][gEdytor] == 0)
    {
		EditDynamicObject(playerid, ObiektInfo[id][objSAMP]);
		edycjaobiektow[playerid] = 0;
	}else{
	    edycjaobiektow[playerid] = 0;
	    CancelEdit(playerid);
	}
	Edytors[playerid] = 1;
	SetPVarInt(playerid, "idobiktu", id);
	return 1;
}
CMD:mcopy( playerid, params[ ] )
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	new id;
	if(GetPlayerVirtualWorld(playerid) == 0)
	{
	    //new uidt = GraczNaTerenie(playerid);
	    if(!ZarzadzanieMAPObiektamiVW0(playerid))
	    {
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie masz uprawnieñ do edycji obiektów na tym terenie.", "Zamknij", "");
		    return 0;
		}
	}
	else
	{
	    if(!ZarzadzanieBudynkiem(GetPlayerVirtualWorld(playerid), playerid))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie masz uprawnieñ do edycji obiektów w tym budynku.", "Zamknij", "");
		    return 0;
		}
	}
	new uid = GetPVarInt(playerid, "idobiktu");
	if(uid == 0)
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aktualnie nie edytujesz ¿adnego obiektu.", "Zamknij", "");
	    return 0;
	}
 	new uidt = GraczNaTerenie(playerid);
	if(Lokacja[uidt][gObiekty] <= 0 && GetPlayerVirtualWorld(playerid) == 0)
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Na tym terenie nie ma dostêpnych mebli\nWejdŸ w zarz¹dzanie terenem (/area) i dodaj parê mebli do terenu by zacz¹æ budowaæ", "Zamknij", "");
		return 0;
	}
	if(BudynekInfo[GetPlayerVirtualWorld(playerid)][nLiczbaMebli] <= 0 && GetPlayerVirtualWorld(playerid) != 0)
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "W tym budynku nie ma dostêpnych mebli\nWejdŸ w zarz¹dzanie drzwiami (/drzwi) i dodaj parê mebli do budynku by zacz¹æ budowaæ.", "Zamknij", "");
		return 0;
	}
	if(BudynekInfo[GetPlayerVirtualWorld(playerid)][nMapa] == 1)
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "W³aœciciel budynku w³aœnie wgrywa mape obiektów do budynku.\nTa opcja jest niedostêpna do czasu zakoñczenia tej operacji.", "Zamknij", "");
		return 0;
	}
	if(IsPlayerInAnyVehicle(playerid))
	{
		return 0;
	}
	if(!GraczPremium(playerid))
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie posiadasz konta premium!", "Zamknij", "");
	    return 0;
	}
	if(GetPlayerVirtualWorld(playerid) == 0)
	{
	    Lokacja[uidt][gObiekty] = Lokacja[uidt][gObiekty]-1;
	    ZapiszTeren(uidt);
	}
	new uids = GetPVarInt(playerid, "inedit");
	ZapiszObiekt(uids);
	OnPlayerText(playerid, "-stopani");
	DeletePVar(playerid,"idobiktu");
	TextDrawHideForPlayer(playerid, OBJ[playerid]);
	id = DodajObiekt( ObiektInfo[uid][objModel], ObiektInfo[uid][objPozX], ObiektInfo[uid][objPozY], ObiektInfo[uid][objPozZ], ObiektInfo[uid][objRotX], ObiektInfo[uid][objRotY], ObiektInfo[uid][objRotZ], GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), playerid);
	Streamer_Update(playerid);
	if(DaneGracza[playerid][gEdytor] == 0)
    {
		EditDynamicObject(playerid, ObiektInfo[id][objSAMP]);
		edycjaobiektow[playerid] = 0;
	}else{
	    edycjaobiektow[playerid] = 0;
	    CancelEdit(playerid);
	}
	Edytors[playerid] = 1;
	SetPVarInt(playerid, "idobiktu", id);
	return 1;
}
CMD:msel( playerid, params[ ] )
{
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	if(GetPlayerVirtualWorld(playerid) == 0)
	{
	    if(!ZarzadzanieMAPObiektamiVW0(playerid))
	    {
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie masz uprawnieñ do edycji obiektów na tym terenie.", "Zamknij", "");
		    return 0;
		}
	}
	else
	{
	    if(!ZarzadzanieBudynkiem(GetPlayerVirtualWorld(playerid), playerid))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie masz uprawnieñ do edycji obiektów w tym budynku.", "Zamknij", "");
		    return 0;
		}
	}
	if(GetPlayerVirtualWorld(playerid) == 0)
	{
	    //new uido = ObiektNaTerenie(playerid);
		if(ZarzadzanieMAPObiektamiVW0OBJ(playerid))
		{
		    if(GetPVarInt(playerid, "idobiktu") != 0 || GetPVarInt(playerid, "inedit") != 0)
			{
			    new uids = GetPVarInt(playerid, "inedit");
			    ZapiszObiekt(uids);
				CancelEdit(playerid);
				OnPlayerText(playerid, "-stopani");
		        obiektinedit[uids] = false;
		        DeletePVar(playerid,"idobiktu");
		        DeletePVar(playerid,"inedit");
		        TextDrawHideForPlayer(playerid, OBJ[playerid]);
		        Edytors[playerid] = 0;
			}
		}
		else
		{
		    if(GetPVarInt(playerid, "idobiktu") != 0 || GetPVarInt(playerid, "inedit") != 0)
			{
			    new uids = GetPVarInt(playerid, "inedit");
			    UsunObiekt(uids);
				ClearAnimations(playerid);
				ApplyAnimation(playerid, "CARRY", "crry_prtial", 4, 0, 0, 0, 0, 0, 0);
				CancelEdit(playerid);
				obiektinedit[uids] = false;
				DeletePVar(playerid,"idobiktu");
			    DeletePVar(playerid,"inedit");
			    TextDrawHideForPlayer(playerid, OBJ[playerid]);
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz stawiaæ obiektów poza swoj¹ stref¹!\nObiekt zosta³ usuniêty postaw nowy lecz na swojej strefie.\nPamiêtaj ¿e obiekty s¹ kontrolowane, niestosowne ich u¿ycie grozi usuniêciem strefy!", "Zamknij", "");
			}
		}
	}
	else
	{
	    if(GetPVarInt(playerid, "idobiktu") != 0 || GetPVarInt(playerid, "inedit") != 0)
		{
		    new uids = GetPVarInt(playerid, "inedit");
		    ZapiszObiekt(uids);
			CancelEdit(playerid);
			OnPlayerText(playerid, "-stopani");
	        obiektinedit[uids] = false;
	        DeletePVar(playerid,"idobiktu");
	        DeletePVar(playerid,"inedit");
	        TextDrawHideForPlayer(playerid, OBJ[playerid]);
	        Edytors[playerid] = 0;
		}
	}
	if(BudynekInfo[GetPlayerVirtualWorld(playerid)][nStworzoneObiekty] == 0)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "W budynu którym siê znajdujesz nie ma stworzonych obiektów.", "Zamknij", "");
		return 0;
	}
	new uid;
	if(sscanf(params, "i", uid))
	{
		if(GetPlayerVirtualWorld(playerid) != 0)
		{
			new uids = 0, Float:radius = 1;
			for(new i = 0; i < 100; i++)//edycja 30.12
			{
				if(uids == 0)
				{
					ForeachEx(h, MAX_OBIEKT)
					{
						if(Dystans(radius, playerid, ObiektInfo[h][objPozX],ObiektInfo[h][objPozY],ObiektInfo[h][objPozZ]))
						{
							if(ObiektInfo[h][objvWorld] == GetPlayerVirtualWorld(playerid) && GetPlayerVirtualWorld(playerid) != 0 || GetPlayerVirtualWorld(playerid) == 0 && ObiektInfo[h][objvWorld] == -1)
							{
								uids = h;
								break;
							}
						}
					}
					radius+=0.5;
				}
				else
				{
					if(GetPlayerVirtualWorld(playerid) == 0)
					{
						//new uido = ObiektNaTerenie(playerid);
						if(ZarzadzanieMAPObiektamiVW0OBJ(playerid))
						{
							SetPVarInt(playerid, "inedit", uids);
							obiektinedit[uids] = true;
							if(ObiektInfo[uids][objStworzyl] != DaneGracza[playerid][gUID] && GetPlayerVirtualWorld(playerid) == 0 && DaneGracza[playerid][gAdmGroup] == 8 && DaneGracza[playerid][gAdmLVL] >= 5 && DaneGracza[playerid][gBudowanie] == 0)
							{
								dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie zosta³ stworzony przez Ciebie!", "Zamknij", "");
								return 0;
							}
							if(ObiektInfo[uids][objvWorld] != GetPlayerVirtualWorld(playerid) && GetPlayerVirtualWorld(playerid) != 0)
							{
								dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie nale¿y do Twojego budynku!", "Zamknij", "");
								return 0;
							}
							if(DaneGracza[playerid][gEdytor] == 0)
							{
								EditDynamicObject(playerid, ObiektInfo[uids][objSAMP]);
								edycjaobiektow[playerid] = 0;
								Edytors[playerid] = 1;
							}else{
								edycjaobiektow[playerid] = 0;
								CancelEdit(playerid);
								Edytors[playerid] = 1;
							}
							SetPVarInt(playerid, "idobiktu", uids);
						}
						else
						{
							DeletePVar(playerid,"inedit");
							TextDrawHideForPlayer(playerid, OBJ[playerid]);
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿na znaleŸæ ¿adnych obiektów na tym terenie.\nMusisz stworzyæ jakieœ obiekty na tym terenie by je edytowaæ.", "Zamknij", "");
						}
					}
					else
					{
						SetPVarInt(playerid, "inedit", uids);
						obiektinedit[uids] = true;
						if(ObiektInfo[uids][objStworzyl] != DaneGracza[playerid][gUID] && GetPlayerVirtualWorld(playerid) == 0 && DaneGracza[playerid][gAdmGroup] == 8 && DaneGracza[playerid][gAdmLVL] >= 5 && DaneGracza[playerid][gBudowanie] == 0)
						{
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie zosta³ stworzony przez Ciebie!", "Zamknij", "");
							return 0;
						}
						if(ObiektInfo[uids][objvWorld] != GetPlayerVirtualWorld(playerid) && GetPlayerVirtualWorld(playerid) != 0)
						{
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie nale¿y do Twojego budynku!", "Zamknij", "");
							return 0;
						}
						if(DaneGracza[playerid][gEdytor] == 0)
						{
							EditDynamicObject(playerid, ObiektInfo[uids][objSAMP]);
							edycjaobiektow[playerid] = 0;
							Edytors[playerid] = 1;
						}else{
							edycjaobiektow[playerid] = 0;
							CancelEdit(playerid);
							Edytors[playerid] = 1;
						}
						SetPVarInt(playerid, "idobiktu", uids);
					}
				}
			}
			if(uids == 0)
			{
				GameTextForPlayer(playerid, "~r~Brak obiektow w poblizu.", 3000, 5);
			}
		}
		else
		{
			new uids = 0, Float:radius = 1;
			for(new i = 0; i < 100; i++)
			{
				if(uids == 0)
				{
					ForeachEx(h, MAX_OBIEKT)
					{
						if(Dystans(radius, playerid, ObiektInfo[h][objPozX],ObiektInfo[h][objPozY],ObiektInfo[h][objPozZ]))
						{
							if(ObiektInfo[h][objvWorld] == GetPlayerVirtualWorld(playerid) && GetPlayerVirtualWorld(playerid) != 0 || GetPlayerVirtualWorld(playerid) == 0 && ObiektInfo[h][objvWorld] == -1)
							{
								uids = h;
								break;
							}
						}
					}
					radius+=0.5;
				}
				else
				{
					if(GetPlayerVirtualWorld(playerid) == 0)
					{
						if(ZarzadzanieMAPObiektamiVW0OBJ(playerid))
						{
							SetPVarInt(playerid, "inedit", uids);
							obiektinedit[uids] = true;
							if(ObiektInfo[uids][objStworzyl] != DaneGracza[playerid][gUID] && GetPlayerVirtualWorld(playerid) == 0 && DaneGracza[playerid][gAdmGroup] == 8 && DaneGracza[playerid][gAdmLVL] >= 5 && DaneGracza[playerid][gBudowanie] == 0)
							{
								dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie zosta³ stworzony przez Ciebie!", "Zamknij", "");
								return 0;
							}
							if(ObiektInfo[uids][objvWorld] != GetPlayerVirtualWorld(playerid) && GetPlayerVirtualWorld(playerid) != 0)
							{
								dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie nale¿y do Twojego budynku!", "Zamknij", "");
								return 0;
							}
							if(DaneGracza[playerid][gEdytor] == 0)
							{
								EditDynamicObject(playerid, ObiektInfo[uids][objSAMP]);
								edycjaobiektow[playerid] = 0;
								Edytors[playerid] = 1;
							}else{
								edycjaobiektow[playerid] = 0;
								CancelEdit(playerid);
								Edytors[playerid] = 1;
							}
							SetPVarInt(playerid, "idobiktu", uids);
						}
						else
						{
							DeletePVar(playerid,"inedit");
							TextDrawHideForPlayer(playerid, OBJ[playerid]);
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿na znaleŸæ ¿adnych obiektów na tym terenie.\nMusisz stworzyæ jakieœ obiekty na tym terenie by je edytowaæ.", "Zamknij", "");
						}
					}
					else
					{
						SetPVarInt(playerid, "inedit", uids);
						obiektinedit[uids] = true;
						if(ObiektInfo[uids][objStworzyl] != DaneGracza[playerid][gUID] && GetPlayerVirtualWorld(playerid) == 0 && DaneGracza[playerid][gAdmGroup] == 8 && DaneGracza[playerid][gAdmLVL] >= 5 && DaneGracza[playerid][gBudowanie] == 0)
						{
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie zosta³ stworzony przez Ciebie!", "Zamknij", "");
							return 0;
						}
						if(ObiektInfo[uids][objvWorld] != GetPlayerVirtualWorld(playerid) && GetPlayerVirtualWorld(playerid) != 0)
						{
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie nale¿y do Twojego budynku!", "Zamknij", "");
							return 0;
						}
						if(DaneGracza[playerid][gEdytor] == 0)
						{
							EditDynamicObject(playerid, ObiektInfo[uids][objSAMP]);
							edycjaobiektow[playerid] = 0;
							Edytors[playerid] = 1;
						}else{
							edycjaobiektow[playerid] = 0;
							CancelEdit(playerid);
							Edytors[playerid] = 1;
						}
						SetPVarInt(playerid, "idobiktu", uids);
					}
				}
			}
			if(uids == 0)
			{
				GameTextForPlayer(playerid, "~r~Brak obiektow w poblizu.", 3000, 5);
			}
		}
		return 1;
	}
	else
	{
		if(GetPlayerVirtualWorld(playerid) != 0)
		{
			new uids = 0, Float:radius = 0.5;
			for(new i = 0; i < 2000; i++)//edycja 30.12
			{
				if(uids == 0)
				{
					ForeachEx(h, MAX_OBIEKT)
					{
						if(Dystans(radius, playerid, ObiektInfo[h][objPozX],ObiektInfo[h][objPozY],ObiektInfo[h][objPozZ]) && ObiektInfo[h][objModel] == uid)
						{
							if(ObiektInfo[h][objvWorld] == GetPlayerVirtualWorld(playerid) && GetPlayerVirtualWorld(playerid) != 0 || GetPlayerVirtualWorld(playerid) == 0 && ObiektInfo[h][objvWorld] == -1)
							{
								uids = h;
								break;
							}
						}
					}
					radius+=0.5;
				}
				else
				{
					if(GetPlayerVirtualWorld(playerid) == 0)
					{
						if(ZarzadzanieMAPObiektamiVW0OBJ(playerid))
						{
							SetPVarInt(playerid, "inedit", uids);
							obiektinedit[uids] = true;
							if(ObiektInfo[uids][objStworzyl] != DaneGracza[playerid][gUID] && GetPlayerVirtualWorld(playerid) == 0 && DaneGracza[playerid][gAdmGroup] == 8 && DaneGracza[playerid][gAdmLVL] >= 5 && DaneGracza[playerid][gBudowanie] == 0)
							{
								dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie zosta³ stworzony przez Ciebie!", "Zamknij", "");
								return 0;
							}
							if(ObiektInfo[uids][objvWorld] != GetPlayerVirtualWorld(playerid) && GetPlayerVirtualWorld(playerid) != 0)
							{
								dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie nale¿y do Twojego budynku!", "Zamknij", "");
								return 0;
							}
							if(DaneGracza[playerid][gEdytor] == 0)
							{
								EditDynamicObject(playerid, ObiektInfo[uids][objSAMP]);
								edycjaobiektow[playerid] = 0;
								Edytors[playerid] = 1;
							}
							else
							{
								edycjaobiektow[playerid] = 1;
								CancelEdit(playerid);
								ApplyAnimation(playerid,"BEACH","bather",4.1,0,0,0,1,0);
								ApplyAnimation(playerid,"BEACH","bather",4.1,0,0,0,1,0);
								Edytors[playerid] = 1;
							}
							SetPVarInt(playerid, "idobiktu", uids);
						}
						else
						{
							DeletePVar(playerid,"inedit");
							TextDrawHideForPlayer(playerid, OBJ[playerid]);
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿na znaleŸæ ¿adnych obiektów na tym terenie.\nMusisz stworzyæ jakieœ obiekty na tym terenie by je edytowaæ.", "Zamknij", "");
						}
					}
					else
					{
						SetPVarInt(playerid, "inedit", uids);
						obiektinedit[uids] = true;
						if(ObiektInfo[uids][objStworzyl] != DaneGracza[playerid][gUID] && GetPlayerVirtualWorld(playerid) == 0 && DaneGracza[playerid][gAdmGroup] == 8 && DaneGracza[playerid][gAdmLVL] >= 5 && DaneGracza[playerid][gBudowanie] == 0)
						{
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie zosta³ stworzony przez Ciebie!", "Zamknij", "");
							return 0;
						}
						if(ObiektInfo[uids][objvWorld] != GetPlayerVirtualWorld(playerid) && GetPlayerVirtualWorld(playerid) != 0)
						{
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie nale¿y do Twojego budynku!", "Zamknij", "");
							return 0;
						}
						if(DaneGracza[playerid][gEdytor] == 0)
						{
							EditDynamicObject(playerid, ObiektInfo[uids][objSAMP]);
							edycjaobiektow[playerid] = 0;
							Edytors[playerid] = 1;
						}
						else
						{
							edycjaobiektow[playerid] = 1;
							CancelEdit(playerid);
							ApplyAnimation(playerid,"BEACH","bather",4.1,0,0,0,1,0);
							ApplyAnimation(playerid,"BEACH","bather",4.1,0,0,0,1,0);
							Edytors[playerid] = 1;
						}
						SetPVarInt(playerid, "idobiktu", uids);
					}
				}
			}
			if(uids == 0)
			{
				GameTextForPlayer(playerid, "~r~Brak obiektow w poblizu.", 3000, 5);
			}
		}
		else
		{
			new uids = 0, Float:radius = 0.5;
			for(new i = 0; i < 2000; i++)
			{
				if(uids == 0)
				{
					ForeachEx(h, MAX_OBIEKT)
					{
						if(Dystans(radius, playerid, ObiektInfo[h][objPozX],ObiektInfo[h][objPozY],ObiektInfo[h][objPozZ]) && ObiektInfo[h][objModel] == uid)
						{
							if(ObiektInfo[h][objvWorld] == GetPlayerVirtualWorld(playerid) && GetPlayerVirtualWorld(playerid) != 0 || GetPlayerVirtualWorld(playerid) == 0 && ObiektInfo[h][objvWorld] == -1)
							{
								uids = h;
								break;
							}
						}
					}
					radius+=0.5;
				}
				else
				{
					if(GetPlayerVirtualWorld(playerid) == 0)
					{
						//new uido = ObiektNaTerenie(playerid);
						if(ZarzadzanieMAPObiektamiVW0OBJ(playerid))
						{
							SetPVarInt(playerid, "inedit", uids);
							obiektinedit[uids] = true;
							if(ObiektInfo[uids][objStworzyl] != DaneGracza[playerid][gUID] && GetPlayerVirtualWorld(playerid) == 0 && DaneGracza[playerid][gAdmGroup] == 8 && DaneGracza[playerid][gAdmLVL] >= 5 && DaneGracza[playerid][gBudowanie] == 0)
							{
								dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie zosta³ stworzony przez Ciebie!", "Zamknij", "");
								return 0;
							}
							if(ObiektInfo[uids][objvWorld] != GetPlayerVirtualWorld(playerid) && GetPlayerVirtualWorld(playerid) != 0)
							{
								dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie nale¿y do Twojego budynku!", "Zamknij", "");
								return 0;
							}
							if(DaneGracza[playerid][gEdytor] == 0)
							{
								EditDynamicObject(playerid, ObiektInfo[uids][objSAMP]);
								edycjaobiektow[playerid] = 0;
								Edytors[playerid] = 1;
							}
							else
							{
								edycjaobiektow[playerid] = 1;
								CancelEdit(playerid);
								ApplyAnimation(playerid,"BEACH","bather",4.1,0,0,0,1,0);
								ApplyAnimation(playerid,"BEACH","bather",4.1,0,0,0,1,0);
								Edytors[playerid] = 1;
							}
							SetPVarInt(playerid, "idobiktu", uids);
						}
						else
						{
							DeletePVar(playerid,"inedit");
							TextDrawHideForPlayer(playerid, OBJ[playerid]);
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿na znaleŸæ ¿adnych obiektów na tym terenie.\nMusisz stworzyæ jakieœ obiekty na tym terenie by je edytowaæ.", "Zamknij", "");
						}
					}
					else
					{
						SetPVarInt(playerid, "inedit", uids);
						obiektinedit[uids] = true;
						if(ObiektInfo[uids][objStworzyl] != DaneGracza[playerid][gUID] && GetPlayerVirtualWorld(playerid) == 0 && DaneGracza[playerid][gAdmGroup] == 8 && DaneGracza[playerid][gAdmLVL] >= 5 && DaneGracza[playerid][gBudowanie] == 0)
						{
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie zosta³ stworzony przez Ciebie!", "Zamknij", "");
							return 0;
						}
						if(ObiektInfo[uids][objvWorld] != GetPlayerVirtualWorld(playerid) && GetPlayerVirtualWorld(playerid) != 0)
						{
							dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie nale¿y do Twojego budynku!", "Zamknij", "");
							return 0;
						}
						if(DaneGracza[playerid][gEdytor] == 0)
						{
							EditDynamicObject(playerid, ObiektInfo[uids][objSAMP]);
							edycjaobiektow[playerid] = 0;
							Edytors[playerid] = 1;
						}
						else
						{
							edycjaobiektow[playerid] = 1;
							CancelEdit(playerid);
							ApplyAnimation(playerid,"BEACH","bather",4.1,0,0,0,1,0);
							ApplyAnimation(playerid,"BEACH","bather",4.1,0,0,0,1,0);
							Edytors[playerid] = 1;
						}
						SetPVarInt(playerid, "idobiktu", uids);
					}
				}
			}
			if(uids == 0)
			{
				GameTextForPlayer(playerid, "~r~Brak obiektow w poblizu.", 3000, 5);
			}
		}
		return 1;
	}
	//return 1;
}
CMD:md( playerid, params[ ] )
{
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	if(GetPlayerVirtualWorld(playerid) == 0)
	{
	    if(!ZarzadzanieMAPObiektamiVW0OBJ(playerid))
	    {
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie masz uprawnieñ do edycji obiektów na tym terenie.", "Zamknij", "");
		    return 0;
		}
	}
	else
	{
	    if(!ZarzadzanieBudynkiem(GetPlayerVirtualWorld(playerid), playerid))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie masz uprawnieñ do edycji obiektów w tym budynku.", "Zamknij", "");
		    return 0;
		}
	}
	new id = GetPVarInt(playerid, "idobiktu");
	if(id == 0)
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aktualnie nie edytujesz ¿adnego obiektu.", "Zamknij", "");
	    return 0;
	}
	new uido = ObiektNaTerenie(playerid);
	if(ObiektInfo[id][objStworzyl] != DaneGracza[playerid][gUID] && GetPlayerVirtualWorld(playerid) == 0 && DaneGracza[playerid][gAdmGroup] == 8 && DaneGracza[playerid][gAdmLVL] >= 5 && DaneGracza[playerid][gBudowanie] == 0)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie zosta³ stworzony przez Ciebie!", "Zamknij", "");
		return 0;
	}
	if(ObiektInfo[id][objvWorld] != GetPlayerVirtualWorld(playerid) && GetPlayerVirtualWorld(playerid) != 0)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie nale¿y do Twojego budynku!", "Zamknij", "");
		return 0;
	}
	if(GetPlayerVirtualWorld(playerid) == 0)
	{
	    Lokacja[uido][gObiekty] = Lokacja[uido][gObiekty]+1;
	    ZapiszTeren(uido);
	}
	UsunObiekt(id);
	ClearAnimations(playerid);
	//ApplyAnimation(playerid, "CARRY", "crry_prtial", 4, 0, 0, 0, 0, 0, 0);
	CancelEdit(playerid);
	DeletePVar(playerid,"idobiktu");
    DeletePVar(playerid,"inedit");
    TextDrawHideForPlayer(playerid, OBJ[playerid]);
	TextDrawHideForPlayer(playerid, OBJ[playerid]);
	return 1;
}

	
forward UsunObiekt(id);
public UsunObiekt(id)
{
    new sqls[100];
	format( sqls, sizeof( sqls ), "DELETE FROM `jochym_textury` WHERE `model` = %d", id );
	mysql_query( sqls );

	new sql[100];
	format( sql, sizeof( sql ), "DELETE FROM `jochym_obiekty` WHERE `ID` = %d", id );
	mysql_query( sql );

	if(ObiektInfo[id][objModel] == 2419)
	{
		ForeachEx(i, MAX_PRZEDMIOT)
		{
			if(PrzedmiotInfo[i][pOwner] == id && PrzedmiotInfo[i][pTypWlas] == TYP_CRAFT && PrzedmiotInfo[i][pUID] != 0)
			{
				UsunPrzedmiot(i);
			}
		}
	}
	DestroyDynamicObject(ObiektInfo[id][objSAMP]);
	if(ObiektInfo[id][objvWorld] != -1)
	{
		for(new i = 0; i < 2048; i++)
		{
			if(BudynekInfo[ObiektInfo[id][objvWorld]][nObiekty][i] == id)
			{
				for(new o = i, d; o < BudynekInfo[ObiektInfo[id][objvWorld]][nStworzoneObiekty]; o++)
				{
					d = o+1;
					BudynekInfo[ObiektInfo[id][objvWorld]][nObiekty][o] = BudynekInfo[ObiektInfo[id][objvWorld]][nObiekty][d];
				}
				break;
			}
		}
		BudynekInfo[ObiektInfo[id][objvWorld]][nStworzoneObiekty]--;
		if(ObiektInfo[id][objModel] != 364 && ObiektInfo[id][objModel] != 1958)
		{
			BudynekInfo[ObiektInfo[id][objvWorld]][nLiczbaMebli]++;
		}
		ZapiszNieruchomosc(ObiektInfo[id][objvWorld]);
	}
	ObiektInfo[id][objUID] = 0;
	ObiektInfo[id][objSAMP] = 0;
	ObiektInfo[id][objModel] = 0;
	ObiektInfo[id][objvWorld] = 0;
	ObiektInfo[id][objInterior] = 0;
	ObiektInfo[id][objPozX] = 0;
	ObiektInfo[id][objPozY] = 0;
	ObiektInfo[id][objPozZ] = 0;
	ObiektInfo[id][objPosX] = 0;
	ObiektInfo[id][objPosY] = 0;
	ObiektInfo[id][objPosZ] = 0;
	ObiektInfo[id][objBrama] = 0;
	ObiektInfo[id][objSprarowanyUID] = 0;
	ObiektInfo[id][objOwnerBrama] = 0;
	ObiektInfo[id][objTypOwneraBramy] = 0;
	ObiektInfo[id][objRotX] = 0;
	ObiektInfo[id][objRotY] = 0;
	ObiektInfo[id][objRotZ] = 0;
	ObiektInfo[id][objHP] = 0;
	ObiektInfo[id][objStworzyl] = 0;
	ObiektInfo[id][objKopia] = 0;
	for(new i = 0; i < 6; i++)
	{
		ObiektInfo[id][objPoker][i] = -1;
		ObiektInfo[id][gAktualniGracze][i] = -1;
	}
	UpdateDynamic3DTextLabelText(ObiektInfo[id][objNapis], 0xC2A2DAFF, " ");
	return 1;
}
CMD:kamerax( playerid, params[ ] )
{
	//printf("U¿yta komenda rz");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	new Float:model;
	if( sscanf( params, "f", model) )
		return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Wpisz: /kamerax [X]", "Zamknij", "");
	new myobject = GetPVarInt(playerid, "idobiktu");
	if(myobject == 0)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aktualnie nie edytujesz ¿adnego obiektu.", "Zamknij", "");
		return 0;
	}
	ObiektInfo[myobject][objPosX] = ObiektInfo[myobject][objPozX]+model;
	new find = GetPVarInt(playerid, "idobiktu");
	SetPVarInt(playerid, "Teleportacja", 1);
	SetPlayerCameraPos(playerid, ObiektInfo[find][objPozX], ObiektInfo[find][objPozY], ObiektInfo[find][objPozZ]);
	SetPlayerCameraLookAt(playerid, ObiektInfo[find][objPosX], ObiektInfo[find][objPosY], ObiektInfo[find][objPosZ]);
	return 1;
}
CMD:kameray( playerid, params[ ] )
{
	//printf("U¿yta komenda rz");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	/*if(DaneGracza[playerid][gEdytor] == 0)
	{
	    return 0;
	}*/
	new Float:model;
	if( sscanf( params, "f", model) )
		return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Wpisz: /kameray [Y]", "Zamknij", "");
	new myobject = GetPVarInt(playerid, "idobiktu");
	if(myobject == 0)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie masz uprawnieñ by edytowaæ obiekt na tym terenie!.", "Zamknij", "");
		return 0;
	}
	//new ids = SprawdzObiektUID(myobject);
	ObiektInfo[myobject][objPosY] = ObiektInfo[myobject][objPozY]+model;
	new find = GetPVarInt(playerid, "idobiktu");
	SetPVarInt(playerid, "Teleportacja", 1);
	SetPlayerCameraPos(playerid, ObiektInfo[find][objPozX], ObiektInfo[find][objPozY], ObiektInfo[find][objPozZ]);
	SetPlayerCameraLookAt(playerid, ObiektInfo[find][objPosX], ObiektInfo[find][objPosY], ObiektInfo[find][objPosZ]);
	return 1;
}
CMD:kameraz( playerid, params[ ] )
{
	//printf("U¿yta komenda rz");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	new Float:model;
	if( sscanf( params, "f", model) )
		return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Wpisz: /kameraz [Z]", "Zamknij", "");
	new myobject = GetPVarInt(playerid, "idobiktu");
	if(myobject == 0)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aktualnie nie edytujesz ¿adnego obiektu.", "Zamknij", "");
		return 0;
	}
	//new ids = SprawdzObiektUID(myobject);
	ObiektInfo[myobject][objPosZ] = ObiektInfo[myobject][objPozZ]+model;
	new find = GetPVarInt(playerid, "idobiktu");
	SetPVarInt(playerid, "Teleportacja", 1);
	SetPlayerCameraPos(playerid, ObiektInfo[find][objPozX], ObiektInfo[find][objPozY], ObiektInfo[find][objPozZ]);
	SetPlayerCameraLookAt(playerid, ObiektInfo[find][objPosX], ObiektInfo[find][objPosY], ObiektInfo[find][objPosZ]);
	return 1;
}
CMD:pz( playerid, params[ ] )
{
	//printf("U¿yta komenda rz");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	new Float:model;
	if( sscanf( params, "f", model) )
		return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby przesun¹æ obiekt w osi Z wpisz: /pz [ilosc]", "Zamknij", "");
	new myobject = GetPVarInt(playerid, "idobiktu");
	if(myobject == 0)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aktualnie nie edytujesz ¿adnego obiektu.", "Zamknij", "");
		return 0;
	}
	edycjaobiektow[playerid] = 1;
	ObiektInfo[myobject][objPozZ] += model;
	SetDynamicObjectPos(ObiektInfo[myobject][objSAMP], ObiektInfo[myobject][objPozX],ObiektInfo[myobject][objPozY], ObiektInfo[myobject][objPozZ]);
	ZapiszObiekt(myobject);
	edycjaobiektow[playerid] = 0;
	return 1;
}
CMD:py( playerid, params[ ] )
{
	//printf("U¿yta komenda rz");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	new Float:model;
	if( sscanf( params, "f", model) )
		return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby przesun¹æ obiekt w osi Y wpisz: /py [ilosc]", "Zamknij", "");
	new myobject = GetPVarInt(playerid, "idobiktu");
	if(myobject == 0)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aktualnie nie edytujesz ¿adnego obiektu.", "Zamknij", "");
		return 0;
	}
	edycjaobiektow[playerid] = 1;
	ObiektInfo[myobject][objPozY] += model;
	SetDynamicObjectPos(ObiektInfo[myobject][objSAMP], ObiektInfo[myobject][objPozX],ObiektInfo[myobject][objPozY], ObiektInfo[myobject][objPozZ]);
	ZapiszObiekt(myobject);
	edycjaobiektow[playerid] = 0;
	return 1;
}
CMD:px( playerid, params[ ] )
{
	//printf("U¿yta komenda rz");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	new Float:model;
	if( sscanf( params, "f", model) )
		return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby przesun¹æ obiekt w osi X wpisz: /px [ilosc]", "Zamknij", "");
	new myobject = GetPVarInt(playerid, "idobiktu");
	if(myobject == 0)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aktualnie nie edytujesz ¿adnego obiektu.", "Zamknij", "");
		return 0;
	}
	edycjaobiektow[playerid] = 1;
	ObiektInfo[myobject][objPozX] += model;
	SetDynamicObjectPos(ObiektInfo[myobject][objSAMP], ObiektInfo[myobject][objPozX],ObiektInfo[myobject][objPozY], ObiektInfo[myobject][objPozZ]);
	ZapiszObiekt(myobject);
	edycjaobiektow[playerid] = 0;
	return 1;
}
CMD:rx(playerid, params[])
{
    new myobject = GetPVarInt(playerid, "idobiktu");
	if(myobject == 0)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aktualnie nie edytujesz ¿adnego obiektu.", "Zamknij", "");
		return 0;
	}
    new Float:rzs;
    if( sscanf(params, "f", rzs) ) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby obróciæ obiekt w osi Z wpisz: /rx [rotacja]", "Zamknij", "");
    if(DaneGracza[playerid][gEdytor] == 1)
    {
        ObiektInfo[myobject][objRotX] += rzs;
		SetDynamicObjectRot(ObiektInfo[myobject][objSAMP],ObiektInfo[myobject][objRotX],ObiektInfo[myobject][objRotY],ObiektInfo[myobject][objRotZ]);
		ZapiszObiekt(myobject);
        return 1;
    }
    if(DaneGracza[playerid][gEdytor] == 0)
    {
        ObiektInfo[myobject][objRotX] += rzs;
		SetDynamicObjectRot(ObiektInfo[myobject][objSAMP],ObiektInfo[myobject][objRotX],ObiektInfo[myobject][objRotY],ObiektInfo[myobject][objRotZ]);
		OnPlayerEditDynamicObject(playerid, ObiektInfo[myobject][objSAMP], EDIT_RESPONSE_UPDATE, ObiektInfo[myobject][objPozX], ObiektInfo[myobject][objPozY], ObiektInfo[myobject][objPozZ], ObiektInfo[myobject][objRotX], ObiektInfo[myobject][objRotY], ObiektInfo[myobject][objRotZ]);
		EditDynamicObject(playerid, ObiektInfo[myobject][objSAMP]);
	}
    return 1;
}
CMD:ry(playerid, params[])
{
    new myobject = GetPVarInt(playerid, "idobiktu");
	if(myobject == 0)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aktualnie nie edytujesz ¿adnego obiektu.", "Zamknij", "");
		return 0;
	}
    new Float:rzs;
    if( sscanf(params, "f", rzs) ) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby obróciæ obiekt w osi Z wpisz: /ry [rotacja]", "Zamknij", "");
    if(DaneGracza[playerid][gEdytor] == 1)
    {
        ObiektInfo[myobject][objRotY] += rzs;
		SetDynamicObjectRot(ObiektInfo[myobject][objSAMP],ObiektInfo[myobject][objRotX],ObiektInfo[myobject][objRotY],ObiektInfo[myobject][objRotZ]);
		ZapiszObiekt(myobject);
        return 1;
    }
    if(DaneGracza[playerid][gEdytor] == 0)
    {
        ObiektInfo[myobject][objRotY] += rzs;
		SetDynamicObjectRot(ObiektInfo[myobject][objSAMP],ObiektInfo[myobject][objRotX],ObiektInfo[myobject][objRotY],ObiektInfo[myobject][objRotZ]);
		OnPlayerEditDynamicObject(playerid, ObiektInfo[myobject][objSAMP], EDIT_RESPONSE_UPDATE, ObiektInfo[myobject][objPozX], ObiektInfo[myobject][objPozY], ObiektInfo[myobject][objPozZ], ObiektInfo[myobject][objRotX], ObiektInfo[myobject][objRotY], ObiektInfo[myobject][objRotZ]);
		EditDynamicObject(playerid, ObiektInfo[myobject][objSAMP]);
	}
    return 1;
}
CMD:rz(playerid, params[])
{
    new myobject = GetPVarInt(playerid, "idobiktu");
	if(myobject == 0)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aktualnie nie edytujesz ¿adnego obiektu.", "Zamknij", "");
		return 0;
	}
    new Float:rzs;
    if( sscanf(params, "f", rzs) ) return dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aby obróciæ obiekt w osi Z wpisz: /rz [rotacja]", "Zamknij", "");
    if(DaneGracza[playerid][gEdytor] == 1)
    {
        ObiektInfo[myobject][objRotZ] += rzs;
		SetDynamicObjectRot(ObiektInfo[myobject][objSAMP],ObiektInfo[myobject][objRotX],ObiektInfo[myobject][objRotY],ObiektInfo[myobject][objRotZ]);
		ZapiszObiekt(myobject);
        return 1;
    }
    if(DaneGracza[playerid][gEdytor] == 0)
    {
        ObiektInfo[myobject][objRotZ] += rzs;
		SetDynamicObjectRot(ObiektInfo[myobject][objSAMP],ObiektInfo[myobject][objRotX],ObiektInfo[myobject][objRotY],ObiektInfo[myobject][objRotZ]);
		OnPlayerEditDynamicObject(playerid, ObiektInfo[myobject][objSAMP], EDIT_RESPONSE_UPDATE, ObiektInfo[myobject][objPozX], ObiektInfo[myobject][objPozY], ObiektInfo[myobject][objPozZ], ObiektInfo[myobject][objRotX], ObiektInfo[myobject][objRotY], ObiektInfo[myobject][objRotZ]);
		EditDynamicObject(playerid, ObiektInfo[myobject][objSAMP]);
	}
    return 1;
}
CMD:kamera(playerid, params[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
 	if(SpecUruchomiony[playerid])
	{
        SetCameraBehindPlayer(playerid);
	    SpecUruchomiony[playerid] = 0;
	    TextDrawHideForPlayer(playerid, OBJ[playerid]);
	    return 1;
	}
 	if(PrzyObiekcie(playerid, 2606, 3) != 0)
	{
		if(SpecUruchomiony[playerid])
		{
	        SetCameraBehindPlayer(playerid);
		    SpecUruchomiony[playerid] = 0;
		    TextDrawHideForPlayer(playerid, OBJ[playerid]);
		    return 1;
		}
		else
		{
			new item_list[64], items_list[1024], find;
			format(items_list, sizeof(items_list), "%s\nUID",items_list);
			ForeachEx(i, MAX_OBIEKT)
			{
			    new modelkamery = ObiektInfo[i][objModel];
				if(GetPlayerVirtualWorld(playerid) == ObiektInfo[i][objvWorld] && modelkamery == 1622 || GetPlayerVirtualWorld(playerid) == ObiektInfo[i][objvWorld] && modelkamery == 1616 || GetPlayerVirtualWorld(playerid) == ObiektInfo[i][objvWorld] && modelkamery == 1886)
				{
					format(item_list, sizeof(item_list), "%d", ObiektInfo[i][objUID]);
					format(items_list, sizeof(items_list), "%s\n%s", items_list, item_list);
					find++;
		  		}
			}
			if(find != 0)
			{
				dShowPlayerDialog(playerid, DIALOG_KAMERA, DIALOG_STYLE_LIST, "• Kamery:", items_list, "Obserwuj", "Zamknij");
			}
			return 1;
		}
	}
	else
 	{
 	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie jesteœ przy monitoringu (Obiekt: 2606)", "Zamknij", "");
		return 1;
	}
}
CMD:brama(playerid, params[])
{
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
    new find = 0;
	new Float:radius = 0.5;
	for(new i = 0; i < 100; i++)
	{
		if(find == 0)
		{
			ForeachEx(h, MAX_OBIEKT)
			{
				if(Dystans(radius, playerid, ObiektInfo[h][objPozX],ObiektInfo[h][objPozY],ObiektInfo[h][objPozZ]) && GetPlayerVirtualWorld(playerid) == ObiektInfo[h][objvWorld] && ObiektInfo[h][objBrama] != 0 || Dystans(radius, playerid, ObiektInfo[h][objPozX],ObiektInfo[h][objPozY],ObiektInfo[h][objPozZ]) && GetPlayerVirtualWorld(playerid) == 0 && ObiektInfo[h][objvWorld] == -1 && ObiektInfo[h][objBrama] != 0)
				{
					find = h;
					break;
				}
			}
			radius+=0.5;
		}
	}
	if(!OtwieranieBramV2(playerid, find))
	{
		GameTextForPlayer(playerid, "~r~Brak uprawnien.", 3000, 5);
		return 0;
	}
	if(find == 0)
	{
		GameTextForPlayer(playerid, "~r~W pobli¿u nie ma bramy.", 3000, 5);
	    return 0;
	}
	new findt = ObiektInfo[find][objSprarowanyUID];
	if(findt != 0)
	{
		BramaRuch(playerid, find, findt);
	}else{
		BramaRuch(playerid, find, -1);
	}
	return 1;
}
stock BramaRuch(playerid, uid, uid2)
{
	if(ObiektInfo[uid][objBrama] == 1)
	{
		if(ObiektInfo[uid][objOtw] == 0)
		{
			MoveDynamicObject(ObiektInfo[uid][objSAMP],ObiektInfo[uid][objPosX], ObiektInfo[uid][objPosY], ObiektInfo[uid][objPosZ], 2);
			SetDynamicObjectRot(ObiektInfo[uid][objSAMP], ObiektInfo[uid][objRotX], ObiektInfo[uid][objRotY], ObiektInfo [uid][objRotZ]);
			if(uid2 != -1)
			{
				MoveDynamicObject(ObiektInfo[uid2][objSAMP],ObiektInfo[uid2][objPosX], ObiektInfo[uid2][objPosY], ObiektInfo[uid2][objPosZ], 2);
				SetDynamicObjectRot(ObiektInfo[uid2][objSAMP], ObiektInfo[uid2][objRotX], ObiektInfo[uid2][objRotY], ObiektInfo [uid2][objRotZ]);
				ObiektInfo[uid2][objOtw] = 1;
			}
			GameTextForPlayer(playerid, "~g~Brama: ~w~otwarta", 3000, 6);
			ObiektInfo[uid][objOtw] = 1;
		}
		else
		{
			MoveDynamicObject(ObiektInfo[uid][objSAMP],ObiektInfo[uid][objPozX], ObiektInfo[uid][objPozY], ObiektInfo[uid][objPozZ], 2);
			SetDynamicObjectRot(ObiektInfo[uid][objSAMP], ObiektInfo[uid][objRotX], ObiektInfo[uid][objRotY], ObiektInfo [uid][objRotZ]);
			if(uid2 != -1)
			{
				MoveDynamicObject(ObiektInfo[uid2][objSAMP],ObiektInfo[uid2][objPozX], ObiektInfo[uid2][objPozY], ObiektInfo[uid2][objPozZ], 2);
				SetDynamicObjectRot(ObiektInfo[uid2][objSAMP], ObiektInfo[uid2][objRotX], ObiektInfo[uid2][objRotY], ObiektInfo[uid2][objRotZ]);
				ObiektInfo[uid2][objOtw] = 0;
			}
			GameTextForPlayer(playerid, "~r~Brama: ~w~zamknieta", 3000, 6);
			ObiektInfo[uid][objOtw] = 0;
		}
	}
	if(ObiektInfo[uid][objBrama] == 2)
	{
		if(ObiektInfo[uid][objOtw] == 0)
		{
            SetDynamicObjectRot(ObiektInfo[uid][objSAMP], ObiektInfo[uid][objPosX], ObiektInfo[uid][objPosY], ObiektInfo[uid][objPosZ]);
			MoveDynamicObject(ObiektInfo[uid][objSAMP], ObiektInfo[uid][objPozX], ObiektInfo[uid][objPozY], ObiektInfo[uid][objPozZ], 0.01, ObiektInfo[uid][objPosX], ObiektInfo[uid][objPosY], ObiektInfo[uid][objPosZ]);
			GameTextForPlayer(playerid, "~g~Brama: ~w~otwarta", 3000, 6);
			ObiektInfo[uid][objOtw] = 1;
		}
		else
		{
		    SetDynamicObjectRot(ObiektInfo[uid][objSAMP], ObiektInfo[uid][objRotX], ObiektInfo[uid][objRotY], ObiektInfo [uid][objRotZ]);
			MoveDynamicObject(ObiektInfo[uid][objSAMP],ObiektInfo[uid][objPozX], ObiektInfo[uid][objPozY], ObiektInfo[uid][objPozZ], 0.01, ObiektInfo[uid][objRotX], ObiektInfo[uid][objRotY], ObiektInfo[uid][objRotZ]);
			if(uid2 != -1)
			{
			    SetDynamicObjectRot(ObiektInfo[uid2][objSAMP], ObiektInfo[uid2][objRotX], ObiektInfo[uid2][objRotY], ObiektInfo [uid2][objRotZ]);
				MoveDynamicObject(ObiektInfo[uid2][objSAMP],ObiektInfo[uid2][objPozX], ObiektInfo[uid2][objPozY], ObiektInfo[uid2][objPozZ], 0.01, ObiektInfo[uid][objRotX], ObiektInfo[uid][objRotY], ObiektInfo[uid][objRotZ]);
				ObiektInfo[uid2][objOtw] = 0;
			}
			GameTextForPlayer(playerid, "~r~Brama: ~w~zamknieta", 3000, 6);
			ObiektInfo[uid][objOtw] = 0;
		}
	}
    return true;
}
CMD:amgate( playerid, params[ ] )
{
	//printf("U¿yta komenda amgate");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
    if(ZarzadzanieMAPObiektamiVW0(playerid))
	{
		new myobject = GetPVarInt(playerid, "idobiktu");
		if(myobject == 0)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aktualnie nie edytujesz ¿adnego obiektu.", "Zamknij", "");
			return 0;
		}
		new typ, Float:x, Float:y, Float:z, model, typ_ownera, owner;
		if( sscanf( params, "dfffddd",typ ,x, y, z, model, typ_ownera, owner ) )
			return dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:","Aby ustawiæ obiekt jako ruchom¹ brame wpisz: /amgate [0-2,  0-off, 1-on] [POZX] [POZY] [POZZ] [SPAROWANY OBIEKT] [TYP OWNERA] [OWNER]\n- jeœli obiekt ma byæ niespraowany wpisz w te pole 0", "Zamknij", "" );
		if(typ != 1 && typ !=0 && typ != 0)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Podany typ jest niepoprawny.", "Zamknij", "");
			return 0;
		}
		if(ObiektInfo[model][objvWorld] != GetPlayerVirtualWorld(playerid) && model != 0)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Parametr sparowanego obiektu jest niepoprawny.", "Zamknij", "");
			return 0;
		}
		ObiektInfo[myobject][objBrama] = typ;
		if(typ == 1)
		{
			ObiektInfo[myobject][objPosX] = ObiektInfo[myobject][objPozX] + x;
			ObiektInfo[myobject][objPosY] = ObiektInfo[myobject][objPozY] + y;
			ObiektInfo[myobject][objPosZ] = ObiektInfo[myobject][objPozZ] + z;
		}
		else if(typ == 2)
		{
			ObiektInfo[myobject][objPosX] = ObiektInfo[myobject][objRotX] + x;
			ObiektInfo[myobject][objPosY] = ObiektInfo[myobject][objRotY] + y;
			ObiektInfo[myobject][objPosZ] = ObiektInfo[myobject][objRotZ] + z;
		}
		ObiektInfo[myobject][objSprarowanyUID] = model;
		new vww = GetPlayerVirtualWorld(playerid);
		if(BudynekInfo[vww][nWlascicielP] == 0 && BudynekInfo[vww][nWlascicielD] != 0)
		{
			ObiektInfo[myobject][objTypOwneraBramy] = typ_ownera;
			ObiektInfo[myobject][objOwnerBrama] = owner;
		}
		else
		{
			ObiektInfo[myobject][objTypOwneraBramy] = typ_ownera;
			ObiektInfo[myobject][objOwnerBrama] = owner;
		}
		if(model != 0)
		{
			ObiektInfo[model][objSprarowanyUID] = myobject;
		}
		ZapiszObiekt(myobject);
		ZapiszObiekt(model);
	}
	return 1;
}
CMD:mowner(playerid, params[])
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	new myobject = GetPVarInt(playerid, "idobiktu");
	if(myobject == 0)
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aktualnie nie edytujesz ¿adnego obiektu.", "Zamknij", "");
	    return 0;
	}
	if(ObiektInfo[myobject][objBrama] != 0)
	{
		new typ, owner;
		if(sscanf(params, "dd",typ ,owner))
		    return dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:","Aby ustawiæ ownera obiektu wpisz: : /mowner [TYP: 1 - Gracz, 2 - Grupa, 3 - Dla wszystkich] [UID Gracza/UID Grupy]", "Zamknij", "" );
	    if(typ != 1 && typ !=2 && typ != 3)
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Podany typ jest niepoprawny.", "Zamknij", "");
		    return 0;
		}
		ObiektInfo[myobject][objTypOwneraBramy] = typ;
		ObiektInfo[myobject][objOwnerBrama] = owner;
		ZapiszObiekt(myobject);
		return 1;
	}
	else
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Obiekt musi byæ bram¹ by zmieniæ jego ownera.", "Zamknij", "");
	    return 0;
	}
}
CMD:mgate( playerid, params[ ] )
{
	//printf("U¿yta komenda mgate");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	new myobject = GetPVarInt(playerid, "idobiktu");
	if(myobject == 0)
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Aktualnie nie edytujesz ¿adnego obiektu.", "Zamknij", "");
	    return 0;
	}
	new typ, Float:x, Float:y, Float:z, model;
	if( sscanf( params, "dfffd",typ ,x, y, z, model ) )
	    return dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:","Aby ustawiæ obiekt jako ruchom¹ brame wpisz: : /mgate [0-2,  0-off, 1 - pozycja 2 - rotacja] [POZX] [POZY] [POZZ] [SPAROWANY OBIEKT]\n- jeœli obiekt ma byæ niespraowany wpisz w te pole 0", "Zamknij", "" );
    if(typ != 1 && typ !=0 && typ != 2)
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Podany typ jest niepoprawny.", "Zamknij", "");
	    return 0;
	}
	if(ObiektInfo[model][objvWorld] != GetPlayerVirtualWorld(playerid) && model != 0)
	{
	    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Parametr sparowanego obiektu jest niepoprawny.", "Zamknij", "");
	    return 0;
	}
    ObiektInfo[myobject][objBrama] = typ;
    if(typ == 1)
	{
		ObiektInfo[myobject][objPosX] = ObiektInfo[myobject][objPozX] + x;
		ObiektInfo[myobject][objPosY] = ObiektInfo[myobject][objPozY] + y;
		ObiektInfo[myobject][objPosZ] = ObiektInfo[myobject][objPozZ] + z;
	}
	else if(typ == 2)
	{
		ObiektInfo[myobject][objPosX] = ObiektInfo[myobject][objRotX] + x;
		ObiektInfo[myobject][objPosY] = ObiektInfo[myobject][objRotY] + y;
		ObiektInfo[myobject][objPosZ] = ObiektInfo[myobject][objRotZ] + z;
	}
	ObiektInfo[myobject][objSprarowanyUID] = model;
	new vww = GetPlayerVirtualWorld(playerid);
	if(vww != 0)
	{
		if(BudynekInfo[vww][nWlascicielP] == 0 && BudynekInfo[vww][nWlascicielD] != 0)
		{
			if(model != 0)
			{
				ObiektInfo[model][objSprarowanyUID] = myobject;
				ObiektInfo[model][objTypOwneraBramy] = BRAMA_DZIALALNOSC;
				ObiektInfo[model][objOwnerBrama] = BudynekInfo[vww][nWlascicielD];
			}
			ObiektInfo[myobject][objTypOwneraBramy] = BRAMA_DZIALALNOSC;
			ObiektInfo[myobject][objOwnerBrama] = BudynekInfo[vww][nWlascicielD];
		}
		else
		{
		    
			if(model != 0)
			{
				ObiektInfo[model][objSprarowanyUID] = myobject;
				ObiektInfo[model][objTypOwneraBramy] = BRAMA_OWNER;
				ObiektInfo[model][objOwnerBrama] = BudynekInfo[vww][nWlascicielP];
			}
			ObiektInfo[myobject][objTypOwneraBramy] = BRAMA_OWNER;
			ObiektInfo[myobject][objOwnerBrama] = BudynekInfo[vww][nWlascicielP];
		}
	}
	else
	{
        if(DaneGracza[playerid][gSluzba] != 0)
        {
            if(model != 0)
			{
				ObiektInfo[model][objSprarowanyUID] = myobject;
				ObiektInfo[model][objTypOwneraBramy] = BRAMA_DZIALALNOSC;
				ObiektInfo[model][objOwnerBrama] = DaneGracza[playerid][gSluzba];
			}
			ObiektInfo[myobject][objTypOwneraBramy] = BRAMA_DZIALALNOSC;
			ObiektInfo[myobject][objOwnerBrama] = DaneGracza[playerid][gSluzba];
        }
        else
        {
            if(model != 0)
			{
				ObiektInfo[model][objSprarowanyUID] = myobject;
				ObiektInfo[model][objTypOwneraBramy] = BRAMA_OWNER;
				ObiektInfo[model][objOwnerBrama] = DaneGracza[playerid][gUID];
			}
			ObiektInfo[myobject][objTypOwneraBramy] = BRAMA_OWNER;
			ObiektInfo[myobject][objOwnerBrama] = DaneGracza[playerid][gUID];
		}
	}
	ZapiszObiekt(myobject);
	ZapiszObiekt(model);
	return 1;
}
CMD:edytor(playerid, cmdtext[])
{
	//printf("U¿yta komenda edytor");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	if(GetPlayerVirtualWorld(playerid) != 0 || ZarzadzanieMAPObiektamiVW0(playerid))
	{
	    if(GetPVarInt(playerid, "idobiktu") != 0 || GetPVarInt(playerid, "inedit") != 0)
		{
			new uids = GetPVarInt(playerid, "inedit");
			ZapiszObiekt(uids);
			CancelEdit(playerid);
			OnPlayerText(playerid, "-stopani");
			obiektinedit[uids] = false;
			DeletePVar(playerid,"idobiktu");
			DeletePVar(playerid,"inedit");
			TextDrawHideForPlayer(playerid, OBJ[playerid]);
			Edytors[playerid] = 0;
		}
 		dShowPlayerDialog( playerid, DIALOG_EDYTOR, DIALOG_STYLE_MSGBOX, "• TIP:","W tym oknie wybierz swój edytor, którym chcesz siê pos³ugiwaæ\n podczas tworzenia obiektów lub edytowania bêdziesz siê nim pos³ugiwaæ.", "MTA", "SAMP" );
	}
	return 1;
}
forward SprawdzObiektUID(carid);
public SprawdzObiektUID(carid)
{
	for(new i = 1;i < MAX_OBIEKT; i++)
		if(ObiektInfo[i][objSAMP] == carid)
			return i;
	return 1;
}
forward ZaladujObiekty();
public ZaladujObiekty()
{
	new sql[ 2048 ], id = false;
	mysql_query( "SELECT * FROM `jochym_obiekty`" );
	mysql_store_result( );
	while( mysql_fetch_row( sql ) )
	{
	    sscanf( sql, "p<|>i", id );
	    sscanf( sql, "p<|>iiiifffffffffddddddddddd",
	    ObiektInfo[ id ][ objUID ],
	    ObiektInfo[ id ][ objModel ],
	    ObiektInfo[ id ][ objvWorld ],
	    ObiektInfo[ id ][ objInterior ],
	    ObiektInfo[ id ][ objPozX ],
	    ObiektInfo[ id ][ objPozY ],
	    ObiektInfo[ id ][ objPozZ ],
	    ObiektInfo[ id ][ objRotX ],
	    ObiektInfo[ id ][ objRotY ],
	    ObiektInfo[ id ][ objRotZ ],
	    ObiektInfo[id][objPosX],
		ObiektInfo[id][objPosY],
		ObiektInfo[id][objPosZ],
		ObiektInfo[id][objBrama],
		ObiektInfo[id][objSprarowanyUID],
		ObiektInfo[id][objWlacznik],
		ObiektInfo[id][objWartosc],
		ObiektInfo[id][objOwnerBrama],
		ObiektInfo[id][objTypOwneraBramy],
		ObiektInfo[id][objTekstura],
		ObiektInfo[id][objOwnerDz],
		ObiektInfo[id][objHP],
		ObiektInfo[id][objStworzyl],
		ObiektInfo[id][objKopia]
	    );
		for(new i = 0; i < 2048; i++)
		{
			if(BudynekInfo[ObiektInfo[id][objvWorld]][nObiekty][i] == 0)
		    {
				BudynekInfo[ObiektInfo[id][objvWorld]][nObiekty][i] = ObiektInfo[id][objUID];
				break;
			}
		}
		BudynekInfo[ObiektInfo[id][objvWorld]][nStworzoneObiekty] += 1;
		for(new i = 0; i < 6; i++)
		{
			ObiektInfo[id][objPoker][i] = -1;
			ObiektInfo[id][gAktualniGracze][i] = -1;
			ObiektInfo[0][objPoker][i] = -1;
			ObiektInfo[0][gAktualniGracze][i] = -1;
		}
		ObiektInfo[id][gPokerObj] = EOS;
		ObiektInfo[id][objPokerDiler] = 0;
		ObiektInfo[id][gRundaPoker] = 0;
		if(ObiektInfo[ id ][ objvWorld ] == 0)
		{
			ObiektInfo[id][objvWorld] = -1;
		}
	    ObiektInfo[ id ][ objSAMP ] = CreateDynamicObject( ObiektInfo[ id ][ objModel ], ObiektInfo[ id ][ objPozX ],
	    ObiektInfo[ id ][ objPozY ], ObiektInfo[ id ][ objPozZ ], ObiektInfo[ id ][ objRotX ], ObiektInfo[ id ][ objRotY ],
	    ObiektInfo[ id ][ objRotZ ], ObiektInfo[ id ][ objvWorld ], ObiektInfo[ id ][ objInterior ] );
	    ObiektInfo[id][objOtw] = 0;
	    obiektinedit[id] = false;
		ObiektInfo[id][gPokerKarty][0] = EOS;
		ObiektInfo[id][gZajety] = 0;
		ObiektInfo[id][objNapis] = CreateDynamic3DTextLabel(" ", 0xC2A2DAFF, ObiektInfo[id][objPozX], ObiektInfo[id][objPozY], ObiektInfo[id][objPozZ], 5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0, ObiektInfo[id][objvWorld]);
		if((ObiektInfo[id][objModel] == 1776 || ObiektInfo[id][objModel] == 19526) && ObiektInfo[id][objvWorld] > 0)
		{
		    UpdateDynamic3DTextLabelText(ObiektInfo[id][objNapis], 0xf5deb355, "Kliknij klawisz 'Y' aby skorzystaæ z automatu");
		}
	}
	mysql_free_result( );
	printf("Obiekty   - %d", id);
	return 1;
}
forward ZapiszObiekt(id);
public ZapiszObiekt(id)
{
	strdel(zapyt, 0, 1024);
	format(zapyt, sizeof(zapyt), "UPDATE `jochym_obiekty` SET `pozX` = '%f', `pozY` = '%f', `pozZ` = '%f', `rotX` = '%f', `rotY` = '%f', `rotZ` = '%f',`posX` = '%f', `posY` = '%f', `posZ` = '%f', `brama` = '%d', `sparowany` = '%d', `WLACZNIK` = '%d', `WARTOSC` = '%d', `objOwnerBrama` = '%d', `objTypOwneraBramy` = '%d', `objTekstura` = '%d', `objOwner` = '%d', `HP` = '%d', `Kopia` = '%d' WHERE `ID` = %d",
	ObiektInfo[id][objPozX],
	ObiektInfo[id][objPozY],
	ObiektInfo[id][objPozZ],
	ObiektInfo[id][objRotX],
	ObiektInfo[id][objRotY],
	ObiektInfo[id][objRotZ],
	ObiektInfo[id][objPosX],
	ObiektInfo[id][objPosY],
	ObiektInfo[id][objPosZ],
	ObiektInfo[id][objBrama],
	ObiektInfo[id][objSprarowanyUID],
	ObiektInfo[id][objWlacznik],
	ObiektInfo[id][objWartosc],
	ObiektInfo[id][objOwnerBrama],
	ObiektInfo[id][objTypOwneraBramy],
	ObiektInfo[id][objTekstura],
	ObiektInfo[id][objOwnerDz],
	ObiektInfo[id][objHP],
	ObiektInfo[id][objKopia],
	id);
	UpdateDynamic3DTextLabelText(ObiektInfo[id][objNapis], 0xC2A2DAFF, " ");
	ObiektInfo[id][objNapis] = CreateDynamic3DTextLabel(" ", 0xC2A2DAFF, ObiektInfo[id][objPozX], ObiektInfo[id][objPozY], ObiektInfo[id][objPozZ], 5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0, ObiektInfo[id][objvWorld]);
	if((ObiektInfo[id][objModel] == 1776 || ObiektInfo[id][objModel] == 19526) && ObiektInfo[id][objvWorld] > 0)
	{
	    UpdateDynamic3DTextLabelText(ObiektInfo[id][objNapis], 0xf5deb355, "Kliknij klawisz 'Y' aby skorzystaæ z automatu");
	}
	mysql_query(zapyt);
	return 1;
}
forward DodajObiekt(model, Float:x, Float:y, Float:z, Float:rotx, Float:roty, Float:rotz, vw, interior, playid);
public DodajObiekt(model, Float:x, Float:y, Float:z, Float:rotx, Float:roty, Float:rotz, vw, interior, playid)
{
	if(BudynekInfo[vw][nLiczbaMebli] == 0 && vw != 0 && model != 1958)
	{
	    dShowPlayerDialog( playid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:","Ten budynek nie ma wystarczaj¹cej iloœci obiektów.", "Zamknij", "" );
        ClearAnimations(playid);
		return 0;
	}else{
		new id = GetFreeSQLUID("jochym_obiekty", "ID");
		if(id == 0 || id == 1)
		{
			id = GetFreeSQLUID("jochym_obiekty", "ID");
		}
		format( zapyt, sizeof( zapyt ), "INSERT INTO `jochym_obiekty` (`ID`,`model`, `vw`, `interior`, `pozX`, `pozY`, `pozZ`, \
		`rotX`, `rotY`, `rotZ`, `HP`, `Stworzyl`) VALUES (%d, %d, %d, %d, %f, %f, %f, %f, %f, %f, 100, %d)",
		 id, model, vw, interior, x, y, z, rotx, roty, rotz, DaneGracza[playid][gUID]);
		mysql_query(zapyt);
		//id = mysql_insert_id();
		ObiektInfo[id][objUID] = id;
		ObiektInfo[id][objModel] = model;
		ObiektInfo[id][objvWorld] = vw;
		ObiektInfo[id][objInterior] = interior;
		ObiektInfo[id][objPozX] = x;
		ObiektInfo[id][objPozY] = y;
		ObiektInfo[id][objPozZ] = z;
		ObiektInfo[id][objPosX] = 0;
		ObiektInfo[id][objPosY] = 0;
		ObiektInfo[id][objPosZ] = 0;
		ObiektInfo[id][objBrama] = 0;
		ObiektInfo[id][objSprarowanyUID] = 0;
		ObiektInfo[id][objOwnerBrama] = 0;
		ObiektInfo[id][objTypOwneraBramy] = 0;
		ObiektInfo[id][objTekstura] = 0;
		ObiektInfo[id][objWlacznik] = 0;
		ObiektInfo[id][objWartosc] = 0;
		ObiektInfo[id][objRotX] = rotx;
		ObiektInfo[id][objRotY] = roty;
		ObiektInfo[id][objRotZ] = rotz;
		ObiektInfo[id][objHP] = 100;
		ObiektInfo[id][objStworzyl] = DaneGracza[playid][gUID];
		ObiektInfo[id][objKopia] = 0;
		ObiektInfo[id][objSAMP] = CreateDynamicObject(ObiektInfo[id][objModel], ObiektInfo[id][objPozX],
		ObiektInfo[id][objPozY], ObiektInfo[id][objPozZ], ObiektInfo[id][objRotX], ObiektInfo[id][objRotY],
		ObiektInfo[id][objRotZ], ObiektInfo[id][objvWorld], ObiektInfo[id][objInterior]);
		ObiektInfo[id][gPokerKarty][0] = EOS;
		for(new i = 0; i < 2048; i++)
		{
			if(BudynekInfo[ObiektInfo[id][objvWorld]][nObiekty][i] == 0)
		    {
				BudynekInfo[ObiektInfo[id][objvWorld]][nObiekty][i] = id;
				break;
		    }
		}
		for(new i = 0; i < 6; i++)
		{
			ObiektInfo[id][objPoker][i] = -1;
			ObiektInfo[id][gAktualniGracze][i] = -1;
			ObiektInfo[0][objPoker][i] = -1;
			ObiektInfo[0][gAktualniGracze][i] = -1;
		}
		ObiektInfo[id][gPokerObj] = EOS;
		ObiektInfo[id][objPokerDiler] = 0;
		ObiektInfo[id][gRundaPoker] = 0;
		obiektinedit[id] = true;
		BudynekInfo[vw][nStworzoneObiekty]++;
		if(ObiektInfo[id][objModel] != 1958 && ObiektInfo[id][objModel] != 364)
		{
			BudynekInfo[vw][nLiczbaMebli]--;
		}
		ObiektInfo[id][objNapis] = CreateDynamic3DTextLabel(" ", 0xC2A2DAFF, ObiektInfo[id][objPozX], ObiektInfo[id][objPozY], ObiektInfo[id][objPozZ], 5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0, ObiektInfo[id][objvWorld]);
		if((ObiektInfo[id][objModel] == 1776 || ObiektInfo[id][objModel] == 19526) && ObiektInfo[id][objvWorld] > 0)
		{
		    UpdateDynamic3DTextLabelText(ObiektInfo[id][objNapis], 0xf5deb355, "Kliknij klawisz 'Y' aby skorzystaæ z automatu");
		}
		ZapiszNieruchomosc(vw);
		SetPVarInt(playid, "inedit", id);
		return id;
	}
}
//funkcja strza³ek
public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
    if( !IsValidDynamicObject(objectid) ) return 1;

    new id = SprawdzObiektUID(objectid);
	if(ObiektInfo[id][objStworzyl] != DaneGracza[playerid][gUID] && GetPlayerVirtualWorld(playerid) == 0 && DaneGracza[playerid][gAdmGroup] == 8 && DaneGracza[playerid][gAdmLVL] >= 5 && DaneGracza[playerid][gBudowanie] == 0)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie zosta³ stworzony przez Ciebie!", "Zamknij", "");
		return 0;
	}
	if(ObiektInfo[id][objvWorld] != GetPlayerVirtualWorld(playerid) && GetPlayerVirtualWorld(playerid) != 0)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie nale¿y do Twojego budynku!", "Zamknij", "");
		return 0;
	}
    SetPVarInt(playerid, "inedit", id);
	obiektinedit[id] = true;
	SetPVarInt(playerid, "idobiktu", id);

    if( response == EDIT_RESPONSE_FINAL || response == EDIT_RESPONSE_CANCEL )
    {
        SetDynamicObjectPos(objectid, x, y, z);
        SetDynamicObjectRot(objectid, rx, ry, rz);
		ZapiszObiekt(id);
        obiektinedit[id] = false;
        DeletePVar(playerid,"idobiktu");
        DeletePVar(playerid,"inedit");
        TextDrawHideForPlayer(playerid, OBJ[playerid]);
        Edytors[playerid] = 0;
    }
    else if( response == EDIT_RESPONSE_UPDATE )
    {
        ObiektInfo[id][objPozX] = x;
        ObiektInfo[id][objPozY] = y;
        ObiektInfo[id][objPozZ] = z;
        ObiektInfo[id][objRotX] = rx;
        ObiektInfo[id][objRotY] = ry;
        ObiektInfo[id][objRotZ] = rz;
    }
    return 1;
}
public OnPlayerSelectDynamicObject(playerid, objectid, modelid, Float:x, Float:y, Float:z)
{
    new uids = SprawdzObiektUID(objectid);
	if(ObiektInfo[uids][objvWorld] == 0 || ObiektInfo[uids][objvWorld] == -1)
	{
		if(!ZarzadzanieMAPObiektamiVW0(playerid))
		{
			CancelEdit(playerid);
			return 0;
		}
	}
	else
	{
		if(!ZarzadzanieBudynkiem(GetPlayerVirtualWorld(playerid), playerid) || GetPlayerVirtualWorld(playerid) == 0)
		{
			CancelEdit(playerid);
			return 0;
		}
	}
	if(ObiektInfo[uids][objStworzyl] != DaneGracza[playerid][gUID] && GetPlayerVirtualWorld(playerid) == 0 && DaneGracza[playerid][gAdmGroup] == 8 && DaneGracza[playerid][gAdmLVL] >= 5 && DaneGracza[playerid][gBudowanie] == 0)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie zosta³ stworzony przez Ciebie!", "Zamknij", "");
		return 0;
	}
	if(ObiektInfo[uids][objvWorld] != GetPlayerVirtualWorld(playerid) && GetPlayerVirtualWorld(playerid) != 0)
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz edytowaæ obiektu, który nie nale¿y do Twojego budynku!", "Zamknij", "");
		return 0;
	}
	SetPVarInt(playerid, "inedit", uids);
	obiektinedit[uids] = true;
	if(DaneGracza[playerid][gEdytor] == 0)
    {
		EditDynamicObject(playerid, objectid);
		edycjaobiektow[playerid] = 0;
		Edytors[playerid] = 1;
	}else{
	    edycjaobiektow[playerid] = 1;
	    CancelEdit(playerid);
	    ApplyAnimation(playerid,"BEACH","bather",4.1,0,0,0,1,0);
	    ApplyAnimation(playerid,"BEACH","bather",4.1,0,0,0,1,0);
	    Edytors[playerid] = 1;
	}
    SetPVarInt(playerid, "idobiktu", uids);
    return 1;
}
stock WyzejIntek(vw)
{
	for(new i = 0; i < 2048; i++)
	{
		if(BudynekInfo[vw][nObiekty][i] != 0)
		{
			ObiektInfo[BudynekInfo[vw][nObiekty][i]][objPozZ] += 10;
			ZapiszObiekt(BudynekInfo[vw][nObiekty][i]);
		}
	}
	return 1;
}
			
stock SkasujIntek(vw)
{
	for(new i = 0; i < 2048; i++)
	{
		if(BudynekInfo[vw][nObiekty][i] != 0)
		{
			UsunObiekt(BudynekInfo[vw][nObiekty][i]);
		}
	}
	if(BudynekInfo[vw][nStworzoneObiekty] > 0)
	{
		SkasujIntek(vw);
	}
	return 1;
}
stock UnloadObject(vw)
{
	ForeachEx(id, 2048)
	{
		if(ObiektInfo[BudynekInfo[vw][nObiekty][id]][objSAMP] != 0)
		{
			DestroyDynamicObject(ObiektInfo[BudynekInfo[vw][nObiekty][id]][objSAMP]);
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objUID] = 0;
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objSAMP] = 0;
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objModel] = 0;
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objvWorld] = 0;
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objInterior] = 0;
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objPozX] = 0;
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objPozY] = 0;
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objPozZ] = 0;
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objPosX] = 0;
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objPosY] = 0;
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objPosZ] = 0;
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objBrama] = 0;
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objSprarowanyUID] = 0;
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objOwnerBrama] = 0;
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objTypOwneraBramy] = 0;
			ObiektInfo[id][objTekstura] = 0;
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objWlacznik] = 0;
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objWartosc] = 0;
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objRotX] = 0;
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objRotY] = 0;
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objRotZ] = 0;
			ObiektInfo[BudynekInfo[vw][nObiekty][id]][objHP] = 0;
			BudynekInfo[vw][nObiekty][id] = 0;
			for(new i = 0; i < 6; i++)
			{
				ObiektInfo[BudynekInfo[vw][nObiekty][id]][objPoker][i] = -1;
				ObiektInfo[BudynekInfo[vw][nObiekty][id]][gAktualniGracze][i] = -1;
				ObiektInfo[0][objPoker][i] = -1;
				ObiektInfo[0][gAktualniGracze][i] = -1;
			}
		}
	}
	BudynekInfo[vw][nStworzoneObiekty] = 0;
	return 1;
}
stock LoadObject(vw)
{
	new sql[ 2048 ], id = false;
	mysql_query( "SELECT * FROM `jochym_obiekty`" );
	mysql_store_result( );
	while( mysql_fetch_row( sql ) )
	{
	    sscanf( sql, "p<|>i", id );
	    sscanf( sql, "p<|>iiiifffffffffddddddddddd",
	    ObiektInfo[ id ][ objUID ],
	    ObiektInfo[ id ][ objModel ],
	    ObiektInfo[ id ][ objvWorld ],
	    ObiektInfo[ id ][ objInterior ],
	    ObiektInfo[ id ][ objPozX ],
	    ObiektInfo[ id ][ objPozY ],
	    ObiektInfo[ id ][ objPozZ ],
	    ObiektInfo[ id ][ objRotX ],
	    ObiektInfo[ id ][ objRotY ],
	    ObiektInfo[ id ][ objRotZ ],
	    ObiektInfo[id][objPosX],
		ObiektInfo[id][objPosY],
		ObiektInfo[id][objPosZ],
		ObiektInfo[id][objBrama],
		ObiektInfo[id][objSprarowanyUID],
		ObiektInfo[id][objWlacznik],
		ObiektInfo[id][objWartosc],
		ObiektInfo[id][objOwnerBrama],
		ObiektInfo[id][objTypOwneraBramy],
		ObiektInfo[id][objTekstura],
		ObiektInfo[id][objOwnerDz],
		ObiektInfo[id][objHP],
		ObiektInfo[id][objStworzyl],
		ObiektInfo[id][objKopia]
	    );
	    if(ObiektInfo[id][objvWorld] == vw)
	    {
		    ObiektInfo[ id ][ objSAMP ] = CreateDynamicObject( ObiektInfo[ id ][ objModel ], ObiektInfo[ id ][ objPozX ],
		    ObiektInfo[ id ][ objPozY ], ObiektInfo[ id ][ objPozZ ], ObiektInfo[ id ][ objRotX ], ObiektInfo[ id ][ objRotY ],
		    ObiektInfo[ id ][ objRotZ ], ObiektInfo[ id ][ objvWorld ], ObiektInfo[ id ][ objInterior ] );
		    ObiektInfo[id][objOtw] = 0;
		    obiektinedit[id] = false;
			for(new i = 0; i < 2048; i++)
		    {
				if(BudynekInfo[ObiektInfo[id][objvWorld]][nObiekty][i] == 0)
				{
					BudynekInfo[ObiektInfo[id][objvWorld]][nObiekty][i] = ObiektInfo[id][objUID];
					break;
				}
		    }
			for(new i = 0; i < 6; i++)
			{
				ObiektInfo[id][objPoker][i] = -1;
				ObiektInfo[id][gAktualniGracze][i] = -1;
				ObiektInfo[0][objPoker][i] = -1;
				ObiektInfo[0][gAktualniGracze][i] = -1;
			}
		    reload++;
		}
	}
	BudynekInfo[vw][nStworzoneObiekty] = reload;
	mysql_free_result( );
	LoadTexturs(vw);
	printf("Obiekty w VW(%d) - %d", vw, id);
	return 1;
}
CMD:osave(playerid,params[]) return cmd_msave(playerid, params);
CMD:msave( playerid, params[ ] )
{
    new uids = GetPVarInt(playerid, "inedit");
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
 	//new uido = ObiektNaTerenie(playerid);
 	if(GetPlayerVirtualWorld(playerid) == 0)
	{
		if(ZarzadzanieMAPObiektamiVW0OBJ(playerid))
		{
		    if(GetPVarInt(playerid, "idobiktu") != 0 || GetPVarInt(playerid, "inedit") != 0)
			{
			    ZapiszObiekt(uids);
				CancelEdit(playerid);
				OnPlayerText(playerid, "-stopani");
		        obiektinedit[uids] = false;
		        DeletePVar(playerid,"idobiktu");
		        DeletePVar(playerid,"inedit");
		        TextDrawHideForPlayer(playerid, OBJ[playerid]);
		        Edytors[playerid] = 0;
			}
		}
		else
		{
		    if(GetPVarInt(playerid, "idobiktu") != 0 || GetPVarInt(playerid, "inedit") != 0)
			{
			    UsunObiekt(uids);
				ClearAnimations(playerid);
				ApplyAnimation(playerid, "CARRY", "crry_prtial", 4, 0, 0, 0, 0, 0, 0);
				CancelEdit(playerid);
				obiektinedit[uids] = false;
				DeletePVar(playerid,"idobiktu");
			    DeletePVar(playerid,"inedit");
			    TextDrawHideForPlayer(playerid, OBJ[playerid]);
			    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz stawiaæ obiektów poza swoj¹ stref¹!\nObiekt zosta³ usuniêty postaw nowy lecz na swojej strefie.\nPamiêtaj ¿e obiekty s¹ kontrolowane, niestosowne ich u¿ycie grozi usuniêciem strefy!", "Zamknij", "");
			}
		}
	}
	else
	{
	    if(GetPVarInt(playerid, "idobiktu") != 0 || GetPVarInt(playerid, "inedit") != 0)
		{
		    ZapiszObiekt(uids);
			CancelEdit(playerid);
			OnPlayerText(playerid, "-stopani");
	        obiektinedit[uids] = false;
	        DeletePVar(playerid,"idobiktu");
	        DeletePVar(playerid,"inedit");
	        TextDrawHideForPlayer(playerid, OBJ[playerid]);
	        Edytors[playerid] = 0;
		}
	}
	return 1;
}
CMD:os(playerid,params[]) return cmd_mpick(playerid, params);
CMD:mpick( playerid, params[ ] )
{
    if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	if(GetPlayerVirtualWorld(playerid) == 0)
	{
	    //new uidt = GraczNaTerenie(playerid);
	    if(!ZarzadzanieMAPObiektamiVW0(playerid))
	    {
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie masz uprawnieñ do edycji obiektów na tym terenie.", "Zamknij", "");
		    return 0;
		}
	}
	else
	{
	    if(!ZarzadzanieBudynkiem(GetPlayerVirtualWorld(playerid), playerid))
		{
		    dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie masz uprawnieñ do edycji obiektów w tym budynku.", "Zamknij", "");
		    return 0;
		}
	}
	if(GetPVarInt(playerid, "idobiktu") != 0 || GetPVarInt(playerid, "inedit") != 0)
	{
		new uids = GetPVarInt(playerid, "inedit");
		ZapiszObiekt(uids);
		CancelEdit(playerid);
		OnPlayerText(playerid, "-stopani");
        obiektinedit[uids] = false;
        DeletePVar(playerid,"idobiktu");
        DeletePVar(playerid,"inedit");
        TextDrawHideForPlayer(playerid, OBJ[playerid]);
        Edytors[playerid] = 0;
	}
    SelectObject(playerid);
	CzasWyswietlaniaTextuNaDrzwiach[playerid] = 5;
	TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
	TextDrawSetString(TextNaDrzwi[playerid], "~r~Zaznacz obiekt do edycji!");
	TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
	return 1;
}
