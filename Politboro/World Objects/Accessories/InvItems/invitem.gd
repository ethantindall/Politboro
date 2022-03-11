extends StaticBody2D

export(String) var itemName = ""
export var value = 0
var active = false

func _input(event):
		if event.is_action_pressed("ui_accept") and active:
			print("picked up")
			get_parent().remove_child(self)
			Global.player_inventory.append(itemName)
			print(Global.player_inventory)
			
func _on_EventArea_body_entered(body):
	if body.name == "Player":
		active = true


func _on_EventArea_body_exited(body):
	if body.name == "Player":
		active = false
		

		
