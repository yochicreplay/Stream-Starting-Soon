extends HBoxContainer

@onready var message = $Message
@onready var chat_text = %"Chat Text"
var your_name = 'Michael'

func _on_send_pressed():
	if message.text != '' and message.text != ' ':
		chat_text.add_text(your_name + ': ' + message.text + '\n')
	message.text = ''

