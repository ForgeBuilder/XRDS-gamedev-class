extends Node2D

@onready var security_camera : Camera2D = $"SubViewport/security camera"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var veiwport_tex : ViewportTexture = $"veiwport sprite".texture
	
	$SubViewport.world_2d = get_viewport().find_world_2d()
	security_camera.reparent(self)
	#veiwport_tex.viewport_path = get_viewport().get_path()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	security_camera.position = $"security camera transform".position
