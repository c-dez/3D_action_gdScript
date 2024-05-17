extends RayCast3D
# rotation and position controlled by CamMount



func _process(_delta):
	if is_colliding():
		print(get_collider().get_class())
		
	pass


