@tool

extends Area2D
@export var next_scene_path = "" # (String, FILE)
@export var player_spawn_location: Vector2 = Vector2.ZERO
#export(int) var player_direction = 1

#func _get_configuration_warnings() -> String:
#	if next_scene_path == "":
#		return "next_scene path not set"
#	else:
#		return ""
		
		
		
func _on_Portal_body_entered(body):
	if body.name == "Player":
		#ScreenChanger.goDark()
		Global.player_initial_map_position = player_spawn_location
		#ScreenChanger.goLight()
		#Global.player_facing_direction = player_direction
		if get_tree().change_scene_to_file(next_scene_path) != OK:
			print("Error")
	
