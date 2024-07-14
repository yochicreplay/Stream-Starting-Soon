extends Button

const SHOP = preload("res://Scenes/Menus/shop.tscn")

func _process(_delta):
	text = str(Variables.SmallGrillBucks)

func _on_pressed():
	var new_shop = SHOP.instantiate()
	get_tree().root.call_deferred("add_child", new_shop)
