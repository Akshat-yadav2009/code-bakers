extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -800
@onready var postman_2 = $Postman2

"""it is happning  60 fps"""
func _physics_process(delta: float) -> void:
	"""add the gravity to the character"""
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	"""Handle jump"""
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# why y axis because godot the axis works differently
	" Get the input direction and handle the movement/deceleration."
	
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0,12)

	move_and_slide()
	"""for the flipping of character"""
	
	var isLeft=velocity.x<0	
	postman_2.flip_h = isLeft
	
