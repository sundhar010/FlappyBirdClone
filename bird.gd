extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const ROTATION_SPEED = 2

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	if is_on_floor():
		die()
	move_and_slide()
	rotate_bird()

func rotate_bird():
	if velocity.y > 0 and rad_to_deg(rotation) < 50:
		rotation += ROTATION_SPEED * deg_to_rad(1)
	elif velocity.y < 0 and rad_to_deg(rotation) > -50:
		rotation -= ROTATION_SPEED * deg_to_rad(1)

func die():
	print("Die")
