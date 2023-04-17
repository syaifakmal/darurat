# Darurat

<p align="center">
 <img src="https://i.ibb.co/NCQfYs9/Darurat-Logo.png" height="120"/>
</p>

### About
Darurat is a comprehensive emergency contacts library app designed for Indonesia. Lack of awareness about emergency contacts in Indonesia, we strive to make it easy for you to find the right emergency contact during critical situations. From medical emergencies to fires and other emergencies, Darurat provides a curated list of essential contacts that you can rely on for help. Our app is regularly updated with the latest information, and you can save your favorite contacts for quick access. Share Darurat with others and join our community in promoting safety and awareness in Indonesia.

-   Reliable and comprehensive list of emergency contacts for Indonesia
-   User-friendly interface for easy access during emergencies
-   Save emergency contacts to favorites for quick access
-   Share Darurat with others to spread safety awareness

<a href="https://play.google.com/store/apps/details?id=com.darurat.emergency"><img src="https://i.ibb.co/m01t1F5/5a902dbf7f96951c82922875.png" alt="5a902dbf7f96951c82922875" width= "200" border="0"></a>
### License
Darurat is open-sourced software licensed under the [GNU General Public License v3.0](https://github.com/syaifakmal/darurat/blob/master/LICENSE.md)
### Configuration
#### ‼️ Generate google-service.json
 1. Go to the [Firebase Console](https://console.firebase.google.com/) and sign in with your Google account.
 2.   Click on "Add project" and follow the prompts to create a new Firebase project for your Android app.
 3.   Once your project is created, click on "Add app" to add a new app to your Firebase project.
 4.   Select "Android" as the app platform and follow the prompts to register your app.
 5.   Download the google-service.json file for your Firebase project from the Firebase Console.
 6.   Copy the downloaded google-service.json file into the "app" directory of your Android project.

#### Firestore Structrure

    {
	    "app_version" : {},
	    "emergency_contact" : {},
	    "reporterd_numbers" : {},
	    "submitted_numbers" : {},
	    "server_time" : {}
    }

