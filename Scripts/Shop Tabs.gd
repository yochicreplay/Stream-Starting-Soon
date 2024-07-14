extends HBoxContainer

@onready var rewards = $"../Rewards"
@onready var friends = $"../Friends"
@onready var tab_sound = %"Tab Sound"

func _ready():
	rewards.visible = true
	friends.visible = false

func _on_rewards_tab_pressed():
	rewards.visible = true
	friends.visible = false
	tab_sound.play()

func _on_friends_tab_pressed():
	rewards.visible = false
	friends.visible = true
	tab_sound.play()
