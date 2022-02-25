extends Control

var result_json = {}
var selectedData
var buttonDict = {}

onready var vbox = 	get_node("QuestsScrollContainer/VBoxContainer")

# Called when the node enters the scene tree for the first time.
func _ready():
	#GET JSON DATA
	var file = File.new()
	file.open("res://GUI/quests.json", file.READ)
	var text_json = file.get_as_text()
	result_json = parse_json(text_json)
	file.close()
	
func _on_Quests_visibility_changed():
	var buttonCounter = 0
	for q in result_json.Quests:
		get_node("QuestsScrollContainer/VBoxContainer/Button" + str(buttonCounter)).text = result_json.Quests[q].Title
		buttonCounter += 1
	

func validateJSON(rj):
	if rj.error == OK:  # If parse OK
		var data = rj.result
		return data
	else:  # If parse has errors
		print("Error: ", rj.error)
		print("Error Line: ", rj.error_line)
		print("Error String: ", rj.error_string)




func _on_Button0_pressed():
	get_node("Folder/VBoxContainer/QuestName").text = result_json.Quests.Q0.Title
	get_node("Folder/VBoxContainer/QuestCompletionState").text = "Completed: " + result_json.Quests.Q0.Completed
	get_node("Folder/VBoxContainer/QuestDescription").text = result_json.Quests.Q0.Description
	
func _on_Button1_pressed():
	get_node("Folder/VBoxContainer/QuestName").text = result_json.Quests.Q1.Title
	get_node("Folder/VBoxContainer/QuestCompletionState").text = "Completed: " + result_json.Quests.Q1.Completed
	get_node("Folder/VBoxContainer/QuestDescription").text = result_json.Quests.Q1.Description
	
func _on_Button2_pressed():
	get_node("Folder/VBoxContainer/QuestName").text = result_json.Quests.Q2.Title
	get_node("Folder/VBoxContainer/QuestCompletionState").text = "Completed: " + result_json.Quests.Q2.Completed
	get_node("Folder/VBoxContainer/QuestDescription").text = result_json.Quests.Q2.Description
	
func _on_Button3_pressed():
	get_node("Folder/VBoxContainer/QuestName").text = result_json.Quests.Q3.Title
	get_node("Folder/VBoxContainer/QuestCompletionState").text = "Completed: " + result_json.Quests.Q3.Completed
	get_node("Folder/VBoxContainer/QuestDescription").text = result_json.Quests.Q3.Description
	
func _on_Button4_pressed():
	get_node("Folder/VBoxContainer/QuestName").text = result_json.Quests.Q4.Title
	get_node("Folder/VBoxContainer/QuestCompletionState").text = "Completed: " + result_json.Quests.Q4.Completed
	get_node("Folder/VBoxContainer/QuestDescription").text = result_json.Quests.Q4.Description
