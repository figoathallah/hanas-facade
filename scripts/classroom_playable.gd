extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if !BGM.isPlaying:
		BGM.bgm = preload("res://assets/Mysterious Doll.wav")
		BGM.bgm_player.stream = BGM.bgm
		BGM.bgm_player.volume_db = -8.5
		BGM.play_bgm()
	
	if Global.collectedItems.has("ev_footprints"):
		$Footprints.queue_free()
		$FootprintsInteract.queue_free()
	else:
		Global.items.append("ev_footprints")
	
	if Global.collectedItems.has("ev_ribbon"):
		$Ribbon.queue_free()
		$RibbonInteract.queue_free()
	else:
		Global.items.append("ev_ribbon")
		
	if Global.collectedItems.has("ev_keychain"):
		$Keychain.queue_free()
		$KeychainInteract.queue_free()
	else:
		Global.items.append("ev_keychain")
	
	if Global.collectedItems.has("ev_bracelet"):
		$FriendshipBracelet.show()
	else:
		Global.items.append("ev_bracelet")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
