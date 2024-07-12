extends CharacterBody3D

const sprint = 20
const speed = 7.5
const JUMP_VELOCITY = 17
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity") * 3.5
var LOOKAROUND_SPEED = 0.001
var rot_x = 0
var rot_y = 0
@export var player := 1 :
	set(id):
		player = id
		# Give authority over the player input to the appropriate peer.
		$InputSync.set_multiplayer_authority(id)

@onready var input = $InputSync

func _physics_process(delta):
	gravityuse(delta)
	jump(delta)
	movement(delta)
	head_look()

func _ready():
	if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func gravityuse(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

func jump(delta):
	if Input.is_action_just_pressed("jumping") and is_on_floor():
		velocity.y = JUMP_VELOCITY

func movement(delta):
	var input_dir = Input.get_vector("left", "right", "foward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if Input.is_action_pressed("sprint"):
		if direction:
			velocity.x = direction.x * sprint
			velocity.z = direction.z * sprint
		else:
			velocity.x = move_toward(velocity.x, 0, sprint)
			velocity.z = move_toward(velocity.z, 0, sprint)
	else:
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
			velocity.z = move_toward(velocity.z, 0, speed)
	move_and_slide()


func _input(event):
	if event is InputEventMouseMotion:
		rot_x -= event.relative.x * LOOKAROUND_SPEED
		rot_y += event.relative.y * LOOKAROUND_SPEED
		
func head_look():
	self.rotate_y(rot_x)
	$Xaxis/Yaxis.rotate_x(-rot_y)
	$Xaxis/Yaxis.rotation.x = clampf($Xaxis/Yaxis.rotation.x,-1.2,1.2)
	rot_x = 0
	rot_y = 0
