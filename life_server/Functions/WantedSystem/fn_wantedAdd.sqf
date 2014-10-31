private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
    	case "187V": {_type = ["Potracenie pieszego",60000]};
	case "187": {_type = ["Nieumyslne spowodowanie smierci",85000]};
	case "901": {_type = ["Ucieczka z wiezienia",40500]};
	case "261": {_type = ["Gwalt",50000]}; //What type of sick bastard would add this?
	case "261A": {_type = ["Proba gwaltu",30000]};
	case "215": {_type = ["Proba kradziezy auta",20000]};
	case "213": {_type = ["Uzywanie nielegalnych ladunkow wybuchowych",100000]};
	case "211": {_type = ["Rabunek",10000]};
	case "207": {_type = ["Porwania",35000]};
	case "207A": {_type = ["Proba porwania",20000]};
	case "487": {_type = ["Kradziez auta",55000]};
	case "488": {_type = ["Drobne kradzieze",15000]};
	case "480": {_type = ["Strzel i uwciekaj",20000]};
	case "481": {_type = ["Posiadanie narkotykow",100000]};
	case "482": {_type = ["Proba dystrybucji",50000]};
	case "483": {_type = ["Handel narkotykami",95000]};
	case "459": {_type = ["Kradziez z wlamaniem",65000]};
    
    case "1": {_type = ["Jazda niebezpieczna dla ruchu",5000]};
	case "2": {_type = ["Uzywanie pojazdu bez odpowiedniej licencji",10000]};
	case "3": {_type = ["Spamowanie telefonow sluzb porzadkowych",10000]};
	case "4": {_type = ["Blokowanie ulic/utrudnianie przejazdu",10000]};
	case "5": {_type = ["Spowodowanie wypadku/ucieczka z miejsca wypadku",15000]};
	case "6": {_type = ["Niewykonywanie policyjnych rozkazów",15000]};
	case "7": {_type = ["Lądowanie w innym miejscu niz Helipad",15000]};
	case "8": {_type = ["Latanie ponizej 150M",15000]};
	case "9": {_type = ["Utrudnianie prowadzenia sluzby",15000]};
	case "10": {_type = ["Proba kradziezy auta",30000]};
	case "11": {_type = ["Wkraczanie na tereny",20000]};
	case "12": {_type = ["Poruszanie sie z wyciagnieta bronia",25000]};
	case "13": {_type = ["Proba gwaltu",30000]};
	case "14": {_type = ["Próba obrabowania",30000]};
	case "15": {_type = ["Ucieczka przed policja",45000]};
	case "16": {_type = ["Przebywanie w czerwonych strefach",50000]};
	case "17": {_type = ["Napad",50000]};
	case "18": {_type = ["Ucieczka z wiezienia",50000]};
	case "19": {_type = ["Proba dystrybucji",50000]};
	case "20": {_type = ["Strzelanie do policji/medyków",50000]};
	case "21": {_type = ["Gwalt",50000]};
	case "22": {_type = ["Potracenie pieszego",60000]};
	case "23": {_type = ["Kradziez z wlamaniem",65000]};
	case "24": {_type = ["Kradziez pojazdu cywilnego",70000]};
	case "25": {_type = ["Posiadanie broni bez licencji",75000]};
	case "26": {_type = ["Proba kradziezy pojazdu policyjnego",80000]};
	case "27": {_type = ["Nieumyslne spowodowanie smierci",85000]};
	case "28": {_type = ["Kradziez pojazdu policyjnego",100000]};
	case "29": {_type = ["Nielegalne uprawianie hazardu",100000]};
	case "30": {_type = ["Posiadanie narkotykow",100000]};
	case "31": {_type = ["Uzywanie nielegalnych ladunkow wybuchowych",100000]};
	case "32": {_type = ["Morderstwo",150000]};
	case "33": {_type = ["Morderstwo sluzb porzadkowych",170000]};
	case "34": {_type = ["Poruszanie sie niedozwolonym pojazdem",200000]};
    default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.
_index = [_uid,life_wanted_list] call TON_fnc_index;

if(_index != -1) then
{
    _data = life_wanted_list select _index;
    _crimes = _data select 2;
    _crimes set[count _crimes,(_type select 0)];
    _val = _data select 3;
    life_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];
}
    else
{
    life_wanted_list set[count life_wanted_list,[_name,_uid,[(_type select 0)],(_type select 1)]];
};

diag_log format["WANTED_LIST = %1", life_wanted_list];

_gesuchter = [life_wanted_list] call DB_fnc_mresArray;
_query = format["UPDATE wanted set list = '%1'", _gesuchter];


waitUntil {sleep (random 0.1); !DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;