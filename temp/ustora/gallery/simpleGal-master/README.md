# simpleGal

[![Build Status](https://travis-ci.org/steverydz/simpleGal.png?branch=master)](https://travis-ci.org/steverydz/simpleGal)

A simple image gallery jQuery plug-in.

## How to use

Checkout [the demo](http://steverydz.github.com/simpleGal/demo) to see this plug-in in action.

### Write your HTML

Place your thubmnails within either a `div`, `ol` or `ul` like so:

    <div class="thumbnails">
      <a href="path/to/larger-image.jpg">
        <img src="path/to/thumbnail.jpg" alt="Thumbnail">
      </a>
      <a href="path/to/larger-image.jpg">
        <img src="path/to/thumbnail.jpg" alt="Thumbnail">
      </a>
      <a href="path/to/larger-image.jpg">
        <img src="path/to/thumbnail.jpg" alt="Thumbnail">
      </a>
    </div>

or

    <ul class="thumbnails">
      <li>
        <a href="path/to/larger-image.jpg">
          <img src="path/to/thumbnail.jpg" alt="Thumbnail">
        </a>
      </li>
      <li>
        <a href="path/to/larger-image.jpg">
          <img src="path/to/thumbnail.jpg" alt="Thumbnail">
        </a>
      </li>
      <li>
        <a href="path/to/larger-image.jpg">
          <img src="path/to/thumbnail.jpg" alt="Thumbnail">
        </a>
      </li>
    </ul>

or

    <ol class="thumbnails">
      <li>
        <a href="path/to/larger-image.jpg">
          <img src="path/to/thumbnail.jpg" alt="Thumbnail">
        </a>
      </li>
      <li>
        <a href="path/to/larger-image.jpg">
          <img src="path/to/thumbnail.jpg" alt="Thumbnail">
        </a>
      </li>
      <li>
        <a href="path/to/larger-image.jpg">
          <img src="path/to/thumbnail.jpg" alt="Thumbnail">
        </a>
      </li>
    </ol>

You can give the list a class or ID of anything you like.

### Set a placeholder image

Then create a placeholder for your main image like so:

    <img src="path/to/placeholder-image.jpg" alt="Placeholder" class="placeholder">

Again, you can give this image a class or ID of anything you like.

### Call the plug-in method

In your JS file, call the function using your class or ID:

    $(".thumbnails").simpleGal();

If you have given the main image a class of anything other than `placeholder` or used an ID then you must declare that in the options:

    $(".thumbnails").simpleGal({
      mainImage: ".your-main-image-class-or-ID"
    });

### Over to you

That's it. You should be ready to roll.
