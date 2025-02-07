--player
function Nymb_Clicks_Player_Clicks(arg1)
            if (Heart_MouseHeal and (Heart_MouseHeal("player", arg1))) then
               return;
            else
                oldPerl_Player_OnClick(arg1);
            end
end

--party
function Nymb_Clicks_Party_Clicks(arg1)
         local unit = "party"..Perl_Party_FindID(this);
            if (Heart_MouseHeal and (Heart_MouseHeal(unit, arg1))) then
               return;
            else
                oldPerl_Party_OnClick(arg1);
            end
end

function Nymb_Clicks_Party_MouseDown(arg1)
            if not(Heart_MouseHeal and (Heart_MouseHeal(unit, arg1))) then
               oldPerl_Party_MouseDown(arg1);
            else
            end
end

function Nymb_Clicks_Party_MouseUp(arg1)
            if not(Heart_MouseHeal and (Heart_MouseHeal(unit, arg1))) then
               oldPerl_Party_MouseUp(arg1);
            else
            end
end


--Raid
function Nymb_Clicks_Raid_Clicks(arg1)
         local unit = "raid"..Perl_Raid_FindID(this);
            if (Heart_MouseHeal and (Heart_MouseHeal(unit, arg1))) then
               return;
            else
                oldPerl_Raid_OnClick(arg1);
            end
end

function Nymb_Clicks_Raid_MouseUp(arg1)
            if not(Heart_MouseHeal and (Heart_MouseHeal(unit, arg1))) then
               oldPerl_Raid_MouseUp(arg1);
            else
            end
end

function Nymb_Clicks_Raid_MouseDown(arg1)
            if not(Heart_MouseHeal and (Heart_MouseHeal(unit, arg1))) then
               oldPerl_Raid_MouseDown(arg1);
            else
            end
end

--raid pets

function Nymb_Clicks_OnLoad()
this:RegisterEvent("VARIABLES_LOADED")
end

function Nymb_Clicks_OnEvent()
         if (event == "VARIABLES_LOADED") then
                  if (IsAddOnLoaded("Perl") and GetAddOnMetadata("Perl", "Author") == "Nymbia") then
                  oldPerl_Player_OnClick = Perl_Player_OnClick;
                  Perl_Player_OnClick = Nymb_Clicks_Player_Clicks;

                  oldPerl_Party_OnClick = Perl_Party_OnClick;
                  Perl_Party_OnClick = Nymb_Clicks_Party_Clicks;
         
                  oldPerl_Party_MouseDown = Perl_Party_MouseDown;
                  Perl_Party_MouseDown = Nymb_Clicks_Party_MouseDown;

                  oldPerl_Party_MouseUp = Perl_Party_MouseUp;
                  Perl_Party_MouseUp = Nymb_Clicks_Party_MouseUp;

                  oldPerl_Raid_OnClick = Perl_Raid_OnClick;
                  Perl_Raid_OnClick = Nymb_Clicks_Raid_Clicks;

                  oldPerl_Raid_MouseUp = Perl_Raid_MouseUp;
                  Perl_Raid_MouseUp = Nymb_Clicks_Raid_MouseUp;

                  oldPerl_Raid_MouseDown = Perl_Raid_MouseDown;
                  Perl_Raid_MouseDown = Nymb_Clicks_Raid_MouseDown;

                  end
         end
end

