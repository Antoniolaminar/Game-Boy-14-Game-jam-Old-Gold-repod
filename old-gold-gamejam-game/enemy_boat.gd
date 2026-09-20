class_name EnemyBoat
extends Node2D

signal _destroyed (unalive: bool)
var is_destroyed = false

@export var speed = 100.0
@onready var path_follow: PathFollow2D = $Path2D/PathFollow2D
@onready var collision: CollisionShape2D = $Path2D/PathFollow2D/EnemyBoatBody/CollisionShape2D
@onready var sprite: Sprite2D = $Path2D/PathFollow2D/EnemyBoatBody/Sprite2D

@export_range(0.0, 1.0) var flickering_freq := 0.25 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	path_follow.progress += speed * delta
	
	if(is_destroyed):
		var spr_flick_float := 0.0
		spr_flick_float += flickering_freq * delta
		var flicks := cos(spr_flick_float * TAU) * 0.25 + 0.75
		if spr_flick_float >= 1.0:
			spr_flick_float -= 1.0
		sprite.self_modulate = Color(1,1,1, 0.7 * flicks)
	elif(not is_destroyed):
		sprite.self_modulate = Color(1,1,1,1)
	pass


func _on_body_entered(body: Node2D) -> void:
	if body as BallObject:
		_destroy_boat()
	pass # Replace with function body.

func _destroy_boat() -> void:
	#print("detected collision debug")
	_destroyed.emit(true)
	is_destroyed = true
	collision.set_deferred("disabled", true)
	#adicionar pontos
	await get_tree().create_timer(1.3).timeout
	
	_respawn_boat()
	pass

func _respawn_boat() -> void:
	collision.set_deferred("disabled", false)
	_destroyed.emit(false)
	is_destroyed = false
	pass
	
