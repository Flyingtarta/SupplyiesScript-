//select the current vehicle
_veh = _this select 0;
//make the driver as variable
_dvr = driver _veh;

//we save that variable globally
[ chof , _dvr ] call BIS_fnc_arrayPush;

_veh setfuel 0;
//saves the position of the vehicle.
call tarta_fnc_safepos;

[
"<t color='#FFFF00'>suministros </t>", //acction in yelow
"call tarta_fnc_desplz",         //script 1
"<t color='#FF0000'>cancelar suministros </t>", //cancel tthe call (red)
"call tarta_fnc_VolverZonaSegura" //script 2
] call tarta_fnc_addaction;


//while the driver is alive, reports its status
while { alive _dvr } do
{
  call tarta_fnc_reportesPeligro;
};
