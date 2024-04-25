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

func _process(delta: float) -> void:
	var histogram: Dictionary = {}
	for word in words:
		if histogram.has(word):
			histogram[word] += 1
		else:
			histogram[word] = 1
	words = histogram.keys()

# Function to randomly select a word from the 'words' array.
func set_chosen_word_randomly():
	var words_count := words.size()
	if words_count == 0:
		chosen_word = ""
	var random_word_index := randi() % words_count
	chosen_word = words[random_word_index]

# Function to populate the 'words' array from a dictionary file.
func populate_words():
	var dictionary: FileAccess = utility.open_dictionary()
	while dictionary.get_position() < dictionary.get_length():
		words.append(dictionary.get_line().strip_edges())

# Function to set 'chosen_word' randomly and convert it to uppercase.
func set_chosen_word() -> void:
	var random_index = randi() % words.size()
	chosen_word = words[random_index].to_upper()
