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

		var unique = true
		for item in Global.player_inventory:
			if item.itemName == self.itemName:
				item.itemValue += self.itemValue
				unique = false
		if unique == true:
			Global.player_inventory.append(self)
			print(self)
		get_tree().paused = false
		get_parent().remove_child(self)
		print("Test")

		#add_child(dialog)
		#Dialogic.timeline_ended.connect(unpause)
			
func unpause():
	get_tree().paused = false
	print("test part 2")
	#get_parent().remove_child(self)


func _on_EventArea_body_entered(body):
	if body.name == "Player":
		active = true

func _on_EventArea_body_exited(body):
	if body.name == "Player":
		active = false
		
func drop_item():
	pass
		
