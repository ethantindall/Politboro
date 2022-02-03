extends Node

var player

var game_running = false

var player_initial_map_position = Vector2(273,160)
#var player_facing_direction = 1

func _ready():
	OS.set_window_maximized(true)

	
func _input(event):
	if game_running == true:
		if event is InputEventKey and event.scancode == KEY_I and not event.echo:
			print("Open inventory")
	
func register_player(in_player):
	 player = in_player
	
	
