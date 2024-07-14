extends HBoxContainer

@onready var message = $Message
@onready var ChatHandler = get_tree().get_first_node_in_group("Chat")
var your_name = 'Michael'

func _on_send_pressed():
	if message.text != '' and message.text != ' ':
		var newMessageLabel = Label.new()
		newMessageLabel.text = your_name + ': ' + message.text
		ChatHandler.add_child(newMessageLabel)
	message.text = ''

