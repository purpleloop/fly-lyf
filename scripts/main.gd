extends Node

@export var foodScene : PackedScene

func _ready():
	$larva.start($StartPosition.position)
	$backgroundMusic.play()
	$foodTimer.start()

func _on_larva_moved(delta):
	$background.scroll_base_offset -= Vector2(40,0)*delta

func _on_food_timer_timeout():

	$foodTimer.stop()

	var newFood = foodScene.instantiate()
	
	newFood.connect("decayEvent", Callable(self, "_on_food_decay_event"))
	
	var food_spawn_location = get_node("foodPath/foodSpawnLocation")
	food_spawn_location.progress_ratio = randf()
	
	print("food spawned in "+str(food_spawn_location.progress_ratio))
	
	newFood.position = food_spawn_location.position
		
	add_child(newFood)

func _on_food_decay_event():
	print("decayEvent -> restart timer")
	$foodTimer.start()	

func _on_larva_grabbed():
	print("grabbed food")
