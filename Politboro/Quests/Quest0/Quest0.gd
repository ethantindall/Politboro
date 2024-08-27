extends QuestSystem

func _init():
	isActive = true
	title = "Meet your Boss"
	description = "Head to the Ministry of Energy office in the Party HQ and talk to your boss."
	
	

func talkToBoss(x):
	if x == "quest0":
		print("Something was activated!")

func _on_Quest0_ready():
	 Dialogic.signal_event.connect(talkToBoss)
