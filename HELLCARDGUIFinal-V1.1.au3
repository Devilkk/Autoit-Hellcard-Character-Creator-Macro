; *** Start added by AutoIt3Wrapper ***
#include <EditConstants.au3>
#include <StaticConstants.au3>
; *** End added by AutoIt3Wrapper ***
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Hellcard_logo.ico
#AutoIt3Wrapper_Res_Comment=Disclaimer: Not created or maintained by Return 2 Games or Thing Trunk. All Rights Reserved to the icon used belong to Thing Trunk/Return 2 Games.
#AutoIt3Wrapper_Res_Description=Macro functions for Thing Trunks Hellcard Game
#AutoIt3Wrapper_Res_Fileversion=1.1.0.0
#AutoIt3Wrapper_Res_ProductName=Hellcard Character Creator
#AutoIt3Wrapper_Res_ProductVersion=1.1.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Hellcard Character Creator © 2023 by Devilkk is licensed under GNU GPLv3. You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
#AutoIt3Wrapper_Add_Constants=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;Disclaimer: Not created or maintained by Return 2 Games or Thing Trunk. All Rights Reserved to the icon used belong to Thing Trunk/Return 2 Games.
;Created By Devilkk#2649 - https://steamcommunity.com/id/Devil_Ninja/
;https://github.com/Devilkk
;https://www.buymeacoffee.com/Devilkk
#include <GuiConstants.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Global $Paused = "OFF", $MPSP = 1
Global $Disclaimer
Global $Sleeps[5][2] = [["Sleeps A", 50], ["Sleeps B", 100], ["Sleeps C", 250], ["Sleeps D", 500], ["Sleeps E", 800]]
;Resolution Start
Global $Resolution4K[20][3] = [["CreateNew", 625, 1905], ["Rogue", 650, 640], ["Mage", 945, 640], ["Artifact 1", 2840, 1620], ["Artifact 2", 2980, 1620], ["Artifact 3", 3120, 1620], ["Artifact 4", 3260, 1620], ["Artifact 5", 3395, 1620], ["VetPin", 3535, 1620], ["Torment", 3180, 1260], ["Drag1Start", 3083, 1090], ["Drag1Stop", 3083, 1090], ["Drag2Start", 3083, 1090], ["Drag2Stop", 3083, 1535], ["TormentOk", 1700, 1673], ["Create", 1920, 2005], ["Retire", 3195, 1900], ["Yes", 2195, 1380], ["MPDetails", 3180, 1660], ["SPDetails", 3180, 1235]]
Global $TClickX4K = 1455
Global $TClickY4K[18] = [790, 910, 1030, 1150, 1270, 1390, 795, 915, 1035, 1155, 1275, 1395, 810, 930, 1050, 1170, 1290, 1410]
Global $Resolution1K[20][3] = [["CreateNew", 325, 945], ["Rogue", 325, 320], ["Mage", 470, 320], ["Artifact 1", 1420, 810], ["Artifact 2", 1490, 810], ["Artifact 3", 1560, 810], ["Artifact 4", 1630, 810], ["Artifact 5", 1695, 810], ["VetPin", 1765, 810], ["Torment", 1590, 625], ["Drag1Start", 1540, 320], ["Drag1Stop", 1540, 545], ["Drag2Start", 1540, 545], ["Drag2Stop", 1540, 770], ["TormentOk", 850, 830], ["Create", 960, 1000], ["Retire", 1595, 950], ["Yes", 1095, 690], ["MPDetails", 1590, 830], ["SPDetails", 1590, 615]]
Global $TClickX1K = 725
Global $TClickY1K[18] = [390, 450, 510, 570, 630, 690, 390, 450, 510, 570, 630, 690, 390, 450, 510, 570, 630, 690]
Global $ResolutionOther[20][3] = [["CreateNew", 0, 0], ["Rogue", 0, 0], ["Mage", 0, 0], ["Artifact 1", 0, 0], ["Artifact 2", 0, 0], ["Artifact 3", 0, 0], ["Artifact 4", 0, 0], ["Artifact 5", 0, 0], ["VetPin", 0, 0], ["Torment", 0, 0], ["Drag1Start", 0, 0], ["Drag1Stop", 0, 0], ["Drag2Start", 0, 0], ["Drag2Stop", 0, 0], ["TormentOk", 0, 0], ["Create", 0, 0], ["Retire", 0, 0], ["Yes", 0, 0], ["MPDetails", 0, 0], ["SPDetails", 0, 0]]
Global $TClickXOther = 0
Global $TClickYOther[18] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $ResUse = $Resolution1K, $TClickXUse = $TClickX1K, $TClickYUse = $TClickY1K, $RISet = 0, $TISet = 0
;Resolution End
;Checks start
;Resolution 0: Name, 1: Check, 2: 1/0
Global $ResCheck[3][3] = [["4K", 0, 0], ["1080P", 0, 0], ["Other", 0, 0]]
;Classes 0: Name, 1: Check, 2: 1/0
Global $Classes[3][3] = [["Warrior", 0, 0], ["Rogue", 0, 0], ["Mage", 0, 0]]
;Artifact 0: Name, 1: Check, 2: 1/0, 3: cost
Global $Artifact[6][4] = [["Artifact 1", 0, 0, 1], ["Artifact 2", 0, 0, 1], ["Artifact 3", 0, 0, 1], ["Artifact 4", 0, 0, 2], ["Artifact 5", 0, 0, 2], ["VetPin", 0, 0, 3]]
Global $ArtifactTip[6] = ["Artifact 1 - Cost: 1 Gem" & @CRLF & @CRLF & "Warrior:" & @CRLF & "Talking Scabbard" & @CRLF & "Transform one Sword Slash into Heavy Sword." & @CRLF & @CRLF & "Rogue:" & @CRLF & "Brass Cog" & @CRLF & "Transform one Sharp Arrow into Rogue Tactics." & @CRLF & @CRLF & "Mage:" & @CRLF & "Prism" & @CRLF & "Transform one Magic Bolt into a Comet rune.", "Artifact 2 - Cost: 1 Gem" & @CRLF & @CRLF & "Warrior:" & @CRLF & "Unagi" & @CRLF & "Start each battle with 5 Stamina points." & @CRLF & @CRLF & "Rogue:" & @CRLF & "Salt" & @CRLF & "Gain 1 mana every 5th summoned card played." & @CRLF & @CRLF & "Mage:" & @CRLF & "Little Helper" & @CRLF & "Draw 1 additional card when you draw a Status (black) card.", "Artifact 3 - Cost: 1 Gem" & @CRLF & @CRLF & "Warrior:" & @CRLF & "Tankard" & @CRLF & "Add Camaraderie and Fool's Guard cards to deck." & @CRLF & @CRLF & "Rogue:" & @CRLF & "Horse's Head" & @CRLF & "Add Death Mark and Osoto Gari cards to deck." & @CRLF & @CRLF & "Mage:" & @CRLF & "Cockade" & @CRLF & "Add Cold Arm and Brutal Thaw to deck.", "Artifact 4 - Cost: 2 Gem" & @CRLF & @CRLF & "Warrior:" & @CRLF & "Sun" & @CRLF & "Get 1 additional mana at the start of your next turn if you got damaged this turn." & @CRLF & @CRLF & "Rogue:" & @CRLF & "Golden Onion" & @CRLF & "After every battle one random Location of yours is lowered by 1 gemstone." & @CRLF & @CRLF & "Mage:" & @CRLF & "Acorn" & @CRLF & "Get 10 block after using Bolts 3 times in a turn.", "Artifact 5 - Cost: 2 Gem" & @CRLF & @CRLF & "Warrior:" & @CRLF & "Unripe Banana" & @CRLF & "Get 3 block for every mana point left when ending your turn." & @CRLF & @CRLF & "Rogue:" & @CRLF & "Grabber" & @CRLF & "Add 1 random Bomb to your hand at the start of your turn." & @CRLF & @CRLF & "Mage:" & @CRLF & "Spacious Sleeve" & @CRLF & "Add 1 random Scroll to your hand at the start of your turn.", "Artifact 6 - Cost: 3 Gem" & @CRLF & @CRLF & "Veteran Pin" & @CRLF & "Discard whole deck. Pick up 4 random starters, 4 random common cards and 1 random rare card instead."]
;StamBurst 0: Name, 1: X pos, 2: Y pos
Global $StamBurst[2][3] = [["Card down", 0, 0], ["Card up", 0, 0]]
;Torments 0: Name, 1: Check, 2: 1/0, 3: cost
Global $Torments[18][4] = [["Distracted", 0, 0, 3], ["Inflation", 0, 0, 3], ["Pacifist", 0, 0, 3], ["Scatterbrained", 0, 0, 3], ["Anemic", 0, 0, 2], ["Bleeding", 0, 0, 2], ["Brainfogged", 0, 0, 2], ["Clumsy", 0, 0, 2], ["Hoarder", 0, 0, 2], ["OutofStock", 0, 0, 2], ["Reckless", 0, 0, 2], ["Sickly", 0, 0, 2], ["Blighted", 0, 0, 1], ["Doomed", 0, 0, 1], ["Fatigued", 0, 0, 1], ["Feeble", 0, 0, 1], ["LimitedHealthcare", 0, 0, 1], ["Restock", 0, 0, 1]]
Global $TormentTip[18] = ["You can only use 1 Location option after each battle", "Every location option increases cost with each use", "Get a random Status card when you kill a monster", "Lose all gemstones at the beginning of every battle", "Your monsters get +50% health (no less than +3 Max HP)", "You get 3 damage every turn", "A random card in hand costs 1 mana more each turn", "You draw 1 card less each turn", "You lose 5 HP when skipping card reward", "One random option is disabled in each location after every battle", "You cannot have more than 10 block", "Your monsters are 50% stronger (no less than +3 str)", "All attacks on you deal +1 damage", "2 Delusion cards in the starting deck", "Your bosses get +50% health and are 50% stronger (no less than +3 Max HP and +3 str)", "5 less Max HP on start", "You can only heal 2 times in a Camp during the whole run", "Picking an option in a Location makes it temporarily unavailable for the next visit"]
Global $TormentCountcheck, $TormentCount = 0, $TormentCountp = $TormentCount
Global $TG0, $TG1, $TG2, $TG3
;Checks End
Global $CharCreateLabel, $CharCreateInputBox, $CharCreateInput = 10, $CharCreateTotalCountLabel, $CharCreateTotalCount = 0

$HCCGUI = GUICreate("Hellcard Character Creator", 450, 300)
;Menu Start
$MenuChooseRes = GUICtrlCreateMenu("Choose Resolution")
For $i = 0 To UBound($ResCheck) - 1
    $ResCheck[$i][1] = GUICtrlCreateMenuItem($ResCheck[$i][0] & " Res", $MenuChooseRes, $i, 1)
Next
GUICtrlSetState($ResCheck[1][1], $GUI_CHECKED)
$MenuResOther = GUICtrlCreateMenu("Res Other Inputs")
$MRORI = GUICtrlCreateMenuItem("Res Input GUI", $MenuResOther)
$MROTI = GUICtrlCreateMenuItem("Torment Input GUI", $MenuResOther)
$MenuDetails = GUICtrlCreateMenu("MP/SP Cards&Details")
$MDMP = GUICtrlCreateMenuItem("Multiplayer Details", $MenuDetails, 0, 1)
$MDSP = GUICtrlCreateMenuItem("Singleplayer Details", $MenuDetails, 1, 1)
GUICtrlSetState($MDMP, $GUI_CHECKED)
$MenuSleeps = GUICtrlCreateMenu("Sleeps")
$MenuSleeps = GUICtrlCreateMenuItem("Sleeps", $MenuSleeps)
$MenuHelp = GUICtrlCreateMenu("Help")
$MHHotkeys = GUICtrlCreateMenuItem("Hotkeys", $MenuHelp)
$MHResOther = GUICtrlCreateMenuItem("Res Other", $MenuHelp)
$MHAbout = GUICtrlCreateMenuItem("About", $MenuHelp)
;Menu End
;Main GUI Start
GUIStartGroup()
For $i = 0 To UBound($Classes) - 1
    $Classes[$i][1] = GUICtrlCreateRadio($Classes[$i][0], 5 + ($i * 150), 5, 100, 25)
Next
GUICtrlSetState($Classes[0][1], $GUI_CHECKED)
GUIStartGroup()
For $i = 0 To UBound($Artifact) - 1
    $Artifact[$i][1] = GUICtrlCreateCheckbox($Artifact[$i][0], 5 + Mod($i, 3) * 150, 30 + Int($i / 3) * 25, 150, 25)
    $ArtifactTip[$i] = GUICtrlSetTip($Artifact[$i][1], $ArtifactTip[$i])
Next
GUIStartGroup()
For $i = 0 To UBound($Torments) - 1
    $Torments[$i][1] = GUICtrlCreateCheckbox($Torments[$i][0] & " (" & $Torments[$i][3] & " cost)", 5 + Int($i / 6) * 150, 80 + Mod($i, 6) * 25, 150, 25)
    $TormentTip[$i] = GUICtrlSetTip($Torments[$i][1], $TormentTip[$i])
Next
GUIStartGroup()
$CharCreateLabel = GUICtrlCreateLabel("Create Amount", 5, 250, 75, 25)
$CharCreateInputBox = GUICtrlCreateInput($CharCreateInput, 95, 250, 40, 20, BitOR($ES_NUMBER, $ES_CENTER))
GUICtrlSetLimit($CharCreateInputBox, 2)
GUICtrlCreateUpdown($CharCreateInputBox)
GUICtrlSetLimit(-1, 99)
$TormentCountcheck = GUICtrlCreateLabel("Torment Count " & $TormentCountp, 150, 250, 100, 25, $SS_CENTER)
$CharCreateTotalCountLabel = GUICtrlCreateLabel("Total Created " & $CharCreateTotalCount, 325, 250, 150, 25)
;Main GUI End

$Disclaimer = MsgBox($MB_SYSTEMMODAL & $MB_YESNO, "Disclaimer:", "Terms of use" & @CRLF & @CRLF & "By using this tool/program you agree to the following:" & @CRLF & @CRLF & "This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version." & @CRLF & "This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details." & @CRLF & @CRLF & "You understand that this tool/program is neither made by nor affiliated with Thing Trunk and is to be considered Third Party." & @CRLF & @CRLF & "Intended usage:" & @CRLF & "For (Hellcard by https://thingtrunk.com/) to be opened in fullscreen or windowed fullscreen." & @CRLF & "For all 18 Torments to be unlocked." & @CRLF & "This tool is a macro which simulates usage of your mouse and keyboard, during which you should avoid using while it is running functions." & @CRLF & @CRLF & "By clicking Yes you agree to the terms and use of this tool." & @CRLF & "If you do not agree with these terms click No." & @CRLF & @CRLF & "Hellcard Character Creator © 2023 by Devilkk is licensed under GNU GPLv3. You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>." & @CRLF & @CRLF & "https://github.com/Devilkk/Autoit-Hellcard-Character-Creator-Macro" & @CRLF & "https://www.buymeacoffee.com/Devilkk")
If $Disclaimer = 6 Then
HotKeySet("{F3}", "CharCreation")
HotKeySet("{F4}", "Pause")
HotKeySet("{F5}", "Terminate")
HotKeySet("{F6}", "CharDeletion")
HotKeySet("{F7}", "CharDetails")
HotKeySet("{F8}", "StamBurst")
HotKeySet("{F9}", "GMP")
Else
Terminate()
EndIf

Func CharCreation()
HKUS()
TGC()
$CharCreateInput = GUICtrlRead($CharCreateInputBox)
While $CharCreateInput > 0
If $Paused = "OFF" Then
WAHC()
;--------------------------------------------------
;create new character
MouseClick ("left", $ResUse[0][1], $ResUse[0][2], 1, 0)
Sleep($Sleeps[4][1])
;--------------------------------------------------
If $Classes[1][2] = 1 Then
MouseClick("left", $ResUse[1][1], $ResUse[1][2], 1, 0)
Sleep($Sleeps[0][1])
EndIf
If $Classes[2][2] = 1 Then
MouseClick("left", $ResUse[2][1], $ResUse[2][2], 1, 0)
Sleep($Sleeps[0][1])
EndIf
;--------------------------------------------------
;click artifacts
If $Artifact[0][2] = 1 Then
MouseClick ("left", $ResUse[3][1], $ResUse[3][2], 1, 0)
Sleep($Sleeps[0][1])
EndIf
If $Artifact[1][2] = 1 Then
MouseClick ("left", $ResUse[4][1], $ResUse[4][2], 1, 0)
Sleep($Sleeps[0][1])
EndIf
If $Artifact[2][2] = 1 Then
MouseClick ("left", $ResUse[5][1], $ResUse[5][2], 1, 0)
Sleep($Sleeps[0][1])
EndIf
If $Artifact[3][2] = 1 Then
MouseClick ("left", $ResUse[6][1], $ResUse[6][2], 1, 0)
Sleep($Sleeps[0][1])
EndIf
If $Artifact[4][2] = 1 Then
MouseClick ("left", $ResUse[7][1], $ResUse[7][2], 1, 0)
Sleep($Sleeps[0][1])
EndIf
If $Artifact[5][2] = 1 Then
MouseClick ("left", $ResUse[8][1], $ResUse[8][2], 1, 0)
Sleep($Sleeps[0][1])
EndIf
;--------------------------------------------------
;click torment
    If $TG0 = 1 Then
MouseClick ("left", $ResUse[9][1], $ResUse[9][2], 1, 0)
Sleep($Sleeps[3][1])
;--------------------------------------------------
;select torment below
If $TG1 = 1 Then
For $i = 0 to 5
If $Torments[$i][2] = 1 Then
MouseClick ("left", $TClickXUse, $TClickYUse[$i], 1, 0)
Sleep($Sleeps[0][1])
EndIf
Next
EndIf
;--------------------------------------------------
;drag to second group
If ($TG2 = 1) or ($TG3 = 1) Then
MouseClickDrag ("left", $ResUse[10][1], $ResUse[10][2], $ResUse[11][1], $ResUse[11][2], 0)
Sleep($Sleeps[1][1])
EndIf
;--------------------------------------------------
If $TG2 = 1 Then
For $i = 6 to 11
If $Torments[$i][2] = 1 Then
MouseClick ("left", $TClickXUse, $TClickYUse[$i], 1, 0)
Sleep($Sleeps[0][1])
EndIf
Next
EndIf
;--------------------------------------------------
;drag to third group
If $TG3 = 1 Then
MouseClickDrag ("left", $ResUse[12][1], $ResUse[12][2], $ResUse[13][1], $ResUse[13][2], 0)
Sleep($Sleeps[1][1])
;--------------------------------------------------
For $i = 12 to 17
If $Torments[$i][2] = 1 Then
MouseClick ("left", $TClickXUse, $TClickYUse[$i], 1, 0)
Sleep($Sleeps[0][1])
EndIf
Next
EndIf
;--------------------------------------------------
;torment ok
MouseClick ("left", $ResUse[14][1], $ResUse[14][2], 1, 0)
Sleep($Sleeps[3][1])
    EndIf
;--------------------------------------------------
;create below
MouseClick ("left", $ResUse[15][1], $ResUse[15][2], 1, 0)
Sleep($Sleeps[3][1])
$CharCreateInput -= 1
GUICtrlSetData($CharCreateInputBox, $CharCreateInput)
$CharCreateTotalCount += 1
GUICtrlSetData($CharCreateTotalCountLabel, "Total Created " & $CharCreateTotalCount)
Else
$Paused = "ON"
ExitLoop
EndIf
WEnd
$Paused = "OFF"
If $CharCreateInput = 0 Then
GUICtrlSetData($CharCreateInputBox, 10)
EndIf
HKS()
EndFunc

Func CharDeletion()
HKUS()
Local $aPos = MouseGetPos()
;delete current character from inside card detail
WAHC()
Send("{ESC}")
Sleep($Sleeps[3][1])
MouseClick ("left", $ResUse[16][1], $ResUse[16][2], 1, 0)
Sleep($Sleeps[3][1])
MouseClick ("left", $ResUse[17][1], $ResUse[17][2], 1, 0)
Sleep($Sleeps[0][1])
MouseMove($aPos[0], $aPos[1])
Sleep($Sleeps[0][1])
MouseClick ("left")
Sleep($Sleeps[0][1])
HKS()
CharDetails()
EndFunc

Func CharDetails()
HKUS()
Local $aPos = MouseGetPos()
;press card details
WAHC()
If $MPSP = 1 Then
MouseClick ("left", $ResUse[18][1], $ResUse[18][2], 1, 0)
Sleep($Sleeps[0][1])
Else
MouseClick ("left", $ResUse[19][1], $ResUse[19][2], 1, 0)
Sleep($Sleeps[0][1])
EndIf
MouseMove($aPos[0], $aPos[1])
Sleep($Sleeps[0][1])
HKS()
EndFunc

Func StamBurst()
HKUS()
GetSBI()
WAHC()
While 1
If $Paused = "OFF" Then
MouseMove($StamBurst[0][1], $StamBurst[0][2], 1)
Sleep($Sleeps[1][1])
MouseDown("left")
Sleep($Sleeps[1][1])
MouseMove($StamBurst[1][1], $StamBurst[1][2], 1)
Sleep($Sleeps[1][1])
MouseUp("left")
Sleep($Sleeps[1][1])
Else
ExitLoop
EndIf
WEnd
$Paused = "OFF"
HKS()
EndFunc

Func Pause()
    If $Paused = "OFF" Then 
        $Paused = "ON"
    Else 
        $Paused = "OFF"
    EndIf
EndFunc

GUISetState()
While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            ExitLoop
        Case $ResCheck[0][1], $ResCheck[1][1], $ResCheck[2][1]
            For $i = 0 To UBound($ResCheck) - 1
                $ResCheck[$i][2] = IsChecked($ResCheck[$i][1])
            Next
            Select
                Case $ResCheck[0][2] = 1
                $ResUse = $Resolution4K
                $TClickXUse = $TClickX4K
                $TClickYUse = $TClickY4K
                Case $ResCheck[1][2] = 1
                $ResUse = $Resolution1K
                $TClickXUse = $TClickX1K
                $TClickYUse = $TClickY1K
                Case ($ResCheck[2][2] = 1) And ($RISet = 0) And ($TISet = 0)
                GetRI()
                GetTI()
                GUICtrlSetState($ResCheck[2][1], $GUI_UNCHECKED)
                GUICtrlSetState($ResCheck[1][1], $GUI_CHECKED)
                Case ($ResCheck[2][2] = 1) And ($RISet = 0) And ($TISet = 1)
                GetRI()
                GUICtrlSetState($ResCheck[2][1], $GUI_UNCHECKED)
                GUICtrlSetState($ResCheck[1][1], $GUI_CHECKED)
                Case ($ResCheck[2][2] = 1) And ($RISet = 1) And ($TISet = 0)
                GetTI()
                GUICtrlSetState($ResCheck[2][1], $GUI_UNCHECKED)
                GUICtrlSetState($ResCheck[1][1], $GUI_CHECKED)
                Case ($ResCheck[2][2] = 1) And ($RISet = 1) And ($TISet = 1)
                $ResUse = $ResolutionOther
                $TClickXUse = $TClickXOther
                $TClickYUse = $TClickYOther
            EndSelect
        Case $Classes[0][1], $Classes[1][1], $Classes[2][1]
            For $i = 0 To UBound($Classes) - 1
                $Classes[$i][2] = IsChecked($Classes[$i][1])
            Next
        Case $Artifact[0][1], $Artifact[1][1], $Artifact[2][1], $Artifact[3][1], $Artifact[4][1], $Artifact[5][1]
            For $i = 0 To UBound($Artifact) - 1
                $Artifact[$i][2] = IsChecked($Artifact[$i][1])
            Next
            $cost = 0
            For $i = 0 To UBound($Artifact) - 1
                If $Artifact[$i][2] Then
                    $cost += $Artifact[$i][3]
                EndIf
            Next
            For $i = 0 To UBound($Artifact) - 1
                If $Artifact[$i][2] Then
                    ContinueLoop
                EndIf
                If $cost + $Artifact[$i][3] <= 3 Then
                    GUICtrlSetState($Artifact[$i][1], $GUI_ENABLE)
                Else
                    GUICtrlSetState($Artifact[$i][1], $GUI_DISABLE)
                EndIf
            Next
        Case $MDMP
            $MPSP = 1
        Case $MDSP
            $MPSP = 0
        Case $MRORI
        GetRI()
        Case $MROTI
        GetTI()
        Case $MenuSleeps
        GetSlI()
        Case $MHHotkeys
        MsgBox($MB_APPLMODAL, "Hotkey Information", "F3: Character Creation: From either the multiplayer or singleplayer screens, will create new character with veteran pin for the selected class and torments." & @CRLF & @CRLF & "F4: Pause: Will cause the function to stop after its current loop finishes." & @CRLF & @CRLF & "F5: Terminate: Closes the application." & @CRLF & @CRLF & "F6: Character Deletion: Starting from the cards & details screen, saves mouse position, presses ESC, deletes the character, returns to mouse position and clicks then runs F7." & @CRLF & @CRLF & "F7: Character Details: While saving and returning to current mouse position uses the Details Multiplayer/Singleplayer option to choose which cards & details location to click to open." & @CRLF & @CRLF & "F8: Stamina Burst: Used to continually play the same card over and over. Somewhat slower than human input." & @CRLF & @CRLF & "F9: Get Mouse Position: Opens message box with the X/Y coordinates of the mouse position.")
        Case $MHResOther
        MsgBox($MB_APPLMODAL, "Res Other Information", "If you are playing in a resolution other than fullscreen 4K or 1080p, you will have to manually input the click coordinates to be used by using the F9 hotkey." & @CRLF & "In the current iteration of this program these points are not saved between sessions and therefore require the user to either screenshot them or save them in a .txt file for future reference." & @CRLF & @CRLF & "Resolution Coordinate Input: Move the mouse to the center of each button and press the F9 key. Enter the X in the left input and Y in the right input. Drag1 refers to the torment scroll from the top to mid way. Drag2 refers to moving it from midway to the bottom." & @CRLF & @CRLF & "Torments Coordinate Input: The X value is only required once at the bottom as it is the same for all Y values entered above.")
        Case $MHAbout
        MsgBox($MB_APPLMODAL, "About:", "Hellcard Character Creator © 2023 by Devilkk is licensed under GNU GPLv3. You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>." & @CRLF & @CRLF & "https://github.com/Devilkk/Autoit-Hellcard-Character-Creator-Macro" & @CRLF & "https://www.buymeacoffee.com/Devilkk")
        Case Else
            $TormentCount = 0
            For $i = 0 To UBound($Torments) - 1
                If IsChecked($Torments[$i][1]) Then
                    $TormentCount += $Torments[$i][3]
                    $Torments[$i][2] = 1
                Else
                    $Torments[$i][2] = 0
                EndIf
            Next
    EndSwitch
CountChange()
WEnd

Func Terminate()
    Exit 0
EndFunc

Func IsChecked($control)
 Return BitAnd(GUICtrlRead($control),$GUI_CHECKED) = $GUI_CHECKED
EndFunc

Func CountChange()
    If $TormentCount <> $TormentCountp Then
        $TormentCountp = $TormentCount
        GUICtrlSetData($TormentCountcheck, "Torment Count " & $TormentCountp)
    EndIf
EndFunc

Func WAHC()
If WinActive("[CLASS:CUG Framework WND Class]") Then
Sleep($Sleeps[2][1])
Else
WinActivate("[CLASS:CUG Framework WND Class]")
Sleep($Sleeps[2][1])
WinWaitActive("[CLASS:CUG Framework WND Class]")
Sleep($Sleeps[2][1])
EndIf
EndFunc

Func HKS()
HotKeySet("{F3}", "CharCreation")
HotKeySet("{F6}", "CharDeletion")
HotKeySet("{F7}", "CharDetails")
HotKeySet("{F8}", "StamBurst")
EndFunc

Func HKUS()
HotKeySet("{F3}")
HotKeySet("{F6}")
HotKeySet("{F7}")
HotKeySet("{F8}")
EndFunc

Func TGC()
$TG0 = 0
$TG1 = 0
$TG2 = 0
$TG3 = 0
    For $i = 0 to 5
        If $Torments[$i][2] = 1 Then
        $TG1 = 1
        EndIf
    Next
    For $i = 5 to 11
        If $Torments[$i][2] = 1 Then
        $TG2 = 1
        EndIf
    Next
    For $i = 12 to 17
        If $Torments[$i][2] = 1 Then
        $TG3 = 1
        EndIf
    Next
    If ($TG1 = 1) or ($TG2 = 1) or ($TG3 = 1) Then
    $TG0 = 1
    EndIf
EndFunc

Func GetRI()
Local $ResolutionOtherL[20], $ResolutionOtherIX[20], $ResolutionOtherIY[20]
Local $ROX, $ROY
$RCIGUI = GUICreate("Resolution Coordinate Input", 630, 130)
GUIStartGroup()
For $i = 0 To UBound($ResolutionOther) - 1
    $ResolutionOtherL[$i] = GUICtrlCreateLabel($ResolutionOther[$i][0], 5 + Int($i / 5) * 160, 5 + Mod($i, 5) * 25, 60, 25)
    $ResolutionOtherIX[$i] = GUICtrlCreateInput($ResolutionOther[$i][1], 65 + Int($i / 5) * 160, 5 + Mod($i, 5) * 25, 40, 20, BitOR($ES_NUMBER, $ES_CENTER))
    GUICtrlSetLimit($ResolutionOtherIX[$i], 4)
    $ResolutionOtherIY[$i] = GUICtrlCreateInput($ResolutionOther[$i][2], 105 + Int($i / 5) * 160, 5 + Mod($i, 5) * 25, 40, 20, BitOR($ES_NUMBER, $ES_CENTER))
    GUICtrlSetLimit($ResolutionOtherIY[$i], 4)
Next

GUISetState()
While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            GUIDelete($RCIGUI)
            ExitLoop
        Case Else
            For $i = 0 To UBound($ResolutionOther) - 1
                $ResolutionOther[$i][1] = GUICtrlRead($ResolutionOtherIX[$i])
                $ResolutionOther[$i][2] = GUICtrlRead($ResolutionOtherIY[$i])
            Next
    EndSwitch
    For $i = 0 To UBound($ResolutionOther) - 1
        If $ResolutionOther[$i][1] = 0 Then
        $ROX = 0
        Else
        $ROX = 1
        EndIf
        If $ResolutionOther[$i][2] = 0 Then
        $ROY = 0
        Else
        $ROY = 1
        EndIf
    Next
    If ($ROX = 1) And ($ROY = 1) Then
    $RISet = 1
    EndIf
WEnd
EndFunc

Func GetTI()
Local $TClickYOtherI[18], $TClickL, $TClickXOtherI
Local $TOSet
$TCIGUI = GUICreate("Torments Coordinate Input", 400, 200)
GUIStartGroup()
For $i = 0 To UBound($Torments) - 1
    $TClickL = GUICtrlCreateLabel($Torments[$i][0], 5 + Int($i / 6) * 130, 5 + Mod($i, 6) * 25, 75, 25)
    $TClickYOtherI[$i] = GUICtrlCreateInput($TClickYOther[$i], 80 + Int($i / 6) * 125, 5 + Mod($i, 6) * 25, 40, 20, BitOR($ES_NUMBER, $ES_CENTER))
    GUICtrlSetLimit($TClickYOtherI[$i], 4)
Next
$TClickL = GUICtrlCreateLabel("Torment X Pos", 5, 165, 75, 25)
$TClickXOtherI = GUICtrlCreateInput($TClickXOther, 80, 165, 40, 20, BitOR($ES_NUMBER, $ES_CENTER))
GUICtrlSetLimit($TClickXOtherI, 4)
GUISetState()
While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            GUIDelete($TCIGUI)
            ExitLoop
        Case Else
            For $i = 0 To UBound($TClickYOther) - 1
                $TClickYOther[$i] = GUICtrlRead($TClickYOtherI[$i])
            Next
            $TClickXOther = GUICtrlRead($TClickXOtherI)
    EndSwitch
    For $i = 0 To UBound($TClickYOther) - 1
        If $TClickYOther[$i] = 0 Then
        $TOSet = 0
        Else
        $TOSet = 1
        EndIf
    Next
    If ($TOSet = 1) And ($TClickXOther <> 0) Then
    $TISet = 1
    EndIf
WEnd
EndFunc

Func GetSBI()
Local $StamBurstL[2], $StamBurstIX[2], $StamBurstIY[2]
$SBIGUI = GUICreate("Stamina Burst Input", 150, 55)
GUIStartGroup()
For $i = 0 To UBound($StamBurst) - 1
    $StamBurstL[$i] = GUICtrlCreateLabel($StamBurst[$i][0], 5, 5 + $i * 25, 60, 25)
    $StamBurstIX[$i] = GUICtrlCreateInput($StamBurst[$i][1], 65, 5 + $i * 25, 40, 20, BitOR($ES_NUMBER, $ES_CENTER))
    GUICtrlSetLimit($StamBurstIX[$i], 4)
    $StamBurstIY[$i] = GUICtrlCreateInput($StamBurst[$i][2], 105, 5 + $i * 25, 40, 20, BitOR($ES_NUMBER, $ES_CENTER))
    GUICtrlSetLimit($StamBurstIY[$i], 4)
Next
GUISetState()
While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            GUIDelete($SBIGUI)
            ExitLoop
        Case Else
            For $i = 0 To UBound($StamBurst) - 1
                $StamBurst[$i][1] = GUICtrlRead($StamBurstIX[$i])
                $StamBurst[$i][2] = GUICtrlRead($StamBurstIY[$i])
            Next
    EndSwitch
WEnd
EndFunc

Func GetSlI()
Local $SleepsL[5], $SleepsI[5], $SleepsLIT
Local $SleepsTip[5] = ["Most clicks", "Drag and stamina burst", "Hellcard window activation", "Window open/close", "After character create wait to create new"]
$SlGUI = GUICreate("Sleeps Input", 150, 150)
GUIStartGroup()
For $i = 0 To UBound($Sleeps) - 1
    $SleepsL[$i] = GUICtrlCreateLabel($Sleeps[$i][0], 5, 5 + $i * 25, 60, 25)
    $SleepsTip[$i] = GUICtrlSetTip($SleepsL[$i], $SleepsTip[$i])
    $SleepsI[$i] = GUICtrlCreateInput($Sleeps[$i][1], 65, 5 + $i * 25, 40, 20, BitOR($ES_NUMBER, $ES_CENTER))
    GUICtrlSetLimit($SleepsI[$i], 4)
Next
$SleepsLIT = GUICtrlCreateLabel("1000 = 1 Second", 5, 130, 150, 25, $SS_CENTER)
GUISetState()
While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            GUIDelete($SlGUI)
            ExitLoop
        Case Else
            For $i = 0 To UBound($Sleeps) - 1
                $Sleeps[$i][1] = GUICtrlRead($SleepsI[$i])
            Next
    EndSwitch
WEnd
EndFunc

Func GMP()
Local $aPos = MouseGetPos()
MsgBox($MB_APPLMODAL, "Mouse Pos:", "X = " & $aPos[0] & @CRLF & @CRLF & "Y = " & $aPos[1])
EndFunc
