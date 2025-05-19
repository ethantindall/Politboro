extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var frames = 1
var counter = 5
var bounceSpeed = 15

# Called when the node enters the scene tree for the first time.
func _ready():
	print()
	
func drive():
	if Global.activeQuest == "Q0":
		if self.global_position[0] >1200 or self.global_position[0] <-200:
			queue_free()
			print("dead")
		else:	
			self.global_position[0]-=1
			if frames == 1 && counter ==0:
				self.global_position[1]+=1
				counter =bounceSpeed
				frames = 2
			if frames == 2 && counter ==0:
				self.global_position[1]-=1
				counter =bounceSpeed
				frames = 1
			counter -=1


func _process(delta):
	drive()
