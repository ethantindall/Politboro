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
	if event.is_action_pressed("ui_accept") and active:
		if Dialogic.current_timeline != null:
			return
		
		print(self.itemName)
		
		var dialog = Dialogic.start(load(onPickupTimeline))
		dialog.process_mode = Node.PROCESS_MODE_ALWAYS
		Dialogic.process_mode = Node.PROCESS_MODE_ALWAYS
		
		get_tree().get_root().add_child(dialog)
		
		get_tree().paused = true
		# Disconnect first to avoid duplicate connections
		if Dialogic.timeline_ended.is_connected(_on_dialog_finished):
			Dialogic.timeline_ended.disconnect(_on_dialog_finished)
		# Wait for dialog to finish before unpausing and collecting item
		Dialogic.timeline_ended.connect(_on_dialog_finished, CONNECT_ONE_SHOT)

func _on_dialog_finished():
	get_tree().paused = false
	add_to_player_inventory()



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
		
