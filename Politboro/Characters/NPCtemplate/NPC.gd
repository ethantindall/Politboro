extends CharacterBody2D

class_name NPC

#don't remember what this does
var QMactive = false
var entered = false

#this uses the Dialogue Node addon. It uses the dialogueBox Node that is on each NPC's scene. 
#In order to use this node, you need the dialogue data save file and the start ID
@onready var dialogue_box = $DialogueBox/DialogueBoxNode
@export var startData = ""
@export var dialogueDataPath = ""
@export var sample_portrait = ""

#IDK
func _ready():
	if true:
		QMactive = true

#question mark visible
func _process(delta):
	$questionmark.visible = QMactive
	
#On input event
func _input(event):
	if event.is_action_pressed("ui_accept") and QMactive and entered:
		#pause the game while the dialog box is up. 
		#The dialog box has been whitelisted in the DialogueBox/DialogueBoxNode scene
		get_tree().paused = true
		dialogue_box.data = load(dialogueDataPath)
		dialogue_box.sample_portrait = load(sample_portrait)
		dialogue_box.start(startData)
		
		#The game is unpaused in DialogueBox.gd
			
func unpause():
	get_tree().paused = false
	QMactive = false
	

func _on_EventArea_body_entered(body):
	if body.name == "Player":
		entered = true


func _on_EventArea_body_exited(body):
	if body.name == "Player":
		entered = false
