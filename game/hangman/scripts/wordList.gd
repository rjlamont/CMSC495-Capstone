extends Node

# A list to store all available words for the game.
var words: Array[String] = []

# The currently selected word that players need to guess.
var chosen_word: String

# Function to randomly select a word from the 'words' array.
func set_chosen_word_randomly():

	# Calculate the number of words in the 'words' array.
	var words_count := words.size()

	# If there are no words available, set 'chosen_word' to an empty string.
	if words_count == 0:
		chosen_word = ""

	# Generate a random index based on the number of words.
	var random_word_index := randi() % words_count

	# Set 'chosen_word' to the word at the randomly selected index.
	chosen_word = words[random_word_index]

# Function to populate the 'words' array from a dictionary file.
func populate_words():
	var dictionary: FileAccess = Utility.open_dictionary()
	while dictionary.get_position() < dictionary.get_length():
		words.append(dictionary.get_line().strip_edges())

# Function to set 'chosen_word' randomly and convert it to uppercase.
func set_chosen_word() -> void:

	# Randomly select an index from the 'words' array.
	var random_index = randi() % words.size()

	# Set 'chosen_word' to the word at the random index, converted to uppercase.
	chosen_word = words[random_index].to_upper()
