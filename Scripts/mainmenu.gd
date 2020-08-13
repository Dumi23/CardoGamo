extends Control

#get the node
export (NodePath) var button_path
onready var Play = get_node(button_path)
onready var Deck_Manager = get_node(button_path)
onready var Quit = get_node(button_path)


func _ready():
	Play.set_toggle_mode(true)
	pass # Replace with function body.




func _on_Play_toggled(button_pressed):
	get_tree().change_scene("res://scenes/Lobby.tscn")
	pass # Replace with function body.


func _on_Deck_Manager_pressed():
	get_tree().change_scene("res://scenes/DeckBuilder.tscn")
	pass # Replace with function body.


func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
