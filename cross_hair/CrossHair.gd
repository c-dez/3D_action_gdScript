extends TextureRect
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport().get_size()/2
	position = screen_size
	pass # Replace with function body.


