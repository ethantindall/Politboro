extends Control

var result_json
var selectedData
var button_theme = preload("res://GUI/themes/people_menu_button_theme.tres")



# Called when the node enters the scene tree for the first time.
func _ready():
	#GET JSON DATA
	var file = FileAccess.open("res://GUI/npcs.json",FileAccess.READ)
	var text_json = file.get_as_text()
	var test_json_conv = JSON.new()
	test_json_conv.parse(text_json)
	result_json = test_json_conv.get_data()
	file.close()
	
	#PROVIDE DATA TO THE BUTTONS
	update_npc_buttons()



func update_npc_buttons():
	for npc in result_json.Ministers:
		var new_btn = Button.new()
		new_btn.text = npc.Name
		#new_btn.add_theme_font_size_override("font_size", 100)
		new_btn.pressed.connect(func(): show_npc_data(npc))
		#new_btn.size.x = get_parent().size.x
		$ColorRect/MarginContainer/HBoxContainer/mcLeft/ScrollContainer/VBoxContainer.add_child(new_btn)


	
func show_npc_data(npc):
	$ColorRect/MarginContainer/HBoxContainer/mcRight/Folder/NPCname.text = str(npc.Name)
	$ColorRect/MarginContainer/HBoxContainer/mcRight/Folder/NPCbio.text = str(npc.Bio)
	$ColorRect/MarginContainer/HBoxContainer/mcRight/Folder/NPCtitle.text = str(npc.Title)
	$ColorRect/MarginContainer/HBoxContainer/mcRight/Folder/Photo/ColorRect/NPCimage.set_texture(load(npc.Sprite))
	$ColorRect/MarginContainer/HBoxContainer/mcRight/Folder/NPCfear.text = "Fear of You: " + str(npc.Fear) + "%"
	$ColorRect/MarginContainer/HBoxContainer/mcRight/Folder/NPChatred.text ="Hatred of You: " + str(npc.Hatred) + "%"
	$ColorRect/MarginContainer/HBoxContainer/mcRight/Folder/NPCloyalty.text = "Loyalty to You: " + str(npc.Loyalty) + "%"
	
	
