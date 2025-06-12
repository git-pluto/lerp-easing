extends Node2D

@onready var icon: Sprite2D = $Icon
var distance = 0
var pos = Vector2(-200,100)
var move = 0

func _init() -> void:
	Engine.time_scale = 1

func _process(_delta: float) -> void:
	pass
	distance+=move
	icon.position = Vector2(pos.x*1.5**-distance,pos.y*1.5**-distance)
	#icon.position.y += pos.y*sc.ypos(distance) + pos.y*sc.ypos(distance-move) # calculo + offset. esse é um tipo de funcao definitiva
	#icon.position.x += -(pos.x*sc.ypos(distance) + pos.x*sc.ypos(distance-move))
	# pra fazer um aditivo disso é so comparar o valor da posicao atual e somar/subtrair
	icon.scale = Vector2(1,1)*sc.scale(distance)*3

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up"):
		#var a:lerp_ease = calc.setLerp("ite") # example of simultaneous easing desync
		#a.add(icon,"scale",0.5,calc.tco, 0.5)
		#var b:lerp_ease = calc.setLerp("ite")
		#b.add(icon,"scale",2,calc.co, 0.5)
		move=0.1
		
	if event.is_action_pressed("ui_down"):
		move=-0.1
	if event.is_action_released("ui_up") or event.is_action_released("ui_down"):
		move=0
