extends Control

# Node references to various UI elements
@onready var itemlist := $MarginContainer/VBoxContainer/MarginContainer/ScrollContainer/ItemList
@onready var delete := $MarginContainer/VBoxContainer/HBoxContainer2/Delete
@onready var textbox := $MarginContainer/VBoxContainer/HBoxContainer/InputBox
@onready var wordcount := $MarginContainer/VBoxContainer/HBoxContainer/WordCount
@onready var add_button := $MarginContainer/VBoxContainer/HBoxContainer/Add

# Arrays to track words added and deleted during the current session.
var added_words: Array[String] = []
var deleted_words: Array[String] = []

# Called when the node is added to the scene; initializes the item list.
func _ready() -> void:
	update_itemlist()

# Called every frame; updates UI elements based on current state.
func _process(delta: float) -> void:

	# Enable or disable the delete button based on selection in the item list.
	if itemlist.is_anything_selected():
		delete.disabled = false
	else:
		delete.disabled = true
	
	# Update the word count display.
	wordcount.text = str(WordList.words.size()) + " Words"
	
	# Check for an 'accept' action (default is Enter key) when textbox is focused.
	if Input.is_action_just_pressed("ui_accept") and get_viewport().gui_get_focus_owner() == textbox:
		add_button.emit_signal("pressed")

# Refreshes the list of words displayed in the UI.
func update_itemlist() -> void:
	itemlist.clear()
	for word in WordList.words:
		itemlist.add_item(word)

# Handler for the 'Add' button; adds a word from the textbox to the word list.
func _on_add_pressed() -> void:
	var word = textbox.get_line(0).strip_edges()
	if !WordList.words.has(word):
		WordList.words.append(word)
		added_words.append(word)
	update_itemlist()
	textbox.text = ""

# Handler for the 'Back' button; rolls back changes if any and returns to main menu.
func _on_back_pressed() -> void:
	for word in added_words:
		var index = WordList.words.find(word)
		WordList.words.remove_at(index)
	for word in deleted_words:
		WordList.words.append(word)
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")

# Handler for the 'Delete' button; deletes selected words from the word list.
func _on_delete_pressed() -> void:
	var selected_words = itemlist.get_selected_items()
	for words in selected_words:
		deleted_words.append(itemlist.get_item_text(words))
		WordList.words.remove_at(WordList.words.find(itemlist.get_item_text(words)))
	update_itemlist()

# Handler for the 'Apply' button; saves changes and returns to the main menu.
func _on_apply_pressed() -> void:
	Utility.save_dictionary()
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")


func _on_tree_entered() -> void:
	if itemlist != null:
		update_itemlist()
