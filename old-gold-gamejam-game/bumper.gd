class_name Bumper
extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered_left(body: Node) -> void:
	if (body as BallObject):
		var bounce_vector_left = Vector2(700.5,550.0)
		body.apply_central_impulse(bounce_vector_left)
		
		
	pass # Replace with function body.


func _on_body_entered_right(body: Node) -> void:
	if (body as BallObject):
		var bounce_vector_right = Vector2(-700.5,550.0)
		body.apply_central_force(bounce_vector_right)
	pass # Replace with function body.
