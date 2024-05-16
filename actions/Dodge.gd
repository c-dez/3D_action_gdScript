extends Node
class_name Dodge

# @export var dodge_time_count_down : float = 0.5



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# cuenta regresiva en _physics
# func dodge
# poddria hacer esto con signals?


func dodge_timer(_delta, count_time: float):
	if count_time > 0:
		# dodge logic
		print(count_time)
		count_time -= _delta 
	if count_time < 0:
		count_time = 0