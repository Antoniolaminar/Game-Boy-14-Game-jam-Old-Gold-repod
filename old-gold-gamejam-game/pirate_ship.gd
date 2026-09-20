class_name PirateShip
extends Area2D

@onready var path_follow: PathFollow2D = $Path2D/PathFollow2D
@export var speed = 16

signal destroyed(alive: bool)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	path_follow.progress += speed * delta
	pass


func _on_body_entered(body: Node2D) -> void:
	if (body as BallObject):
		#var death_pos = PirateShip.position
		#subir pontos aqui
		
		#elimina a si mesmo quando em collisao com a bola
		destroyed.emit(true)
		
		
	pass # Replace with function body.


func _on_body_exited(_body: Node2D) -> void:
	pass # Replace with function body.
