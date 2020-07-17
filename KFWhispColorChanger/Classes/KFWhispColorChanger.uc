//=============================================================================
// Base Mutator by Vel-San - Contact on Steam using the following Profile Link
// for more information, feedback, questions or requests
// https://steamcommunity.com/id/Vel-San/
//=============================================================================

class KFWhispColorChanger extends Mutator Config(KFWhispColorChanger);

//// Vars
var color AquaColor, OrangeColor, GreenColor, BlueColor, GoldColor, PurpleColor, WhiteColor;
//// Config Vars
var config int sColor;
var config bool bRandomColor;

replication
{
	unreliable if (Role == ROLE_Authority)
		sColor, bRandomColor;
}

simulated function PostNetBeginPlay()
{
    super.PostNetBeginPlay();
    MutLog("-----|| sColor: " $sColor$ " || bRandomColor: " $bRandomColor$ " ||-----");

    if (bRandomColor){
        MutLog("-----|| Random Color for Whisp ENABLED ||-----");
    }
    else{
        MutLog("-----|| Random Color for Whisp DISABLED ||-----");
    }
}

simulated function PostNetReceive()
{
    super.PostNetReceive();
    TimeStampLog("-----|| Server Vars Replicated ||-----");
	default.sColor = sColor;
    default.bRandomColor = bRandomColor;
}

simulated function Tick(float dt)
{
    local RedWhisp RW;

    if (bRandomColor){
        foreach DynamicActors(class'KFMod.RedWhisp', RW)
        {
	        RW.default.mColorRange[0] = class'Canvas'.static.MakeColor(rand(255),rand(255),rand(255),255);
	        RW.default.mColorRange[1] = class'Canvas'.static.MakeColor(rand(255),rand(255),rand(255),255);
        }
    }
        else{
            switch(sColor){
                case 0:
                    // MutLog("-----|| Chosen Whisp Color: Aqua ||-----");
                    foreach DynamicActors(class'KFMod.RedWhisp', RW)
                    {
                        RW.default.mColorRange[0] =  AquaColor;
                        RW.default.mColorRange[1] =  AquaColor;
                    }
                    break;
                case 1:
                    // MutLog("-----|| Chosen Whisp Color: Orange ||-----");
                    foreach DynamicActors(class'KFMod.RedWhisp', RW)
                    {
                        RW.default.mColorRange[0] =  OrangeColor;
                        RW.default.mColorRange[1] =  OrangeColor;
                    }
                    break;
                case 2:
                    // MutLog("-----|| Chosen Whisp Color: Green ||-----");
                    foreach DynamicActors(class'KFMod.RedWhisp', RW)
                    {
                        RW.default.mColorRange[0] =  GreenColor;
                        RW.default.mColorRange[1] =  GreenColor;
                    }
                    break;
                case 3:
                    // MutLog("-----|| Chosen Whisp Color: Blue ||-----");
                    foreach DynamicActors(class'KFMod.RedWhisp', RW)
                    {
                        RW.default.mColorRange[0] =  BlueColor;
                        RW.default.mColorRange[1] =  BlueColor;
                    }
                    break;
                case 4:
                    // MutLog("-----|| Chosen Whisp Color: Gold ||-----");
                    foreach DynamicActors(class'KFMod.RedWhisp', RW)
                    {
                        RW.default.mColorRange[0] =  GoldColor;
                        RW.default.mColorRange[1] =  GoldColor;
                    }
                    break;
                case 5:
                    // MutLog("-----|| Chosen Whisp Color: Purple ||-----");
                    foreach DynamicActors(class'KFMod.RedWhisp', RW)
                    {
                        RW.default.mColorRange[0] =  PurpleColor;
                        RW.default.mColorRange[1] =  PurpleColor;
                    }
                    break;
                case 6:
                    // MutLog("-----|| Chosen Whisp Color: White ||-----");
                    foreach DynamicActors(class'KFMod.RedWhisp', RW)
                    {
                        RW.default.mColorRange[0] =  WhiteColor;
                        RW.default.mColorRange[1] =  WhiteColor;
                    }
                    break;
                default:
                    // MutLog("-----|| Chosen Whisp Color: Aqua ||-----");
                    foreach DynamicActors(class'KFMod.RedWhisp', RW)
                    {
                        RW.default.mColorRange[0] =  AquaColor;
                        RW.default.mColorRange[1] =  AquaColor;
                    }
            }
        }
}

simulated function TimeStampLog(coerce string s)
{
    log("["$Level.TimeSeconds$"s]" @ s, 'WhispColorChanger');
}

simulated function MutLog(string s)
{
    log(s, 'WhispColorChanger');
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
			return "If enabled, path will be changed dynamically every 1 second | This ignores the 'Static Color' option!";
		default:
			return Super.GetDescriptionText(SettingName);
	}
}

defaultproperties
{
    // Mut Info
    GroupName="KF-WhispColorChanger"
    FriendlyName="Whisp Color Changer - v3.0"
    Description="Changes the Color of Trader Path; - By Vel-San"

    // Mut Vars
	sColor=0
    bRandomColor=false

    // Colors
    AquaColor = (R=0,G=255,B=255,A=255)
    GreenColor = (R=0,G=255,B=0,A=255)
    BlueColor = (R=0,G=0,B=255,A=255)
    OrangeColor = (R=255,G=109,B=5,A=255)
    GoldColor = (R=255,G=255,B=0,A=255)
    PurpleColor = (R=255,G=0,B=255,A=255)
    WhiteColor = (R=255,G=255,B=255,A=255)

    // Mandatory Vars
	bAddToServerPackages=True
    bAlwaysRelevant=True
	RemoteRole=ROLE_SimulatedProxy
    bNetNotify=true
}