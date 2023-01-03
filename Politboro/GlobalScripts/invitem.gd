extends StaticBody2D

export(String) var itemName = ""
export(String, FILE) var imagePath = ""
export(String) var itemDesc = ""
export(String) var itemPickupTimeline = ""
export var itemValue = 1
export(String) var itemContent = ""
var active = false
			
func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			get_tree().paused = true
			var dialog = Dialogic.start(itemPickupTimeline)
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)

			var unique = true
			for item in Global.player_inventory:
				if item.itemName == self.itemName:
					item.itemValue += self.itemValue
					unique = false
			if unique == true:
				Global.player_inventory.append(self)
			


			
func unpause(timeline_name):
	get_tree().paused = false
	get_parent().remove_child(self)

func _on_EventArea_body_entered(body):
	if body.name == "Player":
		active = true

func _on_EventArea_body_exited(body):
	if body.name == "Player":
		active = false
		
func drop_item():
	pass
		
