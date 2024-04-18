extends Control

# Called when the node is added to the scene; it initializes the WordList.
func _ready() -> void:
	WordList.populate_words()

# Handler for when the 'Start' button is pressed.
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/hangman.tscn")

# Handler for when the 'Edit' button is pressed.
func _on_edit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/edit.tscn")

# Handler for when the 'Quit' button is pressed.
func _on_quit_pressed() -> void:
	get_tree().quit()
