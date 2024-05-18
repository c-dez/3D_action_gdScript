extends RayCast3D
# rotation and position controlled by CamMount

var timer: float = 0.3
var temporal_reference: CharacterBody3D
var internal_timer: float = 0.0
# test
var gun_damage: int = 1


func _process(_delta):	
	shoot(_delta)		
		

# testing
func shoot(_delta)-> void:
	if Input.is_action_just_pressed("fire1") and internal_timer == 0.0:
		internal_timer = timer
	if internal_timer > 0:
		internal_timer -= _delta
		if get_collider() is CharacterBody3D:
			temporal_reference = get_collider()
			
	elif internal_timer <= 0:
		internal_timer = 0
		temporal_reference = null
		
	if temporal_reference != null and Input.is_action_just_pressed("fire1"):
		temporal_reference.test_shoot(gun_damage)
		