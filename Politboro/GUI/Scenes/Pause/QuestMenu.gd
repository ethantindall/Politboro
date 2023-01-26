extends Control


var selectedData
var buttonDict = {}
var result_json = {}

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
		var x = get_node("QuestsScrollContainer/VBoxContainer/Button" + str(buttonCounter))
		if result_json.Quests[q].Active == "True":
			x.text = result_json.Quests[q].Title
			x.visible = true
			#populateQuestDeets(x)
		else:
			x.visible = false
		buttonCounter += 1
"""
func validateJSON(rj):
	if rj.error == OK:  # If parse OK
		var data = rj.result
		return data
	else:  # If parse has errors
		print("Error: ", rj.error)
		print("Error Line: ", rj.error_line)
		print("Error String: ", rj.error_string)
"""

#func populateQuestDeets(q):
	
	
func populateData(q):
	if q.Active == "True":
		get_node("Folder/VBoxContainer/QuestName").text = q.Title
		get_node("Folder/VBoxContainer/QuestCompletionState").text = "Completed: " + q.Completed
		get_node("Folder/VBoxContainer/QuestDescription").text = q.Description
	

func _on_Button0_pressed():
	populateData(result_json.Quests.Q0)

func _on_Button1_pressed():
	populateData(result_json.Quests.Q1)
	
func _on_Button2_pressed():
	populateData(result_json.Quests.Q2)
		
func _on_Button3_pressed():
	populateData(result_json.Quests.Q3)
	
func _on_Button4_pressed():
	populateData(result_json.Quests.Q4)


func _on_Button5_pressed():
	pass # Replace with function body.


func _on_Button6_pressed():
	pass # Replace with function body.


func _on_Button8_pressed():
	pass # Replace with function body.


func _on_Button7_pressed():
	pass # Replace with function body.


func _on_Button9_pressed():
	pass # Replace with function body.


func _on_Button10_pressed():
	pass # Replace with function body.
