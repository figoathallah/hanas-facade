extends Area2D

signal player_entered
signal player_exited

export var sceneName: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AreaFinalTrigger_body_entered(body):
	if body.get_name() == "Hana":
		emit_signal("player_entered")
		var dialog = Dialogic.start("done")
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		add_child(dialog)
		dialog.connect("dialogic_signal", self, "_dialog_listener")
		dialog.connect("timeline_end", self, "_on_dialog_sequence_finished")
		get_tree().paused = true
		
func _on_dialog_sequence_finished(timeline_name):
	get_tree().paused = false
	emit_signal("player_exited")

func _dialog_listener(argument):
	if argument == "backToCourtyard":
		BGM.fade_out()
		get_tree().paused = false
		emit_signal("player_exited")
		$Transition.show()
		$Transition.transition()

func _on_Transition_transitioned():
	get_tree().change_scene(str("res://scenes/" + sceneName + ".tscn"))
