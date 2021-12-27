extends Node

var player

var game_running = false


func _ready():
	pass # Replace with function body.

	
func _input(event):
	if game_running == true:
		if event is InputEventKey and event.scancode == KEY_I and not event.echo:
			print("Open inventory")
	
func register_player(in_player):
	 player = in_player
	
	
