extends Node2D

const classroom = preload("res://scenes/classroom.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(1.0), "timeout")
	var twist = Dialogic.start("plot-twist")
	add_child(twist)
	twist.connect("timeline_end", self, "_on_dialog_sequence_finished")

func _on_dialog_sequence_finished(timeline_name):
	yield(get_tree().create_timer(2.0), "timeout")
	$Transition.transition()


func _on_Transition_transitioned():
	add_child(classroom.instance())
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
