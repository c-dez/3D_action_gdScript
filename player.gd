extends CharacterBody3D

var visuals : Node3D
var speed : float = 5.0
var jump_velocity : float = 4.5
var input_dir : Vector2 = Vector2.ZERO
var gravity : float = ProjectSettings.get_setting("physics/3d/default_gravity")

@export_category("dodge_controls")
@export var count_time: float = 0.5
var count_time_internal: float = 0
@export var dodge_mult: float = 4


func _ready():
	visuals = get_node("Visuals")
	

func _physics_process(delta):
	get_input()
	rotate_visuals_to_move_direction()
	apply_gravity(delta)
	jump()
	player_move()

	dodge_logic(delta)
	


	move_and_slide()
pass

func dodge_logic(_delta):
	if Input.is_action_just_pressed("fire1"):
		count_time_internal = count_time
		
	if count_time_internal > 0:
		# dodge logic
		if input_dir != Vector2.ZERO:
			velocity.x *= dodge_mult
			velocity.z *= dodge_mult
		count_time_internal -= _delta 
		print(count_time_internal)
	elif count_time_internal < 0:
		count_time_internal = 0


func rotate_visuals_to_move_direction():
	if input_dir !=  Vector2.ZERO:

		# rota visuals hacia el angulo de vector2 input_dir
		# y ese angulo lo suaviza con weight de .2
		var weight : float = 0.2
		visuals.rotation.y = lerp_angle(
			visuals.rotation.y, atan2(-input_dir.x, -input_dir.y), weight)
	pass

func get_input():
	input_dir = Input.get_vector("left", "right", "up", "down")


func jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		self.velocity.y = jump_velocity

func player_move():
	var direction : Vector3 = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

func apply_gravity(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta