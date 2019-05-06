waituntil {time > 3};

//select the current vehicle
_veh = _this select 0;
//make the driver as variable
_dvr = driver _veh;

//we save that variable globally
[ chof , _dvr ] call BIS_fnc_arrayPush;

_veh setfuel 0;
//saves the position of the vehicle.
//call tarta_fnc_safepos;
//save the base pos
call tarta_fnc_BasePos;
//agrega la accion
call tarta_fnc_addaction;

//while the driver is alive, reports its status
while { alive _dvr } do
{
  call tarta_fnc_reportesPeligro;
};

hint "vehiculo MIA";
