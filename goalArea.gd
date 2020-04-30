extends Area


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_x(deg2rad(60 * delta))
	rotate_y(deg2rad(60 * delta))


func _on_goalArea_body_entered(body: Node) -> void:
	if body.name == "player":
		queue_free()
	pass # Replace with function body.
