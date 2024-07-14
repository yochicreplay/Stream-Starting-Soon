extends GridContainer

signal rewardBought(reward)

@onready var buy_sfx = $"Buy SFX"

func _ready():
	rewardBought.connect(get_tree().get_first_node_in_group("DialogueSystem").catchRewards)

func _on_hydrate_pressed():
	if Variables.SmallGrillBucks >= 100:
		rewardBought.emit(Global.rewards.Hydrate)
		buy_sfx.play()

func _on_cheese_pressed():
	if Variables.SmallGrillBucks >= 500:
		rewardBought.emit(Global.rewards.Cheese)
		buy_sfx.play()

func _on_dance_pressed():
	if Variables.SmallGrillBucks >= 1000:
		rewardBought.emit(Global.rewards.Dance)
		buy_sfx.play()
