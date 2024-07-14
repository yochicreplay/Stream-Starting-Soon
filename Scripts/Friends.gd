extends GridContainer

@onready var streamer_cost = $VBoxContainer/Cost
@onready var funny_cost = $VBoxContainer2/Cost
@onready var reader_cost = $VBoxContainer3/Cost
@onready var buy_sfx = $"Buy SFX"

func _process(_delta):
	streamer_cost.text = str(int(15 * (1 + Variables.streamerFriends))) + " Scores"
	funny_cost.text = str(int(25 * (1 + Variables.funnyFriends))) + " Scores"
	reader_cost.text = str(int(100 * (1 + Variables.readerFriends))) + " Scores"

func _on_streamer_pressed():
	if Variables.score >= int(15 * (1 + Variables.streamerFriends)):
		Variables.score -= int(15 * (1 + Variables.streamerFriends))
		Variables.streamerFriends += 1
		buy_sfx.play()

func _on_funny_pressed():
	if Variables.score >= int(25 * (1 + Variables.funnyFriends)):
		Variables.score -= int(25 * (1 + Variables.funnyFriends))
		Variables.funnyFriends += 1
		buy_sfx.play()

func _on_reader_pressed():
	if Variables.score >= int(100 * (1 + Variables.readerFriends)):
		Variables.score -= int(100 * (1 + Variables.readerFriends))
		Variables.readerFriends += 1
		buy_sfx.play()
