extends Control

onready var itemList = get_node("Panel/ItemList")


func _ready():
	
	#initialize item list to display cards 
	
	itemList.set_max_columns(9)
	itemList.set_fixed_icon_size(Vector2(140,160))
	itemList.set_icon_mode(ItemList.ICON_MODE_TOP)
	itemList.set_select_mode(ItemList.SELECT_SINGLE)
	itemList.set_same_column_width(true)
	
	
	for i in range(1, 49):
		var Card
		if i < 10:
			Card = ResourceLoader.load("res://CardImages/Card_0" + String(i) + ".png")
			itemList.add_item("", Card, true)
			continue
		
		if i < 49:
			Card = ResourceLoader.load("res://CardImages/Card_" + String(i) + ".png")
			itemList.add_item("", Card, true)


	pass
