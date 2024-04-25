extends Node

# A list to store all available words for the game.
var words: Array = []
var chosen_word: String
var default_words: Array = [
	"algorithm", "function", "variable", "loop", "array", "object",
	"class", "inheritance", "encapsulation", "polymorphism", "interface",
	"module", "package", "exception", "thread", "process", "synchronization",
	"memory"
]

func _ready() -> void:
	randomize()  # Initialize random number generator
	populate_words_with_defaults()  # Populate the words list with defaults
	set_chosen_word()  # Set a random word as the chosen word

# Populates the 'words' array with default words if it is empty
func populate_words_with_defaults() -> void:
	if words.size() == 0:
		words = default_words.duplicate()  # Duplicate to avoid modifying the original array

# Function to randomly select a word from the 'words' array.
func set_chosen_word() -> void:
	if words.size() > 0:
		var random_index = randi() % words.size()
		chosen_word = words[random_index].to_upper()
		print("Chosen word: ", chosen_word)  # Debug output to show chosen word
	else:
		print("No words available to choose.")

# Example of a function to add more words dynamically (e.g., from an external source)
func add_more_words(new_words: Array) -> void:
	words += new_words  # Append new words to the existing list
	print("Updated words list: ", words)
