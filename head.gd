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
		var change = PI * test.y/1000
		#cast
		if rotation_degrees.x < 45 && change > 0 :
			rotate_x( change )
		if rotation_degrees.x > -65 && change < 0:
			rotate_x(change)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
