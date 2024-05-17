extends Node3D


var player : CharacterBody3D
var visuals : Node3D
var spring_arm: SpringArm3D
var cross_hair: TextureRect

@export var x_sens : float = 0.1
@export var y_sens : float = 0.12
# referencias a los valores de engine
var x_sens_ref: float
var y_sens_ref: float

@export var max_rot : float = -60
@export var min_rot : float = 60

@export var spring_distance: float = 4





func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	player = get_node("..")
	visuals = get_node("../Visuals")
	spring_arm = get_child(1, true)
	cross_hair = get_node("CrossHair")

	x_sens_ref = x_sens
	y_sens_ref = y_sens

func _physics_process(_delta):
	draw_gun()
	
	

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		if event.relative:

			var mouse_relative : Vector2 = event.relative
			# rotates the player in horizontal
			player.rotate_y(deg_to_rad(-mouse_relative.x * x_sens_ref))
			# rotate visuals horizontal
			visuals.rotate_y(deg_to_rad(mouse_relative.x * x_sens_ref))

			# rotates camera in vertical
			rotate_x(deg_to_rad(-mouse_relative.y * y_sens_ref))
			# clamps the rotation
			var rad_max_rot : float = deg_to_rad(max_rot)
			var rad_min_rot : float = deg_to_rad(min_rot)

			rotation.x = clamp(rotation.x, rad_max_rot, rad_min_rot)
		
func draw_gun()-> void:
	if Input.is_action_pressed("fire2"):

		# sensibilidad de el mouse / 2
		x_sens_ref = x_sens /2
		y_sens_ref = y_sens /2

		cross_hair.visible = true

		# camara se mueve a fps/ pocicion de CamMount node, por que es el nodo
		# que contiene a spring_arm
		spring_arm.spring_length = 0
	else:
		# regresa los valores a default
		x_sens_ref = x_sens
		y_sens_ref = y_sens
		spring_arm.spring_length = spring_distance

		cross_hair.visible = false


