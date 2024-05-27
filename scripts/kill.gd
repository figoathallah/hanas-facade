extends Node2D

const classroom = preload("res://scenes/classroom_cutscene.tscn")
# replace with classroom-playable once instanced

# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(1.0), "timeout")
	var kill = Dialogic.start("the-kill")
	add_child(kill)
	kill.connect("timeline_end", self, "_on_dialog_sequence_finished")

func _on_dialog_sequence_finished(timeline_name):
	yield(get_tree().create_timer(2.0), "timeout")
	$Transition.transition()


func _on_Transition_transitioned():
	add_child(classroom.instance())
