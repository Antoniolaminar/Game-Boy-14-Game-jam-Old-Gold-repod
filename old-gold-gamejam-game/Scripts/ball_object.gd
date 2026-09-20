class_name BallObject
extends RigidBody2D

var num_of_lifes := 5

var spawn_vector = Vector2(80, 40)
var dead_ball = false
var in_cannon = false

#signal _locked_flippers (locked: bool)
#signal _cannon_turn_now(value: bool)

func _physics_process(_delta: float) -> void:
	pass

func _ready() -> void:
	pass
	
func _process(_delta: float) -> void:
	if(num_of_lifes <= 0):
		Main._load_level("res://main_menu.tscn")
	pass

#func _entered_cannon_zone(body: Node2D) -> void:
#	if(body as BallObject):
#		in_cannon = true

func _write_number_of_lifes() -> void:
	var num_of_lifes_st := str(num_of_lifes)
	$PlayerLifes/Label.set_text("LIFES:"+num_of_lifes_st)

func _on_death_zone_body_exited(body: Node2D) -> void:
	#fazer animacao depois so respawnar por enquanto
	if (body as BallObject):
		num_of_lifes -= 1
		_write_number_of_lifes()
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
	
	#if (in_cannon):
		#Modo Canhao vamos remover a bola temporariamente e retornala com
		# o input sobreposto de A para lançar na direção em que o canhao estaria apontando
		
		#colocar bola em um lugar seguro (remover da cena da null instance)
	#	state.linear_velocity = Vector2.ZERO
	#	state.transform = Transform2D(25.0, Vector2.ZERO)
	#	state.angular_velocity = 0.0
		
	#	in_cannon = false
		

#func _on_cannon_body_entered(body: Node2D) -> void:
#	if (body as BallObject):
#		in_cannon = true
#		_locked_flippers.emit(false)
#	pass # Replace with function body.
