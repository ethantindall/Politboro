extends Control

var result_json
var selectedData



# Called when the node enters the scene tree for the first time.
func _ready():
	pass

#Level2
func populateData(sd, sprite):
	get_node("Folder/BioControl/NPCname").text = str(sd.Name)
	get_node("Folder/BioControl/NPCbio").text = str(sd.Bio)
	get_node("Folder/BioControl/NPCtitle").text = str(sd.Title)
	get_node("Folder/BioControl/Photo/ColorRect/NPCimage").set_texture(sprite)
	get_node("Folder/BioControl/NPCfear").text = "Fear of You: " + str(sd.Fear) + "%"
	get_node("Folder/BioControl/NPChatred").text ="Hatred of You: " + str(sd.Hatred) + "%"
	get_node("Folder/BioControl/NPCloyalty").text = "Loyalty to You: " + str(sd.Loyalty) + "%"
	
func _on_VladButton_pressed():
	populateData(result_json.NPCs.Ministers.A, load(result_json.NPCs.Ministers.A.Sprite))
	
func _on_GeneralButton_pressed():
	populateData(result_json.NPCs.Ministers.B,load(result_json.NPCs.Ministers.B.Sprite))
		
func _on_ValeryButton_pressed():
	populateData(result_json.NPCs.Ministers.C,load(result_json.NPCs.Ministers.C.Sprite))
		
func _on_PetyaButton_pressed():
	populateData(result_json.NPCs.Ministers.D,load(result_json.NPCs.Ministers.D.Sprite))
	
func _on_GlebButton_pressed():
	populateData(result_json.NPCs.Ministers.E,load(result_json.NPCs.Ministers.E.Sprite))
		
func _on_People_visibility_changed():
	#GET JSON DATA
	var file = FileAccess.open("res://GUI/npcs.json",FileAccess.READ)
	var text_json = file.get_as_text()
	var test_json_conv = JSON.new()
	test_json_conv.parse(text_json)
	result_json = test_json_conv.get_data()
	file.close()
	print(result_json.NPCs.Ministers.A.Name)
