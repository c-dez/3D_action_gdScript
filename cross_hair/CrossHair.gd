extends TextureRect
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport().get_size()/2
	position.x = screen_size.x -20
	position.y = screen_size.y -20

	pass # Replace with function body.


