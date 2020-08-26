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
