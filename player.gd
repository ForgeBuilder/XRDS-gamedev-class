extends CharacterBody2D

@onready var diolouge_text_box = $Diolouge_text

func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	
	var x = Input.get_axis("ui_left","ui_right")
	var y = Input.get_axis("ui_up","ui_down")

	velocity = Vector2(x,y)*200
	
	if (velocity.length() > 0):
		self.diolouge_text_box.text = ""

	move_and_slide()
