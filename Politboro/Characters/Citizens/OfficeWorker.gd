extends NPC

class_name Citizen1 

func _init():
	if Global.activeQuest == "Q0":
		introText = "Quests/Quest0/OW1-trainstation"
	#textureSprite = 'res://Images/Sprites/employee.png'
