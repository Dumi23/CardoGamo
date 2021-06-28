extends Control

const FILE_NAME = "user://game-data.json"

onready var file = File.new()

var player = {
	"decks": {}
}

func save():
	var file = File.new()
	file.open(FILE_NAME, File.WRITE)
	file.store_var(to_json(player))
	file.close()

func load():
	var file = File.new()
	if file.file_exists(FILE_NAME):
		file.open(FILE_NAME, File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			player = data
		else:
			printerr("Corrupted data")
	else:
		printerr("No Saved data")


func load_data(url) -> Dictionary:
	if url == null: return {}
	if !file.file_exists(url): return {}
	file.open(url, File.READ)
	var data:Dictionary = {}
	data = parse_json(file.get_as_text())
	file.close()
	return data
	
func write_data(url:String, dict:Dictionary):
	if url == null: return
	file.open(url, File.WRITE)
	file.store_line(to_json(dict))
	file.close()
