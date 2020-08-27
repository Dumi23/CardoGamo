extends Control


func _ready() -> void:
	
	#initialize item list to display cards 
	
	$Panel/ItemList.set_max_columns(9)
	$Panel/ItemList.set_fixed_icon_size(Vector2(120,140))
	$Panel/ItemList.set_icon_mode($Panel/ItemList.ICON_MODE_TOP)
	$Panel/ItemList.set_select_mode($Panel/ItemList.SELECT_SINGLE)
	$Panel/ItemList.set_same_column_width(true)
	$Panel/ItemList.set_allow_rmb_select(true)
	
	
	set_process(false)
	set_process_input(true)
	


func load_items():
	$Panel/ItemList.clear()
	for slot in range(0, Global_Player.deck_maxSlots):
		var CardData = Global_Player.deck[str(slot)]
		var cardMetaData = Global_CardDatabase.get_card(CardData["id"])
		var icon = ResourceLoader.load(cardMetaData["icon"])
		var amount = int(CardData["amount"])
		
		cardMetaData["amount"] = amount
		if CardData["id"] == "0": amount = " "
		if cardMetaData["stackable"]: amount = " "
		$Panel/ItemList.add_item(String(amount), icon, true)
		$Panel/ItemList.set_item_metadata(slot, cardMetaData)
		$Panel/ItemList.set_item_tooltip(slot, cardMetaData["name"])
	
	
	
func _on_Button_AddCard_pressed() -> void:
	$Panel/WindowDialog_AddCardWindow.popup()

func _on_AddCard_Window_Button_Close_pressed() -> void:
	$Panel/WindowDialog_AddCardWindow.hide()




func _on_AddCardWindow_Button_AddCard_pressed():
	Global_Player.collection_addCard($Panel/WindowDialog_AddCardWindow/AddCardWindow_SpinBox_CardID.get_value())
	load_items()

func _on_ItemList_item_rmb_selected(index, at_position):
	var cardData = $Panel/ItemList.get_item_metadata(index)
	var strCardInfo = ""
	
	$Panel/WindowDialog_CardMenu.set_position(get_viewport().get_mouse_position())
	$Panel/WindowDialog_CardMenu.set_title(cardData["name"])
	$Panel/WindowDialog_CardMenu/CardMenu_TextureRect_Icon.set_texture($Panel/ItemList.get_item_icon(index))
	
	strCardInfo = "Name: [color=#ff0000]" + cardData["name"] + "[/color]\n"
	strCardInfo = strCardInfo + "Type: [color=#ffffff] " + cardData["type"] + "[/color]\n"
	strCardInfo = strCardInfo + "Form: [color=#ffffff] " + cardData["form"] + "[/color]\n"
	strCardInfo = strCardInfo + "HP: [color=#ffffff]" + String(cardData["health"]) + "[/color]"
	strCardInfo = strCardInfo + "\n[color=#ffffff]" + cardData["description"] + "[/color]"
	$Panel/WindowDialog_CardMenu/CardMenu_RichTextLabel_CardInfo.set_bbcode(strCardInfo)
	$Panel/WindowDialog_CardMenu/CardMenu_Button_RemoveCard.set_text("(" + String(cardData["amount"]) + ") Remove")
	$Panel/WindowDialog_CardMenu.popup()
