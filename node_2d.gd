extends Node2D

@onready var icon: Sprite2D = $Icon

var move = Vector3(0,0,0)

func _init() -> void:
	Engine.time_scale = 1
	await self.ready
	sc.translate(icon,Vector3(0,0,0))



func _process(_delta: float) -> void:
	pass
	sc.translate(icon, move*5)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("up"):
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
