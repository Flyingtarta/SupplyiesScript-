
_dvr = chof select 0; //make the global variable in a local one

_caller = _this select 1;
_posCall = getPosATL _caller; //position where the vehicle is called

_roads = [_poscall, 500] call BIS_fnc_NearestRoad; //search the closest road

//if its too far from a road. it donest came
if (isnull _roads) then {
  hint "muy lejos de una ruta";
};

//final position.
_posdes = getposATL _roads;

//gives fuel to the vehicle
vehicle _dvr setfuel 1;

//move to posdes
_dvr domove _posdes;

//parametros del accion
_name   ="<t color='#FFFF00'>cancelar el pedido </t>";
_script ="call tarta_fnc_VolverBase";
_condicion = "";
//_condicion = str (_dvr distance2d player > 20);

_cancelar =_caller addaction [
  _name,      //tittle
  _script,    //script
  nil,       //arguments
  2,          //priority
  true,      //showWindow
  true,       //HideOnUse
  "",        //shortcut
  _condicion ,  //condition
  0.00001 ,   //radius
  false,      //unconciuos
  "",         //selection
  ""          //memoryPoint
];

// distance
_dis = _dvr distance2d _posCall;
//ETA to the position.
_ETA = round (_dis/200);
/////////////////////////////


//falta repoteexec para los sidechat

//reports the ETA
_dvr sidechat format ["Vehiculo en movimiento ETA: %1 minutos", _ETA];


//driver behaviour
_dvr setBehaviour "SAFE";
_dvr setSpeedMode "NORMAL";

//wait until the distance is less than 10mts
waitUntil {( _dvr distance2d _posdes < 10)};
//reports the arrival
_dvr sidechat format ["posicion:%1", [round (GetposATL _dvr select 0), round (GetposATL _dvr select 1)]];

sleep 1;
waitUntil {( _dvr distance2d player < 10)};
//engine off
_dvr action ["EngineOff", vehicle _dvr];
//fuel out
vehicle _dvr setfuel 0;
//saves the new position as a safe point
//call tarta_fnc_safepos;





// agregar marcador a donde frena
//_marker = ["municion", position _dvr, "ELLIPSE", [10,10], "GLOBAL", "solid", "collorYellow", "Suministros"] call CBA_fnc_createMarker;
//crear marcador + aviso de la posicion
