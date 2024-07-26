extends Area2D

@onready var line = $fishingline
@onready var fish = $fish
@onready var hitbox = $fishhitbox
@export var direction = false
@export var ismoving = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if ismoving == true:
		if direction == false:
			global_position.x -= 10
		else:
			global_position.x += 10
			
		
