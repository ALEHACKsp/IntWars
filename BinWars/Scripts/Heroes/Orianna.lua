--[[[7681250] }
OnCastSpell(128,1674.107170,608.961630) {
[    46] self:CastSpell(spellIndex,x,y) --[093B6C74] NOT FOUND / 0066 flag 
[     0] self:SetSpellName(3,'')
[     0] self:SetSpellName(2,'')
[     0] self:SetSpellName(1,'')
[     0] self:SetSpellName(0,'')
[     0] self:SetPosition(...) --50 sets face position
[     0] self:CreateMissile('orianaizuna',x,y) --[041795C1] / 0066 flag 
[     0] self:AnimateSpell('',1.000000) -- AF
[   297] self:SetSpellName(1,'?')
[     0] self:SetSpellName(2,'?')
[     0] self:SetSpellName(3,'?')
[     0] self:SetSpellName(0,'?')
--.. ball here
[     0] self:SetSpellName(3,'?')
[     0] self:SetSpellName(2,'?')
[     0] self:SetSpellName(1,'?')
[     0] self:SetSpellName(0,'?')
--5A
[    32] self:ApplyBuff(0,1,'orianaghost',24999.966797) --Stacks: 1, Visible: 0
[     0] self:ApplyBuff(1,1,'orianaghostminion',24999.966797) --Stacks: 1, Visible: 0
[     0] ParticleEmiter() --count: 4 - 87 ...
[     0] pe:AddParticle(self,'Oriana_Izuna_nova.troy') --Applied to (null)
[     0] pe:AddParticle(self,'oriana_ball_glow_green.troy') --Applied to TheDoomBall
[     0] pe:AddParticle(self,'yomu_ring_green.troy') --Applied to TheDoomBall
[     0] pe:AddParticle(self,'OrianaBallIndicatorNear.troy') --Applied to DENNIS Smart]]

function BallQHit(projectile,target)
        if target == nil then --land

        else
        target:TakeDamage(projectile.dmg,projectile.owner)
        projectile:Hit(target) --HitEffectName
        end
end
function CastSpell(self,spellIndex,x,y)
	if spellIndex == 0 then 

                        spell = CSpellWork(self,spellIndex,x,y) --orianaizuna
                        spell.iUpdatePos = 0
                        spell.fVisible = 2.0
                        --spell.stop = true --after 0.15, send stop move
                        spell.fReleaseCast = 0.85 --release cast after 0.85 seconds?
                        
                        spell.cooldown = 0
                        spell.manaCost = 0
                spell:AddMissile(self,'orianaizuna',0.25)
                --self:globalCd(..)
                self.model = 'OriannaNoBall' --after cast
                --spell.animation = 'Spell1b'
                spell.projectile = CreateProjectile(self,x,y,1300,40,BallQHit)--,BallQLand)
                spell.projectile.dmg = spell.effect1
                self:QueueSpell(spell)
                print('x')
	elseif spellIndex == 1 then 
                self:CastSpell(spellIndex,x,y)
		--SendSpell(self,'Spell2',5,0)
        elseif spellIndex == 2 then 
                self:CastSpell(spellIndex,x,y)
                --SendSpell(self,'Spell3',5,0)
        elseif spellIndex == 3 then 
                self:CastSpell(spellIndex,x,y)
                --SendSpell(self,'Spell3',5,0)
	end
end