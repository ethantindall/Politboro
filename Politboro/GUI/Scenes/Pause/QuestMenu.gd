extends Control

var result_json
var selectedData
onready var vbox = 	get_node("QuestsScrollContainer/VBoxContainer")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_Quest1_pressed():
	pass

func _on_Quests_visibility_changed():
	#GET JSON DATA
	var file = File.new()
	file.open("res://GUI/quests.json", file.READ)
	var text_json = file.get_as_text()
	result_json = JSON.parse(text_json)
	print(processJSON(result_json).Quests.Tutorial)
	file.close()

func processJSON(rj):
	if rj.error == OK:  # If parse OK
		var data = rj.result
		return data
	else:  # If parse has errors
		print("Error: ", rj.error)
		print("Error Line: ", rj.error_line)
		print("Error String: ", rj.error_string)
