extends StaticBody2D

@export var itemName: String = ""
@export var imagePath = "" # (String, FILE)
@export var itemDesc: String = ""
@export var itemValue = 1
@export var itemContent: String = ""
@export var onPickupTimeline = ""
@export var resPath = ""
var active = false

func _ready():
	self.scale.x = self.scale.x/2
	self.scale.y = self.scale.y/2
	
func _input(event):
	#if get_node_or_null('DialogNode') == null:
	if event.is_action_pressed("ui_accept") and active:
		print(self.itemName)
		#get the timeline ready
		var dialog = Dialogic.start(load(onPickupTimeline))
		#for some reason you have to set Dialogic game handler and dialogic timeline to always process even when game paused
		#check out this resource: https://www.reddit.com/r/godot/comments/16oo1rc/dialogic_pausing/
		
		dialog.process_mode = Node.PROCESS_MODE_ALWAYS
		Dialogic.process_mode = Node.PROCESS_MODE_ALWAYS
		#add the timeline to the tree

		#pause the game so that the character can't move while talking
		get_tree().paused = true
		#when timeline is done unpause the game handler. Not the timeline.

		add_to_player_inventory()
		get_tree().paused = false



func add_to_player_inventory():
	var item_data = {
		"itemName": self.itemName,
		"itemDesc": self.itemDesc,
		"itemValue": self.itemValue,
		"imagePath": self.imagePath,
		"itemContent": self.itemContent,
		"resPath": self.resPath			
	}
	var found = false
	for item in Global.player_inventory:
		if item["itemName"] == item_data["itemName"]:
			item["itemValue"] += item_data["itemValue"]
			found = true
			break
	if not found:
		Global.player_inventory.append(item_data)
	queue_free()

		
func _on_EventArea_body_entered(body):
	if body.name == "Player":
		active = true
		

func _on_EventArea_body_exited(body):
	if body.name == "Player":
		active = false
		
