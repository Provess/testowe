#define MPH_KMH 1.609344
new noclipdata[100];
new guyfps[100];
//new vehfps[100]; // not used :p
new jongkok[100]; // jongkok means crouch in indonesia :v
new aim[100]; //aim variable
new swim[100];//swim variable

#define PRESSING(%0,%1) \
	(%0 & (%1))

forward dcek(playerid);
public dcek(playerid)
{
    if(GetPVarInt(playerid, "FirstPerson") == 1)
    {
		if(!IsPlayerAiming(playerid) && aim[playerid] == 1 && guyfps[playerid] == 1)
		{
		    FPSMode(playerid);
		    aim[playerid] = 0;
		}
		if(guyfps[playerid] == 1 && GetPlayerSpecialAction(playerid)!= SPECIAL_ACTION_DUCK && !IsPlayerInAnyVehicle(playerid))
		{
		   // FlyMode(playerid);
			ResetFPSMode(playerid);
		}
		if(!IsPlayerInWater(playerid) && swim[playerid] == 1)
		{
			FPSMode(playerid);
			swim[playerid] = 0;
		}
		// well the vehicle FPS is on Experimental version :p not recomended
		new vehicleid = GetPlayerVehicleID(playerid);
		if(IsPlayerInAnyVehicle(playerid) && GetVehicleSpeed(vehicleid) > 70.0)
		{
		    ResetFPSMode2(playerid);
		}
	}
	return 1;
}

/*stock IsPlayerInWater(playerid)
{
    new animlib[32],tmp[32];
    GetAnimationName(GetPlayerAnimationIndex(playerid),animlib,32,tmp,32);
    if( !strcmp(animlib, "SWIM") && !IsPlayerInAnyVehicle(playerid) ) return true;
    return false;
}*/

stock FPSMode(playerid)
{
    if(GetPVarInt(playerid, "FirstPerson") == 1)
    {
		guyfps[playerid] = 1;
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		DestroyObject(noclipdata[playerid]);
		noclipdata[playerid] = CreateObject(19300, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
		AttachObjectToPlayer(noclipdata[playerid], playerid, 0.0, 0.2, 0.75, 0.0, 0.0, 0.0);
	 	AttachCameraToObject(playerid, noclipdata[playerid]);
	}
	return 1;
}

stock SwimMode(playerid)
{
    if(GetPVarInt(playerid, "FirstPerson") == 1)
    {
		AttachObjectToPlayer(noclipdata[playerid], playerid, 0.0, 0.7, 0.55  , 0.0, 0.0, 0.0);
	 	AttachCameraToObject(playerid, noclipdata[playerid]);
	}
	return 1;
}

stock CrouchMode(playerid)
{
    if(GetPVarInt(playerid, "FirstPerson") == 1)
    {
	    guyfps[playerid] = 1;
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		DestroyObject(noclipdata[playerid]);
		noclipdata[playerid] = CreateObject(19300, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
		AttachObjectToPlayer(noclipdata[playerid], playerid,  0.0, 0.0, 0.20 , 0.0, 0.0, 0.0);
	 	AttachCameraToObject(playerid, noclipdata[playerid]);
	}
	return 1;
}

stock ResetFPSMode(playerid)
{
    if(GetPVarInt(playerid, "FirstPerson") == 1)
    {
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
	 	AttachCameraToObject(playerid, noclipdata[playerid]);
	}
	return 1;
}

stock FPSMode2(playerid)
{
    if(GetPVarInt(playerid, "FirstPerson") == 1)
    {
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		DestroyObject(noclipdata[playerid]);
		noclipdata[playerid] = CreateObject(19300, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
		SetCameraBehindPlayer(playerid);
		AttachObjectToPlayer(noclipdata[playerid], playerid, 0.0, -0.2, 0.65, 0.0, 0.0, 0.0);
	 	AttachCameraToObject(playerid, noclipdata[playerid]);
	}
	return 1;
}
stock ResetFPSMode2(playerid)
{
    if(GetPVarInt(playerid, "FirstPerson") == 1)
    {
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		AttachObjectToPlayer(noclipdata[playerid], playerid,0.0, -0.2, 0.65, 0.0, 0.0, 0.0);
	 	AttachCameraToObject(playerid, noclipdata[playerid]);
	}
	return 1;
}

stock ResetGun(playerid)
{
    if(GetPVarInt(playerid, "FirstPerson") == 1)
    {
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
		SetPlayerCameraPos(playerid, X, Y, Z);
		AttachObjectToPlayer(noclipdata[playerid], playerid,0.0, -0.1, 0.85 , 0.0, 0.0, 0.0);
	 	AttachCameraToObject(playerid, noclipdata[playerid]);
	}
	return 1;
}

stock crouch(playerid)
{
    if(GetPVarInt(playerid, "FirstPerson") == 1)
    {
	    if(jongkok[playerid] == 0)
	    {
	        guyfps[playerid] = 0;
			CrouchMode(playerid);
			jongkok[playerid] = 1;
		}
		if(jongkok[playerid] == 1)
		{
		    guyfps[playerid] = 0;
		    FPSMode(playerid);
		    jongkok[playerid] = 0;
		}
	}
	return 1;
}

stock GetVehicleSpeed( vehicleid )
{
	// Function: GetVehicleSpeed( vehicleid )

	new
	    Float:x,
	    Float:y,
	    Float:z,
		vel;

	GetVehicleVelocity( vehicleid, x, y, z );

	vel = floatround( floatsqroot( x*x + y*y + z*z ) * 180 );			// KM/H

	return vel;
}
