extends Node

func distance(coords):
	return (((coords.x/10)**2+(coords.y/10)**2+(coords.z/10)**2)**0.5)

func translate(obj, move: Vector3):
	var start = obj.pos
	obj.pos+= move
	
	obj.position += 100*Vector2(obj.pos.x,obj.pos.y)/distance(obj.pos) - 100*Vector2(start.x,start.y)/distance(start)
	obj.scale *= (10*Vector2(1,1)/distance(obj.pos))/(10*Vector2(1,1)/distance(start))
	print(obj.scale)
	#obj.white.modulate.a = (distance(obj.pos)/60)**1.6
	
