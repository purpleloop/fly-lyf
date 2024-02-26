extends RigidBody2D

signal decayEvent

func _ready():
	var foodType = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(foodType[randi() % foodType.size()])
	$decayTimer.start()

func _on_decay_timer_timeout():
	print("decayTimer timeoud -> destroy and emit decay")	
	queue_free()
	decayEvent.emit()
