extends AudioStreamPlayer

var sounds = [preload("res://Sounds/SFX/Talking Sounds/tree_talk_1.wav"), preload("res://Sounds/SFX/Talking Sounds/tree_talk_2.wav"), preload("res://Sounds/SFX/Talking Sounds/tree_talk_3.wav"), preload("res://Sounds/SFX/Talking Sounds/tree_talk_4.wav"), preload("res://Sounds/SFX/Talking Sounds/tree_talk_5.wav"), preload("res://Sounds/SFX/Talking Sounds/tree_talk_6.wav"), preload("res://Sounds/SFX/Talking Sounds/tree_talk_7.wav"), preload("res://Sounds/SFX/Talking Sounds/tree_talk_8.wav"), preload("res://Sounds/SFX/Talking Sounds/tree_talk_9.wav"), preload("res://Sounds/SFX/Talking Sounds/tree_talk_10.wav")]

func _ready():
	stream = sounds.pick_random()
	pitch_scale = randf_range(0.5, 0.75)

func _process(_delta):
	if Global.talking:
		if !playing:
			play()
		autoplay = true
	else:
		stop()
		autoplay = false

func _on_finished():
	stream = sounds.pick_random()
	pitch_scale = randf_range(0.5, 0.75)
