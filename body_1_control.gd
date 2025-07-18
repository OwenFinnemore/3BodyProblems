extends Control

var unitmultiplier = 0.001
var posxunitmultiplier = 0.001
var posyunitmultiplier = 0.001

func _ready():
	$body1massnumber.connect("text_changed", Callable(self, "_on_text_changed"))
	$posxnumber.connect("text_changed", Callable(self, "_xpos_changed"))
	$posynumber.connect("text_changed", Callable(self, "_ypos_changed"))

func _on_text_changed(new_text):
	# Remove all non numbers
	var filtered = ""
	for c in new_text:
		if c >= "0" and c <= "9" or c == "-":
			filtered += c
	if $body1massnumber.text != filtered:
		$body1massnumber.text = filtered
	Global.body1masskg = unitmultiplier * int($body1massnumber.text)
	print(Global.body1masskg)
#set mass unit
func _on_body_1_massunit_item_selected(index: int) -> void:
	unitmultiplier = 10 ** ((index as float - 1) * 3)
	Global.body1masskg = unitmultiplier * int($body1massnumber.text)
	print(Global.body1masskg)

func _on_body_1_color_color_changed(color: Color) -> void:
	Global.body1color = color

func _xpos_changed(new_text):
	# Remove all non numbers
	var filtered = ""
	for c in new_text:
		if c >= "0" and c <= "9" or c == "-":
			filtered += c
	if $posxnumber.text != filtered:
		$posxnumber.text = filtered
	Global.body1posx = posxunitmultiplier * int($posxnumber.text)
	print(Global.body1posx)

func _on_posxunit_item_selected(index: int) -> void:
	posxunitmultiplier = 10 ** ((index as float - 1) * 3)
	Global.body1posx = posxunitmultiplier * int($posxnumber.text)
	print(Global.body1posx)

func _ypos_changed(new_text):
	# Remove all non numbers
	var filtered = ""
	for c in new_text:
		if c >= "0" and c <= "9" or c == "-":
			filtered += c
	if $posynumber.text != filtered:
		$posynumber.text = filtered
	Global.body1posy = posyunitmultiplier * int($posynumber.text)
	print(Global.body1posy)

func _on_posyunit_item_selected(index: int) -> void:
	posyunitmultiplier = 10 ** ((index as float - 1) * 3)
	Global.body1posy = posyunitmultiplier * int($posynumber.text)
	print(Global.body1posy)

func _on_xvelocity_text_changed(new_text: String) -> void:
	# Remove all non numbers
	var filtered = ""
	for c in new_text:
		if c >= "0" and c <= "9" or c == "-" or c == ".":
			filtered += c
	if $xvelocity.text != filtered:
		$xvelocity.text = filtered
	Global.body1velocity.x = filtered.to_float()


func _on_yvelocity_text_changed(new_text: String) -> void:
	# Remove all non numbers
	var filtered = ""
	for c in new_text:
		if c >= "0" and c <= "9" or c == "-" or c == ".":
			filtered += c
	if $yvelocity.text != filtered:
		$yvelocity.text = filtered
	Global.body1velocity.y = filtered.to_float()
