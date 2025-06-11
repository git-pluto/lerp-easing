extends Node
class_name lerp_ease

var timestart: float
var obj: Node2D
var duration
var end
var eas
var property
var queue:Array[Array] = []

func _process(delta: float) -> void:
	var a = lerp(float(1), float(end),eas.call((g.t()-timestart)/duration))/lerp(float(1), float(end),eas.call((g.t()-delta-timestart)/duration))
	match property:
		"scale":
			obj.scale *= a
		"position":
			obj.position *= a
	if g.t()-timestart >= duration:
		if len(queue):
			setup(queue.pop_front())
		else:
			queue_free()

func add(xObj, xProperty, xEnd, xEase, xDuration):
	if not obj:
		setup([xObj, xProperty, xEnd, xEase, xDuration])
	else:
		queue.append([xObj, xProperty, xEnd, xEase, xDuration])

func setup(arr: Array):
	obj = arr[0]
	property = arr[1]
	end = arr[2]
	eas = arr[3]
	duration = arr[4]
	timestart = g.t()
