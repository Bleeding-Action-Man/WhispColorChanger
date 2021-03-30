//=============================================================================
// Base Mutator by Vel-San - Contact on Steam using the following Profile Link
// for more information, feedback, questions or requests
// https://steamcommunity.com/id/Vel-San/
//=============================================================================

class WhispColorChanger extends Mutator Config(WhispColorChanger);

//// Config Vars
var config bool bRandomColor;

// Struct of Whisp Colors declared in Config File
// TODO: Add More Varibales, when needed ;p
struct WhispColors
{
  var config Color cWhispColorHead, cWhispColorTail;
};

// Colors Count
const COLORS_COUNT = 2;

// Colors List to be loaded from Config File
var config WhispColors aColors[COLORS_COUNT];

// Mut Vars
var KFGameType KFGT;
var WhispColorChanger Mut;
var RedWhisp RW;
var WhispColors Colors[COLORS_COUNT];
var bool tmpRandomColor;

replication
{
  unreliable if (Role == ROLE_Authority)
                aColors, Colors,
                bRandomColor, tmpRandomColor;
}

simulated function PostBeginPlay()
{
  // Pointer To self, just in case needed
  Mut = self;
  default.Mut = self;
  class'WhispColorChanger'.default.Mut = self;

  // Var init
  KFGT = KFGameType(Level.Game);
  tmpRandomColor = bRandomColor;

  // Basic Logging
  MutLog("-----|| Random Whisp Color Enabled? " $tmpRandomColor$ " ||-----");
  if(KFGT == none) MutLog("-----|| KFGameType not found! ||-----");

  // Enable Timer & Tick
  SetTimer(1, false);
  Enable('Tick');
}

simulated function Timer()
{
  GetServerVars();
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
      RW.default.mColorRange[0] = Colors[0].cWhispColorHead;
      RW.default.mColorRange[1] = Colors[0].cWhispColorTail;
    }
  }
}

// Any new vars added to the array, will automatically be copied here
simulated function GetServerVars()
{
  MutLog("-----|| Getting Colors from Server ||-----");
  Colors[0] = aColors[0];
  MutLog("-----|| Chosen cWhispColorHead Colors (RGBA): " $Colors[0].cWhispColorHead.R$ "-" $Colors[0].cWhispColorHead.G$ "-" $Colors[0].cWhispColorHead.B$ "-" $Colors[0].cWhispColorHead.A$ " ||-----");
  MutLog("-----|| Chosen cWhispColorTail Colors (RGBA): " $Colors[0].cWhispColorTail.R$ "-" $Colors[0].cWhispColorTail.G$ "-" $Colors[0].cWhispColorTail.B$ "-" $Colors[0].cWhispColorTail.A$ " ||-----");
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