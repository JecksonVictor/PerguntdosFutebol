extends Node2D

var bgcolor = ["40E0D0", "008000", "FFA500", "002600", "6666FF", "CCCC00", "FF69B4", "800080", "CC0000"]

func _ready():
	$HTTPRequest.request("http://testes.futebolinterativo.com/api/pergunta.php?token=x&id_categoria="+str(scene_switcher.get_categoria()))

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	$Panel.set_frame_color(bgcolor[3])#int(json.result.id)-1])
	$Panel/CenterContainer/Pergunta.set_text(json.result.question)