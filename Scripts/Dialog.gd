extends Control

@onready var rich_text_label = $"Dialog Box/RichTextLabel"

var dialogs = {'Introduction': ['[wave]Hi chat![/wave]', Global.emotions.Normal],
	'Markiplier': ['I wonder what my roomate is doing.', Global.emotions.Confusion],
	'Egg': ["Where's my egg?", Global.emotions.Confusion],
	'NSFW': ["I'm sorry for breaking the rules but... NSFW", Global.emotions.Sad],
	'Ace': ["Don't trust [shake]Kingchild[/shake]!", Global.emotions.Normal],
	'AI': ["Sorry. But as an AI Language Model, I cannot create funny dialogue for a streamer.", Global.emotions.Confusion],
	'Uninspired': ["I can't think of anything funny...", Global.emotions.Sad],
	'Contraption': ["Chat! I recently bought a [wave]funny[/wave] contraption! IF I move, I say something funny!", Global.emotions.Happy],
	'Nerd': ["So now this should run...", Global.emotions.Normal],
	'AngryGamer': ["Oh, come on!", Global.emotions.Anger],
	'NoBots': ["Cheap viewers? GET OUT OF HERE", Global.emotions.Anger],
}

var randomdialogs = ['Markiplier', 'Uninspired', 'Contraption', 'Nerd', 'AngryGamer', 'NoBots']
var funnies = ['Egg', 'NSFW', 'Ace', 'AI']
var rewardDialogues = [["Hydrate? [tornado]*gulp* *gulp* *gulp*[/tornado]", Global.emotions.Normal], 
	["Cheese Time... [tornado]*Sigh*[/tornado]", Global.emotions.Anger], 
	["Sorry but I can't dance right now! I will add that to my debt...", Global.emotions.Sad]
]

signal said(emotion)
var disappearTime:float = 5.0
var disappearTimer:float = 0.0

func _say(what):
	rich_text_label.text = '[center]' + what[0] + '[/center]'
	disappearTimer = disappearTime
	modulate.a = 1
	Global.talking = true
	said.emit(what[1])

func catchRewards(reward):
	_say(rewardDialogues[reward])

func _ready():
	_say(dialogs['Introduction'])
	said.connect($"../Streamer"._hear)

var randomDialogTimer = 30.0

func _process(delta):
	if disappearTimer <= 0:
		Global.talking = false
		modulate.a -= delta / 3
	if randomDialogTimer <= 0:
		_say(dialogs[randomdialogs.pick_random()])
		ChatAi.ChattingIntuition -= 5
		randomDialogTimer = randf_range(20, 120)
	
	disappearTimer -= delta
	randomDialogTimer -= delta

func _on_click_button_pressed():
	_say(dialogs[funnies.pick_random()])
	if ChatAi.ChattingIntuition <= 0:
		ChatAi.ChattingIntuition = 1
	else:
		var x = ChatAi.ChattingIntuition
		ChatAi.ChattingIntuition += max(-x/5+10, (x*x-pow(x, sqrt(x))+1)*5, log(-x+80))
