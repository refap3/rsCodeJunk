//Get the array of PairedBluetoothDevice objects
var bluetoothDevices = device.bluetooth.pairedDevices;
var deviceName = "KIA-BLUETOOTH";
var verssion = "1.9"          ;

console.log(verssion +  " is there anny focca here??", bluetoothDevices.length);
logStuff("bt device name: " + device.bluetooth.name);
for (var i in bluetoothDevices) {
    console.log("Paired with", bluetoothDevices[i].name, bluetoothDevices[i].address, bluetoothDevices[i].deviceClass);
}
logStuff("dumped all bt devices");

function logStuff(s) {
    var notification; 
    console.log(s);
    notification = device.notifications.createNotification(s); //DEBUG -- out
    notification.show(); //DEBUG -- out
}
