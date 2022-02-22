extends Control

var vladSprite = preload("res://Images/Sprites/officialA.png")
var generalSprite = preload("res://Images/Sprites/General.png")
var valerySprite = preload("res://Images/Sprites/Judge.png")
var petyaSprite = preload("res://Images/Sprites/OfficialB.png")
var glebSprite = preload("res://Images/Sprites/OfficialC.png")
var result_json

func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state
		
		#GET JSON DATA
		var file = File.new()
		file.open("res://GUI/npcs.json", file.READ)
		var text_json = file.get_as_text()
		result_json = JSON.parse(text_json)
		#print(processJSON(result_json).NPCs.Ministers.A.Name)

		

func processJSON(rj):
	if rj.error == OK:  # If parse OK
		var data = result_json.result
		return data
	else:  # If parse has errors
		print("Error: ", rj.error)
		print("Error Line: ", rj.error_line)
		print("Error String: ", rj.error_string)

#Level1
func _on_PeopleButton_pressed():
	get_node("PeopleScrollContainer").visible = true
	get_node("QuestsScrollContainer").visible = false
	get_node("ItemsScrollContainer").visible = false
	get_node("Folder/BioControl").visible = true
	
func _on_QuestsButton_pressed():
	get_node("PeopleScrollContainer").visible = false
	get_node("QuestsScrollContainer").visible = true
	get_node("ItemsScrollContainer").visible = false
	get_node("Folder/BioControl").visible = false
	
func _on_ItemsButton_pressed():
	get_node("PeopleScrollContainer").visible = false
	get_node("QuestsScrollContainer").visible = false
	get_node("ItemsScrollContainer").visible = true
	get_node("Folder/BioControl").visible = false
	
#Level2
func _on_VladButton_pressed():
	get_node("Folder/BioControl/NPCname").text = str(processJSON(result_json).NPCs.Ministers.A.Name)
	get_node("Folder/BioControl/NPCbio").text = str(processJSON(result_json).NPCs.Ministers.A.Bio)
	get_node("Folder/BioControl/Photo/ColorRect/NPCimage").set_texture(vladSprite)
	get_node("Folder/BioControl/NPCtitle").text = str(processJSON(result_json).NPCs.Ministers.A.Title)

	
func _on_GeneralButton_pressed():
	get_node("Folder/BioControl/NPCname").text = str(processJSON(result_json).NPCs.Ministers.B.Name)
	get_node("Folder/BioControl/NPCbio").text = str(processJSON(result_json).NPCs.Ministers.B.Bio)
	get_node("Folder/BioControl/Photo/ColorRect/NPCimage").set_texture(generalSprite)
	get_node("Folder/BioControl/NPCtitle").text = str(processJSON(result_json).NPCs.Ministers.B.Title)
		
func _on_ValeryButton_pressed():
	get_node("Folder/BioControl/NPCname").text = str(processJSON(result_json).NPCs.Ministers.C.Name)
	get_node("Folder/BioControl/NPCbio").text = str(processJSON(result_json).NPCs.Ministers.C.Bio)
	get_node("Folder/BioControl/Photo/ColorRect/NPCimage").set_texture(valerySprite)
	get_node("Folder/BioControl/NPCtitle").text = str(processJSON(result_json).NPCs.Ministers.C.Title)
	
func _on_PetyaButton_pressed():
	get_node("Folder/BioControl/NPCname").text = str(processJSON(result_json).NPCs.Ministers.D.Name)
	get_node("Folder/BioControl/NPCbio").text = str(processJSON(result_json).NPCs.Ministers.D.Bio)
	get_node("Folder/BioControl/Photo/ColorRect/NPCimage").set_texture(petyaSprite)
	get_node("Folder/BioControl/NPCtitle").text = str(processJSON(result_json).NPCs.Ministers.D.Title)
	
func _on_GlebButton_pressed():
	get_node("Folder/BioControl/NPCname").text = str(processJSON(result_json).NPCs.Ministers.E.Name)
	get_node("Folder/BioControl/NPCbio").text = str(processJSON(result_json).NPCs.Ministers.E.Bio)
	get_node("Folder/BioControl/Photo/ColorRect/NPCimage").set_texture(glebSprite)
	get_node("Folder/BioControl/NPCtitle").text = str(processJSON(result_json).NPCs.Ministers.E.Title)
