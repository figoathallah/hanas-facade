extends Control

var images = [
	"res://assets/SplashScreen.png",
	"res://assets/SplashScreen2.png",
	"res://assets/SplashScreen3.png"
]

var imgIndex = 0

onready var textureRect = $TextureRect

# Called when the node enters the scene tree for the first time.
func _ready():
	showNext()

func showNext():
	if imgIndex < images.size():
		var image_path = images[imgIndex]
		var texture = load(image_path)
		textureRect.texture = texture
		imgIndex += 1
		# Start the timer for the next image
		$Timer.start()
	else:
		$Transition.show()
		$Transition.transition()

# Called when the timer times out
func _on_Timer_timeout():
	showNext()
	
func _on_Transition_transitioned():
	go_to_main_menu()

# Transition to the main menu
func go_to_main_menu():
	get_tree().change_scene("res://scenes/TitleScreen.tscn")

