extends GridContainer

@onready var streamer_cost = $VBoxContainer/Cost
@onready var funny_cost = $VBoxContainer2/Cost
@onready var reader_cost = $VBoxContainer3/Cost
@onready var buy_sfx = $"Buy SFX"

func _process(_delta):
	streamer_cost.text = str(int(100 * 1 + Variables.streamerFriends / 15.0)) + " Scores"
	funny_cost.text = str(int(100 * 1 + Variables.funnyFriends / 15.0)) + " Scores"
	reader_cost.text = str(int(100 * 1 + Variables.readerFriends / 15.0)) + " Scores"

func _on_streamer_pressed():
	if Variables.score >= int(100 * 1 + Variables.streamerFriends / 15.0):
		Variables.score -= int(100 * 1 + Variables.streamerFriends / 15.0)
		Variables.streamerFriends += 1
		buy_sfx.play()

func _on_funny_pressed():
	if Variables.score >= int(100 * 1 + Variables.funnyFriends / 15.0):
		Variables.score -= int(100 * 1 + Variables.funnyFriends / 15.0)
		Variables.funnyFriends += 1
		buy_sfx.play()

func _on_reader_pressed():
	if Variables.score >= int(100 * 1 + Variables.readerFriends / 15.0):
		Variables.score -= int(100 * 1 + Variables.readerFriends / 15.0)
		Variables.readerFriends += 1
		buy_sfx.play()
