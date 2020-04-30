extends Spatial


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	$ExitRect.hide()
	$PlayRect.hide()
	$RestartRect.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		$ExitRect.show()
		$PlayRect.show()
		$RestartRect.show()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

