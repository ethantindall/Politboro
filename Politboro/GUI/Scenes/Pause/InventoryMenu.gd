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
	if slot.itemName != "":		
		var detailRect = get_node("DetailRect")
		if event is InputEventMouseButton:
			print(event.global_position)
			get_node("DetailRect/TitleLabel").text = slot.itemName
			get_node("DetailRect/DescLabel").text = slot.itemDesc
			get_node("DetailRect/ValueLabel").text = str(slot.itemValue) + "x"
			detailRect.visible = true
			detailRect.set_global_position(Vector2(event.global_position[0]-20, event.global_position[1]))


func _on_ScrollContainer_visibility_changed():
	get_node("DetailRect").visible = false
	if visible == true:
		var itemNumber = 0
		var arraySize = Global.player_inventory.size()
		for inv_slot in inventory_slots.get_children():
			if itemNumber < arraySize:
				inv_slot.get_node("Sprite").set_texture(load(Global.player_inventory[itemNumber].imagePath))
				inv_slot.itemName = Global.player_inventory[itemNumber].itemName
				inv_slot.itemDesc = Global.player_inventory[itemNumber].itemDesc
				inv_slot.itemValue = Global.player_inventory[itemNumber].itemValue
			itemNumber +=1

func _on_ClosePopupButton_pressed():
		get_node("DetailRect").visible = false
