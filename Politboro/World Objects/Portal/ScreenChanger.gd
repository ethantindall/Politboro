extends CanvasLayer

signal scene_changed()

onready var animation_player = $Control/AnimationPlayer
onready var black = $Control/Black

func change_scene(path, delay = 0):
	yield(get_tree().create_timer(delay), "timeout")
	animation_player.play("fade_to_black")
	yield(animation_player, "animation_finished")
	assert(get_tree().change_scene(path) == OK)
	animation_player.play_backwards("fade_to_black")
	yield(animation_player, "animation_finished")
	emit_signal("scene_changed")

func goDark(delay = 0):
	yield(get_tree().create_timer(delay), "timeout")
	animation_player.play("fade_to_black")
	yield(animation_player, "animation_finished")
	
func goLight():
	animation_player.play_backwards("fade_to_black")
	yield(animation_player, "animation_finished")
