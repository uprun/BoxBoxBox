extends KinematicBody


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
export var speed = 600
var direction = Vector3()
var gravity = -9.8 
var velocity = Vector3()





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	
	if event is InputEventMouseMotion:
		var test = (event as InputEventMouseMotion).relative
		var total_x = get_viewport().size.x
		var total_y = get_viewport().size.y
		rotate_y(-PI * test.x / 1000 )

	if event is InputEventKey and event.pressed:
		#print(event.scancode,'-', event.unicode)
		pass


func _process(delta: float) -> void:
	
	direction = Vector3()
	if Input.is_key_pressed(KEY_A):
		direction.x += 1
	if Input.is_key_pressed(KEY_D):
		direction.x -= 1
	if Input.is_key_pressed(KEY_W):
		direction.z += 1
	if Input.is_key_pressed(KEY_S):
		direction.z -= 1
	direction = direction.normalized()
	direction = direction * speed * delta
	
	velocity.y += gravity * delta
	velocity.x = direction.x
	velocity.z = direction.z
	
	velocity = velocity.rotated(Vector3.UP, deg2rad(self.rotation_degrees.y))
	
	if velocity.y > 0:
		gravity = -20
	else:
		gravity = -30
	
	velocity = move_and_slide(velocity, Vector3.UP)
	
	if is_on_floor() and Input.is_key_pressed(KEY_SPACE):
		velocity.y = 10
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
