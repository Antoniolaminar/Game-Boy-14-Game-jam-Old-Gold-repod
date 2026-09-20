extends RigidBody2D
@export var rotation_right_value = 0
@export var rotation_left_value = 0
var free_ball = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsejhd time since the previous frame.
func _physics_process(delta: float) -> void:
	#action input do flipper direito
	if (Input.is_action_pressed("Flipper_Action_Right") && free_ball):
		#Action de fazer o flipper levantar com threshold para poder ou nao
		#conduzir o input (segundo elif) @requires rotaion_right_value != null
		if rotation_right_value > 30:
			rotation_right_value += 290 * delta
		elif rotation_right_value <= 30:
			rotation_right_value = 30
	#recolocar o flipper na sua posicao original apos o input
	else:
		if rotation_right_value > 0:
			rotation_right_value -= 290 * delta
		elif rotation_right_value <= 0:
			rotation_right_value = 0
	
	if (Input.is_action_pressed("Flipper_Action_Left") && free_ball):
		if rotation_left_value < -30:
			rotation_left_value -= 290 * delta
		elif rotation_left_value >= -30:
			rotation_left_value = -30
	else:
		if rotation_left_value < 0:
			rotation_left_value += 290 * delta
		elif rotation_left_value >= 0:
			rotation_left_value = 0
	
	$RightFlipper.rotation_degrees = rotation_right_value
	$LeftFlipper.rotation_degrees = rotation_left_value
	pass


#func _s_locked_flippers(locked: bool) -> void:
#	free_ball = locked
#	pass # Replace with function body.
