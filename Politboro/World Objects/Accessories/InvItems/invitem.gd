extends StaticBody2D

export(String) var itemName = ""
export(String, FILE) var imagePath = ""
export(String) var description = ""
export(String) var pickupTimeline = ""
export var value = 0
var active = false
			
func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			get_tree().paused = true
			var dialog = Dialogic.start(pickupTimeline)
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)
			
			print("picked up")

			Global.player_inventory.append(imagePath)
			print(Global.player_inventory)

			
func unpause(timeline_name):
	get_tree().paused = false
	get_parent().remove_child(self)

func _on_EventArea_body_entered(body):
	if body.name == "Player":
		active = true

func _on_EventArea_body_exited(body):
	if body.name == "Player":
		active = false
		

		
