extends Node2D

@onready var icon: Sprite2D = $Icon
var distance = 0
var move = 0

func _init() -> void:
	Engine.time_scale = 1

func _process(_delta: float) -> void:
	distance+=move
	icon.position.y = -200*sc.ypos(distance) # calculo + offset. esse é um tipo de funcao definitiva
	# pra fazer um aditivo disso é so comparar o valor da posicao atual e somar/subtrair
	icon.scale = Vector2(1,1)*sc.scale(distance)*3

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up"):
		move=0.1
		
	if event.is_action_pressed("ui_down"):
		move=-0.1
	if event.is_action_released("ui_up") or event.is_action_released("ui_down"):
		move=0
