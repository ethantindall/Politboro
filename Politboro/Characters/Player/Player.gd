extends CharacterBody2D

const ACCEL = 800
const SPEED = 200
const FRICTION = 1000

#var velocity = Vector2.ZERO

@onready var bodyNode = $Skeleton/Body
@onready var shoesNode = $Skeleton/Shoes
@onready var bottomNode = $Skeleton/Bottom
@onready var topNode = $Skeleton/Top
@onready var faceNode = $Skeleton/Face
@onready var hairNode = $Skeleton/Hair
@onready var hatNode = $Skeleton/Hat
@onready var animation_player = $AnimationPlayer
@onready var animationTree = $AnimationTree
var last_direction = "D"
var is_facing_left = false



func _ready():
	#self.global_position = Global.player_initial_map_position
	$"/root/Global".register_player(self)
	
	set_skeleton(bodyNode, Global.current_customization["body"])
	set_skeleton(shoesNode, Global.current_customization["shoes"])
	set_skeleton(bottomNode, Global.current_customization["bottom"])
	set_skeleton(topNode, Global.current_customization["top"])
	set_skeleton(faceNode, Global.current_customization["face"])
	set_skeleton(hairNode, Global.current_customization["hair"])
	set_skeleton(hatNode, Global.current_customization["hat"])



func set_skeleton(custom_node, sprite_sheet):
	var texture = load(sprite_sheet) as Texture2D
	custom_node.texture = texture
	custom_node.hframes = 5
	custom_node.vframes = 4
	custom_node.frame = 5

func _process(delta):
	#Clock.time_changed.connect(_update_clock_display)
	get_input()
	move_and_slide()



func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed


#func _physics_process(delta):
#	if self.global_position != Global.player_position:
#		Global.player_position = self.global_position
	
func _on_fade_in_player_animation_finished(anim_name: StringName) -> void:
	print("wow")
	$Fade_In_Canvas/Fade_In_ColorRect.modulate.a = 0.0  # Keep it transparent after animation ends

func _update_clock_display(hour, minute):
	var h = str(hour)
	var m
	if len(str(minute)) == 1:
		m = "0" + str(minute)
	else:
		m = str(minute)
	#d$HUD/ClockBG/ClockLabel.text = "%s:%s" % [h, m]
