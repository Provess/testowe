stock GetVehicleBoost(vehicleid) 
{ 
	new Float:x_speed, Float:y_speed, Float:z_speed, Float:speedf; 
	GetVehicleVelocity(vehicleid,x_speed,y_speed,z_speed); 
	speedf = floatsqroot(((x_speed*x_speed)+(y_speed*y_speed))+(z_speed*z_speed)) * 187.666667; 
	return floatround(speedf,floatround_round); 
} 

stock Boost(playerid)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	new uid = SprawdzCarUID(vehicleid);
	new Float:x, Float:y, Float:z, Float:PredkoscBoosta;
	if(Predkosc(playerid) < 200)
	{
		PredkoscBoosta = GetVehicleBoost(vehicleid)*PojazdInfo[uid][pBoost];
		if(PredkoscBoosta < 200.0)
		{
			GetVehicleVelocity(vehicleid, x, y ,z);
			SetVehicleVelocity(vehicleid, x * PojazdInfo[uid][pBoost], y * PojazdInfo[uid][pBoost], z * PojazdInfo[uid][pBoost]);
		}
	}
	return 1;
}