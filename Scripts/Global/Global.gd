extends Node

enum rewards {Hydrate, Cheese, Dance}
enum emotions {Normal, Happy, Anger, Sad, Confusion}
var talking:bool

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		Variables.save_game()
		get_tree().quit()
