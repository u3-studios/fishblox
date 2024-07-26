extends Node2D

var speed = 10
@onready var line_2d = $fishingLine
@onready var displayScoreLabel = $score
var points = int(0)

@onready var area_2d = $Area2D
@onready var label = $Timer/Label
@onready var timer = $Timer
var CommonFish = preload("res://golden_fish.tscn")

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_timer_timeout():
	if randi_range(0,1) == 1:
		var bullet_instance = CommonFish.instantiate()
		bullet_instance.global_position.x = $Sprite2D/spawner.global_position.x
		bullet_instance.global_position.y = randi_range(196, 500)
		add_child(bullet_instance)
		$Sprite2D/spawner/Timer.start()
	else:
		var bullet_instance = CommonFish.instantiate()
		bullet_instance.direction = true
		bullet_instance.global_position.x = -$Sprite2D/spawner.global_position.x
		bullet_instance.global_position.y = randi_range(196, 500)
		add_child(bullet_instance)
		$Sprite2D/spawner/Timer.start()
