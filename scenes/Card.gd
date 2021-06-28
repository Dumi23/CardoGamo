extends MarginContainer

var startposition = 0
var targetposition = 0
var startrotation = 0 
var t = 0
var timedraw = 1 
var dragging := false
var mouse_enter = false
var pressed = false
var pos = get_global_mouse_position()
export var group := "draggable"
var _click_position = get_local_mouse_position().normalized()
onready var dragstartpos = $Sprite.position
onready var dragstartrot = rect_rotation

enum{
	InHand
	MoveCardDeckHand
	FocusInHand
	OrganiseHand
	Set
}

var state = InHand

func _ready() -> void:
	add_to_group(group)
	var CardSize = rect_size
	print(dragstartpos)


func _physics_process(delta):
	match state:
		MoveCardDeckHand:
			if t <= 1: #needs to be 1 always (ne znam) 
				rect_position = startposition.linear_interpolate(targetposition, t)
				t += delta/float(timedraw)
			else: 
				state = InHand
				t = 0

func _input(event) -> void:
	if not dragging:
		return
	
	if event.is_action_released("leftclick"):
		$Sprite.position = dragstartpos
		rect_rotation = dragstartrot
		dragging = false
		print($Sprite.rotation)
	
	if event is InputEventMouseMotion:
		$Sprite.position = get_local_mouse_position()


func _on_Focus_mouse_entered():
	match state:
		InHand:
			state = FocusInHand
	pass # Replace with function body.


func _on_Focus_mouse_exited():
	match state:
		FocusInHand:
			state = InHand
	pass # Replace with function body.


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("leftclick"):
		if _is_on_top():
			dragging = true
			rect_rotation = 0 
	pass # Replace with function body.

func _is_on_top() -> bool:
	for dragable in get_tree().get_nodes_in_group(group + "hovered"):
		if dragable.get_index() > get_index():
			return false
	
	return true


func _on_Area2D_mouse_entered() -> void:
	add_to_group(group + "hovered")	
	pass # Replace with function body.


func _on_Area2D_mouse_exited() -> void:
	remove_from_group(group + "hovered")
	pass # Replace with function body.
