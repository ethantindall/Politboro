extends Node

var player

var game_running = false

var player_initial_map_position = Vector2(273,160)
#var player_facing_direction = 1

func _ready():
	OS.set_window_maximized(true)


func register_player(in_player):
	 player = in_player
	
	