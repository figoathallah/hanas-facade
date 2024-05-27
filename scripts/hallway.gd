extends Node2D

func _ready():
	if Global.lastPos != Vector2(0,0):
		$Hana.position = Global.lastPos
	
	if Global.collectedItems.has("friendship_bracelet"):
		$FriendshipBracelet.queue_free()
		$BraceletInteract.queue_free()
	else:
		Global.items.append("friendship_bracelet")


