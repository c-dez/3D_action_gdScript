extends Node3D

var player : CharacterBody3D
var visuals : Node3D
@export var xSens : float = 0.1




func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	player = get_node("..")
	visuals = get_node("../Visuals")
	

func _physics_process(_delta):
	
	pass


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		if event.relative:

			var mouseRelative = event.relative
			# rotates the player in horizontal
			player.rotate_y(deg_to_rad(-mouseRelative.x * xSens))

			# rotates camera in vertical
			rotate_x(deg_to_rad(-mouseRelative.y * xSens))
			# clamps the rotation
			var maxRot = -60
			var minRot = 30
			rotation.x = clamp(rotation.x, deg_to_rad(maxRot), deg_to_rad(minRot))
		
			# rotate visuals
			visuals.rotate_y(deg_to_rad(mouseRelative.x * xSens))
		


