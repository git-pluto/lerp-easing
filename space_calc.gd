extends Node


func translate(obj, move: Vector3):
	obj.pos+= move
	
	# how do i do this? it should be the distance from the camera, but x and y arent doing that.
	
	obj.position = 100*Vector2(obj.pos.x,obj.pos.y)/(((obj.pos.x**2)*0.1+(obj.pos.y**2)*0.1+obj.pos.z**2)**0.5)

	obj.scale = 200*Vector2(1,1)/((obj.pos.x**2+obj.pos.y**2+obj.pos.z**2)**0.5)
	
	# the position is still the same but the scale keeps increasing
	#icon.position.y += pos.y*sc.ypos(distance) + pos.y*sc.ypos(distance-move) # calculo + offset. esse é um tipo de funcao definitiva
	#icon.position.x += -(pos.x*sc.ypos(distance) + pos.x*sc.ypos(distance-move))
	# pra fazer um aditivo disso é so comparar o valor da posicao atual e somar/subtrair
