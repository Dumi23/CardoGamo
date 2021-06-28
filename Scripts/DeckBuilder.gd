extends Control

onready var cardAmount = 46
onready var deck = []
onready var deckMaxCards = 11
onready var file_path = "user://decks.json"
onready var deckdata  = {
	"deck": deck,
}



func _ready() -> void:
	#initialize item list to display cards 
	
	$Panel/ItemList.set_max_columns(9)
	$Panel/ItemList.set_fixed_icon_size(Vector2(120,140))
	$Panel/ItemList.set_icon_mode($Panel/ItemList.ICON_MODE_TOP)
	$Panel/ItemList.set_select_mode($Panel/ItemList.SELECT_SINGLE)
	$Panel/ItemList.set_same_column_width(true)
	$Panel/ItemList.set_allow_rmb_select(true)
	
	$Panel/ItemList2.set_max_columns(11)
	$Panel/ItemList2.set_fixed_icon_size(Vector2(150,50))
	$Panel/ItemList2.set_icon_mode($Panel/ItemList2.ICON_MODE_TOP)
	$Panel/ItemList2.set_select_mode($Panel/ItemList2.SELECT_SINGLE)
	$Panel/ItemList2.set_same_column_width(true)
	
	cardCollection(true) 
	
	
	set_process(false)
	set_process_input(true)
	
	
	
func cardCollection(cardID:int) -> void:
	for i in range(cardID, 46):
		var index = $Panel/ItemList.get_item_count()
		var cardData:Dictionary = Global_CardDatabase.get_card(str(cardID))
		var icon = ResourceLoader.load(cardData["icon"])
		$Panel/ItemList.add_item("", icon, true)
		cardID +=1
		index + 1 
		$Panel/ItemList.set_item_metadata(index, cardData)
		continue


func _on_ItemList_item_rmb_selected(index, at_positon):
	var cardData:Dictionary = $Panel/ItemList.get_item_metadata(index)
	if (int(cardData["id"])) < 1: return
	var strCardInfo:String = ""
	
	$Panel/WindowDialog_CardMenu.set_position(get_viewport().get_mouse_position())
	$Panel/WindowDialog_CardMenu.set_title(cardData["name"])
	$Panel/WindowDialog_CardMenu/CardMenu_TextureRect_Icon.set_texture($Panel/ItemList.get_item_icon(index))
	

	$Panel/WindowDialog_CardMenu/CardMenu_RichTextLabel_CardInfo.set_bbcode(strCardInfo)
	$Panel/WindowDialog_CardMenu.popup_centered()



func _on_ItemList_item_activated(index) -> void:
	var cardIDs = $Panel/ItemList2.get_item_count()
	var cardData:Dictionary = $Panel/ItemList.get_item_metadata(index)
	var dataID = (cardData["id"])
	deck.append(dataID)
	var transformIcon = ResourceLoader.load(cardData["transformIcon"])
	$Panel/ItemList2.add_item("", transformIcon, true)
	$Panel/ItemList2.set_item_metadata(cardIDs, cardData)
	
	var event = InputEventMouseButton
	if deck.size() > deckMaxCards:
		get_node("Panel/Popup").popup()
		print("MAX CARDS IS 11")
	else: 
		pass
	if event is InputEventMouseButton:
		if event.pressed:
			get_node("Panel/Popup").popup_hide()
	else:
		pass
	if deck.count(index) > 3:
		get_node("Panel/Popup2").popup()
		print("UNIQUE NUMBER OF CARDS IS 3")
	else:
		pass
	if event is InputEventMouseButton:
		if event.pressed:
			get_node("Panel/Popup2").popup_hide()
	else:
		pass
func _on_ItemList2_item_selected(index):
	var cardID:Dictionary = $Panel/ItemList2.get_item_metadata(index)
	$Panel/ItemList2.remove_item(index)
	deck.remove(index)
	print(deck.size())
	pass # Replace with function body.

func _on_Button_SaveDeck_button_down():
	get_node("Panel/Button_SaveDeck/CanvasLayer/DeckName").popup()
	pass # Replace with function body.




func _on_Save_button_down():
	if deck.empty() == true:
		ERR_CANT_CREATE
	else:
		var file  = File.new()
		file.open(file_path, File.WRITE)
		file.store_line(JSON.print(deckdata))
		file.close()
		print("Deck succesfuly saved")
		get_node("Panel/Button_SaveDeck/CanvasLayer/DeckName").hide()
		pass # Replace with function body.




func _on_Button_Load_pressed():
	var file = File.new()
	file.open(file_path, File.READ)
	deckdata = JSON.parse(file.get_as_text())
	file.close()
	var card_datax = deckdata.result
	deck.append_array(card_datax["deck"])
	print(deck)
	for i in range(deck.size()):
		print(deck[i])
		var cardData:Dictionary = $Panel/ItemList.get_item_metadata(i)
		var transformIcon = ResourceLoader.load(cardData["transformIcon"])
		$Panel/ItemList2.add_item("", transformIcon, true)
		var cardIDs = $Panel/ItemList2.get_item_count()
		$Panel/ItemList2.set_item_metadata(i, cardData)
	
