extends Node2D

var stuff = []

var move = Vector3(0,0,0)

func _init() -> void:
	Engine.time_scale = 1
	await self.ready
	#sc.translate(sprite("bullfrog"),Vector3(-10,0,10))
	#sc.translate(sprite("bullfrog"),Vector3(0,0,7))
	#sc.translate(sprite("bullfrog"),Vector3(0,0,13))
	#sc.translate(sprite("bullfrog"),Vector3(10,0,10))
	
	for i in 5:
		for h in 5:
			sc.translate(sprite("bullfrog"),Vector3((h-2)*-7,0,50-i*8))
	
	movecamera(Vector3(0,7,0))
	spincamera(Vector2(0,-15*PI/180))
	#var a: lerp_ease = calc.setLerp("ite")
	#a.add(icon,"scale",0.5,calc.co,0.2)

func _process(_delta: float) -> void:
	pass
	#sc.translate(icon, move)
	#sc.translate(frog, move)
	#sc.orbit(icon,Vector2(0.1,0.1))

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("up"):
		pass
		movecamera(Vector3(10,0,0))
		
		#var a:space_lerp = calc.setLerp("spc")
		#a.add(icon,"translation",Vector3(0,-5,0),calc.jump,0.2)
		#a.add(icon,"translation",Vector3(0,0,0),calc.jump,0.1)
		#a.add(icon,"translation",Vector3(0,-2,0),calc.jump,1)
		#
		#var b:space_lerp = calc.setLerp("spc")
		#b.add(icon,"translation",Vector3(20,0,40),calc.sqi,0.2)
		#b.add(icon,"translation",Vector3(0,-1,0),calc.jump,0.1)
		#b.add(icon,"translation",Vector3(-20,0,-40),calc.hio,1)
		#
		
		#var c:additive_lerp = calc.setLerp("add")
		#c.add(icon,"rotation_degrees",20,calc.jump,0.2)
		#c.add(icon,"rotation_degrees",0,calc.jump,0.1)
		#c.add(icon,"rotation_degrees",-10,calc.jump,1)
		
		#var a:space_lerp = calc.setLerp("spc")
		#var b:space_lerp = calc.setLerp("spc")
		#a.add(icon,"orbit",Vector2(PI,0),calc.co,1)
		#b.add(frog,"orbit",Vector2(PI,0),calc.co,1)
		
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

func movecamera(vec):
	for i in stuff:
		var a:space_lerp = calc.setLerp("spc")
		a.add(i,"translation",vec,calc.hio,1)

func spincamera(vec):
	for i in stuff:
		var a:space_lerp = calc.setLerp("spc")
		a.add(i,"orbit",vec,calc.hio,1)

func sprite(ame):
	var a:Sprite2D = Sprite2D.new()
	add_child(a)
	a.texture = load("res://sprites/"+ame+".png")
	a.set_script(load("res://icon.gd"))
	stuff.append(a)
	a.pos.z+=10
	a.scale*=10
	return a
