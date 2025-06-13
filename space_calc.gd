extends Node

func distance(obj):
	return (((obj.pos.x/10)**2+(obj.pos.y/10)**2+(obj.pos.z/10)**2)**0.5)

func translate(obj, move: Vector3):
	obj.pos+= move
	
	# how do i do this? it should be the distance from the camera, but x and y arent doing that.
	
	obj.position = 100*Vector2(obj.pos.x,obj.pos.y)/distance(obj)

	obj.scale = 1000*Vector2(1,1)/distance(obj)
	
	# the position is still the same but the scale keeps increasing
	#icon.position.y += pos.y*sc.ypos(distance) + pos.y*sc.ypos(distance-move) # calculo + offset. esse é um tipo de funcao definitiva
	#icon.position.x += -(pos.x*sc.ypos(distance) + pos.x*sc.ypos(distance-move))
	# pra fazer um aditivo disso é so comparar o valor da posicao atual e somar/subtrair
