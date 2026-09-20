class_name BallObject
extends RigidBody2D

var spawn_vector = Vector2(80, 40)
var dead_ball = false

var entry_velocity = 0.0

func _physics_process(_delta: float) -> void:
	pass

func _ready() -> void:
	pass
	
func _process(_delta: float) -> void:
	pass

func _on_death_zone_body_exited(body: Node2D) -> void:
	#fazer animacao depois so respawnar por enquanto
	if (body as BallObject):
		dead_ball = true

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if (dead_ball):
		#Respawn a ball that got holed with random impulse on respawn
		var x_impulse = randf_range(0, 6)
		if (x_impulse <= 3):
			x_impulse = -25.0
		else: x_impulse = 28.0
		var respawn_accel = Vector2(x_impulse,randf_range(20.0, 40.5))
		state.linear_velocity = respawn_accel
		state.transform = Transform2D(0.0, spawn_vector)
		state.angular_velocity = 0.0
		dead_ball = false
		
		
