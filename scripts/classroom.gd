extends Node2D

var confrontation

onready var hana = $Hana
onready var hanaAnimation = $Hana/AnimationPlayer
onready var shinji = $Shinji
var distance = 0
var inchCloser = false
var hanaCominToGetYa = false
var rapidLunge = false
var tremblingMagnitude = 2
var tremblingFrequency = 7


# Called when the node enters the scene tree for the first time.
func _ready():
	hana.canMove = false
	yield(get_tree().create_timer(2.0), "timeout")
	confrontation = Dialogic.start("confrontation")
	add_child(confrontation)
	confrontation.connect("timeline_end", self, "_on_dialog_sequence_finished")
	confrontation.connect("dialogic_signal", self, "_on_cutscene_started")

func _physics_process(delta):
	if hana.cutsceneActive:
		distance += abs(hana.velocity.x) * delta
	
	if hana.cutsceneActive and distance >= 45 and inchCloser:
		_stop_cutscene()
	
	if hana.cutsceneActive and distance >= 180 and rapidLunge:
		_stop_cutscene()

func _process(delta):
	if hanaCominToGetYa:
		var offset = Vector2(rand_range(-tremblingMagnitude, tremblingMagnitude), 
		rand_range(-tremblingMagnitude, tremblingMagnitude))
		shinji.position += offset * delta * tremblingFrequency 

func _on_dialog_sequence_finished(timeline_name):
	hana.cutsceneActive = false
	get_tree().change_scene("res://scenes/kill.tscn")

func _on_cutscene_started(argument):
	hana.cutsceneActive = true
	if argument == "inchCloser":
		hana.velocity.x = -1 * 50
		hanaAnimation.play("walk_left")
		hana.last_input = "left"
		inchCloser = true
		hanaCominToGetYa = true
	if argument == "rapidLunge":
		hana.velocity.x = -1 * 550
		hanaAnimation.play("walk_left")
		hana.last_input = "left"
		rapidLunge = true
		
func _stop_cutscene():
	hana.velocity = Vector2.ZERO
	hanaAnimation.stop()
	distance = 0
	inchCloser = false
		
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
