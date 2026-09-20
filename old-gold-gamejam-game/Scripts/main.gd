extends Control




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _load_next_level() -> void:
	var current_level_path := get_tree().current_scene.scene_file_path
	var split_path := current_level_path.split(".")
	var next_level_number = split_path[1].to_int() + 1
	split_path[1] = str(next_level_number).pad_zeros(3)
	var next_level_path = ".".join(split_path)
	
	if not ResourceLoader.exists(next_level_path):
		split_path[1] = "res://main.tscn"
		next_level_path = ".".join(split_path)
		
	get_tree().change_scene_to_file((next_level_path))
