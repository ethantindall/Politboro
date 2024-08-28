extends CharacterBody2D

class_name NPC

#don't remember what this does
var QMactive = false
var entered = false
var dialogueTimeline = ""

func _ready():
	if true:
		QMactive = true

#question mark visible
func _process(delta):
	$questionmark.visible = QMactive
	
#On input event
func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and QMactive and entered:
			#get the timeline ready
			var dialog = Dialogic.start(load(dialogueTimeline))
			#for some reason you have to set Dialogic game handler and dialogic timeline to always process even when game paused
			#check out this resource: https://www.reddit.com/r/godot/comments/16oo1rc/dialogic_pausing/
			dialog.process_mode = Node.PROCESS_MODE_ALWAYS
			Dialogic.process_mode = Node.PROCESS_MODE_ALWAYS
			#add the timeline to the tree
			add_child(dialog)
			#pause the game so that the character can't move while talking
			get_tree().paused = true
			#when timeline is done unpause the game handler. Not the timeline.
			Dialogic.timeline_ended.connect(_unpause)

		
func _unpause():
	get_tree().paused = false
	QMactive = false
	

func _on_EventArea_body_entered(body):
	if body.name == "Player":
		entered = true


func _on_EventArea_body_exited(body):
	if body.name == "Player":
		entered = false
