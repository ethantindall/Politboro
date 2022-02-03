tool

extends Area2D
export(String, FILE) var next_scene_path = ""
export(Vector2) var player_spawn_location = Vector2.ZERO
#export(int) var player_direction = 1

func _get_configuration_warning() -> String:
	if next_scene_path == "":
		return "next_scene path not set"
	else:
		return ""
		
		
		
func _on_Portal_body_entered(body):
	if body.name == "Player":
		#ScreenChanger.goDark()
		Global.player_initial_map_position = player_spawn_location
		ScreenChanger.goLight()
		#Global.player_facing_direction = player_direction
		if get_tree().change_scene(next_scene_path) != OK:
			print("Error")
	

		
"""tool

extends Area2D

export(String, FILE) var next_scene_path = ""
#export(Vector2) var player_spawn_location = Vector2.ZERO


func _get_configuration_warning() -> String:
	if next_scene_path == "":
		return "next_scene path not set"
	else:
		return ""

	
func _on_Portal_body_entered(body):
	
	if body.name == "Player":
		ScreenChanger.change_scene(next_scene_path)
		

	
	print($"/root/Global".player.get_position())
	#$"/root/Global".player.set_position(Vector2(100,100))
	
"""
