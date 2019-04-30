//reports is under fire
_dvr = chof select 0;

 if ( behaviour _dvr == "COMBAT" && alive _dvr) then
   {

     _dvr sidechat "Vehiculo Bajo fuego";
     _dvr setBehaviour "CARELESS";
     _dvr setSpeedMode "full";
   };

 //when is close to a player switchs to "safe"
 if ( _dvr distance2d player < 50) then
 {
   _dvr setBehaviour "SAFE";
   _dvr setSpeedMode "NORMAL";
 };
// if is going too slow, told there is a problem
 if ( fuel vehicle _dvr > 0
   && behaviour _dvr == "COMBAT" // is in combat
   && alive _dvr                //driver alive
   && _dvr distance2d player > 51 //is futher than 50m of a player
   && speed vehicle _dvr < 5 //vehicle is going at less of 5kmh
   ) then
  {
    _dvr sidechat "vehiculo comprometiedo";
  };
