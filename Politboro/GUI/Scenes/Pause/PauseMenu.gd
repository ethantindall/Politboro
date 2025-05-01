extends Control

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS  # Ensures input is handled even when paused


func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		self.visible = new_pause_state

#Level1
func _on_PeopleButton_pressed():
	get_node("RightBoard/RBoardInner/People").visible = true
	get_node("RightBoard/RBoardInner/Quests").visible = false
	get_node("RightBoard/RBoardInner/Inventory").visible = false

	
func _on_QuestsButton_pressed():
	get_node("RightBoard/RBoardInner/People").visible = false
	get_node("RightBoard/RBoardInner/Quests").visible = true
	get_node("RightBoard/RBoardInner/Inventory").visible = false

	
func _on_ItemsButton_pressed():
	get_node("RightBoard/RBoardInner/People").visible = false
	get_node("RightBoard/RBoardInner/Quests").visible = false
	get_node("RightBoard/RBoardInner/Inventory").visible = true

	


func _on_SaveButton_pressed():
	pass # Replace with function body.


func _on_QuitButton_pressed():
	get_tree().quit()
