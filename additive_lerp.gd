extends lerp_ease
class_name additive_lerp

func _process(delta: float) -> void:
	var a = lerp(0, 1,eas.call((g.t()-timestart)/duration))-lerp(0, 1,eas.call((g.t()-delta-timestart)/duration))
	
	match property:
		"scale":
			obj.scale += a*end
		"position":
			obj.position += a*end
	if g.t()-timestart >= duration:
		if len(queue):
			setup(queue.pop_front())
		else:
			queue_free()
