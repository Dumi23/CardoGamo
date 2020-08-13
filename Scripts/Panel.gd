extends Panel

const CardBase = preload("res://Cards/CardBase.tscn")
var listIndex = 0 

func addCard():
	var Card = CardBase.instance()
	listIndex += 1 
	$ScrollContainer/VBoxContainer.add_child(Card)
	Card.rect_min_size = Vector2(171,194)

func _ready():
	for i in range(10):
		addCard()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
