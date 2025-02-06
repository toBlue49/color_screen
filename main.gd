extends Control

var cmdline_args_count = 0
var hex_color_args_num = 0
var icon_args_num = 0
var title_args_num = 0
var icon_image = Image.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print (OS.get_cmdline_args())
	for n in OS.get_cmdline_args():
		cmdline_args_count += 1
		print(cmdline_args_count)
		
		if n == "--color":
			hex_color_args_num = cmdline_args_count + 1
		if cmdline_args_count == hex_color_args_num:
			$ColorRect.color = Color.html(n)
		
		if n == "--icon":
			icon_args_num = cmdline_args_count + 1
		if cmdline_args_count == icon_args_num:
			DisplayServer.set_icon(icon_image.load_from_file(n))
			
		if n == "--title":
			title_args_num = cmdline_args_count + 1
		if cmdline_args_count == title_args_num:
			DisplayServer.window_set_title(n)
	
