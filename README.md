# lulz_crew_brew_firebase

## what this project is all about
learning how to integrate Firebase with Flutter as a backend and perform multiple operations such as authenticaion

> I didn't use the same dependancy versions as in the tutorial as they're legacy and pretty old now, so I had to upgrade them and run the project with null safety <br>

## what I learned
* The Provider package to listen to e.g. a stream and pass the values too all the widgets below in the tree.<br>

* an alternative to using `StreamProvider` is using the built-in `StreamBuilder` and what it does basically is listen to the stream just as a `StreamProivder` would do except it doesn't pass it down to the children (normally even though you can but for easier maintaince and usabiltiy, `StreamProvider` is better for that case) <br>

* `flutter pub upgrade --major-versions` to upgrade all dependacies. 
> read more about `flutter pub upgrade` https://dart.dev/tools/pub/cmd/pub-upgrade <br>

* To access a member of a widget from the state object in a stateful widget you would use `widget.` instead of `this.` because it refers to the state object. <br>

* A form `key` is used to keep track of the state of the form and help us validate by using  `key.currentState.validate()` and validation is done through checking the `validators` you set on the form text fields and if all of them return null then the input is valid according to your rules and if any of them returns a string then it is invalid. <br>

* Using const values as a form of refactoring insteade of classes might be more efficient/professional and you can get around the problem of the non-constant parameters by using `.copyWith()` method<br>

* In Firestore databases, you don't "have" to create the collection before-hand if it doesn't 
 exist it'll be created automatically<br>

* Creating a dictionary of key:value<br>

* `List` class is a child of `Iterable` and in e.g. `List<Brew> _brewList(QuerySnapshot snapshot)` the method `map()` returns an `Iterable<Brew>` and to convert it to `List<Brew>` use the `.toList()` method<br>

* Putting a `ListView` (which is a scrollable so it doesn't have a height) inside e.g. a `Column` (not scrollable) would cause an error but the best work around is to set the value of `shrinkWrap` to `true` inside of the `ListView`<br>
> for more info about `shrinkWrap`: https://stackoverflow.com/questions/54007073/what-does-the-shrinkwrap-property-do-in-flutter <br>

* To set the color of an `ElevatedButton` from the `style` field add `ElevatedButton.styleFrom(primary: some-color)`<br>
> better styling for elevated button: https://stackoverflow.com/questions/49991444/create-a-rounded-button-button-with-border-radius-in-flutter<br>


* you can close the bottom sheet programatically simply by using `Navigator.pop(context)`<br>
### notable packages
* firebase_auth
* cloud_firestore
* provider
* flutter_spinkit

### changes to take note of for Firebase
> in `main.dart` make sure to add the `Firebase_core` dependancy and add `WidgetsFlutterBinding.ensureInitialized();`<br>`await Firebase.initializeApp();`<br>
`FirebaseUser` is now `User`<br>
`FirebaseResult` is now `UserCredential`<br>
`onAuthStateChanged` is now `authStateChanges` and now you have to use () to access e.g. `map()`<br>


