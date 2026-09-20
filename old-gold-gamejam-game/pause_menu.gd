extends Control

var root_window : Window
var is_on_level := true
var is_paused := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	root_window = get_tree().root
	root_window.remove_child.call_deferred(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if is_paused == false and (is_on_level and Input.is_action_just_pressed("Pause (Start)")):
		PauseMenu.activate()
	elif is_paused == true and (is_on_level and Input.is_action_just_pressed("Pause (Start)")):
		PauseMenu._close_pause_menu()

func activate() -> void:
	is_paused = true
	root_window.add_child(self)
	get_tree().paused = true
	Engine.time_scale = 0.0

func _close_pause_menu() -> void:
	is_paused = false
	get_tree().paused = false
	Engine.time_scale = 1.0
	root_window.remove_child(self)
