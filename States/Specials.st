;===========================================================================
; Special Moves
;===========================================================================

;Elemental Magic
[Statedef 1000]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 1000
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 72)
facep2 = 1

[State 1010, Strength]
type = VarSet
trigger1 = !Time
var(0) = IfElse(command = "qcfc", 2, IfElse(command = "qcfb", 1, 0))

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7000,1
ignorehitpause = 1

[State 1000, Pawnch]
type = Helper
trigger1 = AnimElem = 5
trigger1 = Var(22) = 0
name = "Lightning"
ID = 1000
stateno = 1001
pos = 50 + 50 * Var(0), 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1000, Pawnch]
type = Helper
trigger1 = AnimElem = 5
trigger1 = Var(22) = 1
name = "Water Bubble"
ID = 1000
stateno = 1002
pos = 20, -20
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1000, Pawnch]
type = Helper
trigger1 = AnimElem = 5
trigger1 = Var(22) = 2
name = "Fire"
ID = 1000
stateno = 1003
pos = 15, -15
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1040, End]
type = ChangeState
trigger1 = Time > (30 + 15 * !Var(22))
value = 0
ctrl = 1

;Lightning
[Statedef 1001]
type = A
physics = N
movetype = A
anim = 7100
ctrl = 0
velset = 0,0
sprpriority = 4

[State 1002, Strength]
type = VarSet
trigger1 = !time
var(0) = (root, var(0))

[State 1001, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1001, hitdef]
type = HitDef
trigger1 = !Time
priority = 6, Hit
attr = A,SP
damage = Floor(Parent, FVar(39)*60), 4
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4,4
sparkno = -1
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -0.4,0
air.velocity  = -0.4, 4
air.fall = 1
p2facing = 1
palfx.invertall = 1
palfx.color = 0
palfx.add = 120, 120, 20
palfx.time = 12
guard.dist = 100
envshake.time = 8
envshake.freq = 120
envshake.ampl = 2
getpower = IfElse(Parent, Var(21) > 0, 0, 20)

[State 1001, Dampen]
Type = ParentVarset
Trigger1 = MoveHit
fvar(39) = parent, Fvar(39)*0.86
persistent = 0
ignorehitpause = 1

[State 1001, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1000, burst]
type = Trans
trigger1 = AnimElemTime(6) > 0
trans = addalpha
alpha = 256 - 8 * AnimElemTime(6), 256
ignorehitpause = 1

[State 1001, burst]
type = DestroySelf
trigger1 = AnimElemTime(6) > 32
trigger2 = MoveReversed
ignorehitpause = 1

;Water Bubble
[Statedef 1002]
type = A
physics = N
movetype = A
anim = 7101
ctrl = 0
velset = 0,0
sprpriority = 4

[State 1002, Strength]
type = VarSet
trigger1 = !time
var(0) = (root, var(0))

[State 1002, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1002, Vertical Speed]
type = VelSet
trigger1 = Time < 100
X = 0.3 * (2 - Var(0)) + 0.5
Y = IfElse(Var(0) = 2, -.84, IfElse(Var(0) = 1, -.45, -.24)) - Sin(Time * 6)

[State 1002, Vertical Speed]
type = VelAdd
trigger1 = Time >= 100 
X = - Vel X * 0.9

[State 1002, Vertical Speed]
type = VelSet
trigger1 = Time >= 80 
Y = IfElse(Var(0) = 2, -.84, IfElse(Var(0) = 1, -.45, -.24)) * 30 /(30.0 + Time - 80) - Sin(Time * 6)


[State 1010, hitdef]
type = HitDef
trigger1 = !Time
priority = 6, Hit
attr = A,SP
damage = Floor(Parent, FVar(39)*60), 4
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4,4
sparkno = -1
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -0.4, -4.2
air.velocity  = -0.4, -4.2
air.fall = 1
fall.recover = 1
p2facing = 1
palfx.invertall = 1
palfx.color = 0
palfx.add = 0, 20, 120
palfx.time = 12
guard.dist = 100
envshake.time = 8
envshake.freq = 120
envshake.ampl = 2
getpower = IfElse(Parent, Var(21) > 0, 0, 20)

[State 200, Dampen]
Type = ParentVarset
Trigger1 = MoveHit
fvar(39) = parent, Fvar(39)*0.86
persistent = 0
ignorehitpause = 1

[State 1021, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA, AA, AP
stateno = 1005
ignorehitpause = 1

[State 1021, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1010, burst]
type = ChangeState
trigger1 = MoveContact
trigger2 = Time > 200
value = 1005
ignorehitpause = 1

; Fire
[Statedef 1003]
type    = A
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 7103
sprpriority = 2

[State 1021, Strength]
type = VarSet
trigger1 = !Time
var(0) = parent, var(0)

[State 1021, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1021, Vel]
type = VelSet
trigger1 = AnimElem = 4
x =  IfElse(var(0) = 2, 4.2, IfElse(var(0) = 1, 2.7, 2)) * Cos(IfElse(var(0) = 2, 0.5 ,IfElse(var(0) = 1, 0.78, 1.4)))
y = -IfElse(var(0) = 2, 3.5, IfElse(var(0) = 1, 2.7, 4)) * Sin(IfElse(var(0) = 2, 0.5 ,IfElse(var(0) = 1, 0.78, 1.4)))
persistent = 0

[State 1021, Gravity]
type = VelAdd
trigger1 = AnimElemNo(0) >= 5
y = 0.26

[State 1010, hitdef]
type = HitDef
trigger1 = !Time
priority = 6, Hit
attr = A,SP
damage = Floor(Parent, FVar(39)*60), 4
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 8
sparkno = -1
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -3, -3
air.velocity  = -3, -3
air.fall = 1
p2facing = 1
palfx.invertall = 0
palfx.color = 0
palfx.add = 144, 64, 7
palfx.mul = 256,256,256
palfx.time = 12
guard.dist = 100
envshake.time = 8
envshake.freq = 120
envshake.ampl = 2
getpower = IfElse(Parent, Var(21) > 0, 0, 20)

[State 1022, Explod]
type = Explod
trigger1 = GameTime % 4 = 0
trigger1 = AnimElemNo(0) >= 5
trigger1 = !MoveContact
anim = 7104
ID = 1020
pos = 0, 0
postype = p1 ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0, 0
accel = 0,0
removetime = -2
scale = 1 , 1
sprpriority = 1
ontop = 0
ownpal = 1
removeongethit = 0

[State 1021, ChangeState]
type = DestroySelf
trigger1 = MoveHit
trigger2 = Vel Y >= 0 && Pos Y > - Vel Y
trigger3 = MoveReversed
ignorehitpause = 1


;Bubble Bursting
[Statedef 1005]
type = A
physics = N
movetype = I
anim = 7102
velset = 0,0
ctrl = 0
sprpriority = 4

[State 1015, snd]
type = PlaySnd
trigger1 = !Time
value = S7010,4
channel = 1

[State 1015, assert]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1015, dieplz]
type = DestroySelf
trigger1 = FrontEdgeDist < -50
trigger2 = BackEdgeDist < 0
trigger3 = !AnimTime

;---------------------------------------------------------------------------
;Black Wind
[Statedef 1010]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 1010
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 72)
facep2 = 1

[State 1010, Strength]
type = VarSet
trigger1 = !Time
var(0) = ifelse(command = "dfc", 2, ifelse(command = "dfb", 1, 0))

[State 1100, nothitby]
type = nothitby
trigger1 = animelemtime(1) < 6
value = SCA
time = 1
ignorehitpause = 1

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7000,1
ignorehitpause = 1

[State 1010, Jump]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N
ignorehitpause = 1

[State 1010, Jump]
type = VelSet
trigger1 = AnimElemNo(0) = [3, 14]
Y = -2.7 - 0.4 * Var(0)
X = 0.5 + Var(0)
ignorehitpause = 1

[State 220, Explod]
type = Explod
trigger1 = AnimElem = 3
trigger2 = AnimElem = 7
trigger3 = AnimElem = 11
anim = 7014
ID = 1010
pos = 3, -10
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
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

[State 220, Explod]
type = Explod
trigger1 = AnimElem = 3
trigger2 = AnimElem = 7
trigger3 = AnimElem = 11
anim = 7014
ID = 1011
pos = -3, -20
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = -1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = -1
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1010, Jump]
type = VelSet
trigger1 = AnimElem = 15
Y = 0
X = 0
ignorehitpause = 1

[State 1010, Gravity]
type = VelAdd
trigger1 = AnimElemNo(0) >= 15
y = 0.25
ignorehitpause = 1

[State 1250, Hit]
type = HitDef
trigger1 = Animelem = 3
trigger2 = Animelem = 7
trigger3 = Animelem = 11
attr = A, SA
damage = IfElse(var(0) = 2, 47, IfElse(var(0) = 1, 42, 37)), 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 7, 7
sparkno = S7007
sparkxy = -10, -25
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -0.5 - Var(0), -3.5 - 1.2 * Var(0)
air.type = Low
air.velocity = -0.5 - Var(0), -3.5 - 1.2 * Var(0)
guard.cornerpush.veloff = 0;-12.74
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 24, 48)), IfElse(Var(21) > 0, 0, 12)
givepower = 12, 12
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.3
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
forcestand = 1
palfx.add = 128, 128, 128
palfx.mul = 256,256,256
palfx.time = 8

[State -3: AfterImageTime]
type = AfterImageTime
trigger1 = AnimElemNo(0) < 15
time = 5
ignorehitpause = 1

[State 1020, Afterimage]
type = AfterImage
trigger1 = AnimElem = 3
length = 8
palbright = 20, 20, 20
palcolor = 0
paladd = 10,10,10
palmul = 0.65, 0.65, 0.65
timegap  = 1
framegap = 1
trans = add1
time = 2; only 2 ticks!!!
ignorehitpause = 1

[State 1020, Afterimage]
type = PalFX
trigger1 = Time = [0, 16]
add = -2 * Time, -2 * Time, -2 * Time
color = 16 * (16 - Time )
time = 1
ignorehitpause = 1

[State 1020, Afterimage]
type = PalFX
trigger1 = Time > 16
trigger1 = AnimElemTime(15) < 0
add = -32, -32, -32
color = 0
time = 1
ignorehitpause = 1

[State 1020, Afterimage]
type = PalFX
trigger1 = AnimElemTime(15) = [0, 16]
add = -2 * (16 - AnimElemTime(15)), -2 * (16 - AnimElemTime(15)),-2 * (16 - AnimElemTime(15))
color = 16 * AnimElemTime(15)
time = 1
ignorehitpause = 1

[State 1040, End]
type = PosSet
trigger1 = Pos Y > - Vel Y && Vel Y > 0
trigger1 = AnimElemNo(0) >= 15
Y = 0

[State 1040, End]
type = VelSet
trigger1 = Pos Y > - Vel Y && Vel Y > 0
trigger1 = AnimElemNo(0) >= 15
Y = 0

[State 1040, End]
type = ChangeState
trigger1 = Pos Y >= 0 
trigger1 = AnimElemNo(0) >= 15
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; Dark Mist
[Statedef 1020]
type    = S
movetype= A
physics = S
juggle  = 3
poweradd= 72
ctrl = 0
anim = 1020
sprpriority = 1
facep2 = 1
velset = 0,0

[State 1020, Strength]
type = NotHitBy
trigger1 = AnimElemNo(0) >= 2
value = , AA, AP

[State 1020, Strength]
type = NotHitBy
trigger1 = AnimElemNo(0) >= 2
value = , AA, AP

[State 1020, Strength]
type = PlayerPush
trigger1 = AnimElemNo(0) >= 2
value = 0

[State 1020, Strength]
type = VelSet
trigger1 = AnimElemNo(0) >= 2
trigger1 = Anim = 1020
X = Const(velocity.run.fwd.x)

[State 1020, Strength]
type = VarSet
trigger1 = !Time
var(0) = ifelse(command = "qcbc", 2, ifelse(command = "qcbb", 1, 0))

[State 1020, Afterimage]
type = PalFX
trigger1 = Time = [0, 16]
add = -2 * Time, -2 * Time, -2 * Time
color = 16 * (16 - Time )
time = 1
ignorehitpause = 1

[State 1020, Afterimage]
type = PalFX
trigger1 = Time > 16
add = -32, -32, -32
color = 0
time = 1
ignorehitpause = 1

[State 1020, End]
type = ChangeState
trigger1 = Time > (17 * Var(0) + 20)
value = 1021

;Dark Mist End
[Statedef 1021]
type    = S
movetype= I
physics = S
juggle  = 3
ctrl = 0
anim = 1021
sprpriority = 1
facep2 = 1

[State 1020, Afterimage]
type = PalFX
trigger1 = 1
add = -2 * (16 - Time), -2 * (16 - Time),-2 * (16 - Time)
color = 16 * Time
time = 1
ignorehitpause = 1

[State 1020, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Hypno Wave
[Statedef 1030]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 1030
sprpriority = 1
facep2 = 1
velset = 0,0
poweradd = -500

[State 1030, Strength]
type = VarSet
trigger1 = !Time
var(0) = ifelse(command = "qcbc", 2, ifelse(command = "qcbb", 1, 0))

[State 1030, Jump]
type = PlaySnd
trigger1 = !Time
value = 7010,1

[State 1030, Jump]
type = VarSet
trigger1 = !Time
var(0) = 0

[State 1030, Wave]
type = Helper
trigger1 = AnimElem = 2
name = "Hypno Wave"
ID = 1030
stateno = 1031
pos = 0, -20
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1030, Hit]
type = HitDef
trigger1 = AnimElem = 4
attr = A, ST 
hitflag = M-
priority = 2, Miss
sparkno = -1
hitsound = s7010, 0
p1stateno = 1033
p2stateno = 1034
guard.dist = 0
ground.velocity = 0,0
fall = 1
fall.recover = 1
fall.recovertime = 120
persistent = 0
ID = 1030
nochainID = 1030

[State 1030, End]
type = ChangeState
trigger1 = AnimElemNo(0) >= 4 && !NumHelper(1030)
value = 0
ctrl = 1

; The Hypno Wave itself
[Statedef 1031]
type    = S
movetype= I
physics = S
juggle  = 3
ctrl = 0
anim = 7011
sprpriority = 4

[State 1031, PosSet]
type = VarSet
trigger1 = !Time
trigger1 = PrevStateNo != 1032
trigger1 = !(var(1) := 0)
var(0) = parent, var(0)
ignorehitpause = 1

[State 1031, PosSet]
type = VarAdd
trigger1 = 1
v = 1
value = 1
ignorehitpause = 1

[State 7010, Appear]
type = trans
trigger1 = var(1) <= 16
trans = addalpha
alpha = 16 * var(1), 256 - 8 * var(1)
ignorehitpause = 1

[State 7010, Trans]
type = trans
trigger1 = var(1) >= 16
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 7010, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1031, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = , AA, AP, AT
stateno = 1032
ignorehitpause = 1

[State 1031, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , NT, ST, HT
ignorehitpause = 1

[State 1031, PosSet]
type = PosSet
trigger1 = 1
X = Parent, Pos X
Y = Parent, Pos Y - 24

[State 1031, End]
type = ChangeState
trigger1 = Time = 80 || !(Parent, StateNo = 1030)
value = 1032

; Hypno Wave End
[Statedef 1032]
type    = S
movetype= I
physics = N
ctrl = 0
anim = 7011
sprpriority = 4

[State 7010, Trans]
type = trans
trigger1 = Time <= 20
trans = addalpha
alpha = 256, 128
ignorehitpause = 1


[State 7010, Trans]
type = trans
trigger1 = Time > 20
trans = addalpha
alpha = 256 - 16 * (Time - 20) , 128 + 8 * (Time - 20)
ignorehitpause = 1

[State 1031, PosSet]
type = PosSet
trigger1 = 1
X = Parent, Pos X
Y = Parent, Pos Y - 24
ignorehitpause = 1

[State 7010, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1031, End]
type = DestroySelf
trigger1 = Time >= 36
ignorehitpause = 1

; Successful Hypno Wave
[Statedef 1033]
type = S
physics = N
movetype = I
velset = 0,0
ctrl = 0
anim = 1031

[State 1032, Anim]
type = Explod
trigger1 = NumTarget(1030) && Target(1030), Anim = 5110
anim = 7012
ID = 1030
postype = p1
pos = Facing * (Target(1030), Pos X - Pos X) + Target(1030), Const(size.height)/2 , (Target(1030), Pos Y - Pos Y) - 30
removetime = -1;300
facing = Facing
sprpriority = 3
removeongethit = 0
ownpal = 1
persistent = 0

[State 1032, Self]
type = ChangeState
trigger1 = Time > 90
value = 0
ctrl = 1

; Get Hit - Ground
[Statedef 1034]
type = S
physics = N
movetype = H
velset = 0,0

[State 1032, Anim]
type = PlayerPush
trigger1 = 1
value= 0

[State 1032, Anim]
type = ChangeAnim2
trigger1 = !Time
value= 1032

[State 1032, Self]
type = ChangeAnim
trigger1 = Anim = 1032 && !AnimTime
trigger1 = SelfAnimExist(5110)
value = 5110

[State 1032, Self]
type = ChangeAnim2
trigger1 = Anim = 1032 && !AnimTime
trigger1 = !SelfAnimExist(5110)
value = 5110

[State 1032, End]
type = SelfState
trigger1 = Time > 240
value = 5120