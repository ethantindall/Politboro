extends Node

var player

var game_running = false
var activeQuest = 'Q0'
var nextDialogueTimeline

var player_initial_map_position = Vector2(810,198)
var player_inventory = []
#var player_facing_direction = 1

func _ready():
	get_window().mode = Window.MODE_MAXIMIZED if (true) else Window.MODE_WINDOWED


func register_player(in_player):
	player = in_player
