extends MeshInstance


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
onready var BULLET = preload("res://fire-cube.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if (event as InputEventMouseButton).button_index == BUTTON_LEFT and event.pressed:
			var bullet = BULLET.instance()
			bullet.transform = global_transform.translated(global_transform.basis.z.normalized() * 2)
			get_node("/root/game").add_child(bullet)


func _physics_process(delta: float) -> void:
	#rotate_x(deg2rad(60 * delta))
	#rotate_y(deg2rad(60 * delta))
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
