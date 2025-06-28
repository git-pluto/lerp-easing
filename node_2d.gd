extends Node2D

var stuff = [icon, frog]

@onready var frog: Node2D = $frog
@onready var icon: Node2D = $Icon

var move = Vector3(0,0,0)

func _init() -> void:
	Engine.time_scale = 1
	await self.ready
	icon.pos = Vector3(-10,0,50)
	frog.pos = Vector3(20,0,90)
	#var a: lerp_ease = calc.setLerp("ite")
	#a.add(icon,"scale",0.5,calc.co,0.2)


func _process(_delta: float) -> void:
	pass
	#sc.translate(icon, move)
	#sc.translate(frog, move)
	sc.orbit(icon,Vector2(1,0))

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("up"):
		#var a:space_lerp = calc.setLerp("spc")
		#a.add(icon,Vector3(0,-5,0),calc.jump,0.2)
		#a.add(icon,Vector3(0,0,0),calc.jump,0.1)
		#a.add(icon,Vector3(0,-2,0),calc.jump,1)
		#
		#var b:space_lerp = calc.setLerp("spc")
		#b.add(icon,Vector3(20,0,40),calc.sqi,0.2)
		#b.add(icon,Vector3(0,-1,0),calc.jump,0.1)
		#b.add(icon,Vector3(-20,0,-40),calc.hio,1)
		#
		#var c:additive_lerp = calc.setLerp("add")
		#c.add(icon,"rotation_degrees",20,calc.jump,0.2)
		#c.add(icon,"rotation_degrees",0,calc.jump,0.1)
		#c.add(icon,"rotation_degrees",-10,calc.jump,1)
		
		move.y = -1
	if event.is_action_pressed("down"):
		move.y = 1
	if event.is_action_pressed("left"):
		move.x = -1
	if event.is_action_pressed("right"):
		move.x = 1
	if event.is_action_pressed("depth in"):
		move.z = 1
	if event.is_action_pressed("depth out"):
		move.z = -1
	if not Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		move.x = 0
	if not Input.is_action_pressed("up") and not Input.is_action_pressed("down"):
		move.y = 0
	if not Input.is_action_pressed("depth in") and not Input.is_action_pressed("depth out"):
		move.z = 0
