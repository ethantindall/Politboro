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
func _on_VladButton_pressed():
	selectedData = processJSON(result_json).NPCs.Ministers.A
	get_node("Folder/BioControl/NPCname").text = str(selectedData.Name)
	get_node("Folder/BioControl/NPCbio").text = str(selectedData.Bio)
	get_node("Folder/BioControl/Photo/ColorRect/NPCimage").set_texture(vladSprite)
	get_node("Folder/BioControl/NPCtitle").text = str(selectedData.Title)
	
func _on_GeneralButton_pressed():
	selectedData = processJSON(result_json).NPCs.Ministers.B
	get_node("Folder/BioControl/NPCname").text = str(selectedData.Name)
	get_node("Folder/BioControl/NPCbio").text = str(selectedData.Bio)
	get_node("Folder/BioControl/Photo/ColorRect/NPCimage").set_texture(generalSprite)
	get_node("Folder/BioControl/NPCtitle").text = str(selectedData.Title)
		
func _on_ValeryButton_pressed():
	selectedData = processJSON(result_json).NPCs.Ministers.C
	get_node("Folder/BioControl/NPCname").text = str(selectedData.Name)
	get_node("Folder/BioControl/NPCbio").text = str(selectedData.Bio)
	get_node("Folder/BioControl/Photo/ColorRect/NPCimage").set_texture(valerySprite)
	get_node("Folder/BioControl/NPCtitle").text = str(selectedData.Title)
	
func _on_PetyaButton_pressed():
	selectedData = processJSON(result_json).NPCs.Ministers.D
	get_node("Folder/BioControl/NPCname").text = str(selectedData.Name)
	get_node("Folder/BioControl/NPCbio").text = str(selectedData.Bio)
	get_node("Folder/BioControl/Photo/ColorRect/NPCimage").set_texture(petyaSprite)
	get_node("Folder/BioControl/NPCtitle").text = str(selectedData.Title)
	
func _on_GlebButton_pressed():
	selectedData = processJSON(result_json).NPCs.Ministers.E
	get_node("Folder/BioControl/NPCname").text = str(selectedData.Name)
	get_node("Folder/BioControl/NPCbio").text = str(selectedData.Bio)
	get_node("Folder/BioControl/Photo/ColorRect/NPCimage").set_texture(glebSprite)
	get_node("Folder/BioControl/NPCtitle").text = str(selectedData.Title)


func _on_People_visibility_changed():
	#GET JSON DATA
	var file = File.new()
	file.open("res://GUI/npcs.json", file.READ)
	var text_json = file.get_as_text()
	result_json = JSON.parse(text_json)
	file.close()
	#print(processJSON(result_json).NPCs.Ministers.A.Name)
