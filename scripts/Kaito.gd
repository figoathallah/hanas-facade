extends KinematicBody2D

export (int) var frame

func _ready():
	$Sprite.frame = frame

