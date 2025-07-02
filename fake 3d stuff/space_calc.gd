extends Node

func distance(coords):
	return (((coords.x/10)**2+(coords.y/10)**2+(coords.z/10)**2)**0.5)

func translate(obj: Node2D, move: Vector3):
	var start = obj.pos
	obj.pos+= move
	
	obj.position += 100*Vector2(obj.pos.x,obj.pos.y)/distance(obj.pos) - 100*Vector2(start.x,start.y)/distance(start)
	obj.scale *= (10*Vector2(1,1)/distance(obj.pos))/(10*Vector2(1,1)/distance(start))
	
	#obj.z_index = -distance(obj.pos)*1000
	
	if obj.pos.z <= 0: obj.visible = false
	else: obj.visible = true
	#obj.white.modulate.a = (distance(obj.pos)/60)**1.6

func orbit(obj, angle: Vector2):
	var anguloinicial = atan2(obj.pos.z,obj.pos.x)
	var H = hipot(obj.pos.z,obj.pos.x)
	translate(obj, Vector3(cos(anguloinicial-angle.x)*H-cos(anguloinicial)*H,0,sin(anguloinicial-angle.x)*H-sin(anguloinicial)*H))
	H = hipot(obj.pos.z,obj.pos.y)
	anguloinicial = atan2(obj.pos.z,obj.pos.y)
	translate(obj, Vector3(0,cos(anguloinicial-angle.y)*H-cos(anguloinicial)*H,sin(anguloinicial-angle.y)*H-sin(anguloinicial)*H))

func hipot(a, b):
	return (a**2+b**2)**0.5
