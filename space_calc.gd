extends Node

func ypos(d):
	return (1-1.1**(-d))

func scale(d):
	return 1.1**(-d)

func translate(obj, move: Vector3):
	var start: Vector3 = obj.pos
	obj.pos+= move
	
	obj.position += Vector2(obj.pos.x-1.1**-obj.pos.z,obj.pos.y*1.1**-obj.pos.z)-Vector2(start.x-1.1**-start.z,start.y*1.1**-start.z)
	
	obj.scale *= Vector2(1,1)*(scale(obj.pos.z)/scale(start.z))
	# the position is still the same but the scale keeps increasing
	#icon.position.y += pos.y*sc.ypos(distance) + pos.y*sc.ypos(distance-move) # calculo + offset. esse é um tipo de funcao definitiva
	#icon.position.x += -(pos.x*sc.ypos(distance) + pos.x*sc.ypos(distance-move))
	# pra fazer um aditivo disso é so comparar o valor da posicao atual e somar/subtrair
	
