// ye can really edit this quite nicely in VS 2012 with ctrl apostrophe key to go to matching braces !!
//


// Initializing variables 

var deviceName = "KIA-BLUETOOTH";

// End of variables initializing 

console.log('t#1 V1.8 Started Script:' + device.currentSource);
//console.log("t1a is this the same? " + (deviceName === "KIA-BLUETOOTH") + " yes or no?");

if (!(device.version && device.version.isSupported(0, 55))) {

    var notification = device.notifications.createNotification('on{X} is out of date');
    notification.content = "the recipe '" + device.currentSource + "' requires an up to date on{X} application.";
    notification.show();
}
else {

    // time to wait for connection in milli seconds
    var timeOut = 10000;

    // whether the device was found
    var found = false;

    var currentMOT = ""; // last (current MOT)

    // the timer name
    var timerName = "BluetoothRecipeTimer";
    var timerNameoff = "BluetoothRecipeTimeroff";


    // check for MOT state change every minute
    device.modeOfTransport.samplingInterval = 60000;

    // register on 'connected' event to determine whether the device is near
    device.bluetooth.on('connected', function (bluetoothDevice) {
        console.log("t#2 BT connected: " + bluetoothDevice.name); //DEBUG -- out 
        //console.log("t#2a looking for device: " + deviceName) ; //DEBUG -- out 
        //console.log("t#2b is this the same?? " + (bluetoothDevice.name === deviceName)) ; //DEBUG -- out 

        // show notification on this focca tooooo //DEBUG -- out 
        var notification = device.notifications.createNotification('BTw: BT connect:' + bluetoothDevice.name);
        notification.content = "wait:#" + deviceName + "#got:#" + bluetoothDevice.name + "#";
        notification.show();


        // there is a foccing bug that adds a CR character to end of the reported device name
        // so i will get rid of any excess charater(s).
        if (bluetoothDevice.name.toString().substr(0, deviceName.toString().length) === deviceName) {
            // found the device
            found = true;
            device.scheduler.removeTimer(timerName);
            console.log("t#3 KIA bt detected, all GOODE: " + bluetoothDevice.name); //DEBUG -- out 
        }
        else {
            // we foccin found some other wanka -- what the hell isit ??
            console.log("t#3a otha focca seen, all BADDE,badd:##" + bluetoothDevice.name + "##"); //DEBUG -- out 
            console.log("t#3b instead of this shitting shrott:##" + deviceName + "##"); //DEBUG -- out 

        }
    });


    // register on 'disconnected' event to determine whether we are still driving 
    device.bluetooth.on('disconnected', function (bluetoothDevice) {
        console.log("t#9 BT disconnected: " + bluetoothDevice.name); //DEBUG -- out 
        // show notification on this focca tooooo //DEBUG -- out 
        var notification = device.notifications.createNotification('t#9 BT disconnect:' + bluetoothDevice.name);
        notification.show();

        //now start the timer to monitor drop of MOT="driving" ...

        device.scheduler.setTimer({
            name: timerNameoff,
            time: new Date().getTime() + timeOut,
            exact: true
        },
function () {
    console.log('t#10 bt disconnect after timer: stored MOT is: ' + currentMOT + " actual MOT is: " + device.mode.current);

    if (currentMOT === "driving") {
        //in this case MOT === "driving" so let everything go  ....  
        console.log('t#10b MOT ist still driving , do NOTHIN');
    }
    else {
        // in this case we are NOT driving any more -- turn BT off
        console.log('t#10a turn bt OFF now! ');
        device.scheduler.removeTimer(timerNameoff); // turn off timer 
        //device.bluetooth.enabled = false; // uncomment THIS TO ARM !!
        var notification = device.notifications.createNotification('t#10a turn bt OFF now, this is the cruurentMOT: ' + currentMOT);
        notification.show();
    }
});

    });



    // when driving is detected try turning the bluetooth on and looking for the device
    device.modeOfTransport.on("changed", function (signal) {
        currentMOT = signal.current;  // save current MOT 
        if (signal.current === "driving") {

            console.log('t#4 MOT equals driving detected!');

            found = false;  // set flag BEFORE enabling BT !!

            if (device.bluetooth.enabled) {
                console.log('t#5 bluetooth is already enabled. doing nothing');
                return;
            }


            device.bluetooth.enabled = true;

            device.scheduler.setTimer({
                name: timerName,
                time: new Date().getTime() + timeOut,
                exact: true
            },
            function () {
                if (!found) {
                    console.log('t#6 could not find the device, disabling bluetooth');
                    device.bluetooth.enabled = false;
                }
                else {
                    console.log('t#6a found the device, do NOTHIN');

                }
            });
        }
        else {
            // when other MOT as driving is detected just stick it into user 
            var notification;  //DEBUG -- out 

            console.log('t#4a MOT non driving detected: ' + signal.current); //DEBUG -- out
            //stick it in users face as well: 
            notification = device.notifications.createNotification('MOT change(nonD) detected! ' + signal.current); //DEBUG -- out
            notification.content = "MOT mode: " + signal.current; //DEBUG -- out
            notification.show(); //DEBUG -- out
        }
    });
}

console.log('t#7 Completed Script:' + device.currentSource);