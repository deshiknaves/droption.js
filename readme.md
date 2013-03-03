# Droption.js

![Droption screen](http://deshiknaves.com/droption/droption.png)
## About
**Droption is a simple select list replacement.**

Often we need a select list that can be styled to fit the designs of our projects, but this can't be done with default select options. Droption is a simple replacement for those situations. It's very lightweight and fully customizable to your styling needs.

## Demo
<http://www.deshiknaves.com/droption>

## Requirements
Requires jQuery 1.7 or above

## Usage
Other plugins of this sort that I've seen, the div for the faux select option is added dynamically and causes the screen to flicker. I don't like this behavior, so instead of added the wrapping div through js, you would add a div after the select option. In the css, you can hide the select option by default, or let the js take care of it (if js does, it won't happen immidately). A better solution would be to use the .no-js class to show the select optins and hide the div if the user doesn't have js.

First, include **droption.css** and **droption.js** to the webpage.

	<head>
		<title>Your Website</title>
		<link rel="stylesheet" href="path/to/droption">
	</head>


And add the script after jQuery has been added
	
		<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
		<script src="path/to/droption.js"></script>
	</body>

Finally, after any select option that you want to style with droption ass a div with any class you need for your styling and **droption** (You don't need to add .droption if you don't want to inherit any of the default styles). You can refer to the stylesheet if you want to create your own styles.

	<select name="your-list" id="your-list" class="your-list">
	<div class="your-list-wrap droption"></div>
	
You can style the div of the wrapper to the height that you are expecting it to be in the design so that it doesn't flicker when the list is populated.

Finally, call droption on the element passing the select list to create the select list:

	$('.your-list-wrapper').droption({ select: '.your-list' })
	
## Future plans
* Calculate how much space is available for the dropdown list and make the height of the options dependant on that.
* Add more options as more testing is done.
* Will do more browser testing and write a definitive compatibility chart. (Let me know if you run into any issues).
* Stip width from css and make them options for the function
