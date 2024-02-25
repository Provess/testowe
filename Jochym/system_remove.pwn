enum rRemove {
	rUID,
	rModel,
	Float:rX,
	Float:rY,
	Float:rZ,
	Float:rRadious
};
new RemoveBuilding[MAX_REMOVE][rRemove];

stock ZaladujRemoveBuildings(playerid)
{
	new result[1024], i = 0;
	new 
		uid,
		modelid,
		Float: x, Float:y, Float: z, Float:radious
	;
    format(zapyt, sizeof(zapyt), "SELECT * FROM `jochym_remove`");
    mysql_check();
	mysql_query2(zapyt);
    mysql_store_result();
    while(mysql_fetch_row(result))
	{
	    //new uid;
    	sscanf(result, "p<|>d", uid);
		sscanf(result,  "p<|>dfffd", RemoveBuilding[uid][rUID],
		    RemoveBuilding[uid][rModel],
		    RemoveBuilding[uid][rX],
			RemoveBuilding[uid][rY],
			RemoveBuilding[uid][rZ],
		    RemoveBuilding[uid][rRadious]);
			
		RemoveBuildingForPlayer(playerid, modelid, x, y, z, radious);
	}
	mysql_free_result();
	printf("RemoveBuildings - %d", i);
}

stock AddRemoveBuilding(playerid, modelid, Float:x, Float:y, Float:z, Float:radious = 5.0, short_desc[32] = " ")
{
	format(zapyt, sizeof(zapyt), "INSERT INTO `jochym_remove` (`modelid`, `x`, `y`, `z`, `radious`, `short_desc`) VALUES ('%d', '%f', '%f', '%f', '%f', '%s')", modelid, x, y, z, radious, short_desc);
	
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if(!IsPlayerConnected(i)) continue;
		RemoveBuildingForPlayer(playerid, modelid, x, y, z, radious);
	}
	return 1;
}

/*CMD:rb(playerid, params[])
{
	new modelid, Float:radious, short_desc[32];
	if(sscanf(params, "iF(50)S(Brak)[32]", modelid, radious, short_desc)) return SendClientMessage(playerid, 0xFFb00000, "Tip: /(r)emove(b)uilding [modelid] [radious] [opcjonalny komentarz (aby latwiej znalesc bylo potem do przywrocenia)"); 

	new Float: x, Float: y, Float: z;
	GetPlayerPos(playerid, x, y, z);

	AddRemoveBuilding(playerid, modelid, x, y, z, radious);
	return 1;
}*/