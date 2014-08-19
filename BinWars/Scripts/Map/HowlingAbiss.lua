
TEAM_ORDER = 100
TEAM_CHAOS = 200
ORDER_HQ = 1
CHAOS_HQ = 2
FRONT_TOWER = 4
MID_TOWER = 3
BACK_TOWER = 2
BACK_TOWER2 = 1
CENTER_LANE = 1
INITIAL_TIME_TO_SPAWN = 60
--...
EXP_GIVEN_RADIUS = 1250

ChaosNames = {MeleeMinionName = "Blue_Minion_Basic", CasterMinionName = "Blue_Minion_Wizard", CannonMinionName = "Blue_Minion_MechCannon", SuperMinionName = "Blue_Minion_MechMelee"}
ChaosNames = {MeleeMinionName = "Red_Minion_Basic", CasterMinionName = "Red_Minion_Wizard", CannonMinionName = "Red_Minion_MechCannon", SuperMinionName = "Red_Minion_MechMelee"}


OrderBuildingStatus = {Turret4 = true, Turret3 = true, Turret2 = true, Turret1 = true, Barracks = true, HQ = true}
ChaosBuildingStatus = {Turret4 = true, Turret3 = true, Turret2 = true, Turret1 = true, Barracks = true, HQ = true}

TotalNumberOfMinions = 0


function CreateLevelProps()
  CreateChildTurret("Turret_T1_C_08", "HA_AP_OrderTurret", TEAM_ORDER, 4, 1):SetPos(4943.478027,4929.819336,800)
  CreateChildTurret("Turret_T1_C_07", "HA_AP_OrderTurret2", TEAM_ORDER, 3, 1):SetPos(3809.061035,3829.051270,800)
  CreateChildTurret("Turret_T1_C_09", "HA_AP_OrderTurret3", TEAM_ORDER, 2, 1):SetPos(2493.231445,2101.180664,800)
  CreateChildTurret("Turret_T1_C_010", "HA_AP_OrderTurret3", TEAM_ORDER, 1, 1):SetPos(2052.211914,2561.570068,800)
  CreateChildTurret("Turret_T2_L_01", "HA_AP_ChaosTurret", TEAM_CHAOS, 4, 1):SetPos(7883.546875,7768.135254,800)
  CreateChildTurret("Turret_T2_L_02", "HA_AP_ChaosTurret2", TEAM_CHAOS, 3, 1):SetPos(9017.629883,8871.361328,800)
  CreateChildTurret("Turret_T2_L_03", "HA_AP_ChaosTurret3", TEAM_CHAOS, 2, 1):SetPos(10785.176758,10117.587891,800)
  CreateChildTurret("Turret_T2_L_04", "HA_AP_ChaosTurret3", TEAM_CHAOS, 1, 1):SetPos(10354.110352,10574.865234,800)
  CreateChildTurret("Turret_OrderTurretShrine", "HA_AP_OrderShrineTurret", TEAM_ORDER, 0, 1)
  CreateChildTurret("Turret_ChaosTurretShrine", "HA_AP_ChaosTurretShrine", TEAM_CHAOS, 0, 1)
end

function OnLoadMap()
	--spawn towers and here
end

MINION_MELEE = 0
MINION_CASTER = 1
MINION_SUPER = 2

iWaves = 0
function SpawnMinions() --every 30 seconds
	print('on minion spawn!')
	iWaves = iWaves + 1
	--blue
	for i=0,2 do
		CreateMinion(MINION_MELEE,i)
		ScheduleWork(1,function() CreateMinion(MINION_MELEE,i) end)
		ScheduleWork(2,function() CreateMinion(MINION_MELEE,i) end)
		ScheduleWork(3,function() CreateMinion(MINION_CASTER,i) end)
		ScheduleWork(4,function() CreateMinion(MINION_CASTER,i) end)
		ScheduleWork(5,function() CreateMinion(MINION_CASTER,i) end)
		if iWaves % 3 == 0 then ScheduleWork(6,function() CreateMinion(MINION_SUPER,i) end) end
	end
	--red
	for i=3,5 do
		CreateMinion(MINION_MELEE,i)
		ScheduleWork(1,function() CreateMinion(MINION_MELEE,i) end)
		ScheduleWork(2,function() CreateMinion(MINION_MELEE,i) end)
		ScheduleWork(3,function() CreateMinion(MINION_CASTER,i) end)
		ScheduleWork(4,function() CreateMinion(MINION_CASTER,i) end)
		ScheduleWork(5,function() CreateMinion(MINION_CASTER,i) end)
		if iWaves % 3 == 0 then ScheduleWork(6,function() CreateMinion(MINION_SUPER,i) end) end
	end
end

function OnLoad()
	--ScheduleWork(10,0,false,ReleaseTowers) --tower release
	--ScheduleWork(10,30,true,SpawnMinions) --spawn worker
	ScheduleWork(10,function() print('x') end) --test
end

function OnTimer(time)

	if time >= 10 and not bDone1 then
		--...
		print('XXtime over 10')
		bDone1 = true
	end
end