tool

extends Area2D

export(String, FILE) var next_scene_path = ""
#export(Vector2) var player_spawn_location = Vector2.ZERO

var portal_locations = {
	#Town Square Portals
	"Portal_to_HQ_W" : Vector2(0,100),
	"Portal_to_Train_S" : Vector2(0,100),
	"Portal_to_Farm_E" : Vector2(0,100),
	#Farm Portals
	"Portal_to_Town_W" : Vector2(0,100),
	#HQ outside portals
	"Portal_to_Town_E" : Vector2(0,100),
	"Portal_to_HQ_Interior" : Vector2(0,100),
	#HQ inside portals
	"Portal_to_Office1" : Vector2(0,100),
	"Portal_to_Office2" : Vector2(0,100),
	"Portal_to_Office3" : Vector2(0,100)
}

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
	
