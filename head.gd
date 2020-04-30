extends MeshInstance


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	
	if event is InputEventMouseMotion:
		var test = (event as InputEventMouseMotion).relative
		rotate_x(PI * test.y/1000 )

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
