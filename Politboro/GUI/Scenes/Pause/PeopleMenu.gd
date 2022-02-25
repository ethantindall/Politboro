extends Control

var result_json
var selectedData

var vladSprite = preload("res://Images/Sprites/officialA.png")
var generalSprite = preload("res://Images/Sprites/General.png")
var valerySprite = preload("res://Images/Sprites/Judge.png")
var petyaSprite = preload("res://Images/Sprites/OfficialB.png")
var glebSprite = preload("res://Images/Sprites/OfficialC.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func processJSON(rj):
	if rj.error == OK:  # If parse OK
		var data = rj.result
		return data
	else:  # If parse has errors
		print("Error: ", rj.error)
		print("Error Line: ", rj.error_line)
		print("Error String: ", rj.error_string)

#Level2
func populateData(selectedData, sprite):
	get_node("Folder/BioControl/VBoxContainer/NPCname").text = str(selectedData.Name)
	get_node("Folder/BioControl/VBoxContainer/NPCbio").text = str(selectedData.Bio)
	get_node("Folder/BioControl/VBoxContainer/NPCtitle").text = str(selectedData.Title)
	get_node("Folder/BioControl/Photo/ColorRect/NPCimage").set_texture(sprite)
	get_node("Folder/BioControl/VBoxContainer/NPCfear").text = "Fear of You: " + str(selectedData.Fear) + "%"
	get_node("Folder/BioControl/VBoxContainer/NPChatred").text ="Hatred of You: " + str(selectedData.Hatred) + "%"
	get_node("Folder/BioControl/VBoxContainer/NPCloyalty").text = "Loyalty to You: " + str(selectedData.Loyalty) + "%"
	
func _on_VladButton_pressed():
	populateData(processJSON(result_json).NPCs.Ministers.A, vladSprite)
	
func _on_GeneralButton_pressed():
	populateData(processJSON(result_json).NPCs.Ministers.B,generalSprite)
		
func _on_ValeryButton_pressed():

	populateData(processJSON(result_json).NPCs.Ministers.C, valerySprite)
		
func _on_PetyaButton_pressed():
	populateData(processJSON(result_json).NPCs.Ministers.D, petyaSprite)
	
func _on_GlebButton_pressed():
	populateData(processJSON(result_json).NPCs.Ministers.E, glebSprite)

func _on_People_visibility_changed():
	#GET JSON DATA
	var file = File.new()
	file.open("res://GUI/npcs.json", file.READ)
	var text_json = file.get_as_text()
	result_json = JSON.parse(text_json)
	file.close()
	#print(processJSON(result_json).NPCs.Ministers.A.Name)
