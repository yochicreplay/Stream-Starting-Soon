extends Node

var alreadyInGame = false

var ChattingIntuition:float = 20

signal chat(Name, Message)

func _when_in_game():
	var chat_text = get_tree().get_first_node_in_group("Chat")
	chat.connect(chat_text._AiChat)
	alreadyInGame = true

var chatTimer:float = 5.0

func _process(delta):
	if InGameCalculations.InGame:
		if !alreadyInGame:
			_when_in_game()
		if chatTimer <= 0:
			if ChattingIntuition > 30:
				if randf() <= (ChattingIntuition - 5) / 100:
					chat.emit("Kevin", "[url=plusOne]+1[/url]")
					chatTimer = randf_range(2.5,15)
			if ChattingIntuition > 80:
				if randf() <= (ChattingIntuition - 15) / 100:
					chat.emit("Karl", "[url=plusTwo]+2[/url]")
					chatTimer = randf_range(2.5,15)
		chatTimer -= delta
		ChattingIntuition -= delta
