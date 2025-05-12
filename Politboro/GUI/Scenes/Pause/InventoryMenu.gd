extends Control

var InvMenuOption = preload("res://GUI/Scenes/Pause/InvMenuOption.tscn")
# Called when the node enters the scene tree for the first time.

func _ready():
	update_ui()

func update_ui():
	var sc = $ScrollContainer
	var gridcontainer = $ScrollContainer/MarginContainer/GridContainer
	var innermargin = 10

	#SCROLL CONTAINER
	sc.size = Vector2(get_parent().size.x, get_parent().size.y)

	#MARGIN CONTAINER
	var margincontainermargin=15
	$ScrollContainer/MarginContainer.add_theme_constant_override("margin_top", margincontainermargin)
	$ScrollContainer/MarginContainer.add_theme_constant_override("margin_bottom", margincontainermargin)
	$ScrollContainer/MarginContainer.add_theme_constant_override("margin_left", margincontainermargin)
	$ScrollContainer/MarginContainer.add_theme_constant_override("margin_right", margincontainermargin)

	#GRID CONTAINER
	var gridmargin = 15
	gridcontainer.add_theme_constant_override("h_separation", gridmargin)  # Adjusts spacing between elements
	gridcontainer.add_theme_constant_override("v_separation", gridmargin) # Adjusts spacing between elements
	var cols = 5
	gridcontainer.columns = cols
	gridcontainer.size = Vector2(sc.size.x-(margincontainermargin/2), sc.size.y-(margincontainermargin/2))

	for inv_item in Global.player_inventory:
		#print(inv_item)
		var newitem_bg = TextureRect.new()
		newitem_bg.texture = load("res://Images/plate.png")
		newitem_bg.custom_minimum_size= Vector2((gridcontainer.size.x/cols)-gridmargin, (gridcontainer.size.x/cols)-gridmargin)
		newitem_bg.position = Vector2(gridmargin,gridmargin)
		newitem_bg.mouse_filter = Control.MOUSE_FILTER_STOP  # Ensures the TextureRect receives input
		
		newitem_bg.gui_input.connect(_on_texture_clicked.bind(newitem_bg))
		newitem_bg.mouse_entered.connect(_on_mouse_enter.bind(newitem_bg))
		newitem_bg.mouse_exited.connect(_on_mouse_exit.bind(newitem_bg))
		
		gridcontainer.add_child(newitem_bg)
		
		# ITEM IMAGE
		var newitem_img = TextureRect.new()
		newitem_img.texture = load(inv_item[1])
		newitem_img.custom_minimum_size= Vector2((gridcontainer.size.x/cols)-(gridmargin*2), (gridcontainer.size.x/cols)-(gridmargin*2))
		newitem_img.position = Vector2(gridmargin/2,gridmargin/2)
		newitem_bg.add_child(newitem_img)

func _on_mouse_enter(newitem_bg):
	newitem_bg.modulate = Color(.8,.8,.8, 1)  # Slight transparency effect

func _on_mouse_exit(newitem_bg):
	newitem_bg.modulate = Color(1, 1, 1, 1)  # Restore original opacity
	
func _on_texture_clicked(event, newitem_bg):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$DetailRect.visible = not $DetailRect.visible
		$DetailRect.position = newitem_bg.position
		$DetailRect.size = Vector2(200,200)
		
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
