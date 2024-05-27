extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.collectedItems.has("sewing_kit"):
		$SewingKit.queue_free()
		$SewingKitInteract.queue_free()
	else:
		Global.items.append("sewing_kit")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
