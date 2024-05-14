extends Node3D

var player : CharacterBody3D
var visuals : Node3D

@export var x_sens : float = 0.15
@export var y_sens : float = 0.1

@export var max_rot : float = -60
@export var min_rot : float = 30


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	player = get_node("..")
	visuals = get_node("../Visuals")
	

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		if event.relative:

			var mouse_relative : Vector2 = event.relative
			# rotates the player in horizontal
			player.rotate_y(deg_to_rad(-mouse_relative.x * x_sens))
			# rotate visuals horizontal
			visuals.rotate_y(deg_to_rad(mouse_relative.x * x_sens))

			# rotates camera in vertical
			rotate_x(deg_to_rad(-mouse_relative.y * y_sens))
			# clamps the rotation
			var rad_max_rot : float = deg_to_rad(max_rot)
			var rad_min_rot : float = deg_to_rad(min_rot)

			rotation.x = clamp(rotation.x, rad_max_rot, rad_min_rot)
		
		


