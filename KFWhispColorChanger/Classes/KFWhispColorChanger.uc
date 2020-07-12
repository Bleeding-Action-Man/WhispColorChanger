//=============================================================================
// Base Mutator by Vel-San - Contact on Steam using the following Profile Link
// for more information, feedback, questions or requests please contact
// https://steamcommunity.com/id/Vel-San/
//=============================================================================

class KFWhispColorChanger extends Mutator Config(KFWhispColorChanger);

//// Vars
var color AquaColor, OrangeColor, GreenColor, BlueColor, GoldColor, PurpleColor, WhiteColor, rand_c, rand_c_2;
//// Config Vars
var() config int sColor;
var() config bool bRandomColor;

replication
{
	unreliable if (Role == ROLE_Authority)
		sColor, bRandomColor, AquaColor, OrangeColor, GreenColor, BlueColor, GoldColor, PurpleColor, WhiteColor, rand_c, rand_c_2;
}

function PostBeginPlay()
{
    if (bRandomColor){
        Log("-----|| Random Color for Whisp ENABLED ||-----");
    }
    else{
        Log("-----|| Random Color for Whisp DISABLED ||-----");
     }
     SetTimer(1, true);
}

function Timer()
{
    rand_c = class'Canvas'.static.MakeColor(rand(255),rand(255),rand(255),255);
    rand_c_2 = class'Canvas'.static.MakeColor(rand(255),rand(255),rand(255),255);
    AquaColor = class'Canvas'.static.MakeColor(0,255,255,255);
    GreenColor = class'Canvas'.static.MakeColor(0,255,0,255);
    BlueColor = class'Canvas'.static.MakeColor(0,0,255,255);
    OrangeColor = class'Canvas'.static.MakeColor(255,109,5,255);
    GoldColor = class'Canvas'.static.MakeColor(255,255,0,255);
    PurpleColor = class'Canvas'.static.MakeColor(255,0,255,255);
    WhiteColor = class'Canvas'.static.MakeColor(255,255,255,255);
}

simulated function PostNetReceive()
{
    local RedWhisp RW;
    // Log("-----|| sColor: " $sColor$ " || bRandomColor: " $bRandomColor$ " ||-----");
    if (bRandomColor){
        foreach DynamicActors(class'KFMod.RedWhisp', RW)
        {
	        RW.default.mColorRange[0] = rand_c;
	        RW.default.mColorRange[1] = rand_c_2;
        }
    }else{
        switch(sColor){
            case 0:
                // Log("-----|| Chosen Whisp Color: Aqua ||-----");
                foreach DynamicActors(class'KFMod.RedWhisp', RW)
	            {
		            RW.default.mColorRange[0] =  AquaColor;
		            RW.default.mColorRange[1] =  AquaColor;
                }
                break;
            case 1:
                // Log("-----|| Chosen Whisp Color: Orange ||-----");
                foreach DynamicActors(class'KFMod.RedWhisp', RW)
                {
                    RW.default.mColorRange[0] =  OrangeColor;
                    RW.default.mColorRange[1] =  OrangeColor;
                }
                break;
            case 2:
                // Log("-----|| Chosen Whisp Color: Green ||-----");
                foreach DynamicActors(class'KFMod.RedWhisp', RW)
                {
                    RW.default.mColorRange[0] =  GreenColor;
                    RW.default.mColorRange[1] =  GreenColor;
                }
                break;
            case 3:
                // Log("-----|| Chosen Whisp Color: Blue ||-----");
                foreach DynamicActors(class'KFMod.RedWhisp', RW)
                {
                    RW.default.mColorRange[0] =  BlueColor;
                    RW.default.mColorRange[1] =  BlueColor;
                }
                break;
            case 4:
                // Log("-----|| Chosen Whisp Color: Gold ||-----");
                foreach DynamicActors(class'KFMod.RedWhisp', RW)
                {
                    RW.default.mColorRange[0] =  GoldColor;
                    RW.default.mColorRange[1] =  GoldColor;
                }
                break;
            case 5:
                // Log("-----|| Chosen Whisp Color: Purple ||-----");
                foreach DynamicActors(class'KFMod.RedWhisp', RW)
                {
                    RW.default.mColorRange[0] =  PurpleColor;
                    RW.default.mColorRange[1] =  PurpleColor;
                }
                break;
            case 6:
                // Log("-----|| Chosen Whisp Color: White ||-----");
                foreach DynamicActors(class'KFMod.RedWhisp', RW)
                {
                    RW.default.mColorRange[0] =  WhiteColor;
                    RW.default.mColorRange[1] =  WhiteColor;
                }
                break;
            default:
                // Log("-----|| Chosen Whisp Color: Aqua ||-----");
                foreach DynamicActors(class'KFMod.RedWhisp', RW)
                {
                    RW.default.mColorRange[0] =  AquaColor;
                    RW.default.mColorRange[1] =  AquaColor;
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
	sColor=0
    bRandomColor=false

    // Mandatory Vars
	bAddToServerPackages=True
    bAlwaysRelevant=True
	RemoteRole=ROLE_SimulatedProxy
    bNetNotify=true
}