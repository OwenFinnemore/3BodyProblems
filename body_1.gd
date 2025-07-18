extends Sprite2D
var force = 0
var allbodies = []
var velocity = Vector2.ZERO
var realpos = Vector2.ZERO
@onready var trail := $"../Trail1"
func _ready():
	#color
	self_modulate = Global.body1color
	#pos
	realpos = Vector2(Global.body1posx, Global.body1posy)
	print(Global.scale)
	allbodies = [$"../Body1", $"../Body2", $"../Body3"]
	self.scale = self.scale / Vector2(Global.zoom, Global.zoom)
	update_screen_pos()
	velocity = Global.body1velocity
	print(Global.body1velocity)
	trail.width = 1.5
	trail.default_color = Color.WHITE
	trail.z_index = 10
	trail.global_position = Vector2(1152/2, 648/2)

func _process(delta: float) -> void:
	#calculate force
	var acceleration = Vector2.ZERO
	for i in allbodies:
		if i == null or i == self:
			continue
		var vector = i.realpos - realpos
		var distance = vector.length()
		var direction = vector.normalized()
		if i == $"../Body2":
			#force equation
			force = ((Global.body2masskg * Global.body1masskg) / (distance * distance)) * Global.G
		else:
			force = ((Global.body3masskg * Global.body1masskg) / (distance * distance)) * Global.G
		var acceleration_vector = direction * (force / Global.body1masskg)
		acceleration += acceleration_vector
	velocity += acceleration * delta * Global.time
	realpos += velocity * delta * Global.time
	update_screen_pos()

func update_screen_pos():
	var screen_pos = realpos / Global.scale
	self.position = screen_pos
	var flipped_pos = screen_pos
	# Flip the Y coordinate to compensate for flipped scale
	flipped_pos.y = -screen_pos.y
	add_trail_point(flipped_pos)

func add_trail_point(pos: Vector2):
	if trail.points.size() == 0 or trail.points[-1].distance_to(pos) > 2:
		trail.add_point(pos)
	if trail.points.size() > 400:
		trail.remove_point(0)
