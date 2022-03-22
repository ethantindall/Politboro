extends Node2D


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Node2D_tree_entered():
	Global.tutorial_running = true
	if get_node_or_null('DialogNode') == null:
			get_tree().paused = true
			var dialog = Dialogic.start('Tutorial-1')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)

			
func unpause(timeline_name):
	get_tree().paused = false
	get_tree().change_scene("res://Map Scenes/TownSquare.tscn")
