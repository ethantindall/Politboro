extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ScrollContainer_visibility_changed():
	if visible == true:
		var itemNumber = 0
		var grid = get_node("ColorRect4/ScrollContainer/GridContainer")
		var arraySize = Global.player_inventory.size()
		for slot in grid.get_children():
			if itemNumber < arraySize:
				slot.get_node("Sprite").set_texture(load(Global.player_inventory[itemNumber]))
			itemNumber +=1
			
		




func _on_Slot1_mouse_entered():
	pass # Replace with function body.
