extends Control

var vladSprite = preload("res://Images/Sprites/officialA.png")
var generalSprite = preload("res://Images/Sprites/General.png")
var valerySprite = preload("res://Images/Sprites/Judge.png")
var petyaSprite = preload("res://Images/Sprites/OfficialB.png")
var glebSprite = preload("res://Images/Sprites/OfficialC.png")

func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state
	

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
	get_node("Folder/BioControl/NPCname").text = "Vlad Vladostovovitch"
	get_node("Folder/BioControl/NPCbio").text = "Vlad came to power after his predecessor died in a mysterious nuclear accident."
	get_node("Folder/BioControl/Photo/ColorRect/NPCimage").set_texture(vladSprite)
	get_node("Folder/BioControl/NPCtitle").text = "Minister of Energy"
	
func _on_GeneralButton_pressed():
	get_node("Folder/BioControl/NPCname").text = "General Aleksi Butunov"
	get_node("Folder/BioControl/NPCbio").text = "A loyal nationalist. Highly admired by his troops. They will follow him to the grave."
	get_node("Folder/BioControl/Photo/ColorRect/NPCimage").set_texture(generalSprite)
	get_node("Folder/BioControl/NPCtitle").text = "Minister of War"
		
func _on_ValeryButton_pressed():
	get_node("Folder/BioControl/NPCname").text = "Valery Unchok"
	get_node("Folder/BioControl/NPCbio").text = "Minister of Justice is a misnomer if ever their was one. His sole responsibility is to run the Secret Police."
	get_node("Folder/BioControl/Photo/ColorRect/NPCimage").set_texture(valerySprite)
	get_node("Folder/BioControl/NPCtitle").text = "Minister of Justice"
	
func _on_PetyaButton_pressed():
	get_node("Folder/BioControl/NPCname").text = "Petya Belov"
	get_node("Folder/BioControl/NPCbio").text = "From a long family of bankers. Rumor has it he has ties to the international banking community."
	get_node("Folder/BioControl/Photo/ColorRect/NPCimage").set_texture(petyaSprite)
	get_node("Folder/BioControl/NPCtitle").text = "Minister of Finance"
	
func _on_GlebButton_pressed():
	get_node("Folder/BioControl/NPCname").text = "Gleb Tarasov"
	get_node("Folder/BioControl/NPCbio").text = "He makes the trains run on time, but is primarily famous for his use of slave labor to build infrastructure."
	get_node("Folder/BioControl/Photo/ColorRect/NPCimage").set_texture(glebSprite)
	get_node("Folder/BioControl/NPCtitle").text = "Minister of Transportation"
