extends Control
	
func _on_dialogue_box_node_dialogue_signal(value):
	if value == "END":
		print("wowwwwww")
		get_tree().paused = false
