extends Control



func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state
		
#Level1
func _on_PeopleButton_pressed():
	get_node("People").visible = true
	get_node("Quests").visible = false
	get_node("Inventory").visible = false

	
func _on_QuestsButton_pressed():
	get_node("People").visible = false
	get_node("Quests").visible = true
	get_node("Inventory").visible = false

	
func _on_ItemsButton_pressed():
	get_node("People").visible = false
	get_node("Quests").visible = false
	get_node("Inventory").visible = true

	


func _on_SaveButton_pressed():
	pass # Replace with function body.


func _on_QuitButton_pressed():
	get_tree().quit()
