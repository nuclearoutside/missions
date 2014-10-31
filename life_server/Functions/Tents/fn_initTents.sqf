/*
	Author: Raku @ Veterans of Altis
	
	Description:
	Sets up tents on the map
*/
private["_tickTime","_queryResult","_query"];
_query = format["SELECT type, position, pid FROM tent WHERE alive=1"];
 
waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
 
diag_log "------------- TENT INIT -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";
 
{
	_type = _x select 0;
	_position = call compile format["%1",_x select 1];
 
	_height = [5,5,-5.45,5];
	
	_tent = createVehicle [_type, [1.6650946,1.6626484,_height select 0], [], 0, "CAN_COLLIDE"];
	_tent setDir 90;
	_tent allowDamage false;
	sleep 0.3;		
	_tent setPos (_position);
	
	[[_tent,"pid",_x select 2,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
	
	diag_log format["Tent set: %1",_position];
} foreach _queryResult;