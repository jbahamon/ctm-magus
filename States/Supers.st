;===========================================================================
; Super Moves
;===========================================================================

;---------------------------------------------------------------------------
; Hell's Geyser - HP Down
[Statedef 2000]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2010
poweradd = -1000
sprpriority = 2
juggle = 14

[State 2000, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 2000, Super Pause FX]
type = helper
trigger1 = time = 1
helpertype = normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2000, Super Pause]
type = superpause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S7010,2
p2defmul = 1
darken = 0

[State 2010, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000)
value = 2001
ctrl = 0

;Hell Geyser Summoning
[Statedef 2001]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2011
sprpriority = 2
facep2 = 1

[State 2000, Geyser]
type = Helper
trigger1 = AnimElem = 2
name = "Hell Geyser"
ID = 2000
stateno = 2002
pos = 30, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2001, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Hell Geyser 
[Statedef 2002]
type    = A
movetype= A
physics = N
poweradd= 0
ctrl = 0
sprpriority = 3
velset = 0,0

[State 2003, RealTime]
type = ChangeAnim
trigger1 = !Time && PrevStateNo != 2003
value = 7200
ignorehitpause = 1

[State 2003, RealTime]
trigger1 = 1
type = AngleDraw
scale = 0.8, 0.8
ignorehitpause = 1

[State 2003, RealTime]
trigger1 = 1
type = Trans
trans = addalpha
alpha = 128, 256
ignorehitpause = 1

[State 1022, Souls]
type = Helper
trigger1 = Var(0) % 20 = 0
trigger1 = AnimElemTime(21) = [-10, 70]
trigger1 = Anim = 7200
ID = 2005
stateno = 2005
pos = 25 - (Random % 50), - (Random % 50)
postype = p1 ;p2,front,back,left,right
facing = 1
scale = 1 , 1
sprpriority = 4
ownpal = 1
ignorehitpause = 1

[State 1022, Souls]
type = Helper
trigger1 = Var(0) % 20 = 4
trigger1 = AnimElemTime(21) = [-30, 50]
trigger1 = Anim = 7200
ID = 2005
stateno = 2005
pos = 25 - (Random % 50), - (Random % 50)
postype = p1 ;p2,front,back,left,right
facing = 1
scale = 1 , 1
sprpriority = 4
ownpal = 1
ignorehitpause = 1

[State 2003, RealTime]
trigger1 = !Time && PrevStateNo != 2003
type = VarSet
v = 0
value = -1
persistent = 0
ignorehitpause = 1

[State 2003, Var]
trigger1 = 1
type = VarAdd
v = 0
value = 1
ignorehitpause = 1

[State 2003, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
slot = 0
stateno = 2003
time = 1
ignorehitpause = 1

[State 2013, Override]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 2013, Override]
type = NotHitBy
trigger1 = 1
value = , AT
time = 1
ignorehitpause = 1

[State 2013, HitDef]
type = HitDef
trigger1 = Var(0) % 6 = 0
trigger1 = Var(0) = [10, 110]
attr = S, HP
damage = Ceil(5 * Parent, FVar(39)),0
animtype = Light
air.type = High
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0,0
sparkno = -1
hitsound = -1
guardsound = 5,0
ground.type = High
ground.velocity = 0, -1
ground.hittime = 5
ground.slidetime = 5
guard.velocity = -1
air.velocity = 0,-1
airguard.velocity = 0, 0
air.hittime = 5
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
air.fall = 1
fall = 1
fall.recover = 0
fall.recovertime = 120
fall.animtype = Medium
getpower = 0, 0
givepower = 36, 36
envshake.time = 6
envshake.freq = 120
envshake.ampl = 2
palfx.color = 0
palfx.invertall = 1
palfx.add = 140, 120, 180
palfx.mul = 256, 256, 256
palfx.time = 5
ignorehitpause = 1
numhits = 0
air.juggle = 18

[State 2013, HitDef]
type = HitDef
trigger1 = Var(0) = 110
trigger2 = !Time && Var(0) >= 110
attr = S, HP
damage = 3,3
animtype = Light
air.type = High
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0,0
sparkno = -1
hitsound = S7020,5
guardsound = 5,0
ground.type = High
ground.velocity = 0, -5
ground.hittime = 5
ground.slidetime = 5
guard.velocity = -1
air.velocity = 0,-5
airguard.velocity = 0, 0
air.hittime = 5
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
air.fall = 1
fall = 1
fall.recover = 0
fall.recovertime = 120
fall.animtype = Medium
getpower = 0, 0
givepower = 36, 36
palfx.color = 0
palfx.invertall = 1
palfx.add = 20, 0, 80
palfx.mul = 256, 256, 256
palfx.time = 3
ignorehitpause = 1
numhits = 0
persistent = 0

[State 2003, End]
type = ChangeAnim
trigger1 = Anim = 7200 && Var(0) >= 120
value = 7201
ignorehitpause = 1

;End
[State 2013, End]
type = DestroySelf
trigger1 = !AnimTime && Anim = 7201
ignorehitpause = 1

;Hell Geyser GetHit
[Statedef 2003]
type    = A
movetype= H
physics = N
poweradd= 0
ctrl = 0
sprpriority = 3

[State 2003, RealTime]
trigger1 = 1
type = AngleDraw
scale = 0.8, 0.8
ignorehitpause = 1

[State 2003, Var]
trigger1 = 1
type = VarAdd
v = 0
value = 1
ignorehitpause = 1

[State 2003, RealTime]
trigger1 = 1
type = Trans
trans = addalpha
alpha = 128, 256
ignorehitpause = 1

[State 2014, PosFreeze]
trigger1 = 1
type = PosFreeze
value = 1
ignorehitpause = 1

[State 6965]
type = ChangeAnim
trigger1 = 1
value = Anim
elem = AnimElemNo(0)
ignorehitpause=1

[State 2013, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
slot = 0
stateno = 2003
time = 1
ignorehitpause = 1

[State 2013, Override]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 2004, End]
type = ChangeState
trigger1 = Time > GetHitVar(HitTime)
value = 2002
ignorehitpause = 1

;End
[State 2013, End]
type = DestroySelf
trigger1 = !AnimTime && Anim = 7201
ignorehitpause = 1

;Geyser Soul
[Statedef 2005]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 7205
sprpriority = 3
velset = 0, 2

[state 2014, dist x]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2014, Vel]
type = VelAdd
trigger1 = Vel Y >= - 4
Y = -0.2


[State 2014, Vel]
type = Trans
trigger1 = Time = [36,52]
trans = addalpha
alpha = 256 - 16 *(Time - 36), 16 *(Time - 36)


[State 2014, DestroySelf]
type = DestroySelf
trigger1 = Time >= 52


;---------------------------------------------------------------------------
;Dark Matter
[Statedef 2010]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2010
poweradd = -1000
sprpriority = 2
juggle = 14

[State 2010, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 2010, Super Pause FX]
type = helper
trigger1 = time = 1
helpertype = normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2010, Super Pause]
type = superpause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S7010,2
p2defmul = 1
darken = 0

[State 2010, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000)
value = 2011
ctrl = 0

;Dark Matter Summoning
[Statedef 2011]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2011
sprpriority = 2
facep2 = 1

[State 2011, Dark Matter]
type = Helper
trigger1 = !Time
name = "Dark Matter"
ID = 2010
stateno = 2012
pos = -5, -15
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 2011, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Dark Matter (invisible)
[Statedef 2012]
type    = A
movetype= I
physics = N
ctrl = 0
anim = 7300
sprpriority = 3
velset = 0,0

[State 2012, Boom]
type = ChangeState
trigger1 = Parent, StateNo = 2011
trigger1 = Parent, AnimElem = 2
value = 2013
ignorehitpause = 1

[State 2012, Fail]
type = DestroySelf
trigger1 = Parent, StateNo != 2010
trigger1 = Parent, StateNo != 2011
ignorehitpause = 1

;Dark Matter
[Statedef 2013]
type    = A
movetype= A
physics = N
poweradd= 0
ctrl = 0
sprpriority = 0
juggle = 14

[State 2013, PosAdd]
type = ChangeAnim
trigger1 = !Time && PrevStateNo != 2014
value = 7210
ignorehitpause = 1

[State 2013, PosAdd]
type = VelSet
trigger1 = !Time && PrevStateNo != 2014
X = 3
ignorehitpause = 1

[State 2013, Snd]
type = PlaySnd
trigger1 = !Var(0)
value = S6,0
channel = 0

[State 2013, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
slot = 0
stateno = 2014
time = 1
ignorehitpause = 1

[State 2013, Override]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 2013, Override]
type = NotHitBy
trigger1 = 1
value = , AT
time = 1
ignorehitpause = 1

[State 2013, HitDef]
type = HitDef
trigger1 = Time % 10 = 0
trigger1 = AnimElemNo(0) < 53
attr = S, HP
damage = Ceil(26 * Parent, FVar(39)),3
animtype = Hard
air.type = Low
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0,19
sparkno = -1
hitsound = S7020,5
guardsound = 5,0
ground.type = Low
ground.velocity = 0, 0
ground.hittime = 5
ground.slidetime = 5
guard.velocity = -1
air.velocity = 0,0
airguard.velocity = 0, 0
air.hittime = 5
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4
air.fall = 1
fall = 1
p1sprpriority = 0
p2sprpriority = 2
fall.recover = 0
fall.recovertime = 120
fall.animtype = Medium
getpower = 0, 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
palfx.color = 0
palfx.invertall = 1
palfx.add = 140, 120, 180
palfx.mul = 256, 256, 256
palfx.time = 20
ignorehitpause = 1

[State 2013, End]
type = Trans
trigger1 = AnimElemTime(1) = [0, 32]
trans = addalpha
alpha = 8 * AnimElemTime(1), 256 - 8 * AnimElemTime(1)
ignorehitpause = 1

[State 2013, End]
type = VelMul
trigger1 = AnimElemNo(0) > 40
trigger2 = PrevStateNo = 2014
trigger3 = NumTarget
trigger3 = (Vel X * Facing * (ScreenPos X - Target, ScreenPos X) > 0) ;|| (Vel X < 0 && (ScreenPos X < Target, ScreenPos X))
X = IfElse(MoveContact, 0, 0.93)
ignorehitpause = 1

[State 2013, End]
type = Trans
trigger1 = AnimElemTime(53) > 0
trans = addalpha
alpha = 256 - 8 * AnimElemTime(53), 8 * AnimElemTime(53)
ignorehitpause = 1

[State 2013, NormalScale]
type = AngleDraw
trigger1 = AnimElemTime(53) <= 0
scale = 0.5, 0.5
ignorehitpause = 1

[State 2013, End]
type = AngleDraw
trigger1 = AnimElemTime(53) > 0
scale = 0.5 - 0.5 * AnimElemTime(53)/32.0, 0.5 - 0.5 * AnimElemTime(53)/32.0
ignorehitpause = 1

;End
[State 2013, End]
type = DestroySelf
trigger1 = AnimElemTime(53) > 32
ignorehitpause = 1

;Dark Matter GetHit
[Statedef 2014]
type    = A
movetype= H
physics = N
poweradd= 0
ctrl = 0
sprpriority = 3

[State 2013, End]
type = Trans
trigger1 = AnimElemTime(1) = [0, 32]
trans = addalpha
alpha = 8 * AnimElemTime(1), 256 - 8 * AnimElemTime(1)
ignorehitpause = 1

[State 2013, End]
type = Trans
trigger1 = AnimElemTime(53) > 0
trans = addalpha
alpha = 256 - 8 * AnimElemTime(53), 8 * AnimElemTime(53)
ignorehitpause = 1

[State 2013, NormalScale]
type = AngleDraw
trigger1 = AnimElemTime(53) <= 0
scale = 0.5, 0.5
ignorehitpause = 1

[State 2013, End]
type = AngleDraw
trigger1 = AnimElemTime(53) > 0
scale = 0.5 - 0.5 * AnimElemTime(53)/32.0, 0.5 - 0.5 * AnimElemTime(53)/32.0
ignorehitpause = 1

[State 2014, PosFreeze]
trigger1 = 1
type = PosFreeze
value = 1
ignorehitpause = 1

[State 6965]
type = ChangeAnim
trigger1 = 1
value = Anim
elem = AnimElemNo(0)
ignorehitpause=1

[State 2013, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA, AP
slot = 0
stateno = 2014
time = 1
ignorehitpause = 1

[State 2013, Override]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 2004, End]
type = ChangeState
trigger1 = Time > GetHitVar(HitTime)
value = 2013
ignorehitpause = 1

[State 2013, End]
type = DestroySelf
trigger1 = AnimElemTime(53) > 32
ignorehitpause = 1

;---------------------------------------------------------------------------

;Black Wind
[Statedef 2020]
type=S
physics=S
movetype=A
anim=2020
ctrl=0
velset=0,0
sprpriority=1
poweradd = -1000

[State 3060, nhb]
type = NotHitBy
trigger1 = Time <=45
value = SCA
time = 1
ignorehitpause = 1

[State 2010, Super Pause FX]
type = helper
trigger1 = time = 1
helpertype = normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2010, Super Pause]
type = superpause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S7000,2
p2defmul = 1
darken = 0

[State 2020, Attack]
type = VelSet
trigger1 = AnimElemNo(0) >= 5
X = 5.2

[State 3060,Hit]
type = HitDef
trigger1 = time = 1
attr = S,HT
hitflag = M-
priority = 1, Miss
sparkno = -1
hitsound = S7002,3
p1sprpriority = 1
p2sprpriority = 0
p1facing = 1
p2facing = 1
p1stateno = 2022
p2stateno = 2023
guard.dist = 0
fall = 1
getpower = 0

[State 2020, Attack]
type = ChangeState
trigger1 = Time >= 55 && !MoveHit
value = 2021

;Black Wind Miss
[Statedef 2021]
type = C
physics = C
movetype = I
anim = 2021
ctrl = 0
sprpriority = 1

[State 2021, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Black Wind Success
[Statedef 2022]
type = C
physics = C
movetype = I
anim = 2022
ctrl = 0
sprpriority = 1

[State 2021, End]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 2021, End]
type = VarSet
trigger1 = !Time
FV = 0
value = Facing * (Target, ScreenPos X - ScreenPos X)
ignorehitpause = 1

[State 2021, End]
type = VarAdd
trigger1 = Time <= 16
FV = 0
value = - Vel X
ignorehitpause = 1

[State 2022, Bound]
type = TargetBind
trigger1 = Time < 16
pos = FVar(0), 0

[State 2021, End]
type = PalFx
trigger1 = Time = [0, 16]
time = 1
add = -8 * Time, -8 * Time, -8 * Time
color = IfElse(Time <= 8, 256 - Time*32, 0)
ignorehitpause = 1

[State 2021, End]
type = Trans
trigger1 = Time = [0, 16]
trans = addalpha
alpha = 256 - 16 * Time , 16 * Time
ignorehitpause = 1

[State 2021, End]
type = AssertSpecial
trigger1 = Time >= 16
flag = Invisible
ignorehitpause = 1

[State 2021, End]
type = VelSet
trigger1 = Time >= 16
X = 0
Y = 0
ignorehitpause = 1

[State 2021, End]
type = PosSet
trigger1 = Time = 16
X = Target, Pos X - 30 * Facing
Y = 0
ignorehitpause = 1

[State 2022, Bound]
type = TargetBind
trigger1 = Time >= 16
pos = 30, 0

[State 200, Explod]
type = EnvShake
trigger1 = Time = [16, 120] 
trigger1 = GameTime % 8 = 7
freq = 120
time = 6
ampl = 4
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = Time = [16, 120] 
trigger1 = GameTime % 8 = 7
anim = 7001
ID = 2020
pos = 30 + (0.7 - 1.4 * Random /1000.0) * (Target, Const(size.ground.front) + Target, Const(size.ground.back)) , - (1.2 - Random /1000.0) * (Target, Const(size.height))
postype = p1  ;p2,front,back,left,right
facing = 1 - 2 * (Random % 2) 
vfacing = 1 - 2 * (Random % 2)
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 200, Explod]
type = TargetLifeAdd
trigger1 = Time = [16, 120]
trigger1 = GameTime % 8 = 7
value = -10
ignorehitpause = 1

[State 200, Explod]
type = TargetLifeAdd
trigger1 = Time > 150
trigger1 = GameTime % 8 = 7
value = -30
ignorehitpause = 1
persistent = 0

[State 200, Explod]
type = EnvShake
trigger1 = Time > 150
trigger1 = GameTime % 8 = 7
freq = 120
time = 30
ampl = 8
ignorehitpause = 1
persistent = 0

[State 200, Explod]
type = Explod
trigger1 = Time > 150
trigger1 = GameTime % 8 = 7
anim = 7004
ID = 2020
pos = 30, - 0.7 * (Target, Const(size.height))
postype = p1  ;p2,front,back,left,right
facing =  1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 2,2
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 2021, End]
type = null;ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


; Black Wind - Hit
[Statedef 2023]
type = A
movetype = H
physics = N
sprpriority = 1

[State 2023, Anim]
type = ScreenBound
trigger1 = 1
value = 0
ignorehitpause = 1

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

[State 2023, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 2023
ignorehitpause = 1

; Black Wind - End
[Statedef 2024]
type = A
movetype = H
physics = N
sprpriority = 1

[State 2023, Anim]
type = ScreenBound
trigger1 = 1
value = 0
ignorehitpause = 1

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

[State 2023, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 2023
ignorehitpause = 1


;---------------------------------------------------------------------------

;Gate Key Summon
[Statedef 2100]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2000
poweradd = -3000
sprpriority = 2

[State 2000, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 2110, Super Pause]
type = Explod
trigger1 = AnimElem = 2
removetime = -1
ID = 2100
anim = 7100
pos = 5, -25
ownpal = 1
sprpriority = 3
shadow = -1
removeongethit = 1
supermovetime = 99999
ignorehitpause = 1

[State 2000, Explosion]
type = Helper
trigger1 = AnimElem = 2
name = "Gate"
ID = 2100
stateno = 2101
pos = Facing * Floor(EnemyNear(IfElse(EnemyNear(0), Alive, 0, 1)), Pos X - Pos X), Floor(EnemyNear(IfElse(EnemyNear(0), Alive, 0, 1)), Pos Y + EnemyNear(IfElse(EnemyNear(0), Alive, 0, 1)), Const(size.head.pos.y) - 70)
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime = 999999

[State 2000, Super Pause FX]
type = helper
trigger1 = time = 1
helpertype = normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2000, Super Pause]
type = superpause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S7010,2
p2defmul = 1
darken = 0

[State 2000, End]
type = RemoveExplod
trigger1 = Time > 1 && !NumHelper(7000)
ID = 2100
ignorehitpause = 1

[State 2100, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000)
value = 0
ctrl = 1

; Gate
[Statedef 2101]
type    = A
movetype= I
physics = N
poweradd= 0
ctrl = 0
anim = 7101
sprpriority = -1

[State 2101, Scale]
type = AngleDraw
trigger1 = 1
scale = 2, 1

[State 2000, Explosion]
type = Helper
trigger1 = AnimElem = 25
name = "Tyranno"
ID = 2102
stateno = 2102
postype = p1    ;p2,front,back,left,right
pos = 0, 0
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime = 999999

[State 2101, End]
type = ChangeAnim
trigger1 = Anim = 7101
trigger1 = !NumHelper(2102)
trigger1 = AnimElem = 26
value = 7102

[State 2101, End]
type = DestroySelf
trigger1 = Anim = 7102
trigger1 = !AnimTime

; Tyranno
[Statedef 2102]
type    = A
movetype= A
physics = N
poweradd= 0
ctrl = 0
anim = 7104
sprpriority = 0
velset = 0, 2.7

[State 2101, Trans]
type = Trans
trigger1 = Time = [0, 16]
trans = addalpha
alpha = 16 * Time, 256 - 16 * Time
ignorehitpause = 1

[State 2101, End]
type = VelSet
trigger1 = Anim = 7104
trigger1 = Time > 13
Y = 0

[State 2101, Bite Down]
type = HitDef
trigger1 = NumHelper(2103)
trigger1 = Helper(2103), AnimElem = 2
attr = A,SA
damage = 280
animtype = Hard
hitflag = MAF
hitsound = S7002,3
guardflag = HA
pausetime = 14,14
sparkno = -1
ground.type = High
ground.slidetime = 0
ground.hittime = 7
ground.velocity = 0
air.velocity = 0,0
air.fall = 1
fall = 1
palfx.add = 200,200,200
palfx.mul = 256,256,256
palfx.time = 12

[State 2000, Explosion]
type = Helper
trigger1 = !Time
name = "Tyranno Head"
ID = 2103
stateno = 2103
postype = p1    ;p2,front,back,left,right
pos = 0, 0
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime = 999999

[State 2101, End]
type = ChangeAnim
triggerall = Anim = 7104
trigger1 = NumHelper(2103)
trigger1 = Helper(2103), AnimElemTime(3) >= 20
trigger2 = MoveReversed
value = 7105

[State 2101, Trans]
type = Trans
trigger1 = Anim = 7105
trigger1 = AnimElemTime(1) = [0, 16]
trans = addalpha
alpha = 256 - 16 *  AnimElemTime(1), 16 *  AnimElemTime(1)

[State 2101, up]
type = VelSet
trigger1 = Anim = 7105
Y = -2.7

[State 2101, End]
type = DestroySelf
trigger1 = Anim = 7105
trigger1 = AnimElemTime(1) > 16

;Tyranno Head
[Statedef 2103]
type    = A
movetype= I
physics = N
poweradd= 0
ctrl = 0
anim = 7103
sprpriority = 3

[State 2101, Trans]
type = EnvShake
trigger1 = AnimElem = 2
ampl = 6
freq = 120
time = 12

[State 2101, Trans]
type = Trans
trigger1 = Time = [0, 16]
trans = addalpha
alpha = 16 * Time, 256 - 16 * Time

[State 2101, End]
type = PosSet
trigger1 = 1
X = Parent, Pos X
Y = Parent, Pos Y

[State 2101, Trans]
type = Trans
trigger1 = Parent, Anim = 7105
trigger1 = Parent, AnimElemTime(1) = [0, 16]
trans = addalpha
alpha = 256 - 16 * Parent, AnimElemTime(1), 16 *  Parent, AnimElemTime(1)

[State 2101, End]
type = DestroySelf
trigger1 = Parent, Anim = 7105
trigger1 = Parent, AnimElemTime(1) > 16
trigger2 = !(Parent, StateNo)
trigger3 = !(NumHelper(2102))

;Protect Activation
[Statedef 2110]
type = S
movetype = I
physics = S
anim = 2110
ctrl = 0
velset = 0,0
sprpriority = 1
facep2 = 1

[State 2010, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA

[State 2110, Super Pause FX]
type = helper
trigger1 = time = 1
helpertype = normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2110, Super Pause]
type = SuperPause
trigger1 = Time = 1
time = 60
movetime = 60
anim = -1
pos = 0, -20
sound = S7010,2
p2defmul = 1
darken = 0

[State 2110, Super Pause]
type = Explod
trigger1 = AnimElem = 9
removetime = -2
anim = 7110
pos = 0, -20
ownpal = 1
sprpriority = 3
removeongethit = 1
supermovetime = 99999


[State 2110, VarSet]
type = VarSet
trigger1 = (!AnimTime)
v = 21
value = 1

[State 2110, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000) && Var(21) > 0
value = 0
ctrl = 1