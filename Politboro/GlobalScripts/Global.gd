extends Node

var player

var game_running = false
var activeQuest = 'Q0'
var nextDialogueTimeline

var player_initial_map_position = Vector2(763,198)
var player_inventory = [ 
		["item 1", "res://Images/InvItems/pistol.png"],
		["item 2", "res://Images/InvItems/bloodyknife.png"],
		["item 3", "res://Images/InvItems/filmreel.png"],
		["item 4", "res://Images/InvItems/folder32.png"],
		["item 5", "res://Images/InvItems/photo.png"],
	
]
#var player_facing_direction = 1

func _ready():
	get_window().mode = Window.MODE_MAXIMIZED if (true) else Window.MODE_WINDOWED


func register_player(in_player):
	player = in_player
