extends Control

var url_PlayerData:String = "user://PlayerData.bin"
var deck:Dictionary = {}
var deck_maxSlots:int = 11
onready var playerData:Dictionary = Global_DataParser.load_data(url_PlayerData)



func _ready() -> void:
	load_data()



func load_data() -> void:
	if (playerData.empty()):
		var dict:Dictionary = {"deck":{}}
		for slot in range (0, deck_maxSlots):
			dict["deck"][str(slot)] = {"id": "0", "amount": 0 }
		Global_DataParser.write_data(url_PlayerData, dict)
		deck = dict["deck"]
	else:
		deck = playerData["deck"]
	
func collection_getCard(slot:int) -> Dictionary:
	return deck[str(slot)]
	
func collection_getEmptySlot() -> int:
	for slot in range(0, deck_maxSlots):
			if (deck[str(slot)]["id"] == "0"): 
				return int(slot)
	print ("Deck is full!")
	return -1


func collection_addCard(cardID:int) -> int:
	var cardData:Dictionary = Global_CardDatabase.get_card(str(cardID))
	if (cardData.empty()):
		return -1 
	if (int(cardData["stackable"]) <= 1):
		var slot = collection_getEmptySlot()
		if (slot < 0):
			return -1
		deck[String(slot)] = {"id": String(cardID), "amount": 1}
		return slot
	
	
	for slot in range(0, deck_maxSlots):
		if(deck[String(slot)]["id"] == String(cardID)):
			if (int(cardData["stackable"]) > int(deck[String(slot)]["amount"])):
				deck[String(slot)]["amount"] = int(deck[String(slot)]["amount"])
				return slot
	
	var slot = collection_getEmptySlot()
	if (slot < 0):
		return -1
	deck[String(slot)] = {"id": String(cardID), "amount": 1}	
	return slot

func collection_updateItem(slot:int, new_id:int, new_amount:int) -> void:
	if (slot < 0):
		return
	if (new_amount < 0):
		return
	if (Global_CardDatabase.get_card(str(new_id)).empty()):
		return
	deck[str(slot)] = {"id": str(new_id), "amount": int(new_amount)}
