class_name PointMessage extends RichTextLabel

func _ready():
	meta_clicked.connect(get_parent().handle)
	meta_clicked.connect(_die)

func _die(_command):
	queue_free()
