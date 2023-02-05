extends KinematicBody2D


class_name NPC

var active = false
var introText = 'Citizen-1'
var entered = false

func getIntroText():
	return introText
func setIntroText(x):
	introText = x

###Change sprite if needed	
"""
onready var spriteNode= get_node("Sprite")
var textureSprite = ''
"""
func _ready():
	if true:
		active = true


func _process(delta):
	$questionmark.visible = active


func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and active and entered:
			get_tree().paused = true
			var dialog = Dialogic.start(introText)
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)
	
			
func unpause(timeline_name):
	get_tree().paused = false
	active = false
	

func _on_EventArea_body_entered(body):
	if body.name == "Player":
		entered = true


func _on_EventArea_body_exited(body):
	if body.name == "Player":
		entered = false
