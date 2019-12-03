extends Node2D

var bgcolor = ["40E0D0", "008000", "FFA500", "002600", "6666FF", "CCCC00", "FF69B4", "800080", "CC0000"]
var buttons = []
var correct_answers = []

func _ready():
	$HTTPRequest.request("http://testes.futebolinterativo.com/api/pergunta.php?token=x&id_categoria="+str(scene_switcher.get_categoria()))

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())

	$Panel.set_frame_color(bgcolor[int(json.result.id_categoria)-1])
	$Panel/Titulo/Pergunta.set_text(arrume(str(json.result.question)))
	
	$Panel/autor.set_text("Criada por " + json.result.author)
	
	for alternativa in json.result.answers:
		var button = Button.new()
		
		button.set_text(alternativa.text)
		button.align(Button.ALIGN_LEFT)
		button.set_margins_preset(Control.PRESET_CENTER_TOP,0,buttons.size()*10)
		button.set_custom_minimum_size(Vector2(get_viewport().size.x/2, 0))
		
		button.connect("pressed", self, "_on_Button_"+str(buttons.size()+1)+"_pressed")
		
		buttons.append(button)
		
		if (alternativa.correct == true):
			correct_answers.append(buttons.size()-1)
		
		$Panel/Alternativas/VBoxContainer.add_child(button)

func arrume(strig):
	var line = ""
	var c = 0
	for i in str(strig):
		if (c == 30):
			line += "\n"
			c = 0
		line = line + i
		c = c + 1
	return line


func _on_Button_1_pressed():
	if (correct_answers[0] == 0):
		get_tree().change_scene("res://scenes/Acertou.tscn")
	else:
		get_tree().change_scene("res://scenes/Errou.tscn")

func _on_Button_2_pressed():
	if (correct_answers[0] == 1):
		get_tree().change_scene("res://scenes/Acertou.tscn")
	else:
		get_tree().change_scene("res://scenes/Errou.tscn")

func _on_Button_3_pressed():
	if (correct_answers[0] == 2):
		get_tree().change_scene("res://scenes/Acertou.tscn")
	else:
		get_tree().change_scene("res://scenes/Errou.tscn")

func _on_Button_4_pressed():
	if (correct_answers[0] == 3):
		get_tree().change_scene("res://scenes/Acertou.tscn")
	else:
		get_tree().change_scene("res://scenes/Errou.tscn")
