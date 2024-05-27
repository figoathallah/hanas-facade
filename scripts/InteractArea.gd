extends Area2D

export var sceneName = ""
var active = false
var playerStartPos = Vector2()


signal player_entered
signal player_exited

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	# get Hana


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_InteractArea_body_entered(body):
	if body.get_name() == "Hana":
		active = true
		Global.lastPos = body.position

func _on_InteractArea_body_exited(body):
	if body.get_name() == "Hana":
		active = false
		

func _input(event):
	if event.is_action_pressed("ui_accept") and active:
			emit_signal("player_entered")
			$Door.play()
			$Transition.show()
			$Transition.transition()


func _on_Transition_transitioned():
	emit_signal("player_exited")
	get_tree().change_scene(str("res://scenes/" + sceneName + ".tscn"))

