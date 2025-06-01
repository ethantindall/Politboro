extends CharacterBody2D

class_name NPC

#don't remember what this does
var QMactive = false
var entered = false
var dialogueTimeline = ""

const accel = 300
const speed = 100
const FRICTION = 600
var is_facing_left
#@onready var nav: NavigationAgent2D = $NavigationAgent2D
@onready var animationPlayer = $AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")
@onready var nav = NavigationAgent2D.new()
func _ready():
	self.add_child(nav)

	if true:
		QMactive = true


#question mark visible
#func _process(delta):
#	$questionmark.visible = QMactive


func _physics_process(delta):
	if not nav.is_navigation_finished():
		var direction = (nav.get_next_path_position() - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
	else:
		velocity = Vector2.ZERO

	if velocity != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", velocity)
		animationTree.set("parameters/Move/blend_position", velocity)
		animationState.travel("Move")
		
	else:   
		# Set direction blend for idle
		animationTree.set("parameters/Idle/blend_position", Vector2.DOWN)
		animationState.travel("Idle")
		
	if velocity.x < 0 and not is_facing_left:
		is_facing_left = true
		$Skeleton.scale.x = -1
	elif velocity.x > 0 and is_facing_left:
		is_facing_left = false
		$Skeleton.scale.x = 1

#On input event
func _input(event):
	"""
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
	"""
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var click_pos = get_global_mouse_position()
		nav.target_position = click_pos

		
func _unpause():
	get_tree().paused = false
	QMactive = false
	

func _on_EventArea_body_entered(body):
	if body.name == "Player":
		entered = true


func _on_EventArea_body_exited(body):
	if body.name == "Player":
		entered = false
