extends Node

var categoria = null
var acertos = 0
var jogadas = []

func _ready():
	pass # Replace with function body.
	
func change_scene(next_categoria):
	categoria = next_categoria
	get_tree().change_scene("res://scenes/Perguntas.tscn")
	
func get_categoria():
	return categoria
	
func get_acertos():
	return acertos
	
func increase_acertos():
	acertos = acertos + 1

func set_endgame():
	jogadas.append(acertos)
	jogadas.sort()
	acertos = 0	

func get_rank():
	var line = "Ranking" + "\n" + "\n"
	var i = jogadas.size() - 1
	var m = 10
	while (i >= 0):
		line += "Você: " + str(jogadas[i]) + "\n"
		i = i - 1
		
		if (m == 1):
			break
		else:
			m = m -1
	return line