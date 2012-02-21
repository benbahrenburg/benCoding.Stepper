<h1>benCoding.Stepper Module</h1>

Use the native iOS UIStepper in your Titanium application. This module provides Titanium accessibility to Apple's native [UIStepper](https://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIStepper_Class/Reference/Reference.html) introduced in iOS5.


<h2>Before you start</h2>
* You need Titanium 1.8.1 or greater.
* This module will only work with iOS 5 or great.  

<h2>Download the release</h2>

There is two ways you can download this module. The go to the releases/UseIfDownloadingFromGithub folder. This will have a release compiled for anyone download it from github.

<h2>Building from source?</h2>

If you are building from source you will need to do the following:
* Modify the titanium.xcconfig file with the path to your Titanium installation
* Make sure the the method moduleGUID in the class BencodingDictionaryModule has the variable marketPlace set to NO. This will avoid you running into any licensing issues.


<h2>Setup</h2>

* Download the latest release from the releases folder ( or you can build it yourself )
* Install the bencoding.stepper module. If you need help here is a "How To" [guide](https://wiki.appcelerator.org/display/guides/Configuring+Apps+to+Use+Modules). 
* You can now use the module via the commonJS require method, example shown below.

<pre><code>

var stepper = require('bencoding.stepper');

</code></pre>

Now we have the module installed and avoid in our project we can start to use the components, see the feature guide below for details.

<h2>Creating the control</h2>

The below is an example on how to create a stepper control that starts at 10 and goes to 200. The initial value is set to 25 and the fire event will be called each time the value is changed.

<pre><code>

var myStepper = stepper.createStepper({
	min:10, //Minimum stepper value
	max:200,//Maximum stepper value
	value:25, //Initial or starting value of the stepper
	continuous:true //If the stepper should send change events immediately or wait until touchend
});

</code></pre>

<h2>Properties</h2>

The stepper controls have the following properties.  They can be set or read at anytime.

* <b>min</b> - the minimum stepper value (number value) (read/write)
* <b>max</b> - the maximum stepper value (number value) (read/write)
* <b>enabled</b> - boolean to indicate the enabled state of the stepper
* <b>continuous</b> - if true, value change events are sent immediately when the value changes during user interaction. If false, a value change event is sent when user interaction ends. (read/write)
* <b>value</b> - the current value of the stepper (float value) (read/write)
* <b>wraps</b> - if true, incrementing beyond max sets value to min; likewise, decrementing below min sets value to max. If false, the stepper does not increment beyond max nor does it decrement below min but rather holds at those values. (boolean)(read/write)
* <b>stepValue</b> - the step, or increment, value for the stepper. Must be numerically greater than 0, by default this value is 1.

The below example shows how to create the stepper control using all of the properties.  Please note any of these properties can be read or set after the control has been created. 

<pre><code>
var stepper = require('bencoding.stepper');

var myStepper = stepper.createStepper({
    min:10, //Minimum stepper value (1 by default)
    max:200,//Maximum stepper value (100 by default)
    value:25, //Initial or starting value of the stepper (1 by default)
    enabled:true, //Control is enabled (true by default)
    wraps:true, //Control will start back at 10 after it hits it's max, off by default
    stepValue:2, //Will increment each stepper change action by 2, this is 1 by default
    continuous:true //Event triggered with each value change (true by default) 
});
</code></pre>

<h2>Events</h2>

The stepper has a change event that is fired when the stepper value is changed.  Please see below for an example.

<pre><code>
myStepper.addEventListener('change',function(e){
	myLabel.text = 'Quality: ' + Math.round(e.value);
	showEventsLabel.text='Event = e.value: ' + Math.round(e.value) + ' myStepper.value=' + myStepper.value;
});
</code></pre>

<h2>How To Example</h2>

Please see the example directory for a working "How To" example application.

<h2>Demo Video</h2>

See the included sample app in action [http://www.youtube.com/watch?v=IMEdwPi96iw](http://www.youtube.com/watch?v=IMEdwPi96iw).

<h2>Licensing & Support</h2>

This project is licensed under the OSI approved Apache Public License (version 2). For details please see the license associated with each project.

Developed by [Ben Bahrenburg](http://bahrenburgs.com) available on twitter [@benCoding](http://twitter.com/benCoding)

<h2>Learn More</h2>
<hr />
<h3>Twitter</h3>

Please consider following the [@benCoding Twitter](http://www.twitter.com/benCoding) for updates 
and more about Titanium.

<h3>Blog</h3>

For module updates, Titanium tutorials and more please check out my blog at [benCoding.Com](http://benCoding.com). 
