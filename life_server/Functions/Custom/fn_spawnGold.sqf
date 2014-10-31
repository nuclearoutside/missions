private["_heli","_wreck"];

//Create gold vehicle wreck 
_heli = "Land_ClutterCutter_small_F" createVehicle (["mrkGreen",2,["mrkRed","mrkRed_1","mrkRed_1_1","mrkRed_1_3"]] call SHK_pos);
_heli setPosASLW [(position _heli) select 0, (position _heli) select 1, -5.5];
_heli enableSimulation false;

_wreck = "Land_UWreck_FishingBoat_F" createVehicle (getPos _heli);
_wreck SetPosATL [(getPos _heli select 0)-300*sin(round(random 459)),(getPos _heli select 1)-300*cos(round(random 459)), 0];
_wreck enableSimulation false;

gold_safe attachTo [_wreck,[3,4,-0.4]];
gold_safe setVectorDirAndUp [[90,0,80],[-90,0,0]];
gold_safe enableSimulation false;
gold_safe allowDamage false;

_minTime = (10*60);
_maxTime = (20*80);
_finalTime = (random (_maxTime - _minTime)) + _minTime;
sleep _finalTime;
_Pos = position _heli;
/* //Debug
_Pos1 = position _wreck;
_markerText = createMarker ["MarkerText300", _Pos1];
"MarkerText300" setMarkerColor "ColorRed";
"MarkerText300" setMarkerText "Debug - wrak statku";
"MarkerText300" setMarkerType "mil_warning";
*/ //Debug End
 _marker = createMarker ["Marker200", _Pos];
"Marker200" setMarkerColor "ColorOrange";
"Marker200" setMarkerType "Empty";
"Marker200" setMarkerShape "ELLIPSE";
"Marker200" setMarkerSize [2500,2500];
 _markerText = createMarker ["MarkerText200", _Pos];
"MarkerText200" setMarkerColor "ColorBlack";
"MarkerText200" setMarkerText "Wrak statku";
"MarkerText200" setMarkerType "mil_warning";
[[5,"<t size='3'><t color='#00FF00'>WRAK STATKU</t></t> <br/><t size='1.5'>Otrzymano informacje o rozbitym statku, sprawdŸ na mapie<t color='#FFFF00'>i poszukaj skrzyñ z³ota pod wod¹.</t>. Check your map</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;