extends Node

var player

var game_running = false
var activeQuest = 'Q0'
var nextDialogueTimeline
var Player: Node = null
var MINISTRIES = ["War", "Justice", "Transportation", "Finance", "Energy"]

var player_initial_map_position = Vector2(0,0)
var player_inventory = []
#var player_position
var player_facing_direction = 1
var player_name
var player_ministry
var player_rank
var ingame_time = {"hours":0, "minutes":0}
var active_quests= []
var completed_quests = []

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
	#Engine.max_fps = 60
	#Engine.physics_ticks_per_second = 480
	#Engine.max_physics_steps_per_frame = 30
	get_window().mode = Window.MODE_MAXIMIZED if (true) else Window.MODE_WINDOWED


func register_player(in_player):
	player = in_player
