class_name Level
extends Node
#wincond var fase 1:
var registered_pirateships := 0
var pirateship_inscene_count := 0

signal win_cond(achieved: bool)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child_node in get_children():
		var obj := child_node
		if (obj as PirateShip):
			pirateship_inscene_count += 1
			obj.win_cond.connect(_ships_respawned_watcher)
		#elif(obj as KeyStatue): #fase2
		#elif(obj as Chest_healthPoints
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_next_level() -> void:
	var current_level_path := get_tree().current_scene.scene_file_path
	var split_path := current_level_path.split(".")
	var next_level_number = split_path[1].to_int() + 1
	split_path[1] = str(next_level_number).pad_zeros(3)
	var next_level_path = ".".join(split_path)
	
	if not ResourceLoader.exists(next_level_path):
		split_path[1] = "res://main.tscn"
		next_level_path = ".".join(split_path)
		
	get_tree().change_scene_to_file((next_level_path))

##FASE 1 FUNCTIONS ------------------------------------------------------------

func _ships_respawned_watcher(valid: bool) -> void:
	if valid:
		pirateship_inscene_count += 1
		if pirateship_inscene_count == 0:
			_destroy_rock_wall()
	else:
		pirateship_inscene_count -= 1

func _destroy_rock_wall() -> void:
	for child in get_children():
		var rock_wall := child as WinCondition
		var rock_root = rock_wall.get_tree()
		rock_root.remove_child.call_deferred(self)
		


func _on_next_level_area_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
