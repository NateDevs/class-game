extends Node2D

const SPEED : float = 30.0
var direction : int = -1

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var death_timer: Timer = $DeathTimer

func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = false
		print("Hit Right")
	
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = true
		print("Hit Left")
		
	position.x += SPEED * direction * delta
	
	


func _on_hurtzone_body_entered(body: Node2D) -> void:
	var player : Player = body as Player
	player.velocity.y = player.JUMP_VELOCITY
	animated_sprite_2d.play("death")
	death_timer.start()


func _on_death_timer_timeout() -> void:
	queue_free()
