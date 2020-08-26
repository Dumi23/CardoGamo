extends Control


onready var cardData:Dictionary = Global_DataParser.load_data("res://CardDatabase.json")



func get_card(id:String) -> Dictionary:
		if !cardData.has(id):
			print("Item does not exist.")
			return {}
		
		cardData[(id)]["id"] = (id)
		return cardData[(id)]
