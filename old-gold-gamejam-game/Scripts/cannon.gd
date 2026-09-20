class_name Cannon
extends Area2D

##usar variavel para definir o angulo do in_cannon, qtrue esta na esquerda e ja sabemos o angulo
#@export var _c_left_side : bool
#var lets_turn := false

#func _turn_cannon() -> void:
#	lets_turn = true
#	pass

#func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
#	if(lets_turn and _c_left_side):
#		var cannon_angle = TAU * 80
#		
#	elif(lets_turn and (not _c_left_side)):
#		print()
#	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
