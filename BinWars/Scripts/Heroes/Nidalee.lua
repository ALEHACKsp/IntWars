--[[
OnCastSpell(128,7776.317596,7948.932171) {
[    47] self:SetupSpell() --[40000019] 0 , Updates Position
[     0] self:CastSpell(spellIndex,x,y) --[02953A63] NOT FOUND / 0066 flag 
[     0] self:SetupSpell1(...) --85
[   734] ParticleEmiter() --count: 3 - 87 ...
[     0] self:ApplyBuff(3,'nidaleepassivehunted',4.000000) --Stacks: 1, Visible: 0
[     0] pe:AddParticle(self,'Nidalee_Base_P_Buf.troy') --Applied to DENNIS Smart
[     0] pe:AddParticle(self,'Nidalee_Base_Q_Buf.troy') --Applied to AntonioHermano
[     0] pe:AddParticle(self,'Nidalee_Base_Q_Tar.troy') --Applied to AntonioHermano
[    94] ParticleEmiter() --count: 1 - 87 ...
[     0] self:ApplyBuff(2,'nidaleepassivehunting',4.000000) --Stacks: 1, Visible: 0
[     0] pe:AddParticle(self,'Nidalee_Base_P_Buf.troy') --Applied to DENNIS Smart
[   250] ParticleEmiter() --count: 1 - 87 ...
[     0] pe:AddParticle(self,'Nidalee_Base_P_Buf.troy') --Applied to DENNIS Smart
[   266] ParticleEmiter() --count: 1 - 87 ...
[     0] pe:AddParticle(self,'Nidalee_Base_P_Buf.troy') --Applied to DENNIS Smart
...
]]
function NidaleeQHit(projectile,target)
        if target then
        print(target.model..' - NIDALEE Q HIT !')
        target:TakeDamage(30)
        --apply Q to target
        projectile:Destroy()
        projectile:Hit(target) --HitEffectName
        --applied previously @ Hit --CreateParticle(projectile.owner,target,'Nidalee_Base_Q_Tar.troy',0) --HitEffectName
        --project.owner:ApplyBuff(3,'nidaleepassivehunted',4.000000) --Stacks: 1, Visible: 0
        --CreateParticle(projectile.owner,projectile.owner,'Nidalee_Base_P_Buf.troy',0) --buff should apply this
        --CreateParticle(projectile.owner,target,'Nidalee_Base_Q_Buf.troy',0)
        end
end

function CastSpell(self,spellIndex,x,y)
        --print('Spell1: '..self:GetVar('Data','Spell1'))
        --print('Spell: '..self:GetSpell(spellIndex+1))
        if not self.isMorphed then
                if spellIndex == 0 then 
                        spell = CSpellWork(self,spellIndex,x,y) --JavelinToss
                        spell.iUpdatePos = 0
                        spell.fVisible = 2.0
                        --spell.stop = true --after 0.15, send stop move
                        spell.fReleaseCast = 0.85 --release cast after 0.85 seconds?
                        
                        spell.cooldown = 0
                        spell.manaCost = 0
                        --calc position with cast range = 1500
                        spell.projectile = CreateProjectile(self,x,y,1300,40,NidaleeQHit)

                        self:QueueSpell(spell)

        	elseif spellIndex == 1 then 
                        --self:CastSpell(spellIndex,x,y)--DisplaySpell() --B4
                        --DoDash3(self,x,y,0.5)
                        --self:ApplyBuff(2,1,'InternalTestBuff',13.0)
                elseif spellIndex == 2 then 
                        spell = CSpellWork(self,spellIndex,x,y) --JavelinToss
                        spell.animation = true

                        print('mana: '..spell.manaCost)
                        print('cd: '..spell.cooldown)
                        self:QueueSpell(spell)
                        --SendSpell(self,'Spell2',1,0)
                elseif spellIndex == 3 then 
                        self:CastSpell(spellIndex,x,y)--DisplaySpell() --B4
                        self.model = 'Nidalee_Cougar'
                end
        else
        	if spellIndex == 0 then 
                        self:CastSpell(spellIndex,x,y)--DisplaySpell() --B4
        		--B4 missing
        		SendSpell(self,'Spell1',1,0)
        	elseif spellIndex == 1 then 
                        self:CastSpell(spellIndex,x,y)--DisplaySpell() --B4
        		--B4 missing
        		SendSpell(self,'Spell2',1,0)
        	elseif spellIndex == 2 then 
                        self:CastSpell(spellIndex,x,y)--DisplaySpell() --B4
        		--B4 missing
        		SendSpell(self,'Spell3',1,0)
        	elseif spellIndex == 3 then 
        		self.model = self.type
        	end
	end
end