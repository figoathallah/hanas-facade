extends CanvasLayer

signal transitioned
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func transition():
	$AnimationPlayer.play("fade_out")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_out":
		emit_signal("transitioned")
		$AnimationPlayer.play("fade_in")
