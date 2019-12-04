extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(1.0), "timeout")
	scene_switcher.increase_acertos()
	get_tree().change_scene("res://scenes/Classico.tscn")

