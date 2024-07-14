extends HBoxContainer

@onready var rewards = $"../Rewards"
@onready var friends = $"../Friends"

func _ready():
	rewards.visible = true
	friends.visible = false

func _on_rewards_tab_pressed():
	rewards.visible = true
	friends.visible = false

func _on_friends_tab_pressed():
	rewards.visible = false
	friends.visible = true
