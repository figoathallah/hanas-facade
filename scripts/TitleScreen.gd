extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$TitleScreenBGM.play()
	if !Global.collectedItems.empty():
		_startNewGame()
		
	if Global.trueEndingReached:
		$BloodSplatter.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayButton_pressed():
	$Transition.show()
	$Transition.transition()
	
func _on_Transition_transitioned():
	get_tree().change_scene("res://scenes/intro.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
	
func _startNewGame():
		Global.collectedItems.clear()
		Dialogic.set_variable("all_evidence_collected", "false")
		Dialogic.set_variable("bracelet_evidence_planted", "false")
		Dialogic.set_variable("has_bracelet", "false")	
		Dialogic.set_variable("evidence_ribbon_sewn", "false")
		Dialogic.set_variable("evidence_floor_mopped", "false")
		Dialogic.set_variable("evidence_keychain_reattached", "false")
		Dialogic.set_variable("has_keychain", "false")
		Dialogic.set_variable("has_ribbon", "false")
		Dialogic.set_variable("has_sewing_kit", "false")
		Dialogic.set_variable("has_super_glue", "false")
		Dialogic.set_variable("has_mop_bucket", "false")

