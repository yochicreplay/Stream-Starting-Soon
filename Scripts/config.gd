extends Control

func _on_exit_config_pressed():
	queue_free()

func _on_progress_bar_value_changed(value):
	Variables.SoundEffectsVolume = value
