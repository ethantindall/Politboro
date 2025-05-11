extends Control


@onready var inventory_slots = $ScrollContainer/GridContainer

# Called when the node enters the scene tree for the first time.

func _ready():
	update_ui()
#	for inv_slot in inventory_slots.get_children():
#		inv_slot.connect("gui_input", Callable(self, "showDeets").bind(inv_slot))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func update_ui():
	var sc = $ScrollContainer
	var gc = $ScrollContainer/GridContainer
	var innermargin = 10

	#SCROLL CONTAINER
	sc.size = Vector2(get_parent().size.x, get_parent().size.y)
	print(sc.size)
	#sc.position =Vector2(innermargin,innermargin)

	#Grid container
	#gc.size = Vector2(get_parent().size.x, get_parent().size.y)	
"""
func showDeets(event: InputEvent, slot):
	if slot.itemName != "":		
		var detailRect = $CanvasLayer/DetailRect
		if event is InputEventMouseButton:
			print(event.global_position)
			$DetailRect/TitleLabel.text = slot.itemName
			$DetailRect/DescLabel.text = slot.itemDesc
			$DetailRect/ValueLabel.text = str(slot.itemValue) + "x"
			detailRect.visible = true
			detailRect.set_global_position(Vector2(event.global_position[0]-70, event.global_position[1]))


func _on_scroll_container_visibility_changed() -> void:
	$DetailRect.visible = false
	if visible == true:
		var itemNumber = 0
		var arraySize = Global.player_inventory.size()
		for inv_slot in inventory_slots.get_children():
			if itemNumber < arraySize:
				inv_slot.get_node("Sprite2D").set_texture(load(Global.player_inventory[itemNumber].imagePath))
				inv_slot.itemName = Global.player_inventory[itemNumber].itemName
				inv_slot.itemDesc = Global.player_inventory[itemNumber].itemDesc
				inv_slot.itemValue = Global.player_inventory[itemNumber].itemValue
			itemNumber +=1

func _on_ClosePopupButton_pressed():
		$CanvasLayer/DetailRect.visible = false


func _on_DropButton_pressed():
	print("drop item")
"""
