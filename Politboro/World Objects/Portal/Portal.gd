tool

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
	


