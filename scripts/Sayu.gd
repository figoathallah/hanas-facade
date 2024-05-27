extends KinematicBody2D

export (int) var frame 

var velocity = Vector2.ZERO
var speed = 100
var targetPosition = Vector2.ZERO
var isMoving = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.frame = frame
	
func _process(delta):
	velocity = velocity.normalized() * speed
	

func _physics_process(delta):
	velocity = move_and_slide(velocity)
	if isMoving:
		var direction = (targetPosition - position).normalized()
		move_and_slide(direction * speed)
		if position.distance_to(targetPosition) < 0.5: 
			isMoving = false
			$AnimationPlayer.stop()
			$AnimationPlayer.play("RESET")

func moveToTargetPosition(position):
	targetPosition = position
	isMoving = true

