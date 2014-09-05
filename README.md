# Overview

Keystrokes visualizes keyboard keys as a hint under tutorials or how-to videos, written in Coffeescript. 

![Keystroke in action](https://raw.github.com/DangerCove/Keystroke/master/screenshots/OMG.gif)

# Setup

Get these two files:

* [dist/scripts/dcokeystroke.min.js](https://raw.github.com/DangerCove/Keystroke/master/dist/scripts/dcokeystroke.min.js)
* [dist/styles/dcokeystroke.min.css](https://raw.github.com/DangerCove/Keystroke/master/dist/styles/dcokeystroke.min.css)

And add them to your project.

# Usage

Add both the JavaScript and CSS to your project.

    <link rel="stylesheet" href="styles/dcokeystroke.min.css">
    <script src="scripts/dcokeystrokes.min.js"></script>

Create a new element in your HTML.

    <div id="keystroke" class="keystroke"></div>

Activate it using Javascript.

    keystroke = new DCOKeystroke(document.getElementById('keystroke'));
    // First parameter: characters to display.
    // Second parameter: delay between characters.
    keystroke.type("OMG! It. Just. Works!", 500);

# Customization

## Design

Check [the CSS](https://raw.github.com/DangerCove/Keystroke/master/app/_scss/dcokeystroke.scss) for inspiration.

## Speed

The second parameter on `keystroke.type(chars, delay)` sets the delay between each character. Make sure your CSS matches up. For 500ms this would work nicely:

    animation: 0.2s fadeOut forwards;
    animation-delay: .3s;

# Development

Clone the entire project. Then open the project in your terminal and run the following command:

    $ npm install

After that:

    $ grunt serve

To build the minified files:

    $ grunt build

# Contribute

To create a pull request:

* Fork the repo;
* Create a new branch (git checkout -b your-feature);
* Add your code;
* Commit all your changes to your branch;
* Push it (git push origin your-feature);
* Submit a pull request via the GitHub web interface.

# License

New BSD License, see `LICENSE` for details.
