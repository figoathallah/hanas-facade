extends Node2D

var prologue

onready var hana = $YSort/Hana
onready var hanaAnimation = $YSort/Hana/AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	hana.canMove = false
	yield(get_tree().create_timer(2.0), "timeout")
	prologue = Dialogic.start("prologue")
	add_child(prologue)
	prologue.connect("timeline_end", self, "_on_dialog_sequence_finished")
	prologue.connect("dialogic_signal", self, "_on_cutscene_started")
	
	
func _unhandled_input(event):
	if Input.is_key_pressed(KEY_X):
		get_tree().change_scene("res://scenes/classroom_playable.tscn")
	

func _on_dialog_sequence_finished(timeline_name):
	var two = Dialogic.start("prologue-2")
	add_child(two)
	two.connect("timeline_end", self, "_change_scenes")
	two.connect("dialogic_signal", self, "_on_cutscene_started")
	
func _change_scenes(timeline_name):
	get_tree().change_scene("res://scenes/plottwist.tscn")
	hana.cutsceneActive = false
	hana.canMove = true
	
	
func _on_cutscene_started(argument):
	hana.cutsceneActive = true
	if argument == "hanaLeave":
		hana.velocity.x = -1 * hana.speed
		hanaAnimation.play("walk_left")
		hana.last_input = "left"
	if argument == "skipAhead":
		$Skip.target_position = Vector2(1, 30)
	if argument == "skipHide":
		$Skip.target_position = Vector2(1, -45)
	

