extends CharacterBody2D

var speed := 200.0
@onready var label = $"../Label"
@onready var label_2 = $"../Label2"

var mouse_position = Vector2.ZERO

func _physics_process(delta):
	mouse_position = get_global_mouse_position()
	var direction = mouse_position - global_position
	var angulo = atan2(direction.y,direction.x)
	rotation = angulo
	
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("w"):
		velocity += Vector2.UP
	if Input.is_action_pressed("s"):
		velocity += Vector2.DOWN
	if Input.is_action_pressed("a"):
		velocity += Vector2.LEFT
	if Input.is_action_pressed("d"):
		velocity += Vector2.RIGHT
	velocity = velocity.normalized() * speed
	
	var graus = int(rad_to_deg(angulo))
	label.text = "direction: "+str(direction)
	label_2.text = "angulo: "+str(graus)
	move_and_slide()
