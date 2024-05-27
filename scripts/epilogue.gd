extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(1.0), "timeout")
	var epilogue2 = Dialogic.start("epilogue-pt2")
	add_child(epilogue2)
	epilogue2.connect("timeline_end", self, "_on_dialog_sequence_finished")
	epilogue2.connect("dialogic_signal", self, "_dialog_listener")

func _on_dialog_sequence_finished(timeline_name):
	yield(get_tree().create_timer(2.0), "timeout")
	get_tree().change_scene("res://scenes/TitleScreen.tscn") 


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
