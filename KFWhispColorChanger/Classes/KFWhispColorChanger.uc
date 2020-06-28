//=============================================================================
// Base Mutator by Vel-San - Contact on Steam using the following Profile Link
// for more information, feedback, questions or requests please contact
// https://steamcommunity.com/id/Vel-San/
//=============================================================================

class KFWhispColorChanger extends Mutator Config(KFWhispColorChanger);

//// Vars
var color AquaColor, OrangeColor, GreenColor, BlueColor, GoldColor, PurpleColor, WhiteColor;
var RedWhisp RW;
//// Config Vars
var() config int sColor;
var() config bool bRandomColor;

simulated function PostBeginPlay ()
{
    if (bRandomColor){
        SetTimer(0.5, true);
    }
    else{
        SetTimer(0.1, true);
    }
}

function Timer()
{
    AquaColor = default.AquaColor;
    OrangeColor = default.OrangeColor;
    GreenColor = default.GreenColor;
    BlueColor = default.BlueColor;
    GoldColor = default.GoldColor;
    PurpleColor = default.PurpleColor;
    WhiteColor = default.WhiteColor;

    if (bRandomColor){
        // Log("Random Color for Whisp ENABLED");
        // Log("Chosen Whisp Color: " $sColor);
        foreach DynamicActors(class'KFMod.RedWhisp', RW)
        {
	        RW.default.mColorRange[0] = class'Canvas'.static.MakeColor(rand(255),rand(255),rand(255),255);
	        RW.default.mColorRange[1] = class'Canvas'.static.MakeColor(rand(255),rand(255),rand(255),255);
            // Log("Whisp Color Changed");
        }
    }else{
        switch(sColor){
        case 1:
            // Log("Chosen Whisp Color: " $sColor);
            foreach DynamicActors(class'KFMod.RedWhisp', RW)
	        {
		        RW.default.mColorRange[0] =  OrangeColor;
		        RW.default.mColorRange[1] =  OrangeColor;
                // Log("Whisp Color Changed");
            }
            break;
        case 2:
            // Log("Chosen Whisp Color: " $sColor);
            foreach DynamicActors(class'KFMod.RedWhisp', RW)
	        {
		        RW.default.mColorRange[0] =  GreenColor;
		        RW.default.mColorRange[1] =  GreenColor;
                // Log("Whisp Color Changed");
            }
            break;
        case 3:
            // Log("Chosen Whisp Color: " $sColor);
            foreach DynamicActors(class'KFMod.RedWhisp', RW)
	        {
		        RW.default.mColorRange[0] =  BlueColor;
		        RW.default.mColorRange[1] =  BlueColor;
                // Log("Whisp Color Changed");
            }
            break;
        case 4:
            // Log("Chosen Whisp Color: " $sColor);
            foreach DynamicActors(class'KFMod.RedWhisp', RW)
	        {
		        RW.default.mColorRange[0] =  GoldColor;
		        RW.default.mColorRange[1] =  GoldColor;
                // Log("Whisp Color Changed");
            }
            break;
        case 5:
            // Log("Chosen Whisp Color: " $sColor);
            foreach DynamicActors(class'KFMod.RedWhisp', RW)
	        {
		        RW.default.mColorRange[0] =  PurpleColor;
		        RW.default.mColorRange[1] =  PurpleColor;
                // Log("Whisp Color Changed");
            }
            break;
        case 6:
            // Log("Chosen Whisp Color: " $sColor);
            foreach DynamicActors(class'KFMod.RedWhisp', RW)
	        {
		        RW.default.mColorRange[0] =  WhiteColor;
		        RW.default.mColorRange[1] =  WhiteColor;
                // Log("Whisp Color Changed");
            }
            break;
        default:
            // Log("Chosen Whisp Color: " $sColor);
            foreach DynamicActors(class'KFMod.RedWhisp', RW)
	        {
		        RW.default.mColorRange[0] =  OrangeColor;
		        RW.default.mColorRange[1] =  OrangeColor;
                // Log("Whisp Color Changed");
            }
        }
    }
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
	Super.FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting("KFWhispColorChanger", "sColor", "Trader Path Color", 0, 0, "select", "0;Aqua;1;Orange;2;Green;3;Blue;4;Gold;5;Purple;6;White");
    PlayInfo.AddSetting("KFWhispColorChanger", "bRandomColor", "Continous Random Colors", 0, 0, "check");
}

static function string GetDescriptionText(string SettingName)
{
	switch(SettingName)
	{
		case "sColor":
			return "Pick a color from this list";
        case "bRandomColor":
			return "If enabled, path will be changed dynamically every 0.5 seconds | This ignores the 'Static Color' option!";
		default:
			return Super.GetDescriptionText(SettingName);
	}
}

defaultproperties
{
    // Mut Info
    GroupName="KF-WhispColorChanger"
    FriendlyName="Whisp Color Changer"
    Description="Changes the color of the trader's path; - By Vel-San"

    // Mut Vars
    // String for settings
	sColor=0
    bRandomColor=false
	// Colors of the Path
    AquaColor=(R=0,G=255,B=255,A=255)
    GreenColor=(R=0,G=255,B=0,A=255)
    BlueColor=(R=0,G=0,B=255,A=255)
    OrangeColor=(R=255,G=109,B=5,A=255)
    GoldColor=(R=255,G=255,B=0,A=255)
    PurpleColor=(R=255,G=0,B=255,A=255)
    WhiteColor=(R=255,G=255,B=255,A=255)

    // Mandatory Vars
	bAddToServerPackages=true
    bAlwaysRelevant=true
    RemoteRole=ROLE_SimulatedProxy
}