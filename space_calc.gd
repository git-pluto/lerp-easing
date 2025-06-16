extends Node

func distance(obj):
	return (((obj.pos.x/10)**2+(obj.pos.y/10)**2+(obj.pos.z/10)**2)**0.5)

func translate(obj, move: Vector3):
	obj.pos+= move
	obj.position = 100*Vector2(obj.pos.x,obj.pos.y)/distance(obj)
	obj.scale = 10*Vector2(1,1)/distance(obj)
	obj.white.modulate.a = (distance(obj)/70)**1.6
