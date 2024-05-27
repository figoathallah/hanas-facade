extends Node2D

var fade_duration = 2.0
var current_time = 0.0

onready var sayu = $Sayu
onready var sayuSprite = $Sayu/Sprite
onready var sayuAnimation = $Sayu/AnimationPlayer

onready var officer = $Officer
onready var officerAnimation = $Officer/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.trueEndingReached = true
	fade_in()
	$PoliceSiren.play()
	$Hana.canMove = false
	yield(get_tree().create_timer(2.0), "timeout")
	var epilogue = Dialogic.start("epilogue")
	add_child(epilogue)
	epilogue.connect("timeline_end", self, "_on_dialog_sequence_finished")
	epilogue.connect("dialogic_signal", self, "_on_cutscene_started")

func _on_dialog_sequence_finished(timeline_name):
	current_time = 0.0
	yield(get_tree().create_timer(2.0), "timeout")
	fade_out()
	$Transition.show()
	$Transition.transition()


func _on_Transition_transitioned():
	get_tree().change_scene("res://scenes/epilogue.tscn")
	
func fade_in():
	var start_vol = -80.0 
	var end_vol = $PoliceSiren.volume_db 
	while current_time < fade_duration:
		var t = current_time / fade_duration
		$PoliceSiren.volume_db = lerp(start_vol, end_vol, t)
		yield(get_tree(), "idle_frame")
		current_time += get_process_delta_time()

	
func fade_out():
	var start_vol = $PoliceSiren.volume_db
	var end_vol = -80.0  
	while current_time < fade_duration:
		var t = current_time / fade_duration
		$PoliceSiren.volume_db = lerp(start_vol, end_vol, t)
		yield(get_tree(), "idle_frame")
		current_time += get_process_delta_time()
	
	$PoliceSiren.stop()
	$PoliceSiren.volume_db = start_vol


func _on_cutscene_started(argument):
	if argument == "sayuBeg1":
		sayu.moveToTargetPosition(Vector2(605, 294))
		sayuAnimation.play("walk_front")
	if argument == "sayuBeg2":
		sayu.moveToTargetPosition(Vector2(510, 294))
		sayuAnimation.play("walk_left")
	if argument == "sayuTurn":
		sayuSprite.frame = 1
	if argument == "sayuWalk": 
		sayu.moveToTargetPosition(Vector2(510, 1212))
		sayuAnimation.play("walk_front")
	if argument == "copConfront":
		officer.moveToTargetPosition(Vector2(603, 221))
		officerAnimation.play("walk_front")
	if argument == "copWalk":
		officer.moveToTargetPosition(Vector2(565, 1182))
		officerAnimation.play("walk_front")

