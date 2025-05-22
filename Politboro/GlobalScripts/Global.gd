extends Node

var player

var game_running = false
var activeQuest = 'Q0'
var nextDialogueTimeline

var player_initial_map_position = Vector2(763,198)
var player_position
var player_on_item

var player_inventory = []
#var player_facing_direction = 1

var current_customization = {
		"body": "res://Images/Sprites/ALL_SPRITE_LAYERS/body.png",
		"hat": "",
		"top": "",
		"hair": "",
		"face": "",
		"bottom": "",
		"shoes": ""
	}

func _ready():
	Engine.max_fps = 60

	get_window().mode = Window.MODE_MAXIMIZED if (true) else Window.MODE_WINDOWED


func register_player(in_player):
	player = in_player
