
enum {Paper_plane, Exam_paper, Slap, Dave_the_school_boy, Jim, Jimza, Chop, Punch, Cut, Butter_knife, Edgemaster, Math, Kick, Spitball, Black_pen, Stun, Cheat_sheet, Scalpel, Locker, Flex, Clean_edge, Origami_Bird, Outspeed,
Combo_punch, Shield, Push, Big_joe, Dj_RichieSwitchie, Blank, Happy_bear_patch, Sudden_swing, Nap, Stop, Recovering_Addam, Daemon, Powerbubble_soda, Comet_punch, Switcherobot, Telekinesis, Nail_step, Fist_blast, Origami_Cobra, Dental_checkup, Small_chair_throw, Windown, Doodle, Rules, A_letter, Flower, Ice_cream,}

const DATA = {
	Paper_plane :
		["Usable", "Ouch", "Paper", "Deal 2 damage" ],
	Exam_paper :
		["Usable", "Woah", "Paper", "Your next paper ouch card in the round deals +1 damage"],
	Slap:
		["Usable", "Ouch", "Paper", "Deal 1 damage"],
	Dave_the_school_boy:
		["Hero", 5 , "Your paper ouch cards deal +1 damage during the first round"],
	Chop:
		["Usable", "Woah" ,"Scissors", "Deal 1 damage"],
	Jim:
		["Hero", 7],
	Jimza:
		["Hero", 7, "Hemza that is all that is the description"],
	Punch:
		["Usable", "Ouch", "Rock", "Deal 1 damage"],
	Cut:
		["Usable", "Woah" ,"Scissors", "Stop all enemy healing this round"],
	Butter_knife:
		["Usable", "Ouch" ,"Scissors", "Deal 1 dmg and switch card I and V on both sides"],
	Edgemaster:
		["Hero", 5, "You can redraw up to 2 scissor cards at the start of each round"],
	Math:
		["Usable", "Woah" ,"Utility", "Switch card I and IV or II and V on every side"],
	Spitball:
		["Usable", "Ouch", "Paper", "Deal 1 damage this card ignores block"],
	Black_pen:
		["Usable", "Woah" ,"Scissors", "The damage you take this round against paper is reduced by 1"],
	Stun:
		["Usable", "Woah", "Utility", "Prevent the enemy woah card from activating and set it"],
	Cheat_sheet:
		["Usable", "Ouch" ,"Paper", "Deal 1 damage if this card is switched set it"],
	Scalpel:
		["Usable", "Ouch" , "Scissors", "Deal 2 damage"],
	Locker:
		["Usable", "Blok", "Rock", "Block 1 damage deal damage equal to the not used block value"],
	Flex:
		["Usable", "Blok" ,"Rock", "If your HP is higher stop all enemy rock cards from activating this round"],
	Clean_edge:
		["Usable", "Ouch" ,"Scissors", "Deal 1 damage for every scissor card that did no damage this round"],
	Outspeed:
		["Usable", "Woah" ,"Utility", "Reveal your next turn card and activate it instead of this one but pass your next turn: povuci jos jednu lajnu"],
	Combo_punch:
		["Usable", "Ouch" ,"Utility", "Deal 1 damage as any card type if the card before this one did damage"],
	Dj_RichieSwitchie:
		["Hero", 6, "Once per round you switch two of your set cards. Can only be used on turn start"],
	Push:
		["Usable", "Woah", "Rock", "This round after every card that blocked enemy damage your next ouch card deals +1 damage"],
	Big_joe:
		["Hero", 5, "All of your block cards count as rock and they block 1 more damage"],
	Blank:
		["Usable", "Woah"],
	Happy_bear_patch:
		["Usable", "Woah", "Utility", "Heal 3 HP but stop all other healing this round"],
	Sudden_swing:
		["Usable", "Ouch", "Utility", "If the card before this one has no text deal 3 damage as rock"],
	Nap:
		["Usable", "Woah", "Utility", "Heal 1 HP this card counts as a card with no text"],
	Stop:
		["Usable", "Blok", "Utility", "Block 1 damage"],
	Recovering_Addam:
		["Hero", 5, "After every turn you didn't take damage heal 1 HP. This character does not heal at the round end"],
	Daemon:
		["Hero", 10, "At the end of the first round deal 3 damage to his own HP instead of healing"],
	Powerbubble_soda:
		["Usable", "Woah" ,"Utility", "Heal 1 HP and your next ouch card this round deals 1 more damage"],
	Comet_punch:
		["Usable", "Ouch", "Utility", "Does damage equal to the combined damage you dealt this round as rock"],
	Switcherobot:
		["Usable", "Woah" ,"Utility", "Switch cards I and V and II and IV on both sides and set them"],
	Telekinesis:
		["Usable", "Blok" ,"Utility", "Block 1 damage. Stop all card switching this round"],
	Nail_step:
		["Usable", "Woah" ,"Scissors", "If this card would be set deal 1 damage instead. This card can not be negated"],
	Dental_checkup:
		["Usable", "Woah" ,"Utility", "This round whenever a card gets set on your side deal 1 damage"],
	Small_chair_throw:
		["Usable", "Ouch", "Rock", "Deal 2 damage if used after a rock card"],
	Windown:
		["Usable", "Ouch", "Rock", "Deal 1 damage your next card counts as a card with no text"],
	Doodle:
		["Usable", "Woah", "Paper", "Your woah cards with no text also block 1 damage this game"],
	Rules:
		["Usable", "Blok", "Utility", "Block 0 damage"],
	A_letter:
		["Usable", "Blok", "Paper", "Block 1 damage set this card on turn end"],
	Flower:
		["Usable", "Woah", "Utility", "Switch two enemy set cards. You choose one and and the enemy chooses the other"],
	Ice_cream:
		["Usable", "Woah", "Utility", "Set your max HP to 7"],
}

