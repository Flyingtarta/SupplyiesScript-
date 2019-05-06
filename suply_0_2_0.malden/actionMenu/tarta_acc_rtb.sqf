_dvr = chof select 0;

_name   ="<t color='#FF0000'>Volver a Base </t>";
_script = "call tarta_fnc_volverBase";
_condicion = "";
//_condicion = str ( base distance2d vehicle _dvr > 20);

{
  if (alive _x && leader (group _x) == _x && !(_x in liderVec)) then
{
[ liderVec , _x] call BIS_fnc_arrayPush;


    _x addaction [
      _name,     //tittle
      _script,   //script
      nil ,       //arguments
      2,          //priority
      false,      //showWindow
      false,      //HideOnUse
      "" ,        //shortcut
      _condicion, //condition
      0.00001 ,   //radius
      false,      //unconciuos
      "",         //selection
      ""          //memoryPoint
    ];
  };
  } foreach allplayers - entities "HeadlessClient_F";
