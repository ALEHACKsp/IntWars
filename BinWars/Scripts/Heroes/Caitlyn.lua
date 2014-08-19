function SpawnTrap(trap)
	print('spawned!')
		--[   250] trap:AnimateSpell(5,'Spell1',1.0,1.0) -- B0, animate trap
		--[     0] ParticleEmiter() --count: 2 - 87 ...
		--[    16] trap:ApplyBuff(0,2,'CaitlynYordleTrap',240.000000) --Stacks: 1, Visible: 0
		--[     0] pe:AddParticle(trap,'caitlyn_Base_yordleTrap_idle_green.troy') --Applied to Cupcake Trap
		--[     0] pe:AddParticle(trap,'caitlyn_Base_yordleTrap_set.troy') --Applied to Cupcake Trap
end
function NidaleeQHit(projectile,target)
        if target then
        target:TakeDamage(30,projectile.owner)
        --apply Q to target
        --projectile:Hit(target) --HitEffectName
        end
end

function CastSpell(self,spellIndex,x,y)
	if spellIndex == 0 then 

                        spell = CSpellWork(self,spellIndex,x,y) --CaitlynPiltoverPeacemaker
                        
                        spell.cooldown = 0
                        spell.manaCost = 0
                        --calc position with cast range = 1500
                        spell.projectile = CreateProjectile(self,x,y,1300,40,NidaleeQHit)

                        self:QueueSpell(spell)
	elseif spellIndex == 1 then 
        spell = CSpellWork(self,spellIndex,x,y) --CaitlynYordleTrap
        spell.iUpdatePos = 1  --[    62] self:SetupSpell() --[40000019] 1 , Updates Position
        spell.fVisible = 1.0
        spell.cooldown = 0
        spell.mana = 0

		spell:CreateObject(self,124,x,y,'Cupcake Trap','CaitlynTrap',100,SpawnTrap)

        self:QueueSpell(spell)
	elseif spellIndex == 2 then 
                        spell = CSpellWork(self,spellIndex,x,y) --CaitlynEntrapment
                        
                        spell.cooldown = 0
                        spell.manaCost = 0

                        spell:SetDash(x,y,1000.0)

                        self:QueueSpell(spell)
--[[		[0 ] } OnCastSpell(130,1949.763870,715.183163) {
[    47] self:SetupSpell() --[40000019] 1 , Updates Position
[     0] self:CastSpell(spellIndex,x,y) --[0B2C7F54] NOT FOUND / 0066 flag  [0B2C7F54] CaitlynEntrapment
[   171] self:SetPosition(...) --50 sets face position
[     0] self:CastSpell(spellIndex,x,y) --[02CD6B05] NOT FOUND / 0066 flag  [02CD6B05] CaitlynEntrapmentMissile
--6E
--6B
[    63] self:DoDash(...) --64]]

		--SendMissile(self,'CaitlynEntrapment',x,y,0x110);
		--SendSpell(self,'Spell3',5,0)
	end
end