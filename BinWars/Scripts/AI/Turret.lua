DEBUG_MINION_STATE_TABLE = { "AI_IDLE", 
   "AI_SOFTATTACK", 
   "AI_HARDATTACK", 
   "AI_ATTACKMOVESTATE", 
   "AI_STANDING", 
   "AI_MOVE", 
   "AI_GUARD", 
   "AI_ATTACK", 
   "AI_RETREAT", 
   "AI_HARDIDLE", 
   "AI_HARDIDLE_ATTACKING", 
   "AI_TAUNTED", 
   "AI_ATTACKMOVE_ATTACKING", 
   "AI_FEARED", 
   "AI_CHARMED", 
   "AI_FLEEING", 
   "AI_ATTACK_GOING_TO_LAST_KNOWN_LOCATION", 
   "AI_HALTED", 
   "AI_SIEGEATTACK", 
   "AI_LAST_NONPET_AI_STATE"
}

function OnInit()
  SetState(AI_HARDIDLE)
  InitTimer(TimerFindEnemies, 0.15, true)
  return false
end

function OnTargetLost()
  local state = GetState()
  if state == AI_HALTED then return false end
  local newTarget = nil
  if #turretTargetList > 0 then
  	newTarget = turretTargetList[1]
  else
  	newTarget = FindTargetInAcR()
  end
  if newTarget then
  	if state == AI_HARDIDLE_ATTACKING or state == AI_TAUNTED  then
  		NetSetState(AI_HARDIDLE_ATTACKING)
  		SetTarget(newTarget)
  		return true
  	end
  end
  NetSetState(AI_HARDIDLE)
  return true
end
function OnCallForHelp(src,target)
  local state = GetState()
  if state == AI_HALTED then return false end
  if target then
  	if state == AI_HARDIDLE or state == AI_HARDIDLE_ATTACKING then
  		NetSetState(AI_HARDIDLE_ATTACKING)
  		SetTarget(target)
  	end
  end
end
function OnReceiveImportantCallForHelp(src,target)
	if ObjectInAttackRange(target) then
		PutTargetInTargetList(target)
	end
end
function OnTauntBegin()
  local state = GetState()
  if state == AI_HALTED then return false end
  local tauntTarget = GetTauntTarget()
  if tauntTarget then
  	NetSetState(AI_TAUNTED)
  	SetTarget(tauntTarget)
  end
end
function OnTauntEnd()
  local state = GetState()
  if state == AI_HALTED then return false end

  tauntTarget = GetTauntTarget()
  if tauntTarget then
  	NetSetState(AI_HARDIDLE_ATTACKING)
  	SetTarget(tauntTarget)
  else
  	NetSetState(AI_HARDIDLE)
  TimerFindEnemies()
  end
end
function OnCanMove()
  local state = GetState()
  if state == AI_HALTED then return false end
  NetSetState(AI_HARDIDLE)
  TimerFindEnemies()

end
function OnCanAttack()
  local state = GetState()
  if state == AI_HALTED then return false end
  NetSetState(AI_HARDIDLE)
  TimerFindEnemies()
end
function TimerFindEnemies()
  local state = GetState()
  if state == AI_HALTED then return false end
  UpdateTargetList()
  if state == AI_HARDIDLE then
  	local newTarget = nil
  	if #turretTargetList > 0 then
  		newTarget = turretTargetList[1]
  	else
  		newTarget = FindTargetInAcR()
  	end
  	if newTarget then
  		if state == AI_HARDIDLE then
  			NetSetState(AI_HARDIDLE_ATTACKING)
  			SetTarget(newTarget)
  		end
    else
  		TurnOffAutoAttack(STOPREASON_TARGET_LOST)
  		return
  	end
  end
  if state == AI_HARDIDLE_ATTACKING or state == AI_TAUNTED then
  		if TargetInAttackRange() then
  			TurnOnAutoAttack(GetTarget())
  		else
  			NetSetState(AI_HARDIDLE)
  			TurnOffAutoAttack(STOPREASON_MOVING)
  		end
  end
end
function PutTargetInTargetList(target)
	table.insert(turretTargetList,target)
end
function UpdateTargetList()
	for i=1,#turretTargetList do
		if not ObjectInAttackRange(turretTargetList[i]) then
			table.remove(turretTargetList,i)
		end
	end
end
function HaltAI()
	StopTimer(TimerFindEnemies)
	TurnOffAutoAttack(STOPREASON_IMMEDIATELY)
	NetSetState(AI_HALTED)
end