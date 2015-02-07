
var stepper = require('bencoding.stepper');

// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});

var container = Ti.UI.createView({
	layout:'vertical'
});
win.add(container);

var infoLabel1 = Ti.UI.createLabel({
	text:'Show wrapping with stepvalue of 2',
	color:'#000',
	font:{
		fontSize:15,
		fontWeight:'bold'
	},
	textAlign:'left',
	top:25,
	width:250,
	left:10,
	height:20
});

container.add(infoLabel1);

var stepper1Section = Ti.UI.createView({
	layout:'horizontal',
	height:40
});
var myStepper1 = stepper.createStepper({
	left:10,
	top:20,
	min:10,
	max:200,
	value:25,
	width:150,
	stepValue:2,
	wraps:true,
	continuous:true
});

stepper1Section.add(myStepper1);

var myLabel1 = Ti.UI.createLabel({
	text:'Quality: ' + myStepper1.value,
	color:'#000',
	font:{
		fontSize:15,
		fontWeight:'bold'
	},
	textAlign:'left',
	top:25,
	width:150,
	left:10,
	height:20
});

stepper1Section.add(myLabel1);

container.add(stepper1Section);

var showEventsLabel1 = Ti.UI.createLabel({
	text:'Value:' ,
	color:'#000',
	font:{
		fontSize:15
	},
	textAlign:'center',
	top:20,
	width:300,
	left:10,
	height:60
});

container.add(showEventsLabel1);

myStepper1.addEventListener('change',function(e){
	myLabel1.text = 'Quality: ' + Math.round(e.value);
	showEventsLabel1.text='Event = e.value: ' + Math.round(e.value) + ' myStepper.value=' + myStepper1.value;
});


var infoLabel2 = Ti.UI.createLabel({
	text:'Show Continuous= false, so change event is only fired on touchend',
	color:'#000',
	font:{
		fontSize:15,
		fontWeight:'bold'
	},
	textAlign:'left',
	top:25,
	width:250,
	left:10,
	height:60
});

container.add(infoLabel2);

var stepper2Section = Ti.UI.createView({
	layout:'horizontal',
	height:40
});
var myStepper2 = stepper.createStepper({
	left:10,
	top:20,
	min:10,
	max:200,
	value:50,
	width:150,
	continuous:false
});

stepper2Section.add(myStepper2);

var myLabel2 = Ti.UI.createLabel({
	text:'Quality: ' + myStepper2.value,
	color:'#000',
	font:{
		fontSize:15,
		fontWeight:'bold'
	},
	textAlign:'left',
	top:25,
	width:150,
	left:10,
	height:20
});

stepper2Section.add(myLabel2);

container.add(stepper2Section);

var showEventsLabel2 = Ti.UI.createLabel({
	text:'Value:' ,
	color:'#000',
	font:{
		fontSize:15
	},
	textAlign:'center',
	top:20,
	width:300,
	left:10,
	height:60
});

container.add(showEventsLabel2);

myStepper2.addEventListener('change',function(e){
	myLabel2.text = 'Quality: ' + Math.round(e.value);
	showEventsLabel2.text='Event = e.value: ' + Math.round(e.value) + ' myStepper.value=' + myStepper2.value;
});

win.open();