extends KinematicBody

export(NodePath) var pathToCollisionShape
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var speed = 60
var rotation_speed = 90
var moveDirection = Vector3(0, 0, 1)
var initial_rotation: Vector3
var initial_transform: Transform
var velocity = Vector3.ZERO
var maxTime = 5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initial_rotation = self.rotation_degrees
	initial_transform = self.transform
	velocity = initial_transform.basis.z.normalized() * speed

func _physics_process(delta: float) -> void:
	#velocity.y -= 19.8 * delta
	
	
	move_and_collide(velocity* delta)
	
	maxTime -= delta
	
	if maxTime < 0:
		queue_free()
	#move_and_collide(initial_transform.origin * delta)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass





func _on_Area_body_entered(body: Node) -> void:
	if body.name.find("enemy") >= 0 or body.name.find("player") >= 0:
		body.decrease_hp()
		queue_free()
	else:
		queue_free()
		
	
