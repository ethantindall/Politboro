extends Control


onready var inventory_slots = $ColorRect4/ScrollContainer/GridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	for inv_slot in inventory_slots.get_children():
		inv_slot.connect("gui_input", self, "showDeets", [inv_slot])
		print("wow")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func showDeets(event: InputEvent, slot):
	if event is InputEventMouseButton:
		print(event.global_position)
		get_node("DetailRect").visible = true
		get_node("DetailRect").set_global_position(Vector2(event.global_position))


func _on_ScrollContainer_visibility_changed():
	get_node("DetailRect").visible = false
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


func _on_ClosePopupButton_pressed():
		get_node("DetailRect").visible = false
