extends Control

func _on_dialogue_box_node_dialogue_signal(value):
	if value == "END":
		get_tree().paused = false
