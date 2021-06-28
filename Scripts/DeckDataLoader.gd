extends Control

var card_data



func _ready():
	var carddata_file = File.new()
	carddata_file.open("res://CardDatabase.json", File.READ)
	var carddatabase = JSON.parse(carddata_file.get_as_text())
	carddata_file.close()
	card_data = carddatabase.result
	
	if card_data == null:
		print("This is an error")
	else:
		print("DAYUM BRO")
		pass
