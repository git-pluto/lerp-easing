extends Node

func distance(coords):
	return (((coords.x/10)**2+(coords.y/10)**2+(coords.z/10)**2)**0.5)

func translate(obj, move: Vector3):
	var start = obj.pos
	obj.pos+= move
	
	obj.position += 100*Vector2(obj.pos.x,obj.pos.y)/distance(obj.pos) - 100*Vector2(start.x,start.y)/distance(start)
	obj.scale *= (10*Vector2(1,1)/distance(obj.pos))/(10*Vector2(1,1)/distance(start))
	
	#obj.white.modulate.a = (distance(obj.pos)/60)**1.6

func orbit(obj, angle: Vector2):
	var start = obj.pos
	var anguloinicial = atan2(start.z,start.x)
	var H = hipot(start.z,start.x)
	translate(obj, Vector3(cos(anguloinicial)*H-cos(anguloinicial+angle.x)*H,0,sin(anguloinicial)*H-sin(anguloinicial+angle.x)*H))
	translate(obj, Vector3(0,cos(anguloinicial)*H-cos(anguloinicial+angle.y)*H,sin(anguloinicial)*H-sin(anguloinicial+angle.y)*H))

func hipot(a, b):
	return (a**2+b**2)**0.5
