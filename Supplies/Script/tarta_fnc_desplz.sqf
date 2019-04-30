
_dvr = chof select 0; //make the global variable in a local one
_posCall = getPosATL (_this select 1); //position where the vehicle is called
_roads = [_poscall, 500] call BIS_fnc_NearestRoad; //search the closest road

//if its too far from a road. it donest came
if (isnull _roads) then {
  hint "muy lejos de una ruta";
};

//final position.
_posdes = getposATL _roads;

//gives fuel to the vehicle
vehicle _dvr setfuel 1;

//moves
_dvr domove _posdes;



/////tarta_fnc_eta.sqf////// <- useless

// distance
_dis = _dvr distance2d _posCall;
//ETA to the position.
_ETA = round (_dis/200);
/////////////////////////////

//reports the ETA
_dvr sidechat format ["Vehiculo en movimiento ETA: %1 minutos", _ETA];

//driver behaviour
_dvr setBehaviour "SAFE";
_dvr setSpeedMode "NORMAL";

//wait until the distance is less than 10mts
waitUntil {( _dvr distance2d _posdes < 10)};
//reports the arrival
_dvr sidechat format ["posicion:%1", [round (GetposATL _dvr select 0), round (GetposATL _dvr select 1)]];

sleep 3;

//engine off
_dvr action ["EngineOff", vehicle _dvr];
//fuel out
vehicle _dvr setfuel 0;

//saves the new position as a safe point
call tarta_fnc_safepos;





// agregar marcador a donde frena
//_marker = ["municion", position _dvr, "ELLIPSE", [10,10], "GLOBAL", "solid", "collorYellow", "Suministros"] call CBA_fnc_createMarker;
//crear marcador + aviso de la posicion
