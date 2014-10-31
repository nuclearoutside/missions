private["_kibole"];

//Create kibole mendy pierdolone
_kibole = "OIA_InfSquad" createVehicle (["mrkGreenn",0,["mrkRedd","mrkRedd_1","mrkRedd_1_1","mrkRedd_1_3"]] call SHK_pos);
_kibole setPosATL [(position _kibole) select 0, (position _kibole) select 1, -5.5];
_kibole enableSimulation true;


_minTime = (10*60);
_maxTime = (20*80);
_finalTime = (random (_maxTime - _minTime)) + _minTime;
sleep _finalTime;
_Pos = position _kibole;
 _marker = createMarker ["Marker201", _Pos];
"Marker201" setMarkerColor "ColorRed";
"Marker201" setMarkerType "Empty";
"Marker201" setMarkerShape "ELLIPSE";
"Marker201" setMarkerSize [1000,1000];
 _markerText = createMarker ["MarkerText201", _Pos];
"MarkerText201" setMarkerColor "ColorBlack";
"MarkerText201" setMarkerText "KIBOLE KURWA";
"MarkerText201" setMarkerType "mil_warning";
[[5,"<t size='3'><t color='#00FF00'>KIBOLE</t></t> <br/><t size='1.5'>KURWAAAAAA"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
