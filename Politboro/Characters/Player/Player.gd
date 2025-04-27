extends CharacterBody2D

const ACCELERATION = 1500
const MAX_SPEED = 150
const FRICTION = 600

#var velocity = Vector2.ZERO

@onready var animationPlayer = $AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")

signal player_stats_changed


#PLAYER STATS
var health = 100
var health_max = 100
var health_regeneration = 1
var rank = "Noob"
var inventory = []

func _ready():
	self.global_position = Global.player_initial_map_position
	$"/root/Global".register_player(self)
	emit_signal("player_stats_changed", self)
	

func _process(delta):
	# Regenerates health
	var new_health = min(health + health_regeneration * delta, health_max)
	if new_health != health:
		health = new_health
		emit_signal("player_stats_changed", self)

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized() 
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Move/blend_position", input_vector)
		animationState.travel("Move")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		
	else:   
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	set_velocity(velocity)
	move_and_slide()
	velocity = velocity
