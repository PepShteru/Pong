extends CharacterBody2D

const BASE_SPEED = 300.0
var current_speed = BASE_SPEED
var direction = Vector2.ZERO

func _ready():
	direction.y = [-1, 1].pick_random()
	direction.x = [-1, 1].pick_random()

func _physics_process(delta):
	if direction:
		velocity = direction * current_speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, current_speed)

	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.is_in_group("pl"):
		# Increase speed by 50
		current_speed += 1000
		# Change direction
		direction = -direction
