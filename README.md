# lulz_crew_brew_firebase

## what this project is all about
learning how to integrate Firebase with Flutter as a backend and perform multiple operations such as authenticaion

> I didn't use the same dependancy versions as in the tutorial as they're legacy and pretty old now, so I had to upgrade them and run the project with null safety <br>

## what I learned
* the Provider package to listen to e.g. a stream and pass the values too all the widgets below in the tree.<br>

* `flutter pub upgrade --major-versions` to upgrade all dependacies. 
> read more about `flutter pub upgrade` https://dart.dev/tools/pub/cmd/pub-upgrade <br><br>
* to access a member of a widget from the state object in a stateful widget you would use `widget.` instead of `this.` because it refers to the state object. <br>
* a form `key` is used to keep track of the state of the form and help us validate by using  `key.currentState.validate()` and validation is done through checking the `validators` you set on the form text fields and if all of them return null then the input is valid according to your rules and if any of them returns a string then it is invalid. <br>
* Using const values as a form of refactoring insteade of classes might be more efficient/professional and you can get around the problem of the non-constant parameters by using `.copyWith()` method<br>
* in Firestore databases, you don't "have" to create the collection before-hand if it doesn't 
 exist it'll be created automatically<br>
* creating a dictionary of key:value<br>

### notable packages
* firebase_auth
* cloud_firestore
* provider
* flutter_spinkit

### changes to take note of for Firebase
> in `main.dart` make sure to add the `Firebase_core` dependancy and add `WidgetsFlutterBinding.ensureInitialized();`<br>`await Firebase.initializeApp();`<br>
`FirebaseUser` is now `User`<br>
`FirebaseResult` is now `UserCredential`<br>
`onAuthStateChanged` is now `authStateChanges` and you have to use () to access e.g. `map()`<br>
