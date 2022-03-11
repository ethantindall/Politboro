extends KinematicBody2D

var active = false

func _process(delta):
	$questionmark.visible = active
	

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			get_tree().paused = true
			var dialog = Dialogic.start('Soldier-1')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)
			
func unpause(timeline_name):
	get_tree().paused = false

func _on_EventArea_body_entered(body):
	if body.name == "Player":
		active = true


func _on_EventArea_body_exited(body):
	if body.name == "Player":
		active = false
