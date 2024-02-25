extends Node

func _ready():
	$larva.start($StartPosition.position)
	$backgroundMusic.play()
	

func _on_larva_moved(delta):
	$background.scroll_base_offset -= Vector2(40,0)*delta

