extends Area2D

func _on_body_entered(body: Node2D) -> void:
	$Label.visible = true
	print("enter")

func _on_body_exited(body: Node2D) -> void:
	$Label.visible = false
	print("exit")
	#body.diolouge_text_box.text = ""

func _process(delta: float) -> void:
	if len(get_overlapping_bodies()) > 0:
		if Input.is_action_just_pressed("interact"):
			get_node("/root/Node/CanvasLayer/Diolouge_text").text = "Have you ever noticed we all look the same?"
			
			#$Label.text = 

#func _on_timer_timeout() -> void:
	#get_overlapping_bodies()[0].diolouge_text_box.text = ""
