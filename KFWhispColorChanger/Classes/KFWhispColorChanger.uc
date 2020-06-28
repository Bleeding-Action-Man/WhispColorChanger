//=============================================================================
// Base Mutator by Vel-San - Contact on Steam using the following Profile Link
// for more information, feedback, questions or requests please contact
// https://steamcommunity.com/id/Vel-San/
//=============================================================================

class KFWhispColorChanger extends Mutator Config(KFWhispColorChanger);

//// Vars
var color AquaColor, OrangeColor, GreenColor, BlueColor, GoldColor, PurpleColor, WhiteColor;
//// Config Vars
var() config int sColor;

function PostBeginPlay ()
{
    AquaColor = default.AquaColor;
    OrangeColor = default.OrangeColor;
    GreenColor = default.GreenColor;
    BlueColor = default.BlueColor;
    GoldColor = default.GoldColor;
    PurpleColor = default.PurpleColor;
    WhiteColor = default.WhiteColor;

    switch(sColor){
        case 1:
            Log("Chosen Whisp Color: " $sColor);
            Class'RedWhisp'.default.mColorRange[0] = OrangeColor;
            Class'RedWhisp'.default.mColorRange[1] = OrangeColor;
            Log("Whisp Color Changed");
            break;
        case 2:
            Log("Chosen Whisp Color: " $sColor);
            Class'RedWhisp'.default.mColorRange[0] = GreenColor;
            Class'RedWhisp'.default.mColorRange[1] = GreenColor;
            Log("Whisp Color Changed");
            break;
        case 3:
            Log("Chosen Whisp Color: " $sColor);
            Class'RedWhisp'.default.mColorRange[0] = BlueColor;
            Class'RedWhisp'.default.mColorRange[1] = BlueColor;
            Log("Whisp Color Changed");
            break;
        case 4:
            Log("Chosen Whisp Color: " $sColor);
            Class'RedWhisp'.default.mColorRange[0] = GoldColor;
            Class'RedWhisp'.default.mColorRange[1] = GoldColor;
            Log("Whisp Color Changed");
            break;
        case 5:
            Log("Chosen Whisp Color: " $sColor);
            Class'RedWhisp'.default.mColorRange[0] = PurpleColor;
            Class'RedWhisp'.default.mColorRange[1] = PurpleColor;
            Log("Whisp Color Changed");
            break;
        case 6:
            Log("Chosen Whisp Color: " $sColor);
            Class'RedWhisp'.default.mColorRange[0] = WhiteColor;
            Class'RedWhisp'.default.mColorRange[1] = WhiteColor;
            Log("Whisp Color Changed");
            break;
        default:
            Log("Chosen Whisp Color: " $sColor);
            Class'RedWhisp'.default.mColorRange[0] = AquaColor;
            Class'RedWhisp'.default.mColorRange[1] = AquaColor;
            Log("Whisp Color Changed");
    }
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
	Super.FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting("KFWhispColorChanger", "sColor", "Trader Path Color", 0, 0, "select", "0;@øøAqua;1;ø€@Orange;2;@ø@Green;3;@@øBlue;4;øø@Gold;5;ø@øPurple;6;White");
}

static function string GetDescriptionText(string SettingName)
{
	switch(SettingName)
	{
		case "sColor":
			return "Pick a color from this list";
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
	// Colors of the Path
    AquaColor=(R=0,G=255,B=255,A=255)
    GreenColor=(R=0,G=255,B=0,A=255)
    BlueColor=(R=0,G=0,B=255,A=255)
    OrangeColor=(R=255,G=109,B=5,A=255)
    GoldColor=(R=255,G=255,B=0,A=255)
    PurpleColor=(R=255,G=0,B=255,A=255)
    WhiteColor=(R=255,G=255,B=255,A=255)

    // Mandatory Vars
	bAddToServerPackages=True
    bAlwaysRelevant=True
    RemoteRole=ROLE_SimulatedProxy
}