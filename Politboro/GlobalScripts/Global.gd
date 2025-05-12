extends Node

var player

var game_running = false
var activeQuest = 'Q0'
var nextDialogueTimeline

var player_initial_map_position = Vector2(763,198)
var player_inventory = [ 
		["Pistol", "res://Images/InvItems/pistol.png"],
		["Bloody Knife", "res://Images/InvItems/bloodyknife.png"],
		["Filmreel", "res://Images/InvItems/filmreel.png"],
		["Folder", "res://Images/InvItems/folder32.png"],
		["Photograph", "res://Images/InvItems/photo.png"],

]
#var player_facing_direction = 1

func _ready():
	get_window().mode = Window.MODE_MAXIMIZED if (true) else Window.MODE_WINDOWED


func register_player(in_player):
	player = in_player
