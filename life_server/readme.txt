/* *******************Developer : infiSTAR (infiSTAR23@gmail.com)******************* */
/* ******************Copyright © 2014 infiSTAR all rights reserved****************** */
/* *********************************www.infiSTAR.de********************************* */
--------------------------------------------------------------------------------
As a friendly Reminder, you have accepted this by proceeding the payment during the purchase:
*REFUND POLICY*
You agree that infiSTAR offers no refunds and all payments for Services are final. 
Furthermore, you shall not institute any form or charge-back for any fees paid to infiSTAR. 
You acknowledge that you have read and agree to the above Policy.

*TERMS AND CONDITIONS*
The script (which is a plain written text) stays property of infiSTAR.
As author he is the only one allowed to modify, share (sell or post) it.
Commercial use is prohibited unless it is permitted by infiSTAR.
Copyright © 2014 infiSTAR all rights reserved
--------------------------------------------------------------------------------
CONTACT INFO
http://dayzantihack.com/form.html (infiSTAR23@gmail.com)
--------------------------------------------------------------------------------
Installation-Guide:
01. Download your a3_epoch_server.pbo (Epoch\@EpochHive\Addons)
02. Make sure the folder you downloaded the pbo from (Epoch\@EpochHive\Addons), only has the a3_epoch_server.pbo in it.
	 If that folder has a subfolder or the unpacked pbo in it -> DELETE that.
03. Once you are done with this, unpack your pbo file (google pbo manager or semilar)
04. go to (a3_epoch_server\init\) and open server_init.sqf (note - we are in the server pbo and not in the MPmission anymore..)
05. copy paste
	 [] execVM 'run.sqf';
	 in the first line.
06. Take
	 A3AH.sqf
	 A3AT.sqf
	 run.sqf
	 A3_HACKLOG.dll
	 from the .zip you have gotten from me (infiSTAR.de) and put them in the ArmA3 Folder (on the Server!).
07. Only edit the run.sqf - that is the config file.
08. Upload the BattleEye Filters from my folder into your instance folder - overwrite the existing but do not delete any file.
09. Repack Pbo - Upload it - Start the Server and press Your Open Menu Key :)! (Default F1)


USING THIS ON ALTIS-LIFE WITH SPYGLASS:
01. First we need to modify spyglass, so we are not getting banned from our own server..
	 Open the Altis-Life Mpmission folder and move to SpyGlass\fn_menuCheck.sqf and remove this whole block:
			[] spawn {
				waitUntil {!isNull (findDisplay 2727)};
				[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_2727"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
				[[profileName,"Menu Hack: DISPLAY 2727"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
				sleep 0.5;
				["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
			};
		
02. Make sure the folder you downloaded the pbo from (AltisLife\@life_server\Addons), only has the life_server.pbo in it.
	 If that folder has a subfolder or the unpacked pbo in it -> DELETE that.
03. Once you are done with this, unpack your pbo file (google pbo manager or semilar)
04. go to (life_server\) and open init.sqf (note - we are in the server pbo and not in the MPmission anymore..)
05. copy paste
	 [] execVM 'run.sqf';
	 in the first line.
06. Take
	 A3AH.sqf
	 A3AT.sqf
	 run.sqf
	 A3_HACKLOG.dll
	 from the .zip you have gotten from me (infiSTAR.de) and put them in the ArmA3 Folder (on the Server!).
07. Only edit the run.sqf - that is the config file.
08. Upload the BattleEye Filters from my folder into your instance folder - overwrite the existing but do not delete any file.
09. Repack Pbo - Upload it - Start the Server and press Your Open Menu Key :)! (Default F1)




cheers,
chris aka infiSTAR
/* *******************Developer : infiSTAR (infiSTAR23@gmail.com)******************* */
/* ******************Copyright © 2014 infiSTAR all rights reserved****************** */
/* *********************************www.infiSTAR.de********************************* */