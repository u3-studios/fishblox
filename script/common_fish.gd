extends CharacterBody2D

@export var direction = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if direction == false:
		global_position.x -= 10
	else:
		global_position.x += 10
