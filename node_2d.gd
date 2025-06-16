extends Node2D

@onready var icon: Sprite2D = $Icon

var move = Vector3(0,0,0)

func _init() -> void:
	Engine.time_scale = 1
	await self.ready


func _process(_delta: float) -> void:
	pass
	sc.translate(icon, move)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("up"):
		var a:space_lerp = calc.setLerp("spc")
		a.add(icon,Vector3(0,-5,0),calc.jump,0.5)
		a.add(icon,Vector3(0,-5,0),calc.jump,0.5)
		var b:space_lerp = calc.setLerp("spc")
		b.add(icon,Vector3(20,0,20),calc.hio,0.5)
		b.add(icon,Vector3(-20,0,-20),calc.hio,0.5)
		#move.y = -1
	#if event.is_action_pressed("down"):
		#move.y = 1
	#if event.is_action_pressed("left"):
		#move.x = -1
	#if event.is_action_pressed("right"):
		#move.x = 1
	#if event.is_action_pressed("depth in"):
		#move.z = 1
	#if event.is_action_pressed("depth out"):
		#move.z = -1
	#if not Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		#move.x = 0
	#if not Input.is_action_pressed("up") and not Input.is_action_pressed("down"):
		#move.y = 0
	#if not Input.is_action_pressed("depth in") and not Input.is_action_pressed("depth out"):
		#move.z = 0
