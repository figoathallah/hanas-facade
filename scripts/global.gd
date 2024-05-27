extends Node

var lastPos = Vector2(0,0)

var items = []
var collectedItems = []
var trueEndingReached = false
const CHEAT_CODE = "HANADULSET"
var input_buffer = ""
const BLINK_SCRIPT_PATH = "res://scripts/blink.gd"
var blink_script = preload(BLINK_SCRIPT_PATH)
var blinking_active = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every time there's an input event.
func _input(event):
	if event is InputEventKey:
		if event.pressed and not event.echo:
			var key = OS.get_scancode_string(event.scancode)
			input_buffer += key

			# Trim the input buffer if it exceeds a reasonable length
			if input_buffer.length() > 50:
				input_buffer = input_buffer.substr(-50)
			
			# Check if the input buffer contains the cheat code substring
			if CHEAT_CODE in input_buffer:
				toggle_cheat_code()
				input_buffer = ""

# Function to activate the cheat code
func toggle_cheat_code():
	if blinking_active:
		print("Cheat code deactivated!")
		stop_blinking_key_items()
		blinking_active = false
	else:
		print("Cheat code activated!")
		blink_key_items()
		blinking_active = true

# Function to make all interactive objects blink
func blink_key_items():
	var keyItems = get_tree().get_nodes_in_group("keyItems")
	for obj in keyItems:
		if not obj.get_script():
			obj.set_script(blink_script)
			obj.call("start_blinking")
		

# Function to stop blinking for all interactive objects
func stop_blinking_key_items():
	var keyItems = get_tree().get_nodes_in_group("keyItems")
	for obj in keyItems:
		if obj.get_script():
			obj.call("stop_blinking")

