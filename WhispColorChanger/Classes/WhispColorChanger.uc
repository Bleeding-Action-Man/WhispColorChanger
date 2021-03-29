//=============================================================================
// Base Mutator by Vel-San - Contact on Steam using the following Profile Link
// for more information, feedback, questions or requests
// https://steamcommunity.com/id/Vel-San/
//=============================================================================

class WhispColorChanger extends Mutator Config(WhispColorChanger);

//// Config Vars
var() config bool bRandomColor;
var() config Color cWhispColor;

// Mut Vars
var KFGameType KFGT;
var WhispColorChanger Mut;
var RedWhisp RW;

var color tmpWhispColor;
var bool tmpRandomColor;

replication
{
	unreliable if (Role == ROLE_Authority)
		                      tmpWhispColor,
                          tmpRandomColor;
}

simulated function PostBeginPlay()
{
  // Pointer To self, just in case needed
  Mut = self;
  default.Mut = self;
  class'WhispColorChanger'.default.Mut = self;

  // Var init
  KFGT = KFGameType(Level.Game);
  tmpWhispColor = cWhispColor;
  tmpRandomColor = bRandomColor;

  // Basic Logging
  MutLog("-----|| Chosen Color (RGBA): " $tmpWhispColor.R$ "-" $tmpWhispColor.G$ "-" $tmpWhispColor.B$ "-" $tmpWhispColor.A$ " || Random Color Enabled? " $tmpRandomColor$ " ||-----");
  if(KFGT == none) MutLog("-----|| KFGameType not found! ||-----");

  // Enable Tick
  Enable('Tick');
}

simulated function Tick(float dt)
{
  if (!KFGT.bWaveInProgress && !KFGT.IsInState('PendingMatch') && !KFGT.IsInState('GameEnded'))
  {
    ChangeWhispColor();
  }
}

// TODO: Need to find a way to replace foreach, and do the color change just once?
simulated function ChangeWhispColor()
{
  // MutLog("-----|| Whisp Color Changer Spawned & Activated ||-----");

  if (tmpRandomColor)
    {
      // MutLog("-----|| Random-Colored Whisp is active ||-----");
      foreach DynamicActors(class'KFMod.RedWhisp', RW)
        {
          RW.default.mColorRange[0] = class'Canvas'.static.MakeColor(rand(255),rand(255),rand(255),255);
          RW.default.mColorRange[1] = class'Canvas'.static.MakeColor(rand(255),rand(255),rand(255),255);
        }
    }
  else
    {
      // MutLog("-----|| Single-Colored Whisp is active ||-----");
      foreach DynamicActors(class'KFMod.RedWhisp', RW)
        {
          RW.default.mColorRange[0] = tmpWhispColor;
          RW.default.mColorRange[1] = tmpWhispColor;
        }
    }
}

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
	bAddToServerPackages=true
  bNetNotify=true
  RemoteRole=ROLE_SimulatedProxy
	bAlwaysRelevant=true

  // Colors
  /*
  AquaColor = (R=0,G=255,B=255,A=255)
  GreenColor = (R=0,G=255,B=0,A=255)
  BlueColor = (R=0,G=0,B=255,A=255)
  OrangeColor = (R=255,G=109,B=5,A=255)
  GoldColor = (R=255,G=255,B=0,A=255)
  PurpleColor = (R=255,G=0,B=255,A=255)
  WhiteColor = (R=255,G=255,B=255,A=255)
  */
}