extends Node2D

func _play_animation(AnimatedSprite:AnimatedSprite2D, animation:String):
	if AnimatedSprite.animation != animation:
		AnimatedSprite.play(animation)

@onready var body = $Body
@onready var eyebrows = $Eyebrows
@onready var mouth = $Mouth

var currentEmotion

func _hear(emotion):
	currentEmotion = emotion

func _ready():
	body.play(["Blue", "Green", "Red"].pick_random())

func _process(_delta):
	if currentEmotion == Global.emotions.Anger:
		eyebrows.play("Anger")
		if Global.talking:
			_play_animation(mouth, "Anger Talk")
		else:
			mouth.play("Anger")
	elif currentEmotion == Global.emotions.Sad:
		eyebrows.play("Sad")
		if Global.talking:
			_play_animation(mouth, "Frown Talk")
		else:
			mouth.play("Frown")
	elif currentEmotion == Global.emotions.Confusion:
		eyebrows.play("Confused")
		if Global.talking:
			_play_animation(mouth, "Confused Talk")
		else:
			mouth.play("Confused")
	else:
		eyebrows.play("Normal")
		if Global.talking:
			_play_animation(mouth, "Smile Talk")
		else:
			mouth.play("Smile")
