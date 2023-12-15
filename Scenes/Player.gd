extends CharacterBody3D


const WALK_SPEED = 5.0
const RUN_SPEED = 8.0
const JUMP_VELOCITY = 4.5

var speed = WALK_SPEED

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var camera: Camera3D = $Camera

var move_input: Vector2 = Vector2.ZERO

var motion: Vector3 = Vector3.ZERO

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event):
	var mouse = event as InputEventMouseMotion
	if mouse:
		var mouse_delta = mouse.relative
		rotate_y(0.003 * -mouse_delta.x)
		camera.rotate_x(0.003 * -mouse_delta.y)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	speed = RUN_SPEED if Input.is_action_pressed("run") else WALK_SPEED
	
	move_input = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	
	motion = transform.basis * Vector3(move_input.x, 0, move_input.y) * speed
	
	if motion:
		velocity.x = motion.x
		velocity.z = motion.z
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()