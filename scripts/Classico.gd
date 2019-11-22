extends Node2D

var bgcolor = ["40E0D0", "008000", "FFA500", "002600", "6666FF", "CCCC00", "FF69B4", "800080", "CC0000"]

func _ready():
	$HTTPRequest.request("http://testes.futebolinterativo.com/api/categoria.php?token=x")

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	$Panel.set_frame_color(bgcolor[int(json.result.id)-1])
	$Panel/CenterContainer/Categoria.set_text(json.result.titulo)


