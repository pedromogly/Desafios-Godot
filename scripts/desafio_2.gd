extends CharacterBody2D

var speed := 200.0

func _ready():
	pass
	
func _physics_process(delta):
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_left"):
		velocity += Vector2.LEFT # (-1[x],0[y])
	if Input.is_action_pressed("ui_right"):
		velocity += Vector2.RIGHT # (1[x],0[y])
	if Input.is_action_pressed("ui_up"):
		velocity += Vector2.UP # (0[x],-1[y])
	if Input.is_action_pressed("ui_down"):
		velocity += Vector2.DOWN # (0[x],1[y]) 
		
	if velocity != Vector2.ZERO:
		velocity = velocity.normalized() * speed
	
	move_and_slide()
