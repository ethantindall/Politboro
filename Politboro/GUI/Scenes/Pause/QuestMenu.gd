extends Control

func _ready():
	update_ui(Global.active_quests)
	
func update_ui(questlist):
	var thisvbox = $ColorRect/MarginContainer/HBoxContainer/mcLeft/ScrollContainer/VBoxContainer
	for child in thisvbox.get_children():
		child.queue_free()	
	for quest in questlist:
		var new_btn = Button.new()
		new_btn.text = quest.Title
		#new_btn.add_theme_font_size_override("font_size", 100)
		new_btn.pressed.connect(func(): show_quest_data(quest))
		#new_btn.size.x = get_parent().size.x
		thisvbox.add_child(new_btn)
		
func show_quest_data(quest):
	$ColorRect/MarginContainer/HBoxContainer/mcRight/Folder/QuestTitle.text = str(quest.Title)
	$ColorRect/MarginContainer/HBoxContainer/mcRight/Folder/QuestDescription.text = str(quest.Description)
	$ColorRect/MarginContainer/HBoxContainer/mcRight/Folder/QuestStatus.text = str(quest.Status)


func _on_toggle_quest_type_button_button_up() -> void:
	var thisButton = $ColorRect/MarginContainer/HBoxContainer/mcLeft/toggleQuestTypeButton
	if thisButton.text == "VIEW COMPLETED QUESTS":
		thisButton.text = "VIEW ACTIVE QUESTS"
		update_ui(Global.completed_quests)
	else:
		thisButton.text = "VIEW COMPLETED QUESTS"
		update_ui(Global.active_quests)
		


func _on_toggle_quest_type_button_visibility_changed() -> void:
	if self.visible == true:
		update_ui(Global.active_quests)
