extends Control

# Called when the node is added to the scene; it initializes the word_list.
func _ready() -> void:
	word_list.populate_words_with_defaults()

# Handler for when the 'Start' button is pressed.
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_main.tscn")

# Handler for when the 'Edit' button is pressed.
func _on_edit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/edit.tscn")

# Handler for when the 'Quit' button is pressed.
func _on_quit_pressed() -> void:
	get_tree().quit()
