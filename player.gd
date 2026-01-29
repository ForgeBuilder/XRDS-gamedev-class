extends CharacterBody2D

func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	
	var x = Input.get_axis("ui_left","ui_right")
	var y = Input.get_axis("ui_up","ui_down")
	
	velocity = Vector2(x,y)*100

	move_and_slide()
