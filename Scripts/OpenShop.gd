extends Button

const SHOP = preload("res://Scenes/Menus/shop.tscn")

func _process(_delta):
	text = str(Variables.SmallGrillBucks)

func _on_pressed():
	if not get_tree().get_first_node_in_group("Shop"):
		var new_shop = SHOP.instantiate()
		get_tree().root.call_deferred("add_child", new_shop)
