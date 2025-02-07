if (GetLocale() ~= "zhCN") then
	return;
end

Heart_hot_text = {"Interval","Heal"}

-- classes
C_Druid = "德鲁伊";
C_Hunter = "猎人";
C_Mage = "法师";
C_Paladin = "圣骑士";
C_Priest = "牧师";
C_Rogue = "盗贼";
C_Shaman = "萨满祭司";
C_Warlock = "术士";
C_Warrior = "战士";

-- factions
C_Alliance = "Alliance";
C_Horde = "Horde";

-- spells/buffs/debuffs
C_Amplify_magic = "魔法增效";
C_Banish = "放逐";
C_Blessing_of_light = "光明祝福";
C_Blessing_of_protection = "保护祝福";
C_Chain_heal = "治疗链";
C_Clearcasting = "清晰预兆";
C_Crystal_restore = "Crystal Restore";
C_HotA ="Healing of the Ages";
C_Dampen_magic = "魔法抑制";
C_Deep_slumber = "Deep Slumber";
C_Divine_favor = "神恩术";
C_Divine_intervention = "神圣干涉";
C_Divine_protection = "圣佑术";
C_Divine_shield = "圣盾术";
C_First_aid = "急救";
C_Flash_heal = "快速治疗";
C_Flash_of_light = "圣光闪现";
C_Forbearance = "自律";
C_Greater_blessing_of_light = "强效光明祝福";
C_Greater_heal = "强效治疗术";
C_Heal = "治疗术";
C_Healing_touch = "治疗之触";
C_Healing_wave = "治疗波";
C_Holy_light = "圣光术";
C_Holy_nova = "神圣新星";
C_Holy_shock = "神圣震击";
C_Ice_barrier = "寒冰护体";
C_Inner_focus = "心灵专注";
C_Lay_on_hands = "圣疗术";
C_Lesser_heal = "次级治疗术";
C_Lesser_healing_wave = "次级治疗波";
C_Lightwell = "光明之泉";
C_Mortal_strike = "致死打击";
C_Natures_grace = "自然之赐";
C_Natures_swiftness = "自然迅捷";
C_Phase_shift = "相位变换";
C_Power_infusion = "能量灌注";
C_Power_word_shield = "真言术：盾";
C_Prayer_of_healing = "治疗祷言";
C_Recently_bandaged = "新近包扎";
C_Regrowth = "愈合";
C_Rejuvenation = "回春术";
C_Renew = "恢复";
C_Spirit_tap = "精神分流";
C_Swiftmend = "迅捷治愈";
C_Tranquility = "宁静";
C_Unstable_power = "Unstable Power";
C_Weakened_soul = "虚弱灵魂";
C_Resurrection = "复活术";
C_Redemption = "救赎";
C_Rebirth = "复生";
C_Ancestral_Spirit = "先祖之魂";
C_Curse_ot_deadwood = "Curse of the Deadwood";
C_Gehennas_curse = "Gehennas' Curse";

Heart_item_heal_bonus_text = {
        "提高法术所造成的治疗效果，最多(%d+%.?%d*)点",
        "提高所有法术和魔法效果所造成的伤害和治疗效果，最多(%d+%.?%d*)点",
	"%+(%d+%.?%d*) 治疗法术",
	"治疗法术 %+(%d+%.?%d*)"
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
Heart_GUI_tab_title = {"组合", "设置", "优先", "团队", "点击", "显示", "复活", "高级"}
Heart_GUI_tab_title2 = {"Display"}

-- custom classes
Heart_GUI_new = "新建"
Heart_GUI_delete = "删除"
Heart_GUI_percent = "百分比"
Heart_GUI_rank = "等级"
Heart_GUI_new_class = "新组合的名称"
Heart_GUI_okay = "Okay"
Heart_GUI_cancel = "Cancel"
Heart_GUI_new_profile = "档案名称"

-- keys thingy
Heart_GUI_keys = {"Off", "None", "Alt", "Control", "Shift", "Alt + Control", "Alt + Shift", "Control + Shift", "All"}
Heart_GUI_heal_enough = "适度治疗"
Heart_GUI_heal_self = "自我治疗"
Heart_GUI_heal_max = "最大治疗 "
Heart_GUI_heal_targettarget = "治疗目标的目标"
Heart_GUI_heal_none = "无动作"

-- mousehealing
Heart_GUI_left_button = "左键"
Heart_GUI_right_button = "右键"
Heart_GUI_middle_button = "中键"
Heart_GUI_custom_1 = "Custom 1"
Heart_GUI_custom_2 = "Custom 2"

-- priorities
Heart_GUI_player_priority = "玩家优先级"
Heart_GUI_party_priority = "队友优先级"
Heart_GUI_raid_priority = "团队优先级"
Heart_GUI_pet_priority = "宠物优先级"
Heart_GUI_MT_priority = "MT优先级"
Heart_GUI_bop_priority = "BoP pri. decrease"
Heart_GUI_pws_priority = "PWS pri. decrease"
Heart_GUI_rb_priority = "RB priority increase"
Heart_GUI_ws_priority = "WS priority increase"
Heart_GUI_ms_priority = "MS priority increase"
Heart_GUI_druid_priority = C_Druid.." 优先级"
Heart_GUI_hunter_priority = C_Hunter.." 优先级"
Heart_GUI_mage_priority = C_Mage.." 优先级"
Heart_GUI_paladin_priority = C_Paladin.." 优先级"
Heart_GUI_priest_priority = C_Priest.." 优先级"
Heart_GUI_rogue_priority = C_Rogue.." 优先级"
Heart_GUI_shaman_priority = C_Shaman.." 优先级"
Heart_GUI_warlock_priority = C_Warlock.." 优先级"
Heart_GUI_warrior_priority = C_Warrior.." 优先级"

-- raid
Heart_GUI_check_all = "选择/取消所有"
Heart_GUI_uncheck_all = "取消所有"
Heart_GUI_invert_checked = "反向选择"
Heart_GUI_unchecked_priority = "未选中的优先级"

-- settings
Heart_GUI_hook_useaction = "挂接用户动作"
Heart_GUI_ninja_useaction = "覆盖用户动作"
Heart_GUI_hook_shields = "挂接盾法术"
Heart_GUI_useaction_wounded = "ActionBar Buttons heal most wounded"
Heart_GUI_shapeshifted_druids = "变形小D当作贼/战士";
Heart_GUI_safe_cancel = "安全取消"
Heart_GUI_always_tank_target = "\"Heal Max\" targets"
Heart_GUI_scale_spells = "改变法术等级"
Heart_GUI_scale_hots="改变HOT等级"
Heart_GUI_hot_cancel = "HoT门槛"
Heart_GUI_hot_value = "HoT放大"
Heart_GUI_hot_value_battle = "HoT放大-战斗"
Heart_GUI_max_overheal = "最大过量治疗"
Heart_GUI_min_heal_threshold = "治疗门槛"
Heart_GUI_heal_power = "治疗力度"
Heart_GUI_update_time = "刷新时间"
Heart_GUI_heal_strategy = "治疗策略"
Heart_GUI_heal_strategies = {"最小生命", "最小百分比生命", "最多失血"}
Heart_GUI_heal_charmed = "Heal charmed units"

--display
Heart_GUI_HealBar_Scale = "治疗条比例"
Heart_GUI_CurrentHealBars_Scale = "当前治疗条比例"
Heart_GUI_Buttons_Scale = "用户界面比例"
Heart_GUI_show_healing_me = "显示治疗我的人"
Heart_GUI_show_healing_all = "显示其它治疗者"

--adv
Heart_GUI_CastTime_Debuff= "施法时间补偿"
Heart_GUI_MTCastTime_Debuff= "MT施法时间补偿"



-- tooltip help
Heart_GUI_help = {
        ["MM"] = {
                ["Description"] = "左键点击显示/隐藏选项版.\n 右键点击显示/隐藏法术版."
        },
        ["MM2"] = {
                ["Description"] = "左键点击显示/隐藏\"治疗条\".\n 右键点击以关闭 \"显示对我的治疗\"."
        },
	["Tab1"] = {
		["Title"] = "组合",
		["Description"] = "创建你自己的法术组合。"
	},
	["Tab2"] = {
		["Title"] = "设置",
		["Description"] = "控制复杂插件行为的设置"
	},
	["Tab3"] = {
		["Title"] = "优先级",
		["Description"] = "改变插件选择治疗目标的策略."
	},
	["Tab4"] = {
		["Title"] = "团队",
		["Description"] = "这里你可以选择治疗哪些团队队友，当你使用\"heal most wounded\"功能时。"
	},
	["Tab5"] = {
		["Title"] = "鼠标治疗",
		["Description"] = "将治疗法术与鼠标键联系起来, 这样你可以只需鼠标点击某个玩家以治疗他。\n详细设置可以改变插件的行为，当你按住 (alt/ctrl/shift)键并治疗时。"
	},
	["Tab6"] = {
		["Title"] = "显示",
		["Description"] = "显示设置"
	},
	["Tab7"] = {
		["Title"] = "复活",
		["Description"] = "复活按钮设置"
	},
	["Heart_GUISpellSelect%dSpell"] = {
		["Title"] = "",
		["Description"] = "点击这个治疗法术将它加入当前的法术组合"
	},
	["Heart_GUISpellSelect%dAttachment"] = {
		["Title"] = "",
		["Description"] = "点击这个法术使它 \"挂接\" 在另一个法术上. 选择与要\"挂接\"的法术相同的百分比. 在这个百分比上，如果能释放，这个法术将先释放出来, 典型的应用是自然迅捷."
	},

	["Heart_GUIClass%dSpell$"] = {
		["Title"] = "组合法术",
		["Description"] = "这个法术会在给定的百分比上释放.\n 点击来将这个法术从组合中取消."
	},
	["ClassDropDownMenu"] = {
		["Title"] = "选择组合",
		["Description"] = "选择下拉条中的一个组合来设置它."
	},
	["NewClassButton"] = {
		["Title"] = "新组合",
		["Description"] = "点击创建一个新的组合."
	},
	["DeleteClassButton"] = {
		["Title"] = "删除组合",
		["Description"] = "点击这里以删除当前的组合."
	},
	["Heart_GUIClass%dRankSlider"] = {
		["Title"] = "等级",
		["Description"] = "设置你想使用这个魔法的最高等级."
	},
	["Heart_SpellSelectPopUpFramePercentSlider"] = {
		["Title"] = "百分比",
		["Description"] = "选择适用这个魔法的最高百分比, 如果有一个玩家的生命低于这个百分比, 并且高于列表下面的一个更低的值, 这个魔法就将被使用, 否则使用列表更下方的魔法, 以此类推."
	},
	["Heart_GUIClass%dScaleCheckBox"] = {
		["Title"] = "法术等级",
		["Description"] = "如果选择这项, 这个法术就不会使用超过或低于滑动条所设置的等级."
	},
	["Heart_GUIClass%dSpellAttachment"] = {
		["Title"] = "挂接魔法",
		["Description"] = "点击这里以从主魔法上移除挂接魔法."
	},
	["Heart_GUIHealSelfModifier"] = {
		["Title"] = "自我治疗快捷",
		["Description"] = "当你按下这个键时并释放治疗法术时, 你就会治疗自己. 这个设置不能与 \"治疗目标的目标快捷\" 相同. 这个设置对 \"鼠标治疗\" 没有影响."
	},
	["Heart_GUIHealEnoughModifier"] = {
		["Title"] = "适度治疗快捷",
		["Description"] = "当你按下这个键, 并使用 \"鼠标治疗\" 点某人时, 你会适度治疗他以使他刚好恢复所有失去的生命值. 这个设置不能与 \"最大治疗快捷\" 相同. "
	},
	["Heart_GUIHealMaxModifier"] = {
		["Title"] = "最大治疗快捷",
		["Description"] = "当你按下这个键, 并使用 \"鼠标治疗\" 点某人时, Heart会 \"tank 治疗\" 这个人. 这个设置不能与 \"足额治疗快捷\" 相同. 测试中, 这个键表现为能暂时取消\"改变法术等级\"的功能. "
	},
	["Heart_GUIHealTargettargetModifier"] = {
		["Title"] = "治疗目标的目标快捷",
		["Description"] = "当你按下这个键时并释放治疗法术时, 你就会治疗目标的目标. 这个设置不能与 \"自我治疗快捷\" 相同. 这个设置对 \"鼠标治疗\" 没有影响."
	},
	["Heart_GUIHealNoneModifier"] = {
		["Title"] = "不治疗快捷",
		["Description"] = "按下这个键点队友头像时, Heart不会产生任何治疗动作. 这个设置不能与其它快捷相同. 可以用这个选项来关闭其它快捷, 这样你就能正常地点用户头像选择目标了."
	},
	["Heart_GUILeftButtonDrop"] = {
		["Title"] = "左键",
		["Description"] = "Select a class or a spell to associate with your left button."
	},
	["Heart_GUILeftButtonRank"] = {
		["Title"] = "法术等级",
		["Description"] = "选择你想使用这个魔法的最高等级."
	},
	["Heart_GUIRightButtonDrop"] = {
		["Title"] = "右键",
		["Description"] = "Select a class or a spell to associate with your right button."
	},
	["Heart_GUIRightButtonRank"] = {
		["Title"] = "法术等级",
		["Description"] = "选择你想使用这个魔法的最高等级."
	},
	["Heart_GUIMiddleButtonDrop"] = {
		["Title"] = "Middle button",
		["Description"] = "Select a class or a spell to associate with your middle button."
	},
	["Heart_GUIMiddleButtonRank"] = {
		["Title"] = "法术等级",
		["Description"] = "选择你想使用这个魔法的最高等级."
	},
	["Heart_GUIButton4Drop"] = {
		["Title"] = "Button 4",
		["Description"] = "Select a class or a spell to associate with your button 4."
	},
	["Heart_GUIButton4Rank"] = {
		["Title"] = "法术等级",
		["Description"] = "选择你想使用这个魔法的最高等级."
	},
	["Heart_GUIButton5Drop"] = {
		["Title"] = "法术等级",
		["Description"] = "Select a class or a spell to associate with your button 5."
	},
	["Heart_GUIButton5Rank"] = {
		["Title"] = "法术等级",
		["Description"] = "选择你想使用这个魔法的最高等级."
	},
	["Heart_GUICustomButton1Drop"] = {
		["Title"] = "Custom button 1",
		["Description"] = "Select a class or a spell to associate with your custom button 1."
	},
	["Heart_GUICustomButton1Rank"] = {
		["Title"] = "法术等级",
		["Description"] = "选择你想使用这个魔法的最高等级."
	},
	["Heart_GUICustomButton2Drop"] = {
		["Title"] = "Custom button 2",
		["Description"] = "Select a class or a spell to associate with your custom button 2."
	},
	["Heart_GUICustomButton2Rank"] = {
		["Title"] = "法术等级",
		["Description"] = "选择你想使用这个魔法的最高等级."
	},
	["PlayerPriority"] = {
		["Title"] = "玩家优先级",
		["Description"] = "设置你自己优先级."
	},
	["PartyPriority"] = {
		["Title"] = "小队优先级",
		["Description"] = "设置小队队友的优先等级."
	},
	["RaidPriority"] = {
		["Title"] = "团队优先级",
		["Description"] = "设置团队队员的优先等级.",
	},
	["PetPriority"] = {
		["Title"] = "宠物优先级",
		["Description"] = "设置你宠物的优先等级.",
	},
	["MTPriority"] = {
		["Title"] = "主Tank优先增加",
		["Description"] = "主tank优先级将增加多少 (通过 CT_RA or oRA 获得)."
	},
	["BOPPriority"] = {
		["Title"] = "保护祝福优先降低",
		["Description"] = "设置玩家获得保护祝福以后优先级减少多少."
	},
	["PWSPriority"] = {
		["Title"] = "盾优先降低",
		["Description"] = "设置玩家获得真言:盾效果以后, 优先级降低多少. 这个数应该大于为虚弱灵魂的增加的数."
	},
	["RBPriority"] = {
		["Title"] = "新近包扎优先增加",
		["Description"] = "设置玩家获得新近包扎效果以后以后优先级增加多少."
	},
	["WSPriority"] = {
		["Title"] = "虚弱灵魂优先增加",
		["Description"] = "设置玩家获得虚弱灵魂后, 优先级的增加量"
	},
	["MSPriority"] = {
		["Title"] = "致死打击优先增加",
		["Description"] = "设置玩家获得致死打击效果以后, 优先级的增加."
	},
	["DruidPriority"] = {
		["Title"] = C_Druid.."优先级",
		["Description"] = "设置"..C_Druid.."的优先级."
	},
	["HunterPriority"] = {
		["Title"] = C_Hunter.."优先级",
		["Description"] = "设置"..C_Hunter.."的优先级"
	},
	["MagePriority"] = {
		["Title"] = C_Mage.."优先级",
		["Description"] = "设置"..C_Mage.."的优先级"
	},
	["PaladinPriority"] = {
		["Title"] = C_Paladin.."优先级",
		["Description"] = "设置"..C_Paladin.."的优先级"
	},
	["PriestPriority"] = {
		["Title"] = C_Priest.."优先级",
		["Description"] = "设置"..C_Priest.."的优先级"
	},
	["RoguePriority"] = {
		["Title"] = C_Rogue.."优先级",
		["Description"] = "设置"..C_Rogue.."的优先级"
	},
	["ShamanPriority"] = {
		["Title"] = C_Shaman.."优先级",
		["Description"] = "设置"..C_Shaman.."的优先级"
	},
	["WarlockPriority"] = {
		["Title"] = C_Warlock.."优先级",
		["Description"] = "设置"..C_Warlock.."的优先级."
	},
	["WarriorPriority"] = {
		["Title"] = C_Warrior.."优先级",
		["Description"] = "设置"..C_Warrior.."的优先级."
	},
	["RaidGroup%dLabel"] = {
		["Title"] = "选择/撤销小队",
		["Description"] = "点击以选择/取消这个组的所有成员."
	},
	["RaidGroup%dSlot%dCheckButton"] = {
		["Title"] = "选择/取消玩家",
		["Description"] = "点击以选择/取消这个玩家."
	},
	["RaidCheckAllButton"] = {
		["Title"] = "选择/取消所有",
		["Description"] = "左键点击选择所有玩家, 右键点击撤销选择所有玩家"
	},
	["RaidInvertCheckedButton"] = {
		["Title"] = "反向选择",
		["Description"] = "点击以反向选择."
	},
	["RaidUncheckedPrioritySlider"] = {
		["Title"] = "未选中的优先级",
		["Description"] = "设置未被选中的玩家适用什么优先级. 如果你设置为 0%, 那么你就根本不会去治疗未被选中的玩家."
	},
	["UseAction"] = {
		["Title"] = "挂接用户动作",
		["Description"] = "这个选项被选择以后，当你释放一个治疗魔法时，Heart会将它显示在治疗列表中并向其它治疗者广播这个信息，以便协同治疗。Heart不会改变治疗的等级或是治疗目标，除非你选择了\"覆盖用户动作\". 强烈建议选择这个选项."
	},
	["NinjaUseAction"] = {
		["Title"] = "覆盖用户动作",
		["Description"] = "这个选项被选择以后，当你试图释放一个治疗魔法时，Heart会接管这个动作. 这意味着Heart发现过量治疗时会取消这个动作(目前还不会取消释放魔法之后再选择目标的动作）.\n如果你没有目标也没有设置 \"Tank\", 你会治疗Heart认为伤得最重的队友(受优先级选项控制). 如果你很认同Heart的人工智能算法，就选吧."
	},
	["HookShields"] = {
		["Title"] = "挂接盾法术",
		["Description"] = "当这个选项被选择时，Heart会挂接 \"真言:盾\" 和 \"保护祝福\". 这意味着你可以把他们当作“治疗”法术并让Heart将它们自动释放在伤得最重的队友身上. 如果你不想把这些盾法术当作治疗法术，就取消这个选项."
	},
	["Autocancel"] = {
		["Title"] = "自动取消治疗",
		["Description"] = "如果你希望由Heart释放的法术能够自动取消，当被判断为过量治疗时. 建议打开这个选项."
	},
	["ShapeshiftedDruids"] = {
		["Title"] = "把变形的小D当作贼/战士",
		["Description"] = "如果你希望，小D变形以后适用贼/战士的优先级，就选择这个选项."
	},
	["HealStrategy"] = {
		["Title"] = "治疗策略",
		["Description"] = "这个滑动条决定了Heart的治疗策略，有3个选项:\n最少生命值: 治疗生命值最少的玩家(默认).\n最少百分比生命: 治疗百分比生命最少的玩家.\n失血最多: 治疗失血最多的玩家（最大生命-当前生命）."
	},
	["SafeCancel"] = {
		["Title"] = "安全取消",
		["Description"] = "选中这个选项后, 再点击一个治疗魔法或者宏的时候, 就不会取消当前的释法, 除非是即将过量治疗了. 推荐选这个, 好用"
	},
	["TankTarget"] = {
		["Title"] = "\"Heal Max\" targets",
		["Description"] = "当选中这个选项时, 将会总是 \"Heal Max\" 目标. 也就是总是最大治疗当前目标AKA \"Tank Heal\"."
	},

	["ScaleSpells"] = {
		["Title"] = "改变法术等级",
		["Description"] = "选中这个选项, Heart会降低法术等级以便节省魔法. 强烈建议打开这个选项, 但也可能有需要关闭的场合 (例如黑翼的Vaelastrasz) "
	},
	["HealCharmed"] = {
		["Title"] = "Heal charmed units",
		["Description"] = "If this box is checked Heart will heal charmed units when \"Healing most wounded\"."
	},
	["HOTMinCancelThreshold"] = {
		["Title"] = "HoT门槛",
		["Description"] = "如果一个玩家生命值掉落给定百分比以下时，Heart不会考虑该玩家是否在有Hot效果. 当玩家生命跌落这个值以下时，Heart会允许你上新的Hot，即使会覆盖原来的.(其实就是为愈合准备的选项，小D把它当FH救人时，不会考虑上一个愈合是否完了)如果你将它设为100% Heart将忽略玩家身上所有存在的Hot效果."
	},
	["HOTMultiply"] = {
		["Title"] = "HoT比例",
		["Description"] = "这个值决定Heart认为Hot效果会有多少放大(例如. \"回春\" buff说明中说一下189, 但牛人全都一下300+）你可以把这个值设置超过100%. 如果你和你的队友全都有很多治疗效果装，则建议你调整这个数值."
	},
	["HOTMultiplyBattle"] = {
		["Title"] = "HoT比例(战斗)",
		["Description"] = "同\"HoT比例\"，这个是用于战斗中的(战斗非战斗有区别吗? 不明白这里的作者)."
	},
	["MaxOverheal"] = {
		["Title"] = "最大过量治疗",
		["Description"] = "允许的过量治疗量，超过这个值你的治疗框就会变红. 如果你没有过量治疗, 治疗框是绿色的; 黄色如果你将要过量治疗,但全局冷却还没有结束; 红色如果你将过量治疗并且全局冷却已经结束 (该取消换别的魔法啦)."
	},
	["MinHealThreshold"] = {
		["Title"] = "治疗门槛",
		["Description"] = "Heart不会理会生命值\"几乎\"为满的人, 建议把它设为比100%稍小一点的数."
	},
	["HealPower"] = {
		["Title"] = "治疗力度",
		["Description"] = "这是个很有用但也冒险的功能. 这个值设为100%时, 你会去100%得治疗某个人损失的生命值 (只要有足够强的法术和等级). 但这个值设为例如 50% 时, 你只会去治疗他损失生命的 50%. 这个功能在团队中有很多治疗者时很有用, 因为多治疗者会治疗损失的生命. 降低这个数值,你的魔法会持续更长时间, 但有时却可能是致命的."
	},
	["UpdatePlayerDataTime"] = {
		["Title"] = "刷新时间",
		["Description"] = "Heart定期检查玩家的 buffs 和 debuffs, 可以检验他们获得了多长时间buff.  这样可以检验他们会从HOT中获得多少治疗. The value you specify here is how many milliseconds of a second you'll allow Heart to use to collect this data. Increase the value for a more accurate reading, decrease it for less FPS loss. This has been tested alot in 40 man raids, and despite all the data it has to look through the methods are so optimized that the FPS drop is not even noticable. 不翻译了, 总之调高了占用系统时间, 调低了检测速度慢, 选一个中间的数就行了."
	},
	["RezEditBox"] = {
		["Title"] = "复活术公告",
		["Description"] = "这里来编辑你用复活法术时的公告.\n用 $t 表示你复活目标的名字.\n回车键保存修改, ESC撤销修改."
	},
	["HealBarScale"] = {
		["Title"] = "治疗条比例",
		["Description"] = "设置治疗条的大小."
	},
	["CurrentHealBarsScale"] = {
		["Title"] = "当前治疗条",
		["Description"] = "设置当前治疗条的大小."
	},
	["ButtonsScale"] = {
		["Title"] = "用户界面比例",
		["Description"] = "设置用户界面的大小."
	},
	["ShowHealingAll"] = {
		["Title"] = "显示所有治疗者法术",
		["Description"] = "显示团队里所有治疗者都在释放什么治疗(需要他们也安装Heart). 如果你是个治疗者, 推荐打开这个选项."
	},
	["ShowHealingMe"] = {
		["Title"] = "只显示治疗我的法术",
		["Description"] = "只显示正在释放在自己身上的治疗, 对非治疗者很有用, 能看出是否有人正在治疗自己, 以决定是否该嗑瓶药或绷带了."
	},
	["NewProfileButton"] = {
		["Title"] = "存档",
		["Description"] = "将你现在的设置保存为一个文档."
	},
	["ProfileDropDownMenu"] = {
		["Title"] = "存档",
		["Description"] = "调取一个存档."
	},
	["CastTimeDebuff"] = {
		["Title"] = "施法时间补偿",
		["Description"] = "这是一个实验性质的设置. Heart会预测你的目标每秒丢失这么多数量的生命, 计算为施法效力的打折, 施法时间越长的魔法打折越多. 这样Heart会提高法术等级以便补偿预计的伤害. 即便你的生命是满的, Heart也不再会释放1级的法术, 而是会释放适当的高级法术以便补偿预计损失."
	},
	["MTCastTimeDebuff"] = {
		["Title"] = "MT施法时间补偿",
		["Description"] = "同上, 这个是为MT单独设置的. 你可以总结出Tank的 每秒受伤害平均数, 但不必要设置得相等, 因为你不是一个人在治疗Tank. "
	},
	
	["TankButton"] = {
		["Title"] = "当前的坦克是: ",
		["Description"] = "用这个按钮来设置坦克. 当这个被设置以后, 你会自动选择这个玩家, 你的所有治疗都会用于他. 如果你不想这样做, 先取消你当前的目标, 然后再点这个键, 就会清除坦克设置."
	},
	["OptButton"] = {
		["Title"] = "设置",
		["Description"] = "点击这个按钮以显示设置面板."
	},
	["ClickFrameCloseButton"] = {
		["Title"] = "关闭",
		["Description"] = "点击这个以关闭按钮面板. 用 \"/heart gui\" 重新打开. \"/heart opt\" 来打开设置面板.  \"/heart help\" 查看详细用法.  "
	},
	["ScaleHot"] = {
		["Title"] = "改变HoT等级",
		["Description"] = "如果你不想改变 回春 和 恢复 法术的等级, 就不要选择这个选项. 一些激烈战斗可能需要你总是使用完全的HoT."
	}
}
Heart_about_text="redHeart   --致力于解放治疗职业\n自动选择目标; 自动缩放法术; 过量监视器; 点击治疗; 队友同步; 策略调整\n2006 raynorli编程,  基于Heart, Genesis\n网址: http://http://www.curse-gaming.com/en/wow/addons-5568-1-redheart.html\n命令行\"/heart gui\"来打开按钮面板; \"/heart opt\"设置面板; \"/heart help\"命令行用法. readme.txt查看详细使用说明"
