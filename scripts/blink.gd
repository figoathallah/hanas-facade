extends Node2D

# Variables for blinking effect
var is_blinking = false
var blink_interval = 0.1  # Duration between blinks
var blink_duration = 1.0  # Duration of the blinking effect
var blink_timer = 0.0
var original_modulate = Color(1, 1, 1, 1)  # Original modulate color
var blink_modulate = Color(1, 1, 1, 0)  # Color when blinking

func _ready():
	# Initially not blinking
	is_blinking = false
	original_modulate = self.modulate
	print("Blink script ready for", self.name)

func _process(delta):
	if is_blinking:
		blink_timer += delta

		if blink_timer >= blink_duration:
			stop_blinking()
		elif blink_timer >= blink_interval:
			blink_timer = 0.0
			toggle_modulation()

func start_blinking():
	is_blinking = true
	print("Blinking started for", self.name)
	blink_timer = 0.0
	self.modulate = blink_modulate

func stop_blinking():
	is_blinking = false
	print("Blinking stopped for", self.name)
	self.modulate = original_modulate  # Restore original modulation

func toggle_modulation():
	if self.modulate == original_modulate:
		self.modulate = blink_modulate
	else:
		self.modulate = original_modulate
