extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.collectedItems.has("mop_bucket"):
		$MopBucket.queue_free()
		$MopBucketInteract.queue_free()
	else:
		Global.items.append("mop_bucket")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
		
