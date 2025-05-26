@tool

extends Area2D
@export var next_scene_path = "" # (String, FILE)
@export var player_spawn_location: Vector2 = Vector2.ZERO
#export(int) var player_direction = 1
		
func _on_Portal_body_entered(body):
	if body.name == "Player":
		$Fade_Out_Player.play("fade_out")

	


func _on_fade_out_player_animation_finished(anim_name: StringName) -> void:
