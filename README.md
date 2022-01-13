# lulz_crew_brew_firebase

## what this project is all about
learning how to integrate Firebase with Flutter as a backend and perform multiple operations such as authenticaion

> I didn't use the same dependancy versions as in the tutorial as they're legacy and pretty old now, so I had to upgrade them and run the project with null safety <br>

## what i learned
* the Provider package to listen to e.g. a stream and pass the values too all the widgets below in the tree.<br>

* `flutter pub upgrade --major-versions` to upgrade all dependacies. 
> read more about `flutter pub upgrade` https://dart.dev/tools/pub/cmd/pub-upgrade <br>
>to access a member of a widget from the state object in a stateful widget you would use `widget.` instead of `this.` because it refers to the state object. <br>


## Changes to take note of for Firebase
> in `main.dart` make sure to add the `Firebase_core` dependancy and add `WidgetsFlutterBinding.ensureInitialized();`<br>`await Firebase.initializeApp();`<br>
`FirebaseUser` is now `User`<br>
`FirebaseResult` is now `UserCredential`<br>
`onAuthStateChanged` is now `authStateChanges` and you have to use () to access e.g. `map()`<br>
