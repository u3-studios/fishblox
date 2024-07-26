extends Area2D

@onready var goldfishimagesigma = $Sprite2D
var direction = false
@export var ismoving = true

func _ready():
	global_position.y = randi_range(300, 620)
	if randi_range(0, 1) == 1:
		global_position.x = 600
	else:
		global_position.x = -600
		goldfishimagesigma.flip_h = true
		direction = true

func _physics_process(delta):
	if ismoving == true:
		if direction != true:
			global_position.x -= 10
		else:
			global_position.x += 10
