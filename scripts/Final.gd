extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const courtyard = preload("res://scenes/courtyard_ending.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(1.0), "timeout")
	var ending = Dialogic.start("ending")
	add_child(ending)
	ending.connect("dialogic_signal", self, "_dialog_listener")
	
func _dialog_listener(argument):
	yield(get_tree().create_timer(2.0), "timeout")
	if argument == "sayu_ending":
		$Transition.transition()
	else:
		get_tree().change_scene("res://scenes/TitleScreen.tscn") # will change to main menu

func _on_Transition_transitioned():
	add_child(courtyard.instance())



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
