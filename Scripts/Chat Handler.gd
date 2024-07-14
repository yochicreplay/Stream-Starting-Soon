extends VBoxContainer

const CHAT_MESSAGE = preload("res://Scenes/chat_message.tscn")
@onready var click_message = %"Click Message"

func handle(command):
	click_message.play()
	match command:
		"plusOne": Variables.score += 1 * (Variables.cheeseInflation + 1)
		"plusTwo": Variables.score += 2 * (Variables.cheeseInflation + 1)

func _AiChat(Name, Message):
	var newMessage = CHAT_MESSAGE.instantiate()
	newMessage.text = Name + ': ' + Message
	add_child(newMessage)
