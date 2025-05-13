extends Control

var InvMenuOption = preload("res://GUI/Scenes/Pause/InvMenuOption.tscn")
# Called when the node enters the scene tree for the first time.

func _ready():
	update_ui()

func update_ui():

	var sc = $ScrollContainer
	var gridcontainer = $ScrollContainer/MarginContainer/GridContainer
	var innermargin = 10
	
	for child in gridcontainer.get_children():
		gridcontainer.remove_child(child)
		child.queue_free()  # Ensures the child is properly deleted

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

	if len(Global.player_inventory) ==0:
		var label = Label.new()
		label.text = "You have no items in your inventory."
		label.custom_minimum_size = Vector2(200, 50)  # Adjust if needed
		label.position = $ScrollContainer/MarginContainer.size / 2 - label.size / 2
		gridcontainer.add_child(label)
	else:	
		for inv_item in Global.player_inventory:
			print("inventory:")
			print(inv_item)
			var newitem_bg = TextureRect.new()
			newitem_bg.texture = load("res://Images/plate.png")
			newitem_bg.custom_minimum_size= Vector2((gridcontainer.size.x/cols)-gridmargin, (gridcontainer.size.x/cols)-gridmargin)
			newitem_bg.position = Vector2(gridmargin,gridmargin)
			newitem_bg.mouse_filter = Control.MOUSE_FILTER_STOP  # Ensures the TextureRect receives input
			
			newitem_bg.gui_input.connect(_on_texture_clicked.bind(newitem_bg,sc,inv_item))
			newitem_bg.mouse_entered.connect(_on_mouse_enter.bind(newitem_bg))
			newitem_bg.mouse_exited.connect(_on_mouse_exit.bind(newitem_bg))
			
			gridcontainer.add_child(newitem_bg)
			
			# ITEM IMAGE
			var newitem_img = TextureRect.new()
			newitem_img.texture = load(inv_item.imagePath)
			newitem_img.custom_minimum_size= Vector2((gridcontainer.size.x/cols)-(gridmargin*2), (gridcontainer.size.x/cols)-(gridmargin*2))
			newitem_img.position = Vector2(gridmargin/2,gridmargin/2)
			newitem_bg.add_child(newitem_img)

func _on_mouse_enter(newitem_bg):
	newitem_bg.modulate = Color(.8,.8,.8, 1)  

func _on_mouse_exit(newitem_bg):
	newitem_bg.modulate = Color(1, 1, 1, 1) 
	
func _on_texture_clicked(event, newitem_bg, gc, inv_item):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$DetailRect.visible = true
		
		# GET NAME OF ITEM
		var title = $DetailRect/DetailRectInset/MarginContainer/VBoxContainer/HBoxContainer/TitleLabel
		title.text = inv_item.itemName

		$DetailRect.size = Vector2(gc.size.x/3, gc.size.y /2)

		
		# CALCULATE X POSITION OF DETAILRECT
		if (newitem_bg.global_position.x + newitem_bg.size.x +$DetailRect.size.x) > get_viewport_rect().size.x:
			$DetailRect.global_position.x = (newitem_bg.global_position.x - $DetailRect.size.x +(newitem_bg.size.x/2))
		else:
			$DetailRect.global_position.x = newitem_bg.global_position.x +(newitem_bg.size.x/2)
			
				
		#CALCULATE Y POSITION OF DETAIL RECT
		if (newitem_bg.global_position.y + newitem_bg.size.y +$DetailRect.size.y) > get_viewport_rect().size.y:
			$DetailRect.global_position.y = (newitem_bg.global_position.y - $DetailRect.size.y +(newitem_bg.size.y/2))
		else:
			$DetailRect.global_position.y = newitem_bg.global_position.y +(newitem_bg.size.y/2)
		$DetailRect.z_index = 100  # Higher values render on top
		
		$DetailRect/DetailRectInset.size=Vector2($DetailRect.size.x -20, $DetailRect.size.y-20)
		$DetailRect/DetailRectInset.position = Vector2(10,10) 
		

		#title.position = Vector2(10,10)
		
		#await get_tree().process_frame  # Wait for label to update layout
		#var label_width = $DetailRect/DetailRectInset/TitleLabel.rect_size
		#print(label_width)

		#$DetailRect/DetailRectInset/DescLabel.text = inv_item.itemDesc
		#$DetailRect/DetailRectInset/DescLabel.position = Vector2(10,$DetailRect/DetailRectInset.size.y-10-$DetailRect/DetailRectInset/DescLabel.size.y)
		#$DetailRect/DetailRectInset/ValueLabel.text = str(inv_item.itemValue) + "x "

"""
size
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


func _on_visibility_changed() -> void:
	update_ui()


func _on_button_button_up() -> void:
	$DetailRect.visible = false
