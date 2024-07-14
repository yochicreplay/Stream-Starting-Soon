extends PanelContainer

@onready var animation_player = $AnimationPlayer

func _ready():
	visible = true
	animation_player.play("Start stream")
