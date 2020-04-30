extends KinematicBody

export(NodePath) var pathToCollisionShape
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var speed = 230
var rotation_speed = 90
var moveDirection = Vector3(0, 0, 1)
var initial_rotation: Vector3
var initial_transform: Transform

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initial_rotation = self.rotation_degrees
	initial_transform = self.transform

func _process(delta: float) -> void:
	var rot_move = moveDirection.rotated(Vector3.RIGHT, deg2rad(self.initial_rotation.x)).rotated(Vector3.UP, deg2rad(self.initial_rotation.y)).rotated(Vector3.FORWARD, deg2rad(self.initial_rotation.z))
	
	
	move_and_collide(rot_move * speed * delta)
	
	var diff = (transform.origin - initial_transform.origin).length()
	if diff > 400:
		#print('distance destroyed')
		queue_free()
	#move_and_collide(initial_transform.origin * delta)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass





func _on_Area_body_entered(body: Node) -> void:
	if body.name == "enemy-bot":
		body.decrease_hp()
		queue_free()
	elif body.name == "player":
		pass
	else:
		queue_free()
	
