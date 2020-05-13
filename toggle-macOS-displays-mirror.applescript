/**
 *
 * toggle-macOS-displays-mirror
 * javascript for automation(JXA)
 *
 * description:
 * macOS automation script to toggle mirror display.
 * start mirror and stop mirror depending on its current state.
 *
 * author: vergs
 * original author: sidneys
 *	homepage: http://sidneys.github.io
 *	de.sidneys.jxa.toggle-macos-accessibility-keyboard.scpt
 *
 */



// Init
// debugger;
// On first time, calling System Preferences returns window.tabgroup.checkbox (tc)but
// on the second and subsequent calls, returns window.group.tabgroup.checkbox (gtc)
// 	exception sometime run with tc tc boom...
// If above conditions is correct, it could  be rewrote more simply.
// But I gave up.
// to publish, polishing up
// 	1) Organize the function location and content
//	2) remove console.log
//	3) rewrite comment

const ver ="Ver 0.99"

'use strict'

let app = Application.currentApplication();
app.includeStandardAdditions = true; // as usual

const appSP = Application('System Preferences')
const appSE = Application('System Events')


// Initialize storage for the checkbox value
let initialCheckboxValue = 0
let currentCheckboxValue = 0

// Persist start-up state of the "System Preferences" app
let isRunningSystemPreferences = appSP.running()

// function to test Object
function isValidIndex(testOBJ){
	try{
		testOBJ.properties();
		return true;
	}catch(e){
		var tmp = e.errorNumber;
		if ((e.errorNumber != -1719) && (e.errorNumber != -1700) && (e.errorNumber != -1728)) {
			app.displayAlert(e.errorNumber)
			throw e
		}
		return false;
	}
}

//value is 0 or 1, True or False So Using -1 as false
function isValidValue(testOBJ){
	try{
		return testOBJ.value();
	}catch(e){
		var tmp = e.errorNumber;
		if ((e.errorNumber != -1719) && (e.errorNumber != -1700) && (e.errorNumber != -1728)) {
			app.displayAlert(e.errorNumber)
			throw e
		}
	}
	return (-1);
}

// function to clck wich check
function isValidClick(testOBJ){
	try{
		testOBJ.click();
		return true;
	}catch(e){
		var tmp = e.errorNumber;
		if ((e.errorNumber != -1719) && (e.errorNumber != -1700)) {
			app.displayAlert(e.errorNumber)
			throw e
		}
	}
	return false;
}

//Find an existing candidate and get its value
function findAndValueFromWindow(winOBJ){
	let value = 0;
	let done = false;
	let countTry = 0;
	let limTry = 10;

	while ((!done) && (limTry > countTry)){
		if (-1 != (value = isValidValue(winOBJ.tabGroups[0].checkboxes[0]))){
			console.log("in FindAndValueFromWIndow, t0c0");
			done = true;
		}else if (-1 != (value = isValidValue(winOBJ.groups[0].tabGroups[0].checkboxes[0]))){
			console.log("in FindAndValueFromWIndow, g0t0c0");
			done = true;
		}
		if (countTry != 0){
			delay(1)
		}
		++countTry;
		console.log("coutTry:",countTry);
	}
	try {
		if (!(limTry > countTry)){
		// equivalent with if (countTry >= limTry), Don't forget = and never =>, it's notaion foo arrow function..
				app.displayAlert("Sorry, Too many retry in value" );
				throw new Error("Too many retry");
		}
	} catch (e){
		console.log(e.message);
	}
	return value
}

function findAndClickWIndow(winOBJ){
	let done = false;
	let countTry = 0;
	let limTry = 10;
	while ((!done) && (limTry > countTry)){
		if ( isValidClick(winOBJ.tabGroups[0].checkboxes[0])){
			done = true;
			console.log("click t0,c0");
		}else if ( isValidClick(winOBJ.groups[0].tabGroups[0].checkboxes[0])){
			done = true;
			console.log("click G0,t0,c0");
		}
		if (countTry != 0){
			delay(1)
		}
		countTry = countTry + 1;
		console.log("coutTry:",countTry);
	}
	try {
		if (!(limTry > countTry)){
				app.displayAlert("Sorry, Too many retry in click");
				throw new Error("Too many retry");
		}
	} catch (e){
		console.log(e.message);
	}

	return done
}


// Show "Display" pane within the ArrangementTab preferences
appSP.panes.byId('com.apple.preference.displays').anchors["displaysArrangementTab"].reveal()
appSP.activate();


// Wait for: System Preferences Window
while (appSE.processes.byName('System Preferences').windows.length ===0 ) {}


console.log("ready")
// Now "System Preferences is running, application "System Preference process by name "Syste Prefernce" can be set
// without running it byName does not work
const appSEproSP = appSE.processes.byName('System Preferences')
//　The following lines could be combined into a single line, but I won't do it this time.
delay(1)
const initWindowName = appSP.preferencesWindow.name()
// nameが "“ディスプレイ”を読み込み中…"とか起きるんだ...
// 回避方不明のため adhocに delay(1)
const initWindow = appSEproSP.windows.byName(initWindowName);

initialCheckboxValue = findAndValueFromWindow(initWindow);
console.log("Initial:", initialCheckboxValue);

// windoName is not changed
// but index of window, (group.tabgroup.clickbox) or (tabgroup.clckbox) I couldn't find any occurrence conditions.
// even in click just after check

findAndClickWIndow(initWindow);
console.log("click done");

// re focus;reveal pane
appSP.panes.byId('com.apple.preference.displays').anchors["displaysArrangementTab"].reveal()
appSP.activate();

const curWindowName = appSP.preferencesWindow.name()
const curWindow = appSEproSP.windows.byName(curWindowName);

currentCheckboxValue = findAndValueFromWindow(curWindow);

// Did the checkbox value change?
// had better to wait
delay(1)
if (initialCheckboxValue === currentCheckboxValue) {
	app.displayAlert("Sorry, I can't toggle!!")
/* 	I don't know what original is doing.
    // No – Wait for: confirmation dialog
    while (appSE.processes.byName('System Preferences').windows[0].sheets.length === 0) {}

    // Dismiss dialog
    appSE.processes.byName('System Preferences').windows[0].sheets[0].buttons[0].click()
*/
}else{
	console.log("I got it!")
}

// Did the "System Preferences" app run on start-up?
// Restore initial state of the "System Preferences" application. This time I don't implment it.

if (!isRunningSystemPreferences) {
    // No – Quit
    Application('System Preferences').quit()
} else {
    // Yes – Return to the overview screen
    appSE.processes.byName('System Preferences').menuBars[0].menuBarItems[3].menus[0].menuItems[2].click()
}
