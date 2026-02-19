extends RigidBody2D

const SPEED = 200
const TURN_SPEED = 5000
const drift_factor = 0.2
const brake_factor = 0.95

@onready var diolouge_text_box = $Diolouge_text

func _physics_process(delta: float) -> void:
	
	apply_central_force(Vector2.UP.rotated(self.rotation)*SPEED*Input.get_axis("ui_down","ui_up"))
	
	apply_torque(Input.get_axis("ui_left","ui_right")*TURN_SPEED)
	
	

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var forward_velocity = transform.y * state.linear_velocity.dot(transform.y)
	var right_velocity = transform.x * state.linear_velocity.dot(transform.x)
	
	state.linear_velocity = forward_velocity + right_velocity*drift_factor
	
	if Input.is_action_pressed("ui_accept"):
		state.linear_velocity = state.linear_velocity*brake_factor
