extends CharacterBody2D

const ACCEL = 800
const SPEED = 200
const FRICTION = 1000

var is_facing_left = false
var last_blend_position = Vector2.ZERO

@onready var bodyNode = $Skeleton/Body
@onready var shoesNode = $Skeleton/Shoes
@onready var bottomNode = $Skeleton/Bottom
@onready var topNode = $Skeleton/Top
@onready var faceNode = $Skeleton/Face
@onready var hairNode = $Skeleton/Hair
@onready var hatNode = $Skeleton/Hat
@onready var animation_player = $AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")


# -------- SYSTEM FUNCTIONS ---------
func _ready():
	if Global.player_initial_map_position != Vector2(0,0):
		self.position = Global.player_initial_map_position
	$"/root/Global".register_player(self)
	set_skeleton(bodyNode, Global.current_customization["body"])
	set_skeleton(shoesNode, Global.current_customization["shoes"])
	set_skeleton(bottomNode, Global.current_customization["bottom"])
	set_skeleton(topNode, Global.current_customization["top"])
	set_skeleton(faceNode, Global.current_customization["face"])
	set_skeleton(hairNode, Global.current_customization["hair"])
	set_skeleton(hatNode, Global.current_customization["hat"])
	
	Clock.time_changed.connect(_update_clock_display)
	var QuestManager = get_node("QuestManager")  # Adjust path as needed
	QuestManager.quest_updated.connect(_on_quest_updated)
	
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized() 
	
	if input_vector.x < 0 and not is_facing_left:
		is_facing_left = true
		#for node in [bodyNode, shoesNode, bottomNode, topNode, faceNode, hairNode, hatNode]:
		#	node.flip_h = true
		$Skeleton.scale.x = -1
	elif input_vector.x > 0 and is_facing_left:
		is_facing_left = false
		#for node in [bodyNode, shoesNode, bottomNode, topNode, faceNode, hairNode, hatNode]:
		#	node.flip_h = false
		$Skeleton.scale.x = 1


	if input_vector != Vector2.ZERO:
		if input_vector != last_blend_position:
			animationTree.set("parameters/Idle/blend_position", input_vector)
			animationTree.set("parameters/Move/blend_position", input_vector)
			last_blend_position = input_vector
		if animationState.get_current_node() != "Move":
			animationState.travel("Move")
		velocity = velocity.move_toward(input_vector * SPEED, ACCEL * delta)
	else:
		if animationState.get_current_node() != "Idle":
			animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	move_and_slide()
	# YOU ONLY NEED TO UPDATE THIS SOMETIMES
	#Global.player_position = self.global_position
	
	
func _on_fade_in_player_animation_finished(anim_name: StringName) -> void:
	$Fade_In_Canvas/Fade_In_ColorRect.modulate.a = 0.0  # Keep it transparent after animation ends

func _update_clock_display(hour, minute):
	$HUD/ClockBG/ClockLabel.text = "%02d:%02d" % [hour, minute]

func _on_quest_updated(quest_name, status):
	#print("got here")
	$HUD/QuestUpdatedAlert.visible = true
	$HUD/QuestUpdatedAlert/QuestUpdatedLabel.text = quest_name + ": " + status

	await get_tree().create_timer(5.0).timeout
	$HUD/QuestUpdatedAlert.visible = false

# --------- HELPER FUNCTIONS ---------
func set_skeleton(custom_node, sprite_sheet):
	var texture = load(sprite_sheet) as Texture2D
	custom_node.texture = texture
	custom_node.hframes = 5
	custom_node.vframes = 4
	custom_node.frame = 5
