extends Sprite2D
var allbodies = []
var velocity = Vector2.ZERO
var force = 0
var realpos = Vector2.ZERO
@onready var trail := $"../Trail3"
func _ready():
	
	#color
	self_modulate = Global.body3color
	
	#pos
	realpos = Vector2(Global.body3posx, Global.body3posy)
	print(Global.scale)
	allbodies = [$"../Body1", $"../Body2", $"../Body3"]
	self.scale = self.scale / Vector2(Global.zoom, Global.zoom)
	velocity = Global.body3velocity
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
		if distance < 1.0:
			continue #prevents crashes
		var direction = vector.normalized()
		if i == $"../Body2":
			#force equation
			force = ((Global.body2masskg * Global.body3masskg) / (distance * distance)) * Global.G
		else:
			force = ((Global.body1masskg * Global.body3masskg) / (distance * distance)) * Global.G
		var acceleration_vector = direction * force / Global.body3masskg
		acceleration += acceleration_vector
	velocity += acceleration * delta * Global.time
	realpos += velocity * delta * Global.time
	update_screen_pos()
func update_screen_pos():
	var screen_pos = realpos / Global.scale
	self.position = screen_pos
	var flipped_pos = screen_pos
	flipped_pos.y = -screen_pos.y
	add_trail_point(flipped_pos)

func add_trail_point(pos: Vector2):
	if trail.points.size() == 0 or trail.points[-1].distance_to(pos) > 2:
		trail.add_point(pos)
		print("Added trail point:", pos)
	if trail.points.size() > 400:
		trail.remove_point(0)
