extends Control

@export var levelscene : PackedScene

#you don't need this vv if you have only one level
@export var level2scene : PackedScene

var world : Node

func _on_level_1_pressed() -> void:
	if world != null:
		world.queue_free()
	world = levelscene.instantiate()
	get_tree().get_root().add_child(world)
	$CanvasLayer.hide()
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		$CanvasLayer.show() 

# you don't need this vvv if you don't have multiple levels

func _on_level_2_pressed() -> void:
	if world != null:
		world.queue_free()
	world = level2scene.instantiate()
	get_tree().get_root().add_child(world)
	$CanvasLayer.hide()
