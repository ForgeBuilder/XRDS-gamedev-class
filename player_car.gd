extends RigidBody2D

const SPEED = 200
const TURN_SPEED = 8000
const drift_factor = 0.8
const brake_factor = 0.95

@export var diolouge_text_box : Label

var turn_input : float

func _physics_process(delta: float) -> void:
	
	apply_central_force(Vector2.UP.rotated(self.rotation)*SPEED*Input.get_axis("ui_down","ui_up"))
	
	turn_input = Input.get_axis("ui_left","ui_right")*0.01*sqrt(linear_velocity.length())/4
	
	#apply_torque()
	
	

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var forward_velocity = transform.y * state.linear_velocity.dot(transform.y)
	var right_velocity = transform.x * state.linear_velocity.dot(transform.x)
	
	state.linear_velocity = forward_velocity + right_velocity*drift_factor
	state.transform = state.transform.rotated_local(turn_input)
	
	if Input.is_action_pressed("ui_accept"):
		state.linear_velocity = state.linear_velocity*brake_factor
