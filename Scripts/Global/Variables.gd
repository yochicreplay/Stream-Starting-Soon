extends Node

var SaveTime:float = 300
var SaveTimer:float = SaveTime


## VVV SAVE THIS VVV
#Points
var score:int = 0
var SmallGrillBucks:int = 0

#Reward Rememberance
var cheeseInflation:int = 0

#Friends Quantity
var streamerFriends:int = 0
var readerFriends:int = 0
var funnyFriends:int = 0

#Options
var SoundEffectsVolume:float

## STOP SAVING!!!

var lastTimePlayed

func _ready():
	load_game()

func _process(delta):
	if SaveTimer <= 0:
		save_game()
		SaveTimer = SaveTime
	SaveTimer -= delta

func save_game():
	var file = FileAccess.open("user://savegame.json", FileAccess.WRITE)
	var saved_data = {}
	saved_data['soundeffectsvolume'] = SoundEffectsVolume
	saved_data['score'] = score
	saved_data['smallgrillbucks'] = SmallGrillBucks
	saved_data['cheeseinflation'] = cheeseInflation
	saved_data['streamerfriends'] = streamerFriends
	saved_data['readerfriends'] = readerFriends
	saved_data['funnyfriends'] = funnyFriends
	saved_data['lasttimeplayed'] = Time.get_unix_time_from_system()
	var json = JSON.stringify(saved_data)
	file.store_string(json)
	file.close()

func load_game():
	var file = FileAccess.open("user://savegame.json", FileAccess.READ)
	if file == null:
		save_game()
		file = FileAccess.open("user://savegame.json", FileAccess.READ)
	var json = file.get_as_text()
	var saved_data = JSON.parse_string(json)
	
	score = saved_data['score']
	SmallGrillBucks = saved_data['smallgrillbucks']
	cheeseInflation = saved_data['cheeseinflation']
	streamerFriends = saved_data['streamerfriends']
	readerFriends = saved_data['readerfriends']
	funnyFriends = saved_data['funnyfriends']
	lastTimePlayed = saved_data['lasttimeplayed']
	SoundEffectsVolume = saved_data['soundeffectsvolume']
