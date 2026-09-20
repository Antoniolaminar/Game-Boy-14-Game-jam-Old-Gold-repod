class_name Bumper
extends RigidBody2D

@export var hitbox_area_left : CollisionShape2D
@export var hitbox_area_right : CollisionShape2D

# Makes so the ball receives bounce from bumpers upon hitbox contact
func resolve_hitboxes() -> void:
	pass
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
