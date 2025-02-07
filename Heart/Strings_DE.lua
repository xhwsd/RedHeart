if (GetLocale() ~= "deDE") then
	return;
end

-- classes
C_Druid = "Druide";
C_Hunter = "J\195\164ger";
C_Mage = "Magier";
C_Paladin = "Paladin";
C_Priest = "Priester";
C_Rogue = "Schurke";
C_Shaman = "Schamane";
C_Warlock = "Hexenmeister";
C_Warrior = "Krieger";

-- factions
C_Alliance = "Allianz";
C_Horde = "Horde";

-- spells/buffs/debuffs
C_Amplify_magic = "Magie verst\195\164rken";
C_Banish = "Verbannen";
C_Blessing_of_light = "Segen des Lichts";
C_Blessing_of_protection = "Segen des Schutzes";
C_Chain_heal = "Kettenheilung";
C_Clearcasting = "Freizauber";
C_Crystal_restore = "Cristal de restauration";
C_HotA = "Healing of the Ages";
C_Dampen_magic = "Magie d\195\164mpfen";
C_Deep_slumber = "Sommeil profond";
C_Divine_favor = "G\195\182ttliche Gunst";
C_Divine_intervention = "G\195\182ttliche Einmischung";
C_Divine_protection = "G\195\182ttlicher Schutz";
C_Divine_shield = "G\195\182ttlicher Schild";
C_First_aid = "Erste Hilfe";
C_Flash_heal = "Blitzheilung";
C_Flash_of_light = "Lichtblitz";
C_Forbearance = "Vorhersehung";
C_Greater_blessing_of_light = "Gro\195\159er Segen des Lichts";
C_Greater_heal = "Gro\195\159e Heilung";
C_Heal = "Heilen";
C_Healing_touch = "Heilende Ber\195\188hrung";
C_Healing_wave = "Welle der Heilung";
C_Holy_light = "Heiliges Licht";
C_Holy_nova = "Heilige Nova";
C_Holy_shock = "Heiliger Schock";
C_Ice_barrier = "Eis-Barriere";
C_Inner_focus = "Innerer Fokus";
C_Lay_on_hands = "Handauflegung";
C_Lesser_heal = "Geringes Heilen";
C_Lesser_healing_wave = "Geringe Welle der Heilung";
C_Lightwell = "Brunnen des Lichts";
C_Mortal_strike = "T\195\182dlicher Sto\195\159";
C_Natures_grace = "Anmut der Natur";
C_Natures_swiftness = "Schnelligkeit der Natur";
C_Phase_shift = "Phasenverschiebung";
C_Power_infusion = "Power Infusion";
C_Power_word_shield = "Machtwort: Schild";
C_Prayer_of_healing = "Gebet der Heilung";
C_Recently_bandaged = "K\195\188rzlich bandagiert";
C_Regrowth = "Nachwachsen";
C_Rejuvenation = "Verj\195\188ngung";
C_Renew = "Erneuerung";
C_Spirit_tap = "Willensentzug";
C_Swiftmend = "Rasche Heilung";
C_Tranquility = "Gelassenheit";
C_Unstable_power = "Instabile Macht";
C_Weakened_soul = "Geschw\195\164chte Seele";
C_Resurrection = "Auferstehung";
C_Redemption = "Erl\195\182sung";
C_Rebirth = "Wiedergeburt";
C_Ancestral_Spirit = "Geist der Ahnen";
C_Curse_ot_deadwood = "Fluch der Deadwood";
C_Gehennas_curse = "Gehennas Fluch";


Heart_item_heal_bonus_text = {
	"Erh\195\182ht durch Zauber und Effekte verursachte Heilung um bis zu (%d+%.?%d*)%.",
	"Erh\195\182ht durch Zauber und magische Effekte zugef\195\188gten Schaden und Heilung um bis zu (%d+%.?%d*)%.",
	"%+(%d+%.?%d*) Heilzauber",
	"Heilzauber %+(%d+%.?%d*)"
};

-- bindings
BINDING_HEADER_HEART = "Heart";
BINDING_HEADER_HEARTCLICKS = "Heart Unit Healing";
BINDING_NAME_HEART_CUSTOM_1 = "Custom 1";
BINDING_NAME_HEART_CUSTOM_2 = "Custom 2";
BINDING_NAME_HEART_PLAYER_1 = "Player Custom 1";
BINDING_NAME_HEART_PLAYER_2 = "Player Custom 2";
BINDING_NAME_HEART_P1_1 = "Party1 Custom 1";
BINDING_NAME_HEART_P1_2 = "Party1 Custom 2";
BINDING_NAME_HEART_P2_1 = "Party2 Custom 1";
BINDING_NAME_HEART_P2_2 = "Party2 Custom 2";
BINDING_NAME_HEART_P3_1 = "Party3 Custom 1";
BINDING_NAME_HEART_P3_2 = "Party3 Custom 2";
BINDING_NAME_HEART_P4_1 = "Party4 Custom 1";
BINDING_NAME_HEART_P4_2 = "Party4 Custom 2";
BINDING_NAME_HEART_MT1_1 = "MainTank1 Custom 1";
BINDING_NAME_HEART_MT1_2 = "MainTank1 Custom 2";
BINDING_NAME_HEART_MT2_1 = "MainTank2 Custom 1";
BINDING_NAME_HEART_MT2_2 = "MainTank2 Custom 2";
BINDING_NAME_HEART_MT3_1 = "MainTank3 Custom 1";
BINDING_NAME_HEART_MT3_2 = "MainTank3 Custom 2";
BINDING_NAME_HEART_MT4_1 = "MainTank4 Custom 1";
BINDING_NAME_HEART_MT4_2 = "MainTank4 Custom 2";
BINDING_NAME_HEART_MT5_1 = "MainTank5 Custom 1";
BINDING_NAME_HEART_MT5_2 = "MainTank5 Custom 2";
BINDING_NAME_HEART_MT6_1 = "MainTank6 Custom 1";
BINDING_NAME_HEART_MT6_2 = "MainTank6 Custom 2";
BINDING_NAME_HEART_MT7_1 = "MainTank7 Custom 1";
BINDING_NAME_HEART_MT7_2 = "MainTank7 Custom 2";
BINDING_NAME_HEART_MT8_1 = "MainTank8 Custom 1";
BINDING_NAME_HEART_MT8_2 = "MainTank8 Custom 2";
BINDING_NAME_HEART_MT9_1 = "MainTank9 Custom 1";
BINDING_NAME_HEART_MT9_2 = "MainTank9 Custom 2";
BINDING_NAME_HEART_MT10_1 = "MainTank10 Custom 1";
BINDING_NAME_HEART_MT10_2 = "MainTank10 Custom 2";

Heart_GUI_title = "redHeart 0.142"

-- tab titles
Heart_GUI_tab_title = {"HKlassen", "Settings", "Prios", "Raid", "Klick", "Anzeige", "Rez"}
Heart_GUI_tab_title2 = {"Anzeige"}

-- custom classes
Heart_GUI_new = "Neu"
Heart_GUI_delete = "L\195\182schen"
Heart_GUI_percent = "Prozent"
Heart_GUI_rank = "Rang"
Heart_GUI_new_class = "Name der neuen Heilklasse"
Heart_GUI_okay = "Okay"
Heart_GUI_cancel = "Abbruch"
Heart_GUI_new_profile = "Profil Name"

-- keys thingy
Heart_GUI_keys = {"Off", "None", "Alt", "Control", "Shift", "Alt + Control", "Alt + Shift", "Control + Shift", "All"}
Heart_GUI_heal_enough = "Heile genug"
Heart_GUI_heal_self = "Heile dich selbst"
Heart_GUI_heal_max = "Heile max."
Heart_GUI_heal_targettarget = "Heile Ziel d. Ziels"
Heart_GUI_heal_none = "Heile nicht"

-- mousehealing
Heart_GUI_left_button = "Linker Button"
Heart_GUI_right_button = "Rechter Button"
Heart_GUI_middle_button = "Mittlerer Button"
Heart_GUI_custom_1 = "Custom 1"
Heart_GUI_custom_2 = "Custom 2"

-- priorities
Heart_GUI_player_priority = "Eigene Priorit\195\164t"
Heart_GUI_party_priority = "Gruppen Priorit\195\164t"
Heart_GUI_raid_priority = "Raid Priorit\195\164t"
Heart_GUI_pet_priority = "Pet Priorit\195\164t"
Heart_GUI_bop_priority = "BoP Prio. Abnahme"
Heart_GUI_pws_priority = "PWS Prio. Abnahme"
Heart_GUI_rb_priority = "RB Prio. Zunahme"
Heart_GUI_ws_priority = "WS Prio. Zunahme"
Heart_GUI_ms_priority = "MS Prio. Zunahme"
Heart_GUI_druid_priority = C_Druid.." Priorit\195\164t"
Heart_GUI_hunter_priority = C_Hunter.." Priorit\195\164t"
Heart_GUI_mage_priority = C_Mage.." Priorit\195\164t"
Heart_GUI_paladin_priority = C_Paladin.." Priorit\195\164t"
Heart_GUI_priest_priority = C_Priest.." Priorit\195\164t"
Heart_GUI_rogue_priority = C_Rogue.." Priorit\195\164t"
Heart_GUI_shaman_priority = C_Shaman.." Priorit\195\164t"
Heart_GUI_warlock_priority = C_Warlock.." Priorit\195\164t"
Heart_GUI_warrior_priority = C_Warrior.." Priorit\195\164t"

-- raid
Heart_GUI_check_all = "Alles An-/Abw\195\164hlen"
Heart_GUI_uncheck_all = "Alle Abw\195\164hlen"
Heart_GUI_invert_checked = "Auswahl umkehren"
Heart_GUI_unchecked_priority = "Abgewählten-Prio"

-- settings
Heart_GUI_hook_useaction = "Zuschalten: Aktionsleiste"
Heart_GUI_ninja_useaction = "Ninja Aktionsleiste"
Heart_GUI_hook_shields = "Zuschalten: Schilde"
Heart_GUI_useaction_wounded = "Heile den Verwundetsten"
Heart_GUI_shapeshifted_druids = "Behandle Druiden in Tierform als Schurken/Krieger";
Heart_GUI_safe_cancel = "Sicherer Abbruch"
Heart_GUI_always_tank_target = "Ziele:\"Heile max.\""
Heart_GUI_scale_spells = "Skaliere Zauber"
Heart_GUI_hot_cancel = "HoT Grenze"
Heart_GUI_hot_value = "+HoT Wert"
Heart_GUI_hot_value_battle = "+HoT Wert im Kampf"
Heart_GUI_max_overheal = "Max. \195\156berheilung"
Heart_GUI_min_heal_threshold = "Gesundheitsgrenze"
Heart_GUI_heal_power = "Heilkraft"
Heart_GUI_update_time = "Abfragenintervall"
Heart_GUI_heal_strategy = "Heilstrategie:"
Heart_GUI_heal_strategies = {"Wenigsten GP", "Geringsten %", "GP vermissend"}
Heart_GUI_heal_charmed = "Heal charmed units"

--display
Heart_GUI_HealBar_Scale = "HealBars Skalierung"
Heart_GUI_CurrentHealBars_Scale = "CurrentHeal Skalierung"
Heart_GUI_Buttons_Scale = "HeartGUI Skalierung"
Heart_GUI_show_healing_me = "Zeige nur einkommende Heilung."
Heart_GUI_show_healing_all = "Zeige alle Heilung."

-- tooltip help
Heart_GUI_help = {
        ["MM"] = {
                ["Description"] = "Links-Klicken um das Options Panel zu zeigen/verstecken.\n Rechts-Klicken um das Casting Panel zu zeigen/verstecken."
        },
        ["MM2"] = {
                ["Description"] = "Links-Klicken um die \"Heal Bars\" zu zeigen/verstecken.\n Rechts-Klicken um \"Show healing me\" zu deaktivieren."
        },
	["Tab1"] = {
		["Title"] = "Heilklassen",
		["Description"] = "Erstelle deine eigenen Klassen von Heilzaubern."
	},
	["Tab2"] = {
		["Title"] = "Einstellungen",
		["Description"] = "Erweiterte Einstellungen."
	},
	["Tab3"] = {
		["Title"] = "Priorit\195\164ten",
		["Description"] = "Stelle Priorit\195\164ten ein, z.B. welche Klasse bevorzugt werden soll."
	},
	["Tab4"] = {
		["Title"] = "Raid",
		["Description"] = "Hier kannst du einstellen, welche Spieler du in deinem Raid heilen willst wenn du das \"heal most wounded\" feature nutzt."
	},
	["Tab5"] = {
		["Title"] = "Maus",
		["Description"] = "Assoziiere einen Heilzauber mit einem Mausbutton, so dass du einfach auf einen Spielerframe klicken kannst um ihn zu heilen.\nKonfiguriere, wie das Addon reagiert, wenn du bestimmte Tasten w\195\164hrend dem Heilen zus\195\164tzlich dr\195\188ckst (alt/ctrl/shift)."
	},
	["Tab6"] = {
		["Title"] = "Anzeige",
		["Description"] = "Anzeige Einstellungen."
	},
	["Tab7"] = {
		["Title"] = "Rez",
		["Description"] = "Rez Button Einstellungen."
	},
	["Heart_GUISpellSelect%dSpell"] = {
		["Title"] = "",
		["Description"] = "Klicke auf diesen Zauber, um ihn dieser Heilklasse hinzuzuf\195\188gen."
	},
	["Heart_GUISpellSelect%dAttachment"] = {
		["Title"] = "",
		["Description"] = "Klicke auf diesen Zauber, um ihn dieser Heilklasse zu \"Attach\" . \"Attach\" diesen Zauber an einen anderen, indem auf den Zauber klickst, an den du ihn anheften willst. An dessen Zaubers Prozentzahl, wird dann der angeheftete Zauber gewirkt, falls der andere nicht gewirkt werden kann."
	},

	["Heart_GUIClass%dSpell$"] = {
		["Title"] = "Klassenzauber",
		["Description"] = "Dies ist der Zauber, der an den gegebenen Prozent gewirkt werden soll.\n Klicke auf den Zauber, um ihn von der Klasse zu entfernen."
	},
	["ClassDropDownMenu"] = {
		["Title"] = "Heilklasse ausw\195\164hlen",
		["Description"] = "W\195\164hle eine Heilklasse aus der Liste, die du konfigurieren willst."
	},
	["NewClassButton"] = {
		["Title"] = "Neue Heilklasse",
		["Description"] = "Klicke hierauf, um eine neue Heilklasse zu erstellen."
	},
	["DeleteClassButton"] = {
		["Title"] = "Heilklasse l\195\182schen",
		["Description"] = "Klicke hierauf, umd die derzeit ausgew\195\164hlte Heilklasse zu l\195\182schen."
	},
	["Heart_GUIClass%dRankSlider"] = {
		["Title"] = "Rang",
		["Description"] = "W\195\164hle den h\195\182chsten Rang, den du mit diesem Zauber nutzen willst."
	},
	["Heart_SpellSelectPopUpFramePercentSlider"] = {
		["Title"] = "Prozent",
		["Description"] = "W\195\164hle die h\195\182chste Prozentzahl die ein Spieler haben darf, damit dieser Zauber genutzt wird. Falls es einen Zauber mit einem niedrigeren Max Prozentwert in dieser Heilklasse gibt, wird dieser genutzt falls ein Spieler weniger Prozent Leben hat als dieser Wert."
	},
	["Heart_GUIClass%dScaleCheckBox"] = {
		["Title"] = "Skaliere Zauber",
		["Description"] = "Falls selektiert, wird dieser Zauber nicht unter oder \195\188ber den im Rang-Schieberegler gesetzten skalieren."
	},
	["Heart_GUIClass%dSpellAttachment"] = {
		["Title"] = "Zauber Bindung",
		["Description"] = "Klicke auf diesen Zauber, um dessen Bindung vom prim\195\164ren Zauber zu l\195\182sen."
	},
	["Heart_GUIHealSelfModifier"] = {
		["Title"] = "Modifier: Heile dich selbst",
		["Description"] = "Wenn du die hier eingestellte Taste gedr\195\188ckt h\195\164ltst und auf einen Heilzauber klickst, wirst du dich selbst heilen. Diese Einstellung kann nicht die gleiche sein wie die von \"Modifier: Heile Ziel d. Ziels\". Diese Einstellung hat keine Auswirkung bei \"mouse healing\"."
	},
	["Heart_GUIHealEnoughModifier"] = {
		["Title"] = "Modifier: Heile genug",
		["Description"] = "Wenn du die hier eingestellte Taste gedr\195\188ckt h\195\164ltst und \"mouse healing\" benutzt, wirst du dein Ziel genug heilen, um die fehlende Gesundheit wiederherzustellen. Diese Einstellung kann nicht die gleiche sein wie die von \"Modifier: Heile max\". Nur \"mouse healing\" wird von dieser Einstellung beeinflusst."
	},
	["Heart_GUIHealMaxModifier"] = {
		["Title"] = "Modifier: Heile max.",
		["Description"] = "Wenn du die hier eingestellte Taste gedr\195\188ckt h\195\164ltst und \"mouse healing\" benutzt wird Heart diesen Spieler \"tank heilen\". Diese Einstellung kann nicht die gleiche sein wie die von \"Modifier: Heile genug\". Nur \"mouse healing\" wird von dieser Einstellung beeinflusst."
	},
	["Heart_GUIHealTargettargetModifier"] = {
		["Title"] = "Modifier: Heile Ziel d. Ziels",
		["Description"] = "Halte diese Taste gedr\195\188ckt, um das Ziel deines Ziels zu heilen. Diese Einstellung kann nicht die gleiche sein wie die von \"Modifier: Heile dich selbst\". Diese Einstellung hat keine Auswirkung auf \"mouse healing\"."
	},
	["Heart_GUIHealNoneModifier"] = {
		["Title"] = "Modifier: Heile->nicht",
		["Description"] = "Halte diese Taste gedr\195\188ckt, um nicht zu heilen, wenn du auf einen Spielerframe klickst. Diese Einstellung KANN NICHT die gleiche sein wie die eines anderen Modifiers ausser die Einstellung ist auf \"Off\". Benutze diese Einstellung, um alle Modifier mit der Einstellung \"None\" zu \195\188berschreiben, so dass du die M\195\182glichkeit hast, nur dein Ziel auszuw\195\164hlen, oder das Menu zu \195\182ffnen."
	},
	["Heart_GUILeftButtonDrop"] = {
		["Title"] = "Linke Maustaste",
		["Description"] = "W\195\164hle die Heilklasse oder den Heilzauber, den du mit deiner linken Maustaste assoziieren willst."
	},
	["Heart_GUILeftButtonRank"] = {
		["Title"] = "Zauberrang",
		["Description"] = "W\195\164hle den h\195\182chsten Rang, den du mit diesem Zauber nutzen willst."
	},
	["Heart_GUIRightButtonDrop"] = {
		["Title"] = "Rechte Maustaste",
		["Description"] = "W\195\164hle die Heilklasse oder den Heilzauber, den du mit deiner rechten Maustaste assoziieren willst."
	},
	["Heart_GUIRightButtonRank"] = {
		["Title"] = "Zauberrang",
		["Description"] = "W\195\164hle den h\195\182chsten Rang, den du mit diesem Zauber nutzen willst."
	},
	["Heart_GUIMiddleButtonDrop"] = {
		["Title"] = "Mittlere Maustaste",
		["Description"] = "W\195\164hle die Heilklasse oder den Heilzauber, den du mit deiner mittleren Maustaste assoziieren willst."
	},
	["Heart_GUIMiddleButtonRank"] = {
		["Title"] = "Zauberrang",
		["Description"] = "W\195\164hle den h\195\182chsten Rang, den du mit diesem Zauber nutzen willst."
	},
	["Heart_GUIButton4Drop"] = {
		["Title"] = "Button 4",
		["Description"] = "W\195\164hle die Heilklasse oder den Heilzauber, den du mit Button 4 assoziieren willst."
	},
	["Heart_GUIButton4Rank"] = {
		["Title"] = "Zauberrang",
		["Description"] = "W\195\164hle den h\195\182chsten Rang, den du mit diesem Zauber nutzen willst."
	},
	["Heart_GUIButton5Drop"] = {
		["Title"] = "Button 5",
		["Description"] = "W\195\164hle die Heilklasse oder den Heilzauber, den du mit Button 5 assoziieren willst."
	},
	["Heart_GUIButton5Rank"] = {
		["Title"] = "Zauberrang",
		["Description"] = "W\195\164hle den h\195\182chsten Rang, den du mit diesem Zauber nutzen willst."
	},
	["Heart_GUICustomButton1Drop"] = {
		["Title"] = "Custom button 1",
		["Description"] = "W\195\164hle die Heilklasse oder den Heilzauber, den du mit Custom Button 1 assoziieren willst."
	},
	["Heart_GUICustomButton1Rank"] = {
		["Title"] = "Zauberrang",
		["Description"] = "W\195\164hle den h\195\182chsten Rang, den du mit diesem Zauber nutzen willst."
	},
	["Heart_GUICustomButton2Drop"] = {
		["Title"] = "Custom button 2",
		["Description"] = "W\195\164hle die Heilklasse oder den Heilzauber, den du mit Custom Button 2 assoziieren willst."
	},
	["Heart_GUICustomButton2Rank"] = {
		["Title"] = "Zauberrang",
		["Description"] = "W\195\164hle den h\195\182chsten Rang, den du mit diesem Zauber nutzen willst."
	},
	["PlayerPriority"] = {
		["Title"] = "Priorit\195\164t: Selbst",
		["Description"] = "Stelle deine eigene Priorit\195\164t ein."
	},
	["PartyPriority"] = {
		["Title"] = "Priorit\195\164t: Gruppe",
		["Description"] = "Stelle die Priorit\195\164t deiner Gruppenmitglieder ein."
	},
	["RaidPriority"] = {
		["Title"] = "Priorit\195\164t: Raid",
		["Description"] = "Stelle die Priorit\195\164t deiner Raidmitglieder ein.",
	},
	["PetPriority"] = {
		["Title"] = "Priorit\195\164t: Pet",
		["Description"] = "Stelle die Priorit\195\164t von Pets ein.",
	},
	["MTPriority"] = {
		["Title"] = "MainTank priority increase",
		["Description"] = "Set how much a players priority will increase for MainTanks (set through CT_RA or oRA)."
	},
	["BOPPriority"] = {
		["Title"] = "Priorit\195\164t Abnahme: \"Blessing of Protection\"",
		["Description"] = "Stelle ein, um wieviel die Priorit\195\164t eines Spielers abnimmt, wenn er den Buff \"Blessing of Protection\" hat."
	},
	["PWSPriority"] = {
		["Title"] = "Priorit\195\164t Abnahme: \"Power Word: Shield\"",
		["Description"] = "Stelle ein, um wieviel die Priorit\195\164t eines Spielers abnimmt, wenn er den Buff \"Power Word: Shield\" hat. Diese Einstellung sollte immer gr\195\182sser oder gleich dem Wert sein, den du bei *Priorit\195\164t Abnahme: \"Blessing of Protection\"* eingestellt hast."
	},
	["RBPriority"] = {
		["Title"] = "Priorit\195\164t Zunahme: \"Recently Bandaged\"",
		["Description"] = "Stelle ein, um wieviel die Priorit\195\164t eines Spielers zunimmt, wenn er den Debuff \"Recently Bandaged\" hat."
	},
	["WSPriority"] = {
		["Title"] = "Priorit\195\164t Zunahme: \"Weakened Soul\"",
		["Description"] = "Stelle ein, um wieviel die Priorit\195\164t eines Spielers zunimmt, wenn er den Debuff \"Weakened Soul\" hat. Diese Einstellung sollte immer kleiner oder gleich dem Wert sein, den du bei *Priorit\195\164t Abnahme: \"Power Word: Shield\"* eingestellt hast."
	},
	["MSPriority"] = {
		["Title"] = "Priorit\195\164t Zunahme: \"Mortal Strike\"",
		["Description"] = "Stelle ein, um wieviel die Priorit\195\164t eines Spielers zunimmt, wenn er den Debuff \"Mortal Strike\" hat. Diese Einstellung sollte immer kleiner oder gleich dem Wert sein, den du bei *Priorit\195\164t Abnahme: \"Power Word: Shield\"* eingestellt hast."
	},
	["DruidPriority"] = {
		["Title"] = "Priorit\195\164t: "..C_Druid,
		["Description"] = "Stelle die Priorit\195\164t von "..C_Druid.."n ein."
	},
	["HunterPriority"] = {
		["Title"] = "Priorit\195\164t: "..C_Hunter,
		["Description"] = "Stelle die Priorit\195\164t von "..C_Hunter.."n ein."
	},
	["MagePriority"] = {
		["Title"] = "Priorit\195\164t: "..C_Mage,
		["Description"] = "Stelle die Priorit\195\164t von "..C_Mage.."n ein."
	},
	["PaladinPriority"] = {
		["Title"] = "Priorit\195\164t: "..C_Paladin,
		["Description"] = "Stelle die Priorit\195\164t von "..C_Paladin.."en ein."
	},
	["PriestPriority"] = {
		["Title"] = "Priorit\195\164t: "..C_Priest,
		["Description"] = "Stelle die Priorit\195\164t von "..C_Priest.."n ein."
	},
	["RoguePriority"] = {
		["Title"] = "Priorit\195\164t: "..C_Rogue,
		["Description"] = "Stelle die Priorit\195\164t von "..C_Rogue.."n ein."
	},
	["ShamanPriority"] = {
		["Title"] = "Priorit\195\164t: "..C_Shaman,
		["Description"] = "Stelle die Priorit\195\164t von "..C_Shaman.."n ein."
	},
	["WarlockPriority"] = {
		["Title"] = "Priorit\195\164t: "..C_Warlock,
		["Description"] = "Stelle die Priorit\195\164t von "..C_Warlock.."n ein."
	},
	["WarriorPriority"] = {
		["Title"] = "Priorit\195\164t: "..C_Warrior,
		["Description"] = "Stelle die Priorit\195\164t von "..C_Warrior.."n ein."
	},
	["RaidGroup%dLabel"] = {
		["Title"] = "W\195\164hle Gruppe an/ab",
		["Description"] = "Klicke hier, um alle Spieler dieser Gruppe an- oder abzuw\195\164hlen."
	},
	["RaidGroup%dSlot%dCheckButton"] = {
		["Title"] = "W\195\164hle Spieler an/ab",
		["Description"] = "Klicke hier, um diesen Spieler an- oder abzuw\195\164hlen."
	},
	["RaidCheckAllButton"] = {
		["Title"] = "W\195\164hle alle an/ab",
		["Description"] = "Links-Klicke um alle Spieler anzuw\195\164hlen. Rechts-Klicke, um alle Spieler abzuw\195\164hlen."
	},
	["RaidInvertCheckedButton"] = {
		["Title"] = "Auswahl umkehren",
		["Description"] = "Klicke hier, um die Auswahl der an- und abgew\195\164hlten Spieler umzukehren."
	},
	["RaidUncheckedPrioritySlider"] = {
		["Title"] = "Priorit\195\164t der abgew\195\164hlten Spieler",
		["Description"] = "Stelle die Priorit\195\164t der abgew\195\164hlten Spieler ein. Falls du hier 0% einstellst, wird Heart abgew\195\164hlte Spieler \195\188berhaupt nicht ber\195\188cksichtigen."
	},
	["UseAction"] = {
		["Title"] = "Hook UseAction",
		["Description"] = "When this box is checked Heart will detect whenever you click on a healing spell on your actionbar. These spells will be displayed in your Heart HealBars and be Broadcast to other healers for Co-op healing. Heart will not scale or heal most wounded with these spells uness you check \"Ninja Useaction\". It's recommended you keep this box checked."
	},
	["NinjaUseAction"] = {
		["Title"] = "Ninja UseAction",
		["Description"] = "When this box is checked Heart will detect whenever you click on a healing spell on your actionbar and take control of it. This basicly means that Heart will be able to cancel your spell if you're about to overheal (it will currently NOT cancel your spellcasting if you select target after you've selected spell).\nIf you have no target or \"Tank\" set, you'll heal the player in your party/raid who Heart consider to be the most wounded (priorities affect this).It's recommended you keep this box checked."
	},
	["HookShields"] = {
		["Title"] = "Schilde zuschalten",
		["Description"] = "Wenn dieses H\195\164kchen gesetzt ist, wird Heart \"Power Word: Shield\" und \"Blessing of Protection\" mit einbeziehen. Das bedeutet, dass du diese Zauber als \"Heil\"zauber benutzen kannst und Heart dazu bringen kannst, diese auf den verwundetsten Spieler zu wirken. W\195\164hle diese Funktion ab, wenn du dies nicht nutzen willst."
	},
	["UseActionHealMostWounded"] = {
		["Title"] = "Heile den Verwundetsten",
		["Description"] = "Wenn diese Funktion und \"Hook UseAction\" aktiviert sind, wirst du den Spieler in deiner Gruppe oder Raid heilen, den Heart als den verwundetsten ansieht (Die PRIORIT\195\132TEN wirken sich hierauf aus)."
	},
	["Autocancel"] = {
		["Title"] = "Automatischer Abbruch",
		["Description"] = "Setze hier ein H\195\164kchen, wenn du willst, dass deine durch Heart gewirkten Heilzauber automatisch abgebrochen werden, wenn es zur \195\156berheilung kommen w\195\188rde. Es wird empfohlen, diese Funktion aktiviert zu lassen."
	},
	["ShapeshiftedDruids"] = {
		["Title"] = "Behandele Druiden in Tierform wie Schurken bzw. Krieger.",
		["Description"] = "Wenn dieses H\195\164kchen gesetzt ist, haben Druiden die selbe Priorit\195\164t wie Schurken wenn sie in Katzenform sind und wie Krieger wenn sie in B\195\164rform sind."
	},
	["HealStrategy"] = {
		["Title"] = "Heilstrategie",
		["Description"] = "Dieser Schieberegler bestimmt, welche Strategie Heart benutzt, um Leute zu heilen. Es gibt 3 Einstellungen:\nGeringste GP: Heile den Spieler mit den wenigsten Gesundheitspunkten (Voreinstellung).\nGeringste Gesundheit in %: Heile den Spieler, der die wenigsten Prozent seiner Gesundheit \195\188brig hat.\nMeisten GP vermissend: Heile den Spieler, der die meisten Gesundheitspunkte wiederhergestellt bekommen muss."
	},
	["SafeCancel"] = {
		["Title"] = "Sicheres Abbrechen",
		["Description"] = "Wenn dieser Haken gesetzt ist, werden Zauber nicht abgebrochen wenn man w\195\164hrend des Zauberns bereits einen neuen Zauber wirkt, au\195\159er du hast den Wert von Max. \195\156berheilung \195\188berschritten."
	},
	["TankTarget"] = {
		["Title"] = "Ziele:\"Heile max.\"",
		["Description"] = "Wenn dieser Haken gesetzt ist, wird Heart auf anvisierte freundliche Ziele immer *Ziele:\"Heile max.\"* AKA \"Tank Heal\" anwenden."
	},
	["ScaleSpells"] = {
		["Title"] = "Skaliere Zauber",
		["Description"] = "Wenn diese Funktion aktiv ist, wird Heart Zauber skalieren wenn du nicht \"target healing\" bist, um Mana zu sparen. Es wird stark empfohlen, diese Funktion aktiviert zu lassen, aber es gibt Gelegenheiten, bei denen du das vielleicht nicht tun willst (Vaelastrasz in BWL ist ein gutes Beispiel)."
	},
	["HealCharmed"] = {
		["Title"] = "Heile bezauberte Einheiten",
		["Description"] = "Wenn diese Funktion aktiv ist, wird Heart auch bezauberte Einheiten in \"Heile den Verwundetsten\" einbeziehen."
	},
	["HOTMinCancelThreshold"] = {
		["Title"] = "HoT Grenze",
		["Description"] = "Wenn eines Spielers Gesundheit unter diesen Prozentwert f\195\164llt, wird Heart nicht ber\195\188cksichtigen, wieviel HoT der Spieler erh\195\164lt. Weiterhin wird Heart dir erlauben, einen HoT auf diesen Spieler zu wirken, auch wenn noch einer besteht. Wenn du diesen Wert auf 100% stellst, wird Heart alle HoTs auf Spielern ignorieren."
	},
	["HOTMultiply"] = {
		["Title"] = "HoT Wert",
		["Description"] = "Dieser Wert bestimmt, wieviel Heilung eines HoTs au\195\159erhalb eines Kampfes vermutlich bewirkt. Da Buffs den Healbonus nicht anzeigen (z.B. \"Rejuvenation\" zeigt 189 pro tick, kann aber 300 pro tick heilen), kannst du diesen Wert auf \195\188ber 100% stellen. Falls du und deine Kollegen viel +Heilung Equipment nutzen ist es eine gute Idee, diesen Wert zu erh\195\182hen."
	},
	["HOTMultiplyBattle"] = {
		["Title"] = "HoT Wert im Kampf",
		["Description"] = "Siehe \"HoT Wert\", nur innerhalb eines Kampfes."
	},
	["MaxOverheal"] = {
		["Title"] = "Max. \195\156berheilung",
		["Description"] = "Bestimmt, wie viel \195\156berheilung erlaubt ist, bevor der Heilbalken sich rot f\195\164rbt. Der Heilbalken ist gr\195\188n, solange du nicht \195\188berheilst,\n gelb, wenn du \195\188berheilst aber dein globaler cooldown aktiv ist und \nrot wenn du \195\188berheilst und dein globaler cooldown nicht aktiv ist."
	},
	["MinHealThreshold"] = {
		["Title"] = "Gesundheitsgrenze",
		["Description"] = "Heart wird niemanden heilen, der mehr Prozent Leben \195\188brig hat, als dieser Wert. Es wird empfohlen, diesen Wert unter 100% zu belassen, da es sinnfrei ist, jemanden mit vollem Leben zu heilen."
	},
	["HealPower"] = {
		["Title"] = "Heilkraft",
		["Description"] = "Dies ist eine schicke aber auch riskante Funktion. Wenn dieser Wert auf 100% steht wirst du auf 100% Leben heilen (falls deine Zauber das hergeben), aber falls der Wert z.B. auf 50% steht, wirst du nur die H\195\164lfte seines fehlenden Lebens wiederherstellen. Falls er 50% hat, wirst du ihn so auf 75% hochheilen. Das kann sehr n\195\188tzlich sein, wenn einer von mehreren Crosshealern in einem Schlachtzug bist, da du weit weniger Mana verbrauchst, allerdings kann ein niedriger Wert auch fatale Folgen haben..."
	},
	["UpdatePlayerDataTime"] = {
		["Title"] = "Max. Aktualisierungsintervall",
		["Description"] = "Heart pr\195\188ft regelm\195\164\195\159ig alle Buffs & Debuffs der Spieler, damit es besser bestimmen kann, wie lange die Buffs schon andauern. Dies wird zur Prognose genutzt, wieviel von einem HoT ankommt. Der Wert legt fest, in welchem Intervall (Millisekunden) Genesis die Daten sammelt. Verringere den Wert um die Genauigkeit der Prognose zu verbessern, erh\195\182he ihn um weniger FPS zu verlieren. Die Funktion wurde in diversen 40-Mann Schlachtgruppen getestet, und die Methoden sind daraufhin optimiert dass der FPS Verlust nicht feststellbar sein sollte."
	},
	["RezEditBox"] = {
		["Title"] = "Rez Durchsage",
		["Description"] = "Benutze dies, um deine Rez Durchsage zu editieren.\nNutze $t im Satz, um dein Ziel zu benennen.\nDr\195\188cke Enter zum Speichern oder Escape um die \195\132nderungen zu verwerfen."
	},
	["HealBarScale"] = {
		["Title"] = "HealBar Skalierung",
		["Description"] = "Stellt die Skalierung der HealBars ein."
	},
	["CurrentHealBarsScale"] = {
		["Title"] = "CurrentHeal Skalierung",
		["Description"] = "Stellt die Skalierung der CurrentHeal Bars ein."
	},
	["ButtonsScale"] = {
		["Title"] = "GUI Scale",
		["Description"] = "Stellt die Skalierung des GUI ein."
	},
	["ShowHealingAll"] = {
		["Title"] = "Zeige alle Heilung",
		["Description"] = "Zeige alle Heilungen, die Heart Nutzer wirken. Generell empfohlen falls du ein Heiler bist."
	},
	["ShowHealingMe"] = {
		["Title"] = "Zeige nur einkommende Heilung",
		["Description"] = "Zeige nur die Heilung, die du bekommst. Kann n\195\188tzlich f\195\188r Nichtheiler sein, die sehen wollen ob eine Heilung in ihrer Richtung unterwegs ist und so besser entscheiden zu können, was zu tun ist (z.B. ob sie sich bandagieren oder Tr\195\164nke einnehmen sollen."
	},
	["NewProfileButton"] = {
		["Title"] = "Profil speichern",
		["Description"] = "Sichert deine derzeitigen Einstellungen in ein Profil."
	},
	["ProfileDropDownMenu"] = {
		["Title"] = "Profil laden",
		["Description"] = "Lade ein gesichertes Profil."
	},
	["CastTimeDebuff"] = {
		["Title"] = "Casttime Debuff",
		["Description"] = "This is a experimental setting. Heart will think your target will lose health every second for this amount and count it as a debuff to healing effect. Longer the casttime, more abatement the spell will suffer. So even when the unit's health is full, Heart will not cast a level 1 spell. As Heart believe the unit will lose health during the casttime, it will cast a spell powerful enough to heal EXPECTED damage."
	},
	["MTCastTimeDebuff"] = {
		["Title"] = "Casttime Debuff for MT",
		["Description"] = "Same as above except that this is for the MT set by TANK button. As MT do suffer damage overtime, it is a good idea to try it. Set the value to reflect your tank's HurtPerSecond. But don't set it too high as you are not the only one healing the tank."
	},
	
	["TankButton"] = {
		["Title"] = "Current Tank is: ",
		["Description"] = "Use this to set the tank. With this set, you will auto target him and all your heals goes to him. If you don't want it, select no target and click this button again, you will clean the tank set."
	},
	["OptButton"] = {
		["Title"] = "Options",
		["Description"] = "Click this to open/close your option panel."
	},
	["ClickFrameCloseButton"] = {
		["Title"] = "Close",
		["Description"] = "Click this to open/close your button panel. use \"/heart gui\" to open this panel. \"/heart opt\" to open option panel  \"/heart help\" to see full usage.  "
	},
	["ScaleHot"] = {
		["Title"] = "Scale HoTs",
		["Description"] = "If sometimes you don't want to scale Rejuvenation and Renew, you may turn this off. This option is required by some raiders"
	},
}