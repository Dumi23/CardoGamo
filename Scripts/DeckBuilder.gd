extends Control

onready var itemList = get_node("Panel/ItemList")


func _ready():
	
	#initialize item list to display cards 
	
	itemList.set_max_columns(9)
	itemList.set_fixed_icon_size(Vector2(140,160))
	itemList.set_icon_mode(ItemList.ICON_MODE_TOP)
	itemList.set_select_mode(ItemList.SELECT_SINGLE)
	itemList.set_same_column_width(true)
	
	
	


func _on_Button_Load_pressed():
	itemList.clear()
	for slot in range(0, Global_Player.inventory_maxSlots):
		var cardItem = Global_Player.inventory[String(slot)]
		var cardMetaData = Global_CardDatabase.deck[String(slot)]
		var icon = ResourceLoader.load(cardMetaData["icon"])
		var amount = int(cardItem["amount"])
		
		cardMetaData["amount"] = amount
		if cardItem["id"] == "0": amount = " "
		if !cardMetaData["stackable"]: amount = " "
		itemList.add_item(String(amount), icon, true)
		itemList.set_card_metadata(slot, cardMetaData)
		itemList.set_card_tooltip(slot, cardMetaData["name"])
		
	
func _on_Button_AddCard_pressed() -> void:
	$Panel/WindowDialog_AddCard_Window.popup()

func _on_AddCard_Window_Button_Close_pressed() -> void:
	$Panel/WindowDialog_AddCardWindow.hide()


func _on_AddCardWindow_Button_AddCard_pressed() -> void:
	var affectedSlot = Global_Player.inventory_addItem($Panel/WindowDialog_AddItemWindow/AddItemWindow_SpinBox_ItemID.get_value())
	if (affectedSlot >= 0):
		update_slot(affectedSlot)
