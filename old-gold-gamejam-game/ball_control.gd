extends CharacterBody2D
@export var initial_velocity := Vector2.ZERO

func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta
	move_and_slide()


func resolve_collisions() -> void:
	pass
