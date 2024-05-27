extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	$Hana.canMove = false
	yield(get_tree().create_timer(1.0), "timeout")
	get_tree().paused = true
	var evidence = Dialogic.start("clean-evidence")
	evidence.pause_mode = Node.PAUSE_MODE_PROCESS
	add_child(evidence)
	evidence.connect("timeline_end", self, "_on_dialog_sequence_finished")
		
func _on_dialog_sequence_finished(timeline_name):
	get_tree().paused = false
	yield(get_tree().create_timer(1.0), "timeout")
	get_tree().change_scene("res://scenes/classroom_playable.tscn")
	$Hana.canMove = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
