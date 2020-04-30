extends Spatial


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$ColorRect.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_ENTER):
		get_tree().reload_current_scene()
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if Input.is_key_pressed(KEY_ESCAPE):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().quit()


func _on_Area_body_entered(body: Node) -> void:
	if body.name == "ball":
		print("you win!")
		$ColorRect.show()
