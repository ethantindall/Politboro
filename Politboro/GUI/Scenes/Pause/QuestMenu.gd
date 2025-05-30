extends Control

func _ready():
	update_ui()
	
func update_ui():
	for quest in Global.active_quests:
		var new_btn = Button.new()
		new_btn.text = quest.Title
		#new_btn.add_theme_font_size_override("font_size", 100)
		new_btn.pressed.connect(func(): show_quest_data(quest))
		#new_btn.size.x = get_parent().size.x
		$ColorRect/MarginContainer/HBoxContainer/mcLeft/ScrollContainer/VBoxContainer.add_child(new_btn)
		
func show_quest_data(quest):
	$ColorRect/MarginContainer/HBoxContainer/mcRight/Folder/QuestTitle.text = str(quest.Title)
	$ColorRect/MarginContainer/HBoxContainer/mcRight/Folder/QuestDescription.text = str(quest.Description)
	$ColorRect/MarginContainer/HBoxContainer/mcRight/Folder/QuestStatus.text = str(quest.Status)
