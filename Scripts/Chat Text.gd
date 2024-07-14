extends RichTextLabel

func _AiChat(Name, Message):
	append_text(Name + ": " + Message + '\n')

func handle(command):
	match command:
		"plusOne": Variables.score += 1 * (Variables.cheeseInflation + 1)
		"plusTwo": Variables.score += 2 * (Variables.cheeseInflation + 1)

func _ready():
	meta_clicked.connect(handle)
