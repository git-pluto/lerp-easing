extends Node2D

@onready var icon: Sprite2D = $Icon

func _init() -> void:
	Engine.time_scale = 1
	

func _process(_delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up"):
		icon.scale+=Vector2(0,2)
		var a:lerp_ease = calc.setLerp("add")
		a.add(icon,"scale",Vector2(0,-2),calc.co, 0.5)
