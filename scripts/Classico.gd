extends Node2D

var categories = ["Futebol Feminino","Análise de Desempenho","Tática","Preparação Física","Psicologia","Futebol de Base","Marketing","Gestão","História"]
var bgcolor = ["ff69b4","008000","FFA500","002600","6666ff","cccc00","800080","cc0000","40E0D0"]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var category = (randi() % categories.size())
	var background =  get_node("Panel")
	var label_Categoria = get_node("Panel/CenterContainer/Categoria")
	label_Categoria.set_text(categories[category])
	background.set_frame_color(bgcolor[category])
	