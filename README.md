# Map Tutorial

### Sign up Screen

This screen takes your name, email address, and password for regitring you as a user. And it will store that data on device storage in JSON format.

### Maps Screen

* This screen shows static image of map and automatically fetch whether you have given the app permission for getting your location. 
    * If yes, then it will not ask again for permission. 
    * If no, it will show a dialog box for allowing or denying the location permission.

* If user allows location permission then dialog box gets dismissed. 
  * if user denied the permission then it will automatically push user to app information where user can change the permission of location manually.

* If user has disabled the location from deevice settings, then when fetching location user will push to tutorial screen where steps are given of how to enable your location from device settings.
* User can also check tutorials by pressing "Tutorial" button on Maps screen.