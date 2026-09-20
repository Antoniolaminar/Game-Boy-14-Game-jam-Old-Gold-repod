class_name Bumper
extends RigidBody2D

## Color for when bumpers get activated.
@export_color_no_alpha var active_color := Color(0.251, 0.251, 0.741, 0.502)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered_left(body: Node) -> void:
	if (body as BallObject):
		bump_visu($LBumperSprite)
		#var current_velocity = Vector2(body.linear_velocity.x,body.linear_velocity.y)
		var bounce_vector_left = Vector2(1300.5,-2200.0)
		body.apply_central_impulse(bounce_vector_left)
	pass # Replace with function body.


func _on_body_entered_right(body: Node) -> void:
	if (body as BallObject):
		bump_visu($RBumperSprite)
		#var current_velocity = Vector2(body.linear_velocity.x,body.linear_velocity.y)
		var bounce_vector_left = Vector2(-1300.5,-2200.0)
		body.apply_central_impulse(bounce_vector_left)
	pass # Replace with function body.
 
func bump_visu(sprite: Sprite2D) -> void:
	sprite.self_modulate = Color.DARK_BLUE
	await get_tree().create_timer(0.1).timeout
	sprite.self_modulate = Color.WHITE
	await get_tree().create_timer(0.5).timeout
	sprite.self_modulate.a = 1.0
	pass
