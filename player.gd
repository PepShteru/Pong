extends CharacterBody2D

const SPEED = 1000.0
@export var side = 'pl'

func _physics_process(delta):
	
	var direction 
	
	if side == 'pl':
		direction = get_axis(KEY_W, KEY_S)
	else:
		direction = get_axis(KEY_I, KEY_K)
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	clamp_position()
	
func get_axis(up, down):
	if Input.is_key_pressed(up): return -1
	elif Input.is_key_pressed(down): return 1

func clamp_position():
	var screen_size = get_viewport_rect().size
	position.y = clamp(position.y, 0, screen_size.y)

func _on_area_2d_body_entered(body):
	body.direction.x *= -1.1
	Main.side = side

