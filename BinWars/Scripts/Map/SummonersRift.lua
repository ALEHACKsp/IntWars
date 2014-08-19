function table.copy(t)
	local t2 = {}
	for k,v in pairs(t) do
		t2[k] = v
	end
	return t2
end

TEAM_ORDER = 100
TEAM_CHAOS = 200

ORDER_HQ = 1
CHAOS_HQ = 2

BACK_TOWER = 1
MIDDLE_TOWER = 2
FRONT_TOWER = 3
HQ_TOWER2 = 4
HQ_TOWER1 = 5

RIGHT_LANE = 0
CENTER_LANE = 1
LEFT_LANE = 2

INITIAL_TIME_TO_SPAWN = 60


EXP_GIVEN_RADIUS = 1400
GOLD_GIVEN_RADIUS = 1250

DISABLE_MINION_SPAWN_BASE_TIME = 240
DISABLE_MINION_SPAWN_MAG_TIME = 0

LAST_WAVE = -1
SPECIAL_MINION_MODE = "none"

HQTurretAttackable = false

SpawnTable = {
WaveSpawnRate = 0,
NumOfMeleeMinionsPerWave = 0,
NumOfCasterMinionsPerWave = 0,
NumOfCannonMinionsPerWave = 0,
NumOfSuperMinionsPerWave = 0,
SingleMinionSpawnDelay = 0, 
DidPowerGroup = 0,
MeleeMinionName = 0,
CasterMinionName = 0,
CannonMinionName = 0,
SuperMinionName = 0
}
ChaosBarrack0 = {
IsDestroyed = false, 
MeleeMinionArmor = 0, 
MeleeMinionMagicResistance = 0, 
MeleeHPBonus = 0, 
MeleeDamageBonus = 0, 
MeleeGoldBonus = 0, 
MeleeLocalGoldBonus = 0, 
MeleeExpBonus = 0, 
MeleeExpGiven = MELEE_EXP_GIVEN, 
MeleeGoldGiven = MELEE_GOLD_GIVEN, 
MeleeLocalGoldGiven = 0, 
CasterMinionArmor = 0, 
CasterMinionMagicResistance = 0, 
CasterHPBonus = 0, 
CasterDamageBonus = 0, 
CasterGoldBonus = 0, 
CasterLocalGoldBonus = 0, 
CasterExpBonus = 0, 
CasterExpGiven = CASTER_EXP_GIVEN, 
CasterGoldGiven = CASTER_GOLD_GIVEN, 
CasterLocalGoldGiven = 0, 
CannonMinionArmor = 0, 
CannonMinionMagicResistance = 0, 
CannonHPBonus = 0, 
CannonDamageBonus = 0, 
CannonGoldBonus = 0, 
CannonLocalGoldBonus = 0, 
CannonExpBonus = 0, 
CannonExpGiven = CANNON_EXP_GIVEN, 
CannonLocalGoldGiven = 0, 
SuperMinionArmor = 0, 
SuperMinionMagicResistance = 0, 
SuperHPBonus = 0, 
SuperDamageBonus = 0, 
SuperGoldBonus = 0, 
SuperLocalGoldBonus = 0, 
SuperExpBonus = 0, 
SuperExpGiven = SUPER_EXP_GIVEN, 
NumOfSpawnDisables = 0, 
WillSpawnSuperMinion = 0, 
MeleeMinionName = 0, 
RangedMinionName = 0, 
CannonMinionName = 0, 
CannonGoldGiven = CANNON_GOLD_GIVEN, 
SuperMinionName = 0, 
SuperGoldGiven = SUPER_GOLD_GIVEN, 
SuperLocalGoldGiven = 0
}
ChaosBarrack1 = table.copy(ChaosBarrack0)
ChaosBarrack2 = table.copy(ChaosBarrack0)

OrderBarrack0 = table.copy(ChaosBarrack0)
OrderBarrack1 = table.copy(OrderBarrack0)
OrderBarrack2 = table.copy(OrderBarrack0)


function CreateLaneBuildingTable()
	return {Barracks=true,Turret1=true,Turret2=true,Turret3=true}
end
OrderBuildingStatus = {CreateLaneBuildingTable(), CreateLaneBuildingTable(), CreateLaneBuildingTable(); HQTower2 = true, HQTower1 = true, HQ = true}
ChaosBuildingStatus = {CreateLaneBuildingTable(), CreateLaneBuildingTable(), CreateLaneBuildingTable(); HQTower2 = true, HQTower1 = true, HQ = true}

TotalNumberOfMinions = 0
totalNumberOfChaosBarracks = 3
totalNumberOfOrderBarracks = 3

function CreateLevelProps()
	CreateChildTurret("Turret_T1_R_03", "OrderTurretNormal", TEAM_ORDER, FRONT_TOWER, RIGHT_LANE):SetPos(10097.618164, 808.732910, 1905);
	CreateChildTurret("Turret_T1_R_02", "OrderTurretNormal2", TEAM_ORDER, MIDDLE_TOWER, RIGHT_LANE):SetPos(6512.527344, 1262.614624, 1905);
	CreateChildTurret("Turret_T1_C_07", "OrderTurretDragon", TEAM_ORDER, BACK_TOWER, RIGHT_LANE):SetPos(3747.254883, 1041.043945, 800);

	CreateChildTurret("Turret_T2_R_03", "ChaosTurretWorm", TEAM_CHAOS, FRONT_TOWER, RIGHT_LANE):SetPos(13459.614258, 4284.239258, 1905);
	CreateChildTurret("Turret_T2_R_02", "ChaosTurretWorm2", TEAM_CHAOS, MIDDLE_TOWER, RIGHT_LANE):SetPos(12920.789063, 8005.291992, 1905);
	CreateChildTurret("Turret_T2_R_01", "ChaosTurretGiant", TEAM_CHAOS, BACK_TOWER, RIGHT_LANE):SetPos(13205.825195, 10474.619141, 800);

	CreateChildTurret("Turret_T1_C_05", "OrderTurretNormal", TEAM_ORDER, FRONT_TOWER, CENTER_LANE):SetPos(5435.023926, 6179.100098, 1905);
	CreateChildTurret("Turret_T1_C_04", "OrderTurretNormal2", TEAM_ORDER, MIDDLE_TOWER, CENTER_LANE):SetPos(4633.664063, 4591.909180, 1905);
	CreateChildTurret("Turret_T1_C_03", "OrderTurretDragon", TEAM_ORDER, BACK_TOWER, CENTER_LANE):SetPos(3233.994141, 3447.242188, 800);
	CreateChildTurret("Turret_T1_C_01", "OrderTurretAngel", TEAM_ORDER, HQ_TOWER1, CENTER_LANE):SetPos(1341.632568, 2029.984375, 1000);
	CreateChildTurret("Turret_T1_C_02", "OrderTurretAngel", TEAM_ORDER, HQ_TOWER2, CENTER_LANE):SetPos(1768.191650, 1589.465576, 1000);

	CreateChildTurret("Turret_T2_C_05", "ChaosTurretWorm", TEAM_CHAOS, FRONT_TOWER, CENTER_LANE):SetPos(8548.804688, 8289.496094, 1905);
	CreateChildTurret("Turret_T2_C_04", "ChaosTurretWorm2", TEAM_CHAOS, MIDDLE_TOWER, CENTER_LANE):SetPos(9361.072266, 9892.624023, 1905);
	CreateChildTurret("Turret_T2_C_03", "ChaosTurretGiant", TEAM_CHAOS, BACK_TOWER, CENTER_LANE):SetPos(10743.581055, 11010.062500, 800);
	CreateChildTurret("Turret_T2_C_01", "ChaosTurretNormal", TEAM_CHAOS, HQ_TOWER1, CENTER_LANE):SetPos(12662.488281, 12442.701172, 1000);
	CreateChildTurret("Turret_T2_C_02", "ChaosTurretNormal", TEAM_CHAOS, HQ_TOWER2, CENTER_LANE):SetPos(12118.146484, 12876.628906, 1000);

	CreateChildTurret("Turret_OrderTurretShrine", "OrderTurretShrine", TEAM_ORDER, 0, CENTER_LANE)
	CreateChildTurret("Turret_ChaosTurretShrine", "ChaosTurretShrine", TEAM_CHAOS, 0, CENTER_LANE):SetPos(14157.025391, 14456.352539, 1600);

	CreateChildTurret("Turret_T1_L_03", "OrderTurretNormal", TEAM_ORDER, FRONT_TOWER, LEFT_LANE):SetPos(574.655029, 10220.470703, 1905);
	CreateChildTurret("Turret_T1_L_02", "OrderTurretNormal2", TEAM_ORDER, MIDDLE_TOWER, LEFT_LANE):SetPos(1106.263428, 6485.252930, 1905);
	CreateChildTurret("Turret_T1_C_06", "OrderTurretDragon", TEAM_ORDER, BACK_TOWER, LEFT_LANE):SetPos(802.810364, 4052.360596, 800);

	CreateChildTurret("Turret_T2_L_03", "ChaosTurretWorm", TEAM_CHAOS, FRONT_TOWER, LEFT_LANE):SetPos(3911.675293, 13654.815430, 1905);
	CreateChildTurret("Turret_T2_L_02", "ChaosTurretWorm2", TEAM_CHAOS, MIDDLE_TOWER, LEFT_LANE):SetPos(7536.523438, 13190.815430, 1905);
	CreateChildTurret("Turret_T2_L_01", "ChaosTurretGiant", TEAM_CHAOS, BACK_TOWER, LEFT_LANE):SetPos(10261.900391, 13465.911133, 800);
end

function OnLevelInit()
	SpawnTable.WaveSpawnRate = 30000
	SpawnTable.NumOfMeleeMinionsPerWave = 3
	SpawnTable.NumOfCasterMinionsPerWave = 3
	SpawnTable.SingleMinionSpawnDelay = 800
	SpawnTable.DidPowerGroup = false
end

UPGRADE_MINION_TIMER = 90
INCREASE_CANNON_RATE_TIMER = 2090
function OnLevelInitServer()
  --InitTimer(UpgradeMinionTimer, UPGRADE_MINION_TIMER, true)
  --InitTimer(IncreaseCannonMinionSpawnRate, INCREASE_CANNON_RATE_TIMER, false)
  --InitTimer(AllowDamageOnBuildings, 10, false)
end

function OnPostLevelLoad()
	CreateLevelProps()
end

function UpgradeMinionTimer()

end

function AllowDamageOnBuildings()
	for laneIndex = RIGHT_LANE, LEFT_LANE do
		for towerIndex = BACK_TOWER, HQ_TOWER1 do
			orderTurret = GetTurret(TEAM_ORDER, laneIndex, towerIndex)
			if orderTurret then
				if towerIndex == FRONT_TOWER then
					orderTurret:SetInvulnerable(false)
					orderTurret:SetTargetable(true)
				else
					orderTurret:SetInvulnerable(true)
					orderTurret:SetNotTargetableToTeam(true, TEAM_CHAOS)
				end
			end

			chaosTurret = GetTurret(TEAM_CHAOS, laneIndex, towerIndex)
			if chaosTurret then
				if towerIndex == FRONT_TOWER then
					chaosTurret:SetInvulnerable(false)
					chaosTurret:SetTargetable(true)
				else
					chaosTurret:SetInvulnerable(true)
					chaosTurret:SetNotTargetableToTeam(true, TEAM_ORDER)
				end
			end

		end
	end
end

CANNON_MINION_SPAWN_FREQUENCY = 3
MAX_MINIONS_EVER = 180
function GetMinionSpawnInfo(lane,spawnCount,r2,team,waveCount)
	TableForBarrack = SpawnTable
	if TableForBarrack.DidPowerGroup then
		TableForBarrack.NumOfCannonMinionsPerWave = TableForBarrack.NumOfCannonMinionsPerWave - 1
		TableForBarrack.DidPowerGroup = false
	end
	if spawnCount % CANNON_MINION_SPAWN_FREQUENCY == 0 then
		TableForBarrack.NumOfCannonMinionsPerWave = TableForBarrack.NumOfCannonMinionsPerWave + 1
		TableForBarrack.DidPowerGroup = true
	end

	local l_8_5 = 0
	if team == TEAM_ORDER then
		l_8_5 = OrderBarracksBonuses[lane + 1]
	else
		l_8_5 = ChaosBarracksBonuses[lane + 1]
	end

	TableForBarrack.ExpRadius = EXP_GIVEN_RADIUS
	TableForBarrack.GoldRadius = GOLD_GIVEN_RADIUS
	lNumOfMeleeMinionsPerWave = TableForBarrack.NumOfMeleeMinionsPerWave
	lNumOfCasterMinionsPerWave = TableForBarrack.NumOfCasterMinionsPerWave
	lNumOfCannonMinionsPerWave = TableForBarrack.NumOfCannonMinionsPerWave
	lNumOfSuperMinionsPerWave = TableForBarrack.NumOfSuperMinionsPerWave

	if waveCount ~= LAST_WAVE then
		BARRACKSCOUNT = 6
		totalMinionsRemaining = MAX_MINIONS_EVER - GetTotalTeamMinionsSpawned()

		SPECIAL_MINION_MODE = ""
		if totalMinionsRemaining <= BARRACKSCOUNT * 7 then
			SPECIAL_MINION_MODE = "None"
			if totalMinionsRemaining and BARRACKSCOUNT <= totalMinionsRemaining then --too many minions
				SPECIAL_MINION_MODE = "2MeleeMinions"
			end
		end
		LAST_WAVE = waveCount
	end

	if SPECIAL_MINION_MODE == "2MeleeMinions" then
		lNumOfMeleeMinionsPerWave = math.max(2 - lNumOfSuperMinionsPerWave, 0)
		lNumOfCasterMinionsPerWave = 0
		lNumOfCannonMinionsPerWave = 0
	elseif SPECIAL_MINION_MODE == "None" then
		lNumOfMeleeMinionsPerWave = 0
		lNumOfCasterMinionsPerWave = 0
		lNumOfCannonMinionsPerWave = 0
		lNumOfSuperMinionsPerWave = 0
	end

		if l_8_5.WillSpawnSuperMinion == 1 then
			if (team == TEAM_ORDER and totalNumberOfChaosBarracks == 0) or team == TEAM_CHAOS and totalNumberOfOrderBarracks == 0 then
				lNumOfSuperMinionsPerWave = 2
			else
				lNumOfSuperMinionsPerWave = 1
			end
			lNumOfCannonMinionsPerWave = 0
		end

		if team == TEAM_ORDER then
			l_8_5.MeleeMinionName = OrderNames.MeleeMinionName
			l_8_5.CasterMinionName = OrderNames.CasterMinionName
			l_8_5.CannonMinionName = OrderNames.CannonMinionName
			l_8_5.SuperMinionName = OrderNames.SuperMinionName
		else
			l_8_5.MeleeMinionName = ChaosNames.MeleeMinionName
			l_8_5.CasterMinionName = ChaosNames.CasterMinionName
			l_8_5.CannonMinionName = ChaosNames.CannonMinionName
			l_8_5.SuperMinionName = ChaosNames.SuperMinionName
		end

		local l_8_6 = {}
		l_8_6.NumOfMeleeMinionsPerWave = lNumOfMeleeMinionsPerWave
		l_8_6.NumOfCasterMinionsPerWave = lNumOfCasterMinionsPerWave
		l_8_6.NumOfCannonMinionsPerWave = lNumOfCannonMinionsPerWave
		l_8_6.NumOfSuperMinionsPerWave = lNumOfSuperMinionsPerWave
		l_8_6.WaveSpawnRate = TableForBarrack.WaveSpawnRate
		l_8_6.SingleMinionSpawnDelay = TableForBarrack.SingleMinionSpawnDelay
		l_8_6.MeleeMinionName = l_8_5.MeleeMinionName
		l_8_6.CasterMinionName = l_8_5.CasterMinionName
		l_8_6.CannonMinionName = l_8_5.CannonMinionName
		l_8_6.SuperMinionName = l_8_5.SuperMinionName
		l_8_6.IsDestroyed = l_8_5.IsDestroyed
		l_8_6.MeleeMinionArmor = l_8_5.MeleeMinionArmor
		l_8_6.MeleeMinionMagicResistance = l_8_5.MeleeMinionMagicResistance
		l_8_6.MeleeHPBonus = l_8_5.MeleeHPBonus
		l_8_6.MeleeDamageBonus = l_8_5.MeleeDamageBonus
		l_8_6.MeleeExpGiven = l_8_5.MeleeExpGiven
		l_8_6.MeleeGoldGiven = l_8_5.MeleeGoldGiven
		l_8_6.MeleeLocalGoldGiven = l_8_5.MeleeLocalGoldGiven
		l_8_6.CasterMinionArmor = l_8_5.CasterMinionArmor
		l_8_6.CasterMinionMagicResistance = l_8_5.CasterMinionMagicResistance
		l_8_6.CasterHPBonus = l_8_5.CasterHPBonus
		l_8_6.CasterDamageBonus = l_8_5.CasterDamageBonus
		l_8_6.CasterExpGiven = l_8_5.CasterExpGiven
		l_8_6.CasterGoldGiven = l_8_5.CasterGoldGiven
		l_8_6.CasterLocalGoldGiven = l_8_5.CasterLocalGoldGiven
		l_8_6.CannonMinionArmor = l_8_5.CannonMinionArmor
		l_8_6.CannonMinionMagicResistance = l_8_5.CannonMinionMagicResistance
		l_8_6.CannonHPBonus = l_8_5.CannonHPBonus
		l_8_6.CannonDamageBonus = l_8_5.CannonDamageBonus
		l_8_6.CannonExpGiven = l_8_5.CannonExpGiven
		l_8_6.CannonGoldGiven = l_8_5.CannonGoldGiven
		l_8_6.CannonLocalGoldGiven = l_8_5.CannonLocalGoldGiven
		l_8_6.SuperMinionArmor = l_8_5.SuperMinionArmor
		l_8_6.SuperMinionMagicResistance = l_8_5.SuperMinionMagicResistance
		l_8_6.SuperHPBonus = l_8_5.SuperHPBonus
		l_8_6.SuperDamageBonus = l_8_5.SuperDamageBonus
		l_8_6.SuperExpGiven = l_8_5.SuperExpGiven
		l_8_6.SuperGoldGiven = l_8_5.SuperGoldGiven
		l_8_6.SuperLocalGoldGiven = l_8_5.SuperLocalGoldGiven
		l_8_6.ExperienceRadius = TableForBarrack.ExpRadius
		l_8_6.GoldRadius = TableForBarrack.GoldRadius
    --ReturnTable = l_8_6
    --l_8_6 = ReturnTable
    return l_8_6
end
--[[
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
	--ScheduleWork(10,function() print('x') end) --test
end

function OnTimer(time)

	if time >= 10 and not shared['bDone1'] then
		--...
		print('XXtime over 10')
		shared['bDone1'] = true
	end
end]]