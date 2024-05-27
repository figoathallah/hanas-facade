extends Area2D

export var dialogName: String
var active = false
var queueFreeable = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_InteractObject_body_entered(body):
	if body.get_name() == "Hana":
		active = true


func _on_InteractObject_body_exited(body):
	if body.get_name() == "Hana":
		active = false
		
func _input(event):
	if event.is_action_pressed("ui_accept") and active:
		var dialog = Dialogic.start(dialogName)
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		add_child(dialog)
		dialog.connect("timeline_end", self, "_on_dialog_sequence_finished")
		dialog.connect("dialogic_signal", self, "_dialog_listener")
		get_tree().paused = true

func _on_dialog_sequence_finished(timeline_name):
	get_tree().paused = false
	if queueFreeable:
		queue_free()
	
func _dialog_listener(argument):
	if argument == "mop_bucket":
		var mopBucket = get_node("/root/Bathroom/MopBucket")
		Global.collectedItems.append("mop_bucket")
		Global.items.erase("mop_bucket")
		mopBucket.queue_free()
		queueFreeable = true
	if argument == "floor_mopped":
		var footprints = get_node("/root/ClassroomPlayable/Footprints")
		Global.collectedItems.append("ev_footprints")
		Global.items.erase("ev_footprints")
		footprints.queue_free()
		queueFreeable = true
	if argument == "torn_ribbon":
		var tornRibbon = get_node("/root/ClassroomPlayable/Ribbon")
		Global.collectedItems.append("ev_ribbon")
		Global.items.erase("ev_ribbon")
		tornRibbon.queue_free()
		queueFreeable = true
	if argument == "dog_keychain":
		var keychain = get_node("/root/ClassroomPlayable/Keychain")
		Global.collectedItems.append("ev_keychain")
		Global.items.erase("ev_keychain")
		keychain.queue_free()
		queueFreeable = true
	if argument == "sewing_kit":
		var sewingKit = get_node("/root/ArtRoom/SewingKit")
		Global.collectedItems.append("sewing_kit")
		Global.items.erase("sewing_kit")
		sewingKit.queue_free()
		queueFreeable = true
	if argument == "super_glue":
		Global.collectedItems.append("super_glue")
		Global.items.erase("super_glue")
	if argument == "friendship_bracelet":
		var bracelet = get_node("/root/Hallway/FriendshipBracelet")
		Global.collectedItems.append("friendship_bracelet")
		Global.items.erase("friendship_bracelet")
		bracelet.queue_free()
		queueFreeable = true
	if argument == "braceletPlanted":
		var bracelet = get_node("/root/ClassroomPlayable/FriendshipBracelet")
		bracelet.show()
		Global.collectedItems.append("ev_bracelet")
		Global.items.erase("ev_bracelet")

