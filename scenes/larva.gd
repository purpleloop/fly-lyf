extends Area2D

@export  var speed = 20
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size=get_viewport_rect().size
	#hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1		
	
	if velocity.length()>0:
		velocity=velocity.normalized()*speed;
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

	if velocity.x > 0:
		$AnimatedSprite2D.animation="right"
	elif velocity.x < 0:
		$AnimatedSprite2D.animation="left"

func start(pos):
	position=pos
	show()

