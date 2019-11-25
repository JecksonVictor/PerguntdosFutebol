extends Node

var categoria = null

func _ready():
	pass # Replace with function body.
	
func change_scene(next_categoria):
	categoria = next_categoria
	get_tree().change_scene("res://scenes/Perguntas.tscn")
	
func get_categoria():
	return categoria
