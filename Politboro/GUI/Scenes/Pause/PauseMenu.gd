extends Control

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS  # Ensures input is handled even when paused
	update_ui()

func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		$CanvasLayer.visible = new_pause_state

#Level1
func _on_people_button_pressed() -> void:
	$CanvasLayer/RightBoard/RightInset/People.visible = true
	$CanvasLayer/RightBoard/RightInset/Quests.visible = false
	$CanvasLayer/RightBoard/RightInset/Inventory.visible = false

func _on_quests_button_pressed() -> void:
	$CanvasLayer/RightBoard/RightInset/People.visible = false
	$CanvasLayer/RightBoard/RightInset/Quests.visible = true
	$CanvasLayer/RightBoard/RightInset/Inventory.visible = false

func _on_items_button_pressed() -> void:
	$CanvasLayer/RightBoard/RightInset/People.visible = false
	$CanvasLayer/RightBoard/RightInset/Quests.visible = false
	$CanvasLayer/RightBoard/RightInset/Inventory.visible = true

func _on_save_button_pressed() -> void:
	pass # Replace with function body.

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_resized():
	print("resized")
	update_ui()
	
func update_ui():
	var screen_size = get_viewport_rect().size
	var left_rect = $CanvasLayer/LeftBoard
	var left_inner = $CanvasLayer/LeftBoard/LeftInset
	var right_rect = $CanvasLayer/RightBoard
	var right_inner = $CanvasLayer/RightBoard/RightInset
	var game_paused_label = $CanvasLayer/GamePausedLabel
	var vbox = $CanvasLayer/LeftBoard/LeftInset/VBoxContainer
	var exit_label = $CanvasLayer/LeftBoard/LeftInset/ExitLabel
	var margin = screen_size.x * 0.03
	
	# LEFT PANEL
	var left_height = screen_size.y - (margin*2)
	var left_width = screen_size.x * 0.25 -(margin)
	left_rect.size = Vector2(left_width, left_height)
	left_rect.position = Vector2(margin, margin)
	
	# LEFT INSET
	var inset_margin =20
	var l_inset_height = left_height-(inset_margin *2)
	var l_inset_width = left_width-(inset_margin *2)
	left_inner.size = Vector2(l_inset_width, l_inset_height)
	left_inner.position = Vector2(inset_margin,inset_margin)
	
	#RIGHT PANEL
	var right_height = left_height - (margin*2)
	var right_width =  screen_size.x - left_width - (margin*3)
	right_rect.size = Vector2(right_width, right_height)
	right_rect.position = Vector2(left_width+(margin*2), margin*3)
	
	# RIGHT INSET
	var r_inset_height = right_height-(inset_margin *2)
	var r_inset_width = right_width-(inset_margin *2)
	right_inner.size = Vector2(r_inset_width, r_inset_height)
	right_inner.position = Vector2(inset_margin,inset_margin)
	
	# GAME PAUSED LABEL
	var gpl_height = screen_size.y -(margin * 3)
	var gpl_width = game_paused_label.size.x
	game_paused_label.size = Vector2(gpl_height,gpl_width)
	game_paused_label.position = Vector2(left_width+(margin*2)+((right_width - gpl_width)/2), margin)
	
	# VBoxContainer
	var vb_inset_height = left_height - (inset_margin * 2)
	var vb_inset_width = l_inset_width - (inset_margin * 2)
	vbox.size = Vector2(vb_inset_width, l_inset_height)
	vbox.position = Vector2(inset_margin,inset_margin)
	
	
