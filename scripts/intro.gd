extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const courtyard = preload("res://scenes/courtyard.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(1.0), "timeout")
	var intro = Dialogic.start("intro-dialog")
	add_child(intro)
	intro.connect("timeline_end", self, "_on_dialog_sequence_finished")

func _on_dialog_sequence_finished(timeline_name):
	yield(get_tree().create_timer(2.0), "timeout")
	$Transition.transition()


func _on_Transition_transitioned():
	add_child(courtyard.instance())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
