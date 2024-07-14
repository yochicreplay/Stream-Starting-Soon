extends GridContainer

signal rewardBought(reward)

func _ready():
	rewardBought.connect(get_tree().get_first_node_in_group("DialogueSystem").catchRewards)

func _on_hydrate_pressed():
	rewardBought.emit(Global.rewards.Hydrate)

func _on_cheese_pressed():
	rewardBought.emit(Global.rewards.Cheese)

func _on_dance_pressed():
	rewardBought.emit(Global.rewards.Dance)
