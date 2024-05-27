extends Label

var target_position = Vector2(1, -45)  
var move_speed = 100  

func _process(delta):
	# Calculate the direction and distance to the target position
	var direction = (target_position - rect_position).normalized()
	var distance = rect_position.distance_to(target_position)
	
	
	var move_amount = move_speed * delta
	
	
	if distance > move_amount:
		rect_position += direction * move_amount
	else:
		rect_position = target_position  

