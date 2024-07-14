extends Node

var InGame:bool = false

func _check_in_game():
	if get_tree().get_first_node_in_group("InGame"):
		InGame = true

var bucks_time = 300.0
var bucks_timer:float = bucks_time

func _check_earn_bucks(delta):
	if bucks_timer <= 0:
		Variables.SmallGrillBucks += 10
		bucks_timer = bucks_time
	bucks_timer -= delta

var chest_time = 900.0
var chest_timer:float = chest_time
const FLYING_CHEST = preload("res://Scenes/flying_chest.tscn")

func _check_spawn_chest(delta):
	if chest_timer <= 0:
		var new_flying_chest = FLYING_CHEST.instantiate()
		get_tree().call_deferred("add_child", new_flying_chest)
		chest_timer = chest_time
	chest_timer -= delta

var funnytime = 5.0
var funnytimer:float = funnytime

func _funnyCalculation(delta):
	if funnytimer <= 0:
		ChatAi.ChattingIntuition += max(-ChatAi.ChattingIntuition/5.0+10, (ChatAi.ChattingIntuition*ChatAi.ChattingIntuition-pow(ChatAi.ChattingIntuition, sqrt(ChatAi.ChattingIntuition))+1)*5, log(-ChatAi.ChattingIntuition+80)) / (100.0 / Variables.funnyFriends)
		funnytimer = funnytime
	funnytimer -= delta

var readertime = 2.0
var readertimer:float = readertime
@onready var messages = get_tree().get_nodes_in_group("ChatMessage")

func _readerCalculation(delta):
	if readertimer <= 0:
		if randf() >= 1.0 / Variables.readerFriends:
			Variables.score += 1
			messages.pick_random().queue_free()
		readertimer = readertime
	readertimer -= delta

var alreadyInGame = false

func _when_in_game():
	var timePassedSinceLastTimePlayed = Time.get_unix_time_from_system() - Variables.lastTimePlayed
	var scoreReceivedWhileOffline = timePassedSinceLastTimePlayed/60/60/4*8*Variables.streamerFriends # 8 | 4 | 1
	Variables.score += scoreReceivedWhileOffline
	alreadyInGame = true

func _process(delta):
	_check_in_game()
	if InGame:
		if !alreadyInGame:
			_when_in_game()
		_check_earn_bucks(delta)
		_check_spawn_chest(delta)
		_funnyCalculation(delta)
		_readerCalculation(delta)
