extends Node2D

@onready var icon: Sprite2D = $Icon

var move = Vector3(0,0,0)

func _init() -> void:
	Engine.time_scale = 1
	await self.ready
	sc.translate(icon,Vector3(0,0,1))



func _process(_delta: float) -> void:
	pass
	sc.translate(icon, move/100)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up"):
		#var a:lerp_ease = calc.setLerp("ite") # example of simultaneous easing desync
		#a.add(icon,"scale",0.5,calc.tco, 0.5)
		#var b:lerp_ease = calc.setLerp("ite")
		#b.add(icon,"scale",2,calc.co, 0.5)
		#
		#var c:lerp_ease = calc.setLerp("add")
		#c.add(icon,"translation",Vector3(0,100,0),calc.hio, 1)
		#
		var a:lerp_ease = calc.setLerp("add")
		a.add(icon,"translation",Vector3(0,0,-5),calc.jump, 0.5)
		a.add(icon,"translation",Vector3(0,0, 5),calc.jump, 0.5)
		
		var b:lerp_ease = calc.setLerp("add")
		b.add(icon,"translation",Vector3(200,0,0),calc.hio, 0.5)
		b.add(icon,"translation",Vector3(-200,0,0),calc.hio, 0.5)
		
		
		move.y-=1
	if event.is_action_pressed("ui_down"):
		move.y+=1
	if event.is_action_pressed("ui_left"):
		move.z-=1
	if event.is_action_pressed("ui_right"):
		move.z+=1
	if event.is_action_released("ui_up") or event.is_action_released("ui_down") or event.is_action_released("ui_left") or event.is_action_released("ui_right"):
		move = Vector3(0,0,0)
