extends Button

func _ready():
	pass # Replace with function body.

func _on_btnModoClassico_pressed():
	get_tree().change_scene("res://scenes/Classico.tscn")
