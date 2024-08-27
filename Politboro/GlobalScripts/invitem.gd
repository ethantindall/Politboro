extends StaticBody2D

@export var itemName: String = ""
@export var imagePath = "" # (String, FILE)
@export var itemDesc: String = ""
@export var itemPickupTimeline: String = ""
@export var itemValue = 1
@export var itemContent: String = ""
var active = false
			
func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			get_tree().paused = true
			var dialog = Dialogic.start(itemPickupTimeline)
			dialog.process_mode = Node.PROCESS_MODE_ALWAYS
			dialog.connect('timeline_end', Callable(self, 'unpause'))
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
		
