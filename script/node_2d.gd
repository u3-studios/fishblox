extends Node2D


var fishtypeonhook = str(null)
var fishonhook = null
var speed = 10
@onready var line_2d = $fishingLine
@onready var displayScoreLabel = $score
var points = int(0)
var hasfish = false
@onready var hook = $Hook
var barrel = preload("res://scene/barrel.tscn")
var bootsigmaofohio = preload("res://scene/boot.tscn")
var CommonFish = preload("res://scene/common_fish.tscn")
var goldfish = preload("res://scene/goldenfish.tscn")

@export var gameIsRunning = true
@onready var popupMenu = $Popup

func _ready():
	pass

func _on_timer_timeout():
	if gameIsRunning == false:
		Engine.time_scale = 0
		
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
		bullet_instance.get_node("fish").flip_h = true
		bullet_instance.get_node("fish").position.x = -75
		
	
	if randi_range(0,25) == 1:
		var test = goldfish.instantiate()
		add_child(test)
		
	if randi_range(0,2) == 2:
		var sigmaofohioskibidiohisigmabarrelohiomemeofthesigma = barrel.instantiate()
		add_child(sigmaofohioskibidiohisigmabarrelohiomemeofthesigma)
		
	if randi_range(0,2) == 1:
		var boot = bootsigmaofohio.instantiate()
		add_child(boot)
		
		
		
func addfishtohook(fish, fishtype):
		if hasfish == false:
			fish.ismoving = false
			fishtypeonhook = fishtype
			fish.call_deferred("reparent", hook)
			#area.position.y = 0
			#area.position.x = 0
			fishonhook = fish
			hasfish = true

func _process(delta):
	if gameIsRunning == true:
		var mouse = get_global_mouse_position()
		if mouse.y > 0:
			
			line_2d.points[1].y = mouse.y
			hook.global_position.y = line_2d.points[1].y
			
		
	
func _on_area_2d_area_entered(area):
	var newParent = get_node("Hook")
		
	area = area as Area2D
	if area.is_in_group("fish"):
		if hasfish == false:
			addfishtohook(area,"CommonFish")
			
	if area.is_in_group("goldfish"):
		if hasfish == false:
			addfishtohook(area,"goldfish")
		
		
		
	if area.is_in_group("score"):
		if hasfish == true:
			if fishtypeonhook == str("goldfish"):
				points += 30
			else:
				points += 1
				
			newParent.remove_child(fishonhook)
			hasfish = false
			fishonhook = null
	
	if area.is_in_group("loseGame"):
		print("text")
		area.ismoving = false
		gameIsRunning = false
		popupMenu.visible = true
		
	
	displayScoreLabel.text = str(points)



func _on_audio_stream_player_2d_finished():
	$AudioStreamPlayer2D.play()
