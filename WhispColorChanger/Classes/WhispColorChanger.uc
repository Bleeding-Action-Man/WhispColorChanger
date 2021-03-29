//=============================================================================
// Base Mutator by Vel-San - Contact on Steam using the following Profile Link
// for more information, feedback, questions or requests
// https://steamcommunity.com/id/Vel-San/
//=============================================================================

class WhispColorChanger extends Mutator Config(WhispColorChanger);

//// Config Vars
var() config bool bDebug, bRandomColor, bIsWhispActive;
var() config Color cWispColor;

// Mut Vars
var KFGameType KFGT;
var WhispColorChanger Mut;

function PostBeginPlay()
{
  super.PostBeginPlay();

  // Pointer To self, just in case needed
  Mut = self;
  default.Mut = self;
  class'WhispColorChanger'.default.Mut = self;

  // Var init
  KFGT = KFGameType(Level.Game);
  bIsWhispActive = false;

  // Basic Logging
  MutLog("-----|| Chosen Color: " $cWispColor$ " || bRandomColor?: " $bRandomColor$ " ||-----");
  if(KFGT == none) MutLog("-----|| KFGameType not found! ||-----");

  // Enable Tick
  Enable('Tick');
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
  if(RedWhisp(Other)!=None)
  {
    MutLog("-----|| Red Whisp Class Detected ||-----");
  }
  return true;
}

/*
function Tick(float dt)
{
  if (!KFGT.bWaveInProgress && !KFGT.IsInState('PendingMatch') && !KFGT.IsInState('GameEnded'))
  {
    if(!bIsWhispActive) ChangeWhispColor();
  }
  else
  {
    bIsWhispActive = false;
  }

  local RedWhisp RW;

  if (bRandomColor)
    {
      foreach DynamicActors(class'KFMod.RedWhisp', RW)
        {
          RW.default.mColorRange[0] = class'Canvas'.static.MakeColor(rand(255),rand(255),rand(255),255);
          RW.default.mColorRange[1] = class'Canvas'.static.MakeColor(rand(255),rand(255),rand(255),255);
        }
    }
  else
    {
      // MutLog("-----|| Chosen Whisp Color: Aqua ||-----");
      foreach DynamicActors(class'KFMod.RedWhisp', RW)
        {
          RW.default.mColorRange[0] =  AquaColor;
          RW.default.mColorRange[1] =  AquaColor;
        }
    }
}
*/

function TimeStampLog(coerce string s)
{
  log("["$Level.TimeSeconds$"s]" @ s, 'WhispColorChanger');
}

function MutLog(string s)
{
  log(s, 'WhispColorChanger');
}

defaultproperties
{
  // Mut Info
  GroupName="KF-WhispColorChanger"
  FriendlyName="Whisp Color Changer - v3.1"
  Description="Changes the Color of Trader Path; - By Vel-San"

  // Colors
  AquaColor = (R=0,G=255,B=255,A=255)
  GreenColor = (R=0,G=255,B=0,A=255)
  BlueColor = (R=0,G=0,B=255,A=255)
  OrangeColor = (R=255,G=109,B=5,A=255)
  GoldColor = (R=255,G=255,B=0,A=255)
  PurpleColor = (R=255,G=0,B=255,A=255)
  WhiteColor = (R=255,G=255,B=255,A=255)
}