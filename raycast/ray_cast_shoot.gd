extends RayCast3D
# rotation and position controlled by CamMount

var timer: float = 0.3
var internal_timer: float = 0



func _physics_process(_delta):
	# if get_collider() is CharacterBody3D:
	# 	if get_collider().has_method("change_size") and Input.is_action_just_pressed("fire1"):
	# 		get_collider().change_size()
		
	shoot(_delta)		
		


func shoot(_delta):
	if Input.is_action_just_pressed("fire1") and internal_timer == 0:
		internal_timer = timer

	if internal_timer > 0:
		internal_timer -= _delta
		if get_collider() is CharacterBody3D:
			get_collider().change_size()
	elif internal_timer < 0:
		internal_timer = 0

		# cuando disparo quiero que
		# durante timer segundos
		# obtenga el collider
		# e invoque sus methodos


		