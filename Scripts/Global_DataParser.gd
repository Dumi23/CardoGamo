extends Control

onready var file = File.new()





func load_data(url) -> Dictionary:
	if url == null: return {}
	if !file.file_exists(url): return {}
	file.open(url, File.READ)
	var data:Dictionary = {}
	file.close()
	return data
	
func write_data(url:String, dict:Dictionary):
	if url == null: return
	file.open(url, File.WRITE)
	file.store_line(to_json(dict))
	file.close()
