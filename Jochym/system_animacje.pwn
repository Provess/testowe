AntiDeAMX();
enum ainfo
{
	UID,
	CMD[12],
	Lib[16],
	Name[24],
	Float:Speed,
	Loop,
	Lock[2],
	Freeze,
	aTime,
	Toggle
};
new AnimInfo[MAX_ANIM][ainfo];
CMD:anim(playerid, params[])
{
	//printf("U¿yta komenda anim");
	if(zalogowany[playerid] == false)
    {
        return 0;
    }
	if(DaneGracza[playerid][gBW] != 0)
	{
		return 0;
	}
	if(DaneGracza[playerid][gUID] == 0 || DaneGracza[playerid][gBW] != 0) return PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
	new anim[32];
	new found = 0, str[1024];
	if(IsPlayerInAnyVehicle(playerid))
	{
		return 1;
	}
	if(GetPVarInt(playerid, "idobiktu") != 0 || GetPVarInt(playerid, "inedit") != 0)
	{
	    dShowPlayerDialog( playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:","Nie mo¿esz u¿ywaæ animacji, gdy edytujesz obiekt!", "Zamknij", "" );
	    return 0;
	}
	if(sscanf(params, "s[32]", anim))
	{
		ForeachEx(i, MAX_ANIM)
		{
			format(str, sizeof(str), "%s\n%s", str, AnimInfo[i][CMD]);
			found++;
		}
		dShowPlayerDialog(playerid, DIALOG_ANIM, DIALOG_STYLE_LIST, "• TIP:", str, "U¿yj", "Zamknij");
	}
	else
	{
	    ForeachEx(i, MAX_ANIM)
		{
		    if(strfind(AnimInfo[i][CMD], anim, true) >= 0)
		    {
				format(str, sizeof(str), "%s\n%s", str, AnimInfo[i][CMD]);
				found++;
			}
		}
		dShowPlayerDialog(playerid, DIALOG_ANIM, DIALOG_STYLE_LIST, "• TIP:", str, "U¿yj", "Zamknij");
	}
	return 1;
}
stock ZaladujAnimacje()
{
 	new field[10], i;
	mysql_check();
	mysql_query2("SELECT * FROM `jochym_animacje`");
 	mysql_store_result();
 	while(mysql_retrieve_row())
	{
    	mysql_fetch_field_row(field, "uid"); AnimInfo[i][UID] = strval(field);
		mysql_fetch_field_row(AnimInfo[i][CMD], "cmd");
		mysql_fetch_field_row(AnimInfo[i][Lib], "lib");
		mysql_fetch_field_row(AnimInfo[i][Name], "name");
		mysql_fetch_field_row(field, "s"); AnimInfo[i][Speed] = floatstr(field);
		mysql_fetch_field_row(field, "l"); AnimInfo[i][Loop] = strval(field);
		mysql_fetch_field_row(field, "x"); AnimInfo[i][Lock][0] = strval(field);
		mysql_fetch_field_row(field, "y"); AnimInfo[i][Lock][1] = strval(field);
		mysql_fetch_field_row(field, "f"); AnimInfo[i][Freeze] = strval(field);
		mysql_fetch_field_row(field, "t"); AnimInfo[i][aTime] = strval(field);
		mysql_fetch_field_row(field, "c"); AnimInfo[i][Toggle] = strval(field);
		i++;
	}
	//printf("Animacje    - %d", mysql_num_rows());
	mysql_free_result();
	return 1;
}
