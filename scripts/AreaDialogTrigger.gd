extends Area2D


var dialog = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AreaDialogTrigger_body_entered(body):
	if body.get_name() == "Hana" and not dialog:
		dialog = Dialogic.start("stairs-wip")
		add_child(dialog)
		dialog.connect("timeline_end", self, "_on_dialog_sequence_finished")

func _on_AreaDialogTrigger_body_exited(body):
	if body.get_name() == "Hana" and dialog != null:
		dialog.queue_free()
		dialog = null
		
func _on_dialog_sequence_finished(timeline_name):
	dialog.queue_free()
	dialog = null
