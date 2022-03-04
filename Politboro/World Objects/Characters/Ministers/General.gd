extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("woah")


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		print("meow")
		get_node("questionmark").visible = false


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		print("goodbye")
		get_node("questionmark").visible = true
