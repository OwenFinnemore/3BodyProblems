extends Node


#Body 1 vars
var body1masskg: float = 1.989e30
var body1color = Color.from_rgba8(255, 0, 0, 255)
var body1posx = 0 #m
var body1posy = 0 #m
var body1velocity = Vector2(0, 0)
#Body 2 vars
var body2masskg: float = 5.972e24
var body2color = Color.from_rgba8(0, 0, 255, 255)
var body2posx = 149600000000.0 #m
var body2posy = 0.0 #m
var body2velocity = Vector2(0, 29780)
#Body 3 vars
var body3masskg: float= 6.4171e23
var body3color = Color.from_rgba8(0, 255, 0, 255)
var body3posx = 2.279e11 #m
var body3posy = 0.0 #m
var body3velocity = Vector2(0, 24130.0)
#scale
var scale: float = 1.0
var zoom: float = 1.0
#gravitational constant
var G: float = 6.67e-11

#Time scale
var time = 1
