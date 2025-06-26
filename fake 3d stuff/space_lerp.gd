extends Node
class_name space_lerp

var timestart: float
var obj: Node2D
var duration
var end
var eas
var queue:Array[Array] = []

func _process(delta: float) -> void:
	var a = lerp(0, 1,eas.call((g.t()-timestart)/duration))-lerp(0, 1,eas.call((g.t()-delta-timestart)/duration))
	sc.translate(obj,a*end)
	
	if g.t()-timestart >= duration:
		if len(queue):
			setup(queue.pop_front())
		else:
			queue_free()

func add(xObj, xEnd, xEase, xDuration):
	if not obj:
		setup([xObj, xEnd, xEase, xDuration])
	else:
		queue.append([xObj, xEnd, xEase, xDuration])

func setup(arr: Array):
	obj = arr[0]
	end = arr[1]
	eas = arr[2]
	duration = arr[3]
	timestart = g.t()
