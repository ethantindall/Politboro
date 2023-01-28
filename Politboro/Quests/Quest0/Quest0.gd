extends QuestSystem

func _init():
	isActive = true
	title = "Meet your Boss"
	description = "Head to the Ministry of Energy office in the Party HQ and talk to your boss."
	


func _on_Quest0_ready():
	if Global.activeQuest == "Q0":
		#Global.player_initial_map_position = player_spawn_location
		#Global.player_facing_direction = player_direction
		if get_tree().change_scene("res://Map Scenes/CitySouth.tscn") != OK:
			print("Error")
