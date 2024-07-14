extends CharacterBody2D

const SPEED = 3000.0
var firstposition

@onready var animation_player = $AnimationPlayer

func _play_anim(AnimationPlayerNode:AnimationPlayer, animation):
	if AnimationPlayerNode.current_animation != animation:
		AnimationPlayerNode.play(animation)

func _ready():
	firstposition = randf_range(0, 1080)
	_play_anim(animation_player, "Shine")

func _physics_process(delta):
	velocity.x = SPEED * delta
	position.y = firstposition + sin(position.x / 25) * 50
	move_and_slide()

func _on_texture_button_button_down():
	Variables.SmallGrillBucks += 50
	queue_free()
