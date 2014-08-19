function LeesinQHit(projectile,target)
        if target then
        print(target.model..' - LEESIN Q HIT !')
        --apply Q to target
        --76 ??
        --23 vision spawn
        --23 vision spawn
        --65 load hero?
        projectile:Destroy() --5A NETID, destroy missile?
        --projectile.owner:SetTemporarySpell(0,'BlindMonkQTwo')--17 Setup spellname, 2nd leesin skill (BlindMonkQTwo)
        projectile:Hit(target) --26 NETID ..
        --87 SpawnParticle
        --B7 Apply buff to target
        CreateParticle(projectile.owner,target,'blindMonk_Q_resonatingStrike_tar.troy',0) --splash
        CreateParticle(projectile.owner,target,'blindMonk_Q_tar_indicator.troy',0) --floor/head indicator, must expire
        --CreateParticle(projectile.owner,target,'blindMonk_Q_resonatingStrike_tar_blood.troy',0) --?
        --CreateParticle(projectile.owner,target,'leesin_skin05_Q_tar_sound.troy',0)
        --target:ApplyBuff(3,'BlindMonkQOne',3.0,1)
        end
end


function CastSpell(self,spellIndex,x,y)
	if spellIndex == 0 then 
		--self:CastSpell(spellIndex,x,y);
		--6D?
		spell = CSpellWork(self,_Q,x,y) 
        spell.manaCost = 0
        spell.cooldown = 0
        spell.updatePos = 0
        spell.stop = true
        spell.releaseCast = true
        spell.projectile = CreateProjectile(self,x,y,1800,60,LeesinQHit)
        spell:AddBuff(2,'blindmonkpassive_cosmetic',3.0,2) --[   172] self:ApplyBuff(2,'blindmonkpassive_cosmetic',3.000000) --Stacks: 2, Visible: 0
                
                self:QueueSpell(spell)
                --[  1984] self:SetSpellName(1,'BlindMonkWOne') ? reset if did not hit
                --calc position with cast range = 1100
                --Hero collision only
                --LineWidth       "60.0000"
                --CastRange     "1100.0000"
                --MissileSpeed  "1800.0000"
	elseif spellIndex == 1 then 
		spell = CSpellWork(self,_W,x,y) 
		spell:AddBuff(2,'blindmonkwoneshield',4.0,1) --4 seconds, 1 stack
                self:QueueSpell(spell)
        --[     0] self:SetSpellName(1,'BlindMonkWTwo')
                
                --[    31] self:ApplyBuff(2,'blindmonkwoneshield',4.000000) --Stacks: 1, Visible: 0
                
	elseif spellIndex == 2 then 
		spell = CSpellWork(self,_E,x,y) --EzrealMysticShot
        spell.manaCost = 0
        spell.cooldown = 0
        spell.stop = true--[    15] MoveAns(self,...) --[1] STOP
                
                p1 = spell:AddParticle(self,self,'blindMonk_thunderCrash_impact_02.troy',0.25)
                p1 = spell:AddParticle(self,self,'blindMonk_thunderCrash_impact_cas.troy',0.25)
                p1 = spell:AddParticle(self,self,'blindMonk_E_cas.troy',0.25)
                self:QueueSpell(spell)
	elseif spellIndex == 3 then 
		self:CastSpell(_R,x,y);
	end
end