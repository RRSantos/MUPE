extends RichTextLabel


export var max_char_count = 150
export var char_velocity = 50

signal more_text_to_display
var more_text_to_display_emmited = false

var textToShow = ""
const CHARS_TO_BREAK_TEXT = ["\n", ".", "?", "!", ",", " "]

func continue_animated_text():
	more_text_to_display_emmited = false
	if textToShow.length() > 0:
		show_animated_text(textToShow)
	
func show_animated_text(new_text):
	more_text_to_display_emmited = false
	text = _get_splitted_text(new_text)
	percent_visible = 0

func _get_position_to_split_text(text_to_split):
	for c in CHARS_TO_BREAK_TEXT:
		var last_space_before_max_char_count = text_to_split.rfind(c, max_char_count)
		if last_space_before_max_char_count > -1:
			return last_space_before_max_char_count
				
	return text_to_split.length()
	
func _get_splitted_text(text_to_split):
	if text_to_split.length() <= max_char_count:
		textToShow = ""
		return text_to_split
	else:
		var position_to_break_text = _get_position_to_split_text(text_to_split)
		textToShow = text_to_split.right(position_to_break_text)
		var left_text = text_to_split.left(position_to_break_text)
		return  left_text
		 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	



func _process(delta):
	if percent_visible < 1:
		percent_visible += char_velocity*delta/text.length()
	elif textToShow.length() > 0 and !more_text_to_display_emmited:
		emit_signal("more_text_to_display")
		more_text_to_display_emmited = true
		#print("Pausa atingida")
		#todo: disparar evento!
		#continue_animated_text()
