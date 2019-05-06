//sin ace:

_name   ="<t color='#00FFFF'>Llamar a rapi </t>";
_script = "call tarta_fnc_desplz";

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
      "" ,        //condition
      0.00001 ,   //radius
      false,      //unconciuos
      "",         //selection
      ""          //memoryPoint
    ];
  };
  } foreach allplayers - entities "HeadlessClient_F";
