public class Car {
    public string carColor = '';
    public string carName;

    integer maxSpeed = 140;

    public void switchOn () {
        system.debug ('starting the car now!');
    }
    public void drive(){
        system.debug('driving ' + carName);
    }
    public void driveAtMaxSpeed(){
        string description = 'driving ' + carName + ' with car color ' + carColor + ' at ' + maxSpeed + 'km/h';
        system.debug(description);
    }
}
