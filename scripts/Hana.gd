extends KinematicBody2D

export (int) var speed = 400
export (int) var frame 
var velocity = Vector2.ZERO
var last_input = ""
var canMove = true
var cutsceneActive = false


func get_input():
	if canMove and !cutsceneActive:
		velocity = Vector2.ZERO
		if Input.is_action_pressed('ui_right'):
			velocity.x += 1
		if Input.is_action_pressed('ui_left'):
			velocity.x -= 1
		if Input.is_action_pressed('ui_down'):
			velocity.y += 1
		if Input.is_action_pressed('ui_up'):
			velocity.y -= 1
		velocity = velocity.normalized() * speed
	

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.frame = frame
	connect("player_entered", self, "_on_InteractArea_player_entered")
	connect("player_exited", self, "_on_InteractArea_player_exited")
	connect("player_entered", self, "_on_AreaTrigger_player_entered")
	connect("player_exited", self, "_on_AreaTrigger_player_exited")


func _process(delta):
	if canMove and !cutsceneActive:	
		if Input.is_action_pressed('ui_right'):
			$AnimationPlayer.play("walk_right")
			last_input = "right"
		elif Input.is_action_pressed('ui_left'):
			$AnimationPlayer.play("walk_left")
			last_input = "left"
		elif Input.is_action_pressed('ui_down'):
			$AnimationPlayer.play("walk_front")
			last_input = "down"
		elif Input.is_action_pressed('ui_up'):
			$AnimationPlayer.play("walk_back")
			last_input = "up"
		else:
			$AnimationPlayer.stop()
			if last_input == "down":
				$Sprite.frame = 1
			elif last_input == "left":
				$Sprite.frame = 4
			elif last_input == "right":
				$Sprite.frame = 7
			elif last_input == "up":
				$Sprite.frame = 10	


func _on_InteractArea_player_entered():
	canMove = false
	velocity = Vector2.ZERO
	$AnimationPlayer.stop()


func _on_InteractArea_player_exited():
	canMove = true


func _on_AreaTrigger_player_entered():
	canMove = false
	velocity = Vector2.ZERO
	$AnimationPlayer.stop()


func _on_AreaTrigger_player_exited():
	canMove = true
	
