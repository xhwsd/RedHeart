if (GetLocale() ~= "frFR") then
	return;
end

-- classes
C_Druid = "Druide";
C_Hunter = "Chasseur";
C_Mage = "Mage";
C_Paladin = "Paladin";
C_Priest = "Pr\195\170tre";
C_Rogue = "Voleur";
C_Shaman = "Chaman";
C_Warlock = "D\195\169moniste";
C_Warrior = "Guerrier";

-- factions
C_Alliance = "Alliance";
C_Horde = "Horde";

-- spells/buffs/debuffs
C_Amplify_magic = "Amplification de la magie";
C_Banish = "Bannir";
C_Blessing_of_light = "B\195\169n\195\169diction de lumi\195\168re";
C_Blessing_of_protection = "B\195\169n\195\169diction de protection";
C_Chain_heal = "Salve de gu\195\169rison";
C_Clearcasting = "Id\195\169es claires";
C_Crystal_restore = "Cristal de restauration";
C_HotA ="Healing of the Ages";
C_Dampen_magic = "Att\195\169nuer la magie";
C_Deep_slumber = "Sommeil profond";
C_Divine_favor = "Faveur divine";
C_Divine_intervention = "Intervention divine";
C_Divine_protection = "Protection divine";
C_Divine_shield = "Bouclier divin";
C_First_aid = "Premiers soins";
C_Flash_heal = "Soins rapides";
C_Flash_of_light = "Eclair lumineux";
C_Forbearance = "Longanimit\195\169";
C_Greater_blessing_of_light = "B\195\169n\195\169diction de lumi\195\168re sup\195\169rieure";
C_Greater_heal = "Soins sup\195\169rieurs";
C_Heal = "Soins";
C_Healing_touch = "Toucher gu\195\169risseur";
C_Healing_wave = "Vague de soins";
C_Holy_light = "Lumi\195\168re sacr\195\169e";
C_Holy_nova = "Nova sacr\195\169e";
C_Holy_shock = "Horion sacr\195\169";
C_Ice_barrier = "Barri\195\168re de glace";
C_Inner_focus = "Concentration am\195\169lior\195\169e";
C_Lay_on_hands = "Imposition des mains";
C_Lesser_heal = "Soins inf\195\169rieurs";
C_Lesser_healing_wave = "Vague de soins mineurs";
C_Lightwell = "Puits de lumi\195\168re";
C_Mortal_strike = "Frappe mortelle";
C_Natures_grace = "Gr\195\162ce de la nature";
C_Natures_swiftness = "Rapidit\195\169 de la nature";
C_Phase_shift = "Changement de phase";
C_Power_infusion = "Infusion de puissance";
C_Power_word_shield = "Mot de pouvoir : Bouclier";
C_Prayer_of_healing = "Pri\195\168re de soins";
C_Recently_bandaged = "Un bandage a \195\169t\195\169 appliqu\195\169 r\195\169cemment";
C_Regrowth = "R\195\169tablissement";
C_Rejuvenation = "R\195\169cup\195\169ration";
C_Renew = "R\195\169novation";
C_Swiftmend = "Prompte gu\195\169rison";
C_Spirit_tap = "Connexion Spirituelle";
C_Tranquility = "Tranquillit\195\169";
C_Unstable_power = "Puissance instable";
C_Weakened_soul = "Ame affaiblie";
C_Resurrection = "R\195\169surrection";
C_Redemption = "R\195\169demption";
C_Rebirth = "Renaissance";
C_Ancestral_Spirit = "Esprit ancestral";
C_Curse_ot_deadwood = "Mal\195\169diction de Deadwood";
C_Gehennas_curse = "Mal\195\169diction de Gehennas";

Heart_item_heal_bonus_text = {
	"Augmente les soins prodigu\195\169s par les sorts et effets de (%d+%.?%d*)",
	"Augmente les d\195\169g\195\162ts et les soins produits par les sorts et effets magiques de (%d+%.?%d*)",
	"%+(%d+%.?%d*) aux sorts de soins",
	"Sorts de soins %+(%d+%.?%d*)",
	"Sorts de soin %+(%d+%.?%d*)",
	"Augmente les soins de %+(%d+%.?%d*)",
	"%+(%d+%.?%d*) aux d\195\169g\195\162ts des sorts et aux soins"
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
Heart_GUI_tab_title = {"Classes", "Settings", "Priorities", "Raid", "Clicks", "Display", "Rez", "Adv."}
Heart_GUI_tab_title2 = {"Display"}

-- custom classes
Heart_GUI_new = "New"
Heart_GUI_delete = "Delete"
Heart_GUI_percent = "Percent"
Heart_GUI_rank = "Rank"
Heart_GUI_new_class = "Name of new class"
Heart_GUI_okay = "Okay"
Heart_GUI_cancel = "Cancel"
Heart_GUI_new_profile = "Profile Name"

-- keys thingy
Heart_GUI_keys = {"Off", "None", "Alt", "Control", "Shift", "Alt + Control", "Alt + Shift", "Control + Shift", "All"}
Heart_GUI_heal_enough = "Heal enough"
Heart_GUI_heal_self = "Heal self"
Heart_GUI_heal_max = "Heal max"
Heart_GUI_heal_targettarget = "Heal targettarget"
Heart_GUI_heal_none = "No Healing"

-- mousehealing
Heart_GUI_left_button = "Left Button"
Heart_GUI_right_button = "Right Button"
Heart_GUI_middle_button = "Middle Button"
Heart_GUI_custom_1 = "Custom 1"
Heart_GUI_custom_2 = "Custom 2"

-- priorities
Heart_GUI_player_priority = "Player priority"
Heart_GUI_party_priority = "Party priority"
Heart_GUI_raid_priority = "Raid priority"
Heart_GUI_pet_priority = "Pet priority"
Heart_GUI_bop_priority = "BoP pri. decrease"
Heart_GUI_pws_priority = "PWS pri. decrease"
Heart_GUI_rb_priority = "RB priority increase"
Heart_GUI_ws_priority = "WS priority increase"
Heart_GUI_ms_priority = "MS priority increase"
Heart_GUI_druid_priority = C_Druid.." priority"
Heart_GUI_hunter_priority = C_Hunter.." priority"
Heart_GUI_mage_priority = C_Mage.." priority"
Heart_GUI_paladin_priority = C_Paladin.." priority"
Heart_GUI_priest_priority = C_Priest.." priority"
Heart_GUI_rogue_priority = C_Rogue.." priority"
Heart_GUI_shaman_priority = C_Shaman.." priority"
Heart_GUI_warlock_priority = C_Warlock.." priority"
Heart_GUI_warrior_priority = C_Warrior.." priority"

-- raid
Heart_GUI_check_all = "Check / Uncheck all"
Heart_GUI_uncheck_all = "Uncheck all"
Heart_GUI_invert_checked = "Invert checked"
Heart_GUI_unchecked_priority = "Unchecked priority"

-- settings
Heart_GUI_hook_useaction = "Hook ActionBar Buttons"
Heart_GUI_ninja_useaction = "Ninja ActionBar Buttons"
Heart_GUI_hook_shields = "Hook shields"
Heart_GUI_useaction_wounded = "ActionBar Buttons heal most wounded"
Heart_GUI_shapeshifted_druids = "Treat shapeshifted druids as rogues/warriors";
Heart_GUI_safe_cancel = "Safe cancel"
Heart_GUI_always_tank_target = "\"Heal Max\" targets"
Heart_GUI_scale_spells = "Scale spells"
Heart_GUI_hot_cancel = "HoT health threshold"
Heart_GUI_hot_value = "+HoT value"
Heart_GUI_hot_value_battle = "+HoT value combat"
Heart_GUI_max_overheal = "Max overheal"
Heart_GUI_min_heal_threshold = "Min health threshold"
Heart_GUI_heal_power = "Heal power"
Heart_GUI_update_time = "Max update time"
Heart_GUI_heal_strategy = "Heal strategy"
Heart_GUI_heal_strategies = {"Least HP", "Least % life", "Most HP missing"}
Heart_GUI_heal_charmed = "Heal charmed units"

--display
Heart_GUI_HealBar_Scale = "HealBars Scale"
Heart_GUI_CurrentHealBars_Scale = "CurrentHeal Scale"
Heart_GUI_Buttons_Scale = "HealGui Scale"
Heart_GUI_show_healing_me = "Show who\'s healing me"
Heart_GUI_show_healing_all = "Show other healers"

-- tooltip help
Heart_GUI_help = {
        ["MM"] = {
                ["Description"] = "Left-Click to hide/show the Options Panel.\n Right-Click to hide/show the Casting Panel."
        },
        ["MM2"] = {
                ["Description"] = "Left-Click to hide/show the \"Heal Bars\".\n Right-Click to Disable \"Show healing me\"."
        },
	["Tab1"] = {
		["Title"] = "Classes",
		["Description"] = "Create your own classes of healing spells."
	},
	["Tab2"] = {
		["Title"] = "Settings",
		["Description"] = "More advanced settings how the addon should behave."
	},
	["Tab3"] = {
		["Title"] = "Priorities",
		["Description"] = "Change the way the addon prioritize the players."
	},
	["Tab4"] = {
		["Title"] = "Raid",
		["Description"] = "Here you can chose which players to heal when you're in a raid and are healing using the \"heal most wounded\" feature."
	},
	["Tab5"] = {
		["Title"] = "Clicks",
		["Description"] = "Associate a healing spell to a mousebutton, so you can simply click on a player frame to heal that person.\nConfigure how the addon will react when you press certain buttons (alt/ctrl/shift) while healing."
	},
	["Tab6"] = {
		["Title"] = "Display",
		["Description"] = "Display settings."
	},
	["Tab7"] = {
		["Title"] = "Rez",
		["Description"] = "Rez Button Settings."
	},
	["Heart_GUISpellSelect%dSpell"] = {
		["Title"] = "",
		["Description"] = "Click this spell to add it to the current heal class."
	},
	["Heart_GUISpellSelect%dAttachment"] = {
		["Title"] = "",
		["Description"] = "Click this spell to \"Attach\" it to a spell in this HealClass. \"Attach\" this spell to another by clicking on the spell you wish to attach it to. At that spells percent, this spell will be cast first if it is able to be cast."
	},

	["Heart_GUIClass%dSpell$"] = {
		["Title"] = "Class Spell",
		["Description"] = "This is the spell to be cast at the given percent.\n Click the spel to remove it from this class."
	},
	["ClassDropDownMenu"] = {
		["Title"] = "Select class",
		["Description"] = "Select a class in this list to configure it."
	},
	["NewClassButton"] = {
		["Title"] = "New class",
		["Description"] = "Click here to create a new class."
	},
	["DeleteClassButton"] = {
		["Title"] = "Delete class",
		["Description"] = "Click here to delete the currently selected class."
	},
	["Heart_GUIClass%dRankSlider"] = {
		["Title"] = "Rank",
		["Description"] = "Select the highest rank you want to use of this spell."
	},
	["Heart_SpellSelectPopUpFramePercentSlider"] = {
		["Title"] = "Percent",
		["Description"] = "Select the highest percent a player may have for this spell to be used. If there's another spell in this class with a lower max percent value then that spell will be used if a unit has less percent life left than that value."
	},
	["Heart_GUIClass%dScaleCheckBox"] = {
		["Title"] = "Spell Scaling",
		["Description"] = "If selected, this spell will not scale above or below the rank set by the rank slider."
	},
	["Heart_GUIClass%dSpellAttachment"] = {
		["Title"] = "Attachment Spell",
		["Description"] = "Click this spell to remove it's attachment from the primary spell."
	},
	["Heart_GUIHealSelfModifier"] = {
		["Title"] = "Heal self modifier",
		["Description"] = "When you hold down the given key here and click on a healing spell then you will heal yourself. This setting can not be the same setting as \"Heal targettarget modifier\". This setting have no impact on \"mouse healing\"."
	},
	["Heart_GUIHealEnoughModifier"] = {
		["Title"] = "Heal enough modifier",
		["Description"] = "If you hold down this key and use \"mouse healing\" and click on someone, then you will heal that person enough to restore the players missing hitpoints. This setting can not be the same setting as \"Heal max modifier\". Only \"mouse healing\" is affected by this setting."
	},
	["Heart_GUIHealMaxModifier"] = {
		["Title"] = "Heal max modifier",
		["Description"] = "When this key is pressed and you use \"mouse healing\" on someone then Heart will \"tank heal\" that player. This setting can not be the same setting as \"Heal enough modifier\". Only \"mouse healing\" is affected by this setting."
	},
	["Heart_GUIHealTargettargetModifier"] = {
		["Title"] = "Heal targettarget modifier",
		["Description"] = "Hold down this button to heal the target your current target got. This setting can not be the same setting as \"Heal self modifier\". This setting have no impact on \"mouse healing\"."
	},
	["Heart_GUIHealNoneModifier"] = {
		["Title"] = "No healing modifier",
		["Description"] = "Hold down this button to no heal when you click a unit frame. This setting CAN NOT be the same setting as any other modifiers unless that setting is \"Off\". Use this setting to over-ride any modifier set to \"None\" so you can still have the ability to target and get unit menues by clicking."
	},
	["Heart_GUILeftButtonDrop"] = {
		["Title"] = "Left button",
		["Description"] = "Select a class or a spell to associate with your left button."
	},
	["Heart_GUILeftButtonRank"] = {
		["Title"] = "Spell rank",
		["Description"] = "Select the highest rank you want to use of this spell."
	},
	["Heart_GUIRightButtonDrop"] = {
		["Title"] = "Right button",
		["Description"] = "Select a class or a spell to associate with your right button."
	},
	["Heart_GUIRightButtonRank"] = {
		["Title"] = "Spell rank",
		["Description"] = "Select the highest rank you want to use of this spell."
	},
	["Heart_GUIMiddleButtonDrop"] = {
		["Title"] = "Middle button",
		["Description"] = "Select a class or a spell to associate with your middle button."
	},
	["Heart_GUIMiddleButtonRank"] = {
		["Title"] = "Spell rank",
		["Description"] = "Select the highest rank you want to use of this spell."
	},
	["Heart_GUIButton4Drop"] = {
		["Title"] = "Button 4",
		["Description"] = "Select a class or a spell to associate with your button 4."
	},
	["Heart_GUIButton4Rank"] = {
		["Title"] = "Spell rank",
		["Description"] = "Select the highest rank you want to use of this spell."
	},
	["Heart_GUIButton5Drop"] = {
		["Title"] = "Button 5",
		["Description"] = "Select a class or a spell to associate with your button 5."
	},
	["Heart_GUIButton5Rank"] = {
		["Title"] = "Spell rank",
		["Description"] = "Select the highest rank you want to use of this spell."
	},
	["Heart_GUICustomButton1Drop"] = {
		["Title"] = "Custom button 1",
		["Description"] = "Select a class or a spell to associate with your custom button 1."
	},
	["Heart_GUICustomButton1Rank"] = {
		["Title"] = "Spell rank",
		["Description"] = "Select the highest rank you want to use of this spell."
	},
	["Heart_GUICustomButton2Drop"] = {
		["Title"] = "Custom button 2",
		["Description"] = "Select a class or a spell to associate with your custom button 2."
	},
	["Heart_GUICustomButton2Rank"] = {
		["Title"] = "Spell rank",
		["Description"] = "Select the highest rank you want to use of this spell."
	},
	["PlayerPriority"] = {
		["Title"] = "Player priority",
		["Description"] = "Set your priority."
	},
	["PartyPriority"] = {
		["Title"] = "Party priority",
		["Description"] = "Set party members priority."
	},
	["RaidPriority"] = {
		["Title"] = "Raid priority",
		["Description"] = "Set raid members priority.",
	},
	["PetPriority"] = {
		["Title"] = "Pet priority",
		["Description"] = "Set pets priority.",
	},
	["MTPriority"] = {
		["Title"] = "MainTank priority increase",
		["Description"] = "Set how much a players priority will increase for MainTanks (set through CT_RA or oRA)."
	},
	["BOPPriority"] = {
		["Title"] = "Blessing of Protection priority decrease",
		["Description"] = "Set how much a players priority will decrease when the player got buff \"Blessing of Protection\"."
	},
	["PWSPriority"] = {
		["Title"] = "Power Word: Shield priority decrease",
		["Description"] = "Set how much a players priority will decrease when the player got buff \"Power Word: Shield\". This value should always be higher than or equal to the Weakened Soul priority increase value."
	},
	["RBPriority"] = {
		["Title"] = "Recently Bandaged priority increase",
		["Description"] = "Set how much a players priority will increase when the player got debuff \"Recently Bandaged\"."
	},
	["WSPriority"] = {
		["Title"] = "Weakened Soul priority increase",
		["Description"] = "Set how much a players priority will increase when the player got debuff \"Weakened Soul\". This value should always be less than or equal to the Power Word: Shield priority decrease value."
	},
	["MSPriority"] = {
		["Title"] = "Mortal Strike priority increase",
		["Description"] = "Set how much a players priority will increase when the player got debuff \"Mortal Strike\". This value should always be less than or equal to the Power Word: Shield priority decrease value."
	},
	["DruidPriority"] = {
		["Title"] = C_Druid.." priority",
		["Description"] = "Set "..C_Druid.."s priority."
	},
	["HunterPriority"] = {
		["Title"] = C_Hunter.." priority",
		["Description"] = "Set "..C_Hunter.."s priority."
	},
	["MagePriority"] = {
		["Title"] = C_Mage.." priority",
		["Description"] = "Set "..C_Mage.."s priority."
	},
	["PaladinPriority"] = {
		["Title"] = C_Paladin.." priority",
		["Description"] = "Set "..C_Paladin.."s priority."
	},
	["PriestPriority"] = {
		["Title"] = C_Priest.." priority",
		["Description"] = "Set "..C_Priest.."s priority."
	},
	["RoguePriority"] = {
		["Title"] = C_Rogue.." priority",
		["Description"] = "Set "..C_Rogue.."s priority."
	},
	["ShamanPriority"] = {
		["Title"] = C_Shaman.." priority",
		["Description"] = "Set "..C_Shaman.."s priority."
	},
	["WarlockPriority"] = {
		["Title"] = C_Warlock.." priority",
		["Description"] = "Set "..C_Warlock.."s priority."
	},
	["WarriorPriority"] = {
		["Title"] = C_Warrior.." priority",
		["Description"] = "Set "..C_Warrior.."s priority."
	},
	["RaidGroup%dLabel"] = {
		["Title"] = "Check/Uncheck group",
		["Description"] = "Click here if you wish to check/uncheck all the players in this group."
	},
	["RaidGroup%dSlot%dCheckButton"] = {
		["Title"] = "Check/Uncheck player",
		["Description"] = "Click here if you wish to check/uncheck this players."
	},
	["RaidCheckAllButton"] = {
		["Title"] = "Check / Uncheck all",
		["Description"] = "Left Click to check all the players. Right Click to uncheck all players"
	},
	["RaidInvertCheckedButton"] = {
		["Title"] = "Invert checked",
		["Description"] = "Click here if you wish to invert the checked/unchecked players."
	},
	["RaidUncheckedPrioritySlider"] = {
		["Title"] = "Unchecked priority",
		["Description"] = "Set what priority unchecked players should have. If you set this to 0% then you won't heal the unchecked players at all."
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
		["Title"] = "Hook shields",
		["Description"] = "If this box is checked Heart will hook \"Power Word: Shield\" and \"Blessing of Protection\". This means that you can use these spells as a \"healing\" spell and make Heart cast the spell on the most wounded player. Uncheck the box if you don't want these shields to be used as a healing spell."
	},
	["UseActionHealMostWounded"] = {
		["Title"] = "UseAction heal most wounded",
		["Description"] = "When this box and the \"Hook UseAction\" box is checked you'll heal the player in your party/raid who Heart consider to be the most wounded (priorities affect this). This feature won't work unless \"Hook UseAction\" is checked."
	},
	["Autocancel"] = {
		["Title"] = "Autocancel healing",
		["Description"] = "Check this box if you want your healing spells used through Heart to be automatically cancelled if you're about to overheal. It's recommended you keep this box checked."
	},
	["ShapeshiftedDruids"] = {
		["Title"] = "Treat shapeshifted druids as rogues/warriors",
		["Description"] = "Check this box to give druids the same priority as rogues when they're in cat form and the same priority as warriors when they're in bear form."
	},
	["HealStrategy"] = {
		["Title"] = "Heal strategy",
		["Description"] = "This slider determines which strategy Heart should use to heal people. There are 3 settings:\nLeast HP: Heal the player with least hitpoints left (default).\nLeast % life: Heal the player with least percent life left.\nMost HP missing: Heal the player with most hitpoints needed to be restored."
	},
	["SafeCancel"] = {
		["Title"] = "Safe cancel",
		["Description"] = "When this box is checked spells won't be cancelled by clicking on a healing spell/macro unless you will overheal more than the max overheal value."
	},
	["TankTarget"] = {
		["Title"] = "\"Heal Max\" targets",
		["Description"] = "When this box is checked Heart will always \"Heal Max\" targeted friendly units. AKA \"Tank Heal\"."
	},
	["ScaleSpells"] = {
		["Title"] = "Scale Spells",
		["Description"] = "If this box is checked Heart will scale down when you're not \"target healing\" to save mana. It's highly recommended that you keep this feature on, but there are some places where you might not want to scale down spells (Vaelastrasz in BWL is a good example)."
	},
	["HealCharmed"] = {
		["Title"] = "Heal charmed units",
		["Description"] = "If this box is checked Heart will heal charmed units when \"Healing most wounded\"."
	},
	["HOTMinCancelThreshold"] = {
		["Title"] = "HoT health threshold",
		["Description"] = "When a players life drops below the given percent Heart won't concider how much HOT the player will receive. If you set this value to 100% Heart will ignore any HOT on players. When a player drops below this value Heart will also allow you to put a new hot on the player even if the player got the hot already."
	},
	["HOTMultiply"] = {
		["Title"] = "HoT value",
		["Description"] = "This value determine how much healing Heart believe a HOT will do out of combat. Since buffs only say how much the HoT will heal without heal bonus (eg. \"Rejuvenation\" buff will show 189 per tick, but it can heal for 300 per tick) you can set this value higher than 100%. If you and the healers you usually heal with got alot of +healing gear then it could be an idea to increase this value."
	},
	["HOTMultiplyBattle"] = {
		["Title"] = "HoT value combat",
		["Description"] = "Same as \"HoT value\" except this is in combat."
	},
	["MaxOverheal"] = {
		["Title"] = "Max overheal",
		["Description"] = "How much overhealing you'll allow before the heal frame go red. The heal frame will be green as long as you won't overheal, yellow if you're about to overheal but you got global cooldown and red if you're about to overheal and don't have global cooldown."
	},
	["MinHealThreshold"] = {
		["Title"] = "Min health threshold",
		["Description"] = "Heart won't heal anyone with more percent life left than what's given here. Recommended to keep a bit below 100% as it's pointless to heal someone who's almost as full health."
	},
	["HealPower"] = {
		["Title"] = "Heal power",
		["Description"] = "This is a damn fancy, but a risky feature. When this value is set to 100% you'll heal someone to 100% life (as long as you got a powerful enough spell & rank), but when the value is set to eg. 50% you'll only heal 50% of the life the player is missing. This feature is impressingly useful in raids where there are several healers. Your mana will last alot longer if you decrease this value, but too low values can be very fatal."
	},
	["UpdatePlayerDataTime"] = {
		["Title"] = "Max update time",
		["Description"] = "Heart regularly check every players buffs & debuffs so it's capable of determining how long they've had these buffs. This is needed to know how much healing they'll receive from HOT. The value you specify here is how many milliseconds of a second you'll allow Heart to use to collect this data. Increase the value for a more accurate reading, decrease it for less FPS loss. This has been tested alot in 40 man raids, and despite all the data it has to look through the methods are so optimized that the FPS drop is not even noticable."
	},
	["RezEditBox"] = {
		["Title"] = "Rez Announcement",
		["Description"] = "Use this to edit your rez announcement.\nUse $t in the sentence to name your rez target.\nPress Enter to save changes or Escape to undo changes"
	},
	["HealBarScale"] = {
		["Title"] = "HealBar Scale",
		["Description"] = "Sets the scale of the HealBars."
	},
	["CurrentHealBarsScale"] = {
		["Title"] = "CurrentHeal Scale",
		["Description"] = "Sets the scale of the CurrentHeal Bars."
	},
	["ButtonsScale"] = {
		["Title"] = "GUI Scale",
		["Description"] = "Set the scale of the GUI."
	},
	["ShowHealingAll"] = {
		["Title"] = "Show all healing",
		["Description"] = "Show the healing everyone using Heart is doing. Generally recommended if you're a healer."
	},
	["ShowHealingMe"] = {
		["Title"] = "Show only healing me",
		["Description"] = "Show only the healing i receive. Can be useful for non-healers who wish to know whether they got a heal coming their way or not and that way can decide whether to use a potion/bandage or not."
	},
	["NewProfileButton"] = {
		["Title"] = "Save Profile",
		["Description"] = "Saves Your current settings to a profile."
	},
	["ProfileDropDownMenu"] = {
		["Title"] = "Saved Profile",
		["Description"] = "Load a saved Profile."
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