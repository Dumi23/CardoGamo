extends Node2D

#trigonometry for card display
onready var centreoval = get_viewport().size * Vector2(0.6, 1.45)
onready var hor_vector = get_viewport().size.x*0.5
onready var ver_vector = get_viewport().size.y*0.4
var angle = deg2rad(90) - 0.6
var ovalanglevektor = Vector2()
const CardSize = Vector2(120,175)
#.............................#

#variables for implementing drag and drop#
var dragging = false #povuci potegni


#variables for card manipulation#
onready var Card = preload("res://scenes/Card.tscn")
onready var deck = []
onready var file_path = "user://decks.json"
onready var deckdata  = {
	"deck": deck,
}

onready var rest_nodes = []
onready var hand = [] #name says it all 
onready var graveyard = [] #this is where the set card go at the end of the round
onready var stack = []#idk this is just for holding cards that don't appear in the game or the graveyard a nice 
#guy named Damir needs to sort this shit out


enum{
	InHand
	MoveCardDeckHand
	FocusHand
	OrganiseHand
}
#................................#

#function used for assigning hand value properties and loading the deck
func _ready():
	var file = File.new()
	file.open(file_path, File.READ)
	deckdata = JSON.parse(file.get_as_text())
	file.close()
	var card_datax = deckdata.result
	deck.append_array(card_datax["deck"])
	deck.shuffle()
	print(deck)
	for i in range(5):
		var ids = deck[i]
		hand.append(ids)
		deck.remove(ids)
		pass
	print(hand)
#........................................................................#
	
#function for drawing cards and displaying them properly
func drawcards():
	hand.shuffle()
	for i in range(hand.size()):
		var cardInstance = Card.instance()
		var cardIDS = hand[i]
		var cardData:Dictionary = Global_CardDatabase.get_card(cardIDS)
		var icon = ResourceLoader.load(cardData["icon"])
		ovalanglevektor = Vector2(hor_vector * cos(angle), - ver_vector * sin(angle))
		cardInstance.startposition = $Deck.position
		cardInstance.targetposition = centreoval + ovalanglevektor - cardInstance.rect_size/2
		cardInstance.rect_scale /= 2
		cardInstance.rect_rotation = (90 - rad2deg(angle))
		cardInstance.state = MoveCardDeckHand
		cardInstance.get_node("Sprite").set_texture(icon)
		$Cards.add_child(cardInstance)
		angle += 0.25
		var pos = cardInstance.get_node("Sprite").get_global_position()
		print(pos)
		#trigonometry :#
#.............................................................................#

#drag and drop implementation

#............................#
func _on_Button_pressed():
	drawcards()
