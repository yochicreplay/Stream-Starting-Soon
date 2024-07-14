extends HBoxContainer

@onready var initial_click_sound = %"Initial Click"
@onready var start_game_animation = %"Start Game Animation"

const CONFIG = preload("res://Scenes/Menus/config.tscn")

func _process(_delta):
	initial_click_sound.volume_db = Variables.SoundEffectsVolume

func _on_config_pressed():
	initial_click_sound.play()
	if !get_tree().get_first_node_in_group("Config"):
		var new_config = CONFIG.instantiate()
		get_tree().root.call_deferred('add_child', new_config)

func _on_play_pressed():
	initial_click_sound.play()
	start_game_animation.play("Start Game")

func _on_close_pressed():
	initial_click_sound.play()
	Variables.save_game()
	get_tree().quit()

func _on_start_game_animation_animation_finished(_anim_name):
	get_tree().change_scene_to_file("res://Scenes/stream_site.tscn")
