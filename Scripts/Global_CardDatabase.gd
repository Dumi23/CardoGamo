extends Node


var url_database_item = "res://CardDatabase.json"



func get_card(id):
	var cardData
	cardData = Global_DataParser.load_data(url_database_item)
	
	
	if !cardData.has(String(id)):
		print("Item does not exist.")
		return
	
	cardData[String(id)]["id"] = int(id)
	return cardData[String(id)]
	
