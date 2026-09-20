class_name PirateShip
extends Area2D

@onready var path_follow: PathFollow2D = $Path2D/PathFollow2D
@export var speed = 16
@export_range(0.0, 1.0) var pulse_freq := 0.25
@export var sprite : Sprite2D
@export var collision :CollisionShape2D
var got_destroyed = false

var sprite_progress := 0.0
signal _destroyed(alive: bool)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	path_follow.progress += speed * delta
	if (got_destroyed):
		#Fazer sinal visual
		sprite_progress += pulse_freq * delta
		var flick := cos(sprite_progress * TAU) * 0.25 +0.75
		if sprite_progress >= 1.0:
			sprite_progress -= 1.0
		sprite.self_modulate = Color(1,1,1,
			0.5 * flick
		)
	pass

func _respawn_ship() -> void:
	collision.set_deferred("disabled", false)
	_destroyed.emit(false)
	got_destroyed = false
	pass

func _on_body_entered(body: Node2D) -> void:
	if (body as BallObject):
		print("touch ball")
		_destroyed.emit(true)
		got_destroyed = true
		collision.set_deferred("disabled", true)
		#adicionar pontos depois
		
		await get_tree().create_timer(6.0).timeout
		
		_respawn_ship()
	pass # Replace with function body.
