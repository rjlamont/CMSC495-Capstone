// words
const words = [
    "algorithm", "function", "variable", "loop", "array", "boolean", "string", "integer", "float",
    "exception", "pointer", "recursion", "binary", "syntax", "compile", "debugging", "inheritance",
    "encapsulation", "abstraction", "polymorphism", "interface", "constructor", "destructor",
    "method", "module", "library", "framework", "database", "devops", "agile", "scrum", "kanban",
    "github", "markdown", "asynchronous", "callback", "closure", "prototype", "promise", "event",
    "event loop", "concurrency", "parallelism", "deadlock", "race condition", "mutex", "semaphore",
    "thread", "process", "thread pool", "dead code", "refactoring", "code smell", "unit test",
    "integration test", "regression test", "sprint"
];

// definitions
const wordDefinitions = {
    "algorithm": "A step-by-step procedure to solve a problem.",
    "variable": "A container for storing data values.",
    "function": "A block of reusable code that performs a specific task.",
    "array": "A data structure that stores a collection of elements.",
    "boolean": "A data type that represents true or false values.",
    "loop": "A control flow statement that executes a block of code repeatedly.",
    "string": "A sequence of characters.",
    "integer": "A data type representing whole numbers.",
    "float": "A data type representing numbers with a fractional part.",
    "exception": "An error that occurs during the execution of a program.",
    "pointer": "A variable that stores the memory address of another variable.",
    "recursion": "A programming technique where a function calls itself.",
    "binary": "A numbering system with a base of 2.",
    "syntax": "The rules that govern the structure of statements in a programming language.",
    "compile": "The process of translating source code into machine code.",
    "debugging": "The process of finding and fixing errors in a program.",
    "inheritance": "A mechanism in OOP where a class can inherit properties and behaviors from another class.",
    "encapsulation": "The bundling of data and methods that operate on the data into a single unit.",
    "abstraction": "The process of hiding the implementation details and showing only the essential features of an object.",
    "polymorphism": "The ability of a single interface to represent multiple underlying data types.",
    "interface": "A contract that specifies the methods a class must implement.",
    "constructor": "A special type of method used to initialize objects.",
    "destructor": "A special type of method used to destroy objects.",
    "method": "A function associated with a class or object.",
    "module": "A self-contained unit of code that can be reused and imported into other modules.",
    "library": "A collection of reusable code and resources.",
    "framework": "A reusable, prewritten code or set of libraries that provide generic functionality.",
    "database": "A structured set of data stored and organized for easy access and retrieval.",
    "devops": "A set of practices that combines software development and IT operations to shorten the systems development life cycle and provide continuous delivery with high software quality.",
    "agile": "A set of principles for software development under which requirements and solutions evolve through the collaborative effort of self-organizing cross-functional teams.",
    "scrum": "An Agile framework for completing complex projects, typically used in software development.",
    "kanban": "A method for managing knowledge work with an emphasis on just-in-time delivery while not overloading the team members.",
    "github": "A web-based platform for hosting and collaborating on Git repositories.",
    "markdown": "A lightweight markup language with plain-text formatting syntax.",
    "asynchronous": "A programming pattern that allows operations to run separately from the main program flow.",
    "callback": "A function passed as an argument to another function, to be executed later.",
    "closure": "A function bundled together with its lexical environment.",
    "prototype": "An object used as a template from which to create other objects.",
    "promise": "An object representing the eventual completion or failure of an asynchronous operation.",
    "event": "A signal that indicates that something has happened.",
    "event loop": "A mechanism that waits for and dispatches events or messages in a program.",
    "concurrency": "The ability of different parts or units of a program to be executed out-of-order or in partial order.",
    "parallelism": "The simultaneous execution of multiple tasks.",
    "deadlock": "A situation where two or more processes are unable to proceed because each is waiting for the other to do something.",
    "race condition": "A situation in which the behavior of a program depends on the timing of uncontrollable events.",
    "mutex": "A synchronization primitive used to control access to a shared resource by multiple threads.",
    "semaphore": "A synchronization primitive that restricts the number of simultaneous users of a shared resource.",
    "thread": "The smallest unit of execution that can be scheduled by an operating system.",
    "process": "An instance of a computer program that is being executed.",
    "thread pool": "A collection of threads that are created once and reused for multiple tasks.",
    "dead code": "Code that is never executed.",
    "refactoring": "The process of restructuring existing computer code without changing its external behavior.",
    "code smell": "A surface indication that usually corresponds to a deeper problem in the system.",
    "unit test": "A piece of code that tests a specific unit of functionality.",
    "integration test": "Testing performed to examine the behavior of components when integrated together.",
    "regression test": "Testing performed to verify that a recent program or code change has not adversely affected existing features.",
    "sprint": "A short, time-boxed period during which a specific task must be completed and made ready for review."
};

// game state var.
let selectedWord, selectedDefinition;
let guessedLetters, wrongGuesses, attempts;

// max allowed incorrect guesses.
const maxAttempts = 6;

// paths to images corresponding to different stages of hangman.
const hangmanImages = [
    'images/hangman/HangmanPole.png',
    'images/hangman/HangmanPoleWithHead.png',
    'images/hangman/HangmanPoleWithHeadAndBody.png',
    'images/hangman/HangmanPoleWithHeadAndBodyAndLeftHand.png',
    'images/hangman/HangmanPoleWithHeadAndBodyAndBothHands.png',
    'images/hangman/HangmanPoleWithHeadAndBodyAndBothHandsAndLeftLeg.png',
    'images/hangman/HangmanPoleWithHangMan.png'
];


// added to handle wrong guesses and initialize and now claling correct html for funcitonality
function updateWrongGuesses() {
    const wrongGuessesElement = document.getElementById('wrongGuesses');
    console.log(wrongGuessesElement);
    if (wrongGuessesElement !== null) {
        wrongGuessesElement.textContent = 'Wrong guesses: ' + wrongGuesses.join(', ');
    } else {
        console.error('Wrong guesses display element not found!');
    }
}


// init game once the HTML document has fully loaded.
document.addEventListener('DOMContentLoaded', initializeGame);

// init game by setting game state and updating UI components.
function initializeGame() {
    try{
        // select random word from list.
        const randomIndex = Math.floor(Math.random() * words.length);
        selectedWord = words[randomIndex];
        selectedDefinition = wordDefinitions[selectedWord];

        // reset game state.
        guessedLetters = [];
        wrongGuesses = [];
        attempts = 0;

        // init UI components.
        createLetterButtons();
        updateWordDisplay();
        updateHangmanImage();
        updateWrongGuesses();
    } catch (error) {
            console.error('Error Initializing game:', error);
    }
}

// creates/displays letter buttons for user interaction.
function createLetterButtons() {
    // define alphabet for buttons 
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const letterContainer = document.getElementById('letterButtons');
    letterContainer.innerHTML = '';

    // create button for each letter in alph
    letters.split('').forEach(letter => {
        const button = document.createElement('button');
        button.textContent = letter;
        button.id = 'letter-' + letter;
        button.onclick = function() { handleGuess(letter); };
        letterContainer.appendChild(button);
    });
}

// hanles guessess, added console logging and try/catch for troubleshooting....

function handleGuess(letter) {
    try {
        console.log('Guessed letter:', letter);
        console.log('Current state:', { guessedLetters, wrongGuesses, attempts });
        
        const button = document.getElementById('letter-' + letter);
        button.disabled = true;

        if (selectedWord.toUpperCase().includes(letter)) {
            if (!guessedLetters.includes(letter)) {
                guessedLetters.push(letter);
            }
            button.style.backgroundColor = '#D3D3D3';
            updateWordDisplay();
        } else {
            if (!wrongGuesses.includes(letter)) {
                wrongGuesses.push(letter);
                attempts++;
                button.style.backgroundColor = 'red';
                updateHangmanImage();
                updateWrongGuesses();
            }
        }
        checkGameOver();
    } catch (error) {
        console.error('Error handling guess:', error, { guessedLetters, wrongGuesses, attempts });
    }
}


// updates display of word with correctly guessed letters.
function updateWordDisplay() {
    const wordDisplay = document.getElementById('wordDisplay');
    wordDisplay.innerText = selectedWord.split('').map(letter => 
        guessedLetters.includes(letter.toUpperCase()) ? letter : '_'
    ).join(' ');
}

// checks if game has ended by winning or losing.
function checkGameOver() {
    const wordDisplay = document.getElementById('wordDisplay').innerText.replace(/\s+/g, '');
    if (!wordDisplay.includes('_')) {
        // If no blanks, player wins.
        alert(`Congratulations! You won! The word was "${selectedWord}". Definition: ${selectedDefinition}`);
        initializeGame();
    } else if (attempts >= maxAttempts) {
        // If max number of attempts is reached, update image before showing the game over alert.
        updateHangmanImage();
        
        // Delay the game over alert to allow the image to update on the screen.
        setTimeout(() => {
            alert(`Game Over! The correct word was "${selectedWord}". Definition: ${selectedDefinition}`);
            initializeGame();
        }, 500); // Delay of 500 milliseconds (0.5 seconds)
    }
}


// updates hangman image to reflect current number of incorrect guesses.
function updateHangmanImage() {
    const hangmanImage = document.querySelector('.hangman-images');
    if (attempts <= maxAttempts) {
        hangmanImage.src = hangmanImages[attempts];
    }
}

// handles logic when player submits fullword guess.
function submitFullWordGuess() {
    const fullWordGuess = document.getElementById('fullWordGuess');
    const guess = fullWordGuess.value.toLowerCase();
    fullWordGuess.value = '';

    if (guess === selectedWord) {
        // If the guess is correct, the player wins.
        guessedLetters = selectedWord.split('');
        updateWordDisplay();
        alert(`Congratulations! You guessed the word: ${selectedWord}. Definition: ${selectedDefinition}`);
        initializeGame();
    } else {
        // uncorrect fullword guesses count as a failed attempt(s).
        attempts++;
        updateHangmanImage();
        checkGameOver();
    }
}
