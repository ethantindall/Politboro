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
	$PeopleScrollContainer.size = Vector2(get_parent().size.x/3, get_parent().size.y/3)
	$PeopleScrollContainer/VBoxContainer.size = $PeopleScrollContainer.size
	$PeopleScrollContainer/VBoxContainer.position = Vector2(10,10)
	$PeopleScrollContainer/VBoxContainer.add_theme_constant_override("separation", 10)

	for npc in result_json.Ministers:
		var new_btn = Button.new()
		new_btn.text = npc.Name
		#new_btn.add_theme_font_size_override("font_size", 100)
		new_btn.pressed.connect(func(): show_npc_data(npc))
		new_btn.size.x = get_parent().size.x
		#new_btn.theme = button_theme
		$PeopleScrollContainer/VBoxContainer.add_child(new_btn)



	
func show_npc_data(npc):
	get_node("Folder/BioControl/NPCname").text = str(npc.Name)
	get_node("Folder/BioControl/NPCbio").text = str(npc.Bio)
	get_node("Folder/BioControl/NPCtitle").text = str(npc.Title)
	get_node("Folder/BioControl/Photo/ColorRect/NPCimage").set_texture(load(npc.Sprite))
	get_node("Folder/BioControl/NPCfear").text = "Fear of You: " + str(npc.Fear) + "%"
	get_node("Folder/BioControl/NPChatred").text ="Hatred of You: " + str(npc.Hatred) + "%"
	get_node("Folder/BioControl/NPCloyalty").text = "Loyalty to You: " + str(npc.Loyalty) + "%"
	
	
