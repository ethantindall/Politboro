extends CharacterBody2D

class_name NPC

#don't remember what this does
var QMactive = false
var communication_area_entered = false
var recognition_area_entered = false
var turn_to_face_player = true

var dialogueTimeline = ""

const accel = 300
const speed = 100
const FRICTION = 600
var is_facing_left
@onready var animationPlayer = $AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")
@onready var nav = NavigationAgent2D.new()
func _ready():
	self.add_child(nav)

	if true:
		QMactive = true


#question mark visible
func _process(delta):
	#$questionmark.visible = QMactive
	var player = Global.player

	if recognition_area_entered:
		var direction = (player.global_position - global_position).normalized()
		
		# Snap to cardinal directions (4-way)
		var snapped_direction = Vector2.ZERO
		if abs(direction.x) > abs(direction.y):
			snapped_direction = Vector2(sign(direction.x), 0)
			
			# Flip skeleton if facing left
			if snapped_direction.x < 0:
				$Skeleton.scale.x = -1
			else:
				$Skeleton.scale.x = 1
		else:
			snapped_direction = Vector2(0, sign(direction.y))



		animationTree.set("parameters/Idle/blend_position", snapped_direction)
		animationTree.set("parameters/Move/blend_position", snapped_direction)		 

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
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and QMactive and communication_area_entered:
			if Dialogic.current_timeline != null:
				return			
			var dialog = Dialogic.start(load(dialogueTimeline))
			dialog.process_mode = Node.PROCESS_MODE_ALWAYS
			Dialogic.process_mode = Node.PROCESS_MODE_ALWAYS
			
			get_tree().get_root().add_child(dialog)
			get_tree().paused = true
			# Disconnect first to avoid duplicate connections
			if Dialogic.timeline_ended.is_connected(_on_dialog_finished):
				Dialogic.timeline_ended.disconnect(_on_dialog_finished)			
			# Wait for dialog to finish before unpausing and collecting item
			Dialogic.timeline_ended.connect(_on_dialog_finished, CONNECT_ONE_SHOT)
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var click_pos = get_global_mouse_position()
		nav.target_position = click_pos
	
func _on_dialog_finished():
	get_tree().paused = false
	# Optional: remove the dialog node just in case
	var dialog_node = get_tree().get_root().get_node_or_null("DialogNode")
	if dialog_node:
		dialog_node.queue_free()			
			


		
func _unpause():
	get_tree().paused = false
	QMactive = false
	

func _on_communication_event_area_body_entered(body):
	if body.name == "Player":
		communication_area_entered = true
		print("ENTERED")



func _on_communication_event_area_body_exited(body):
	if body.name == "Player":
		communication_area_entered = false

func _on_recognition_event_area_body_entered(body: Node2D) -> void:
	if body.name == "Player" and turn_to_face_player == true:
		recognition_area_entered = true

func _on_recognition_event_area_body_exited(body: Node2D) -> void:
	if body.name == "Player" and turn_to_face_player == true:
		recognition_area_entered = false
