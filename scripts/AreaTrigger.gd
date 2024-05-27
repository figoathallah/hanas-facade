extends Area2D

signal player_entered
signal player_exited

export var sceneName = ""


func _on_AreaTrigger_body_entered(body):
	if body.get_name() == "Hana":
		emit_signal("player_entered")
		$Door.play()
		$Transition.show()
		$Transition.transition()


func _on_Transition_transitioned():
	emit_signal("player_exited")
	get_tree().change_scene(str("res://scenes/" + sceneName + ".tscn"))


func _on_AreaTriggerEntrance_body_entered(body):
	if body.get_name() == "Hana":
		emit_signal("player_entered")
		Global.lastPos = Vector2(global_position.x + 200, global_position.y - 30)
		$Transition.show()
		$Transition.transition()
