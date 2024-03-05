# DUNGEON DWELLERS

#### Video Demo:  https://youtu.be/ydLn-wf0X54

![iPhone with Dungeon Dweller Screenshot](/screenshots/phone.jpeg)

#### Description:
A project for Harvard CS50x. The app is a useful reference tool for Dungeons & Dragons enthusiasts, as it provides them with a quick and easy way to access and explore the monsters from the 5th edition SRD. The app is also a showcase of the power and simplicity of SwiftUI, as it demonstrates how to create a functional cross-platform app in a simple project that can run on iOS, iPadOS, and MacOS.

This app is a Swift app developed with a SwiftUI front, that can be deployed for iOS, iPadOS or MacOS. It is a handy tool for Dungeons & Dragons players and dungeon masters, as it allows them to browse and search through hundreds of monsters from the 5th edition System Reference Document (SRD). The app uses the [5e SRD monsters json file](https://gist.github.com/tkfu/9819e4ac6d529e225e9fc58b358c3479), which contains the data of 327 monsters that are covered in the [Open Gaming License](https://dnd.wizards.com/resources/systems-reference-document). 

![iPhone with Dungeon Dweller Screenshot](/screenshots/phone1.jpeg)
![macbook with Dungeon Dweller Screenshot](/screenshots/mac01.jpeg)

**APP STRUCTURE**
The app is structured in a MVVM (Model-View-ViewModel) architecture, which separates the model, view, and view model layers, and makes the code more readable, testable, and maintainable.

![iPhone with Dungeon Dweller Screenshot](/screenshots/phone2.jpeg)

The Monster is a Core Data model holds all the information about a monster, such as its name, type, size, alignment, armor class, hit points, speed, abilities, skills, senses, languages, challenge rating, traits, actions, and legendary actions. It also has a field for DM notes and a Boolean for the user to flag their favorites. Since the SRD data comes from a JSON Open Source file, we use a Adapter to encoded and decoded from JSON data when the app is first loaded, and store all the app data using Core Data, Apple's framework for SwiftUI Persistence.

The MonsterListViewModel is a class that manages the logic and data of the app. It has a property called monsters, which is an array of Monster structs. The MonsterListViewModel loads the JSON file with the monster data from the app bundle, decodes it into Monster structs using the JSONDecoder, and assigns it to the monsters array. The MonsterListViewModel also conforms to the ObservableObject protocol, which allows it to publish changes to its properties and notify the views that depend on them. The MonsterListViewModel also has filtering capabilities, by using a property called searchText, which is a string that represents the user’s input in the search bar. The MonsterListViewModel uses the searchText to filter the monsters array and return a subset of monsters that match the query. There's a toggle that allows to instead search by monster traits, powers or capabilities. This View Model is responsible for fetching Core Data models, filtering them according to user preferences set in the View.

![iPhone with Dungeon Dweller Screenshot](/screenshots/phone3.jpeg)

The MonsterListView is a SwiftUI view that displays the list of monsters in a scrollable and searchable interface. The MonsterListView uses the new Navigation Stack available for iOS 17 and MacOS 15, to display all the properties of the model when the user wants in a MonsterDetailView. 

The MonsterDetailView is a SwiftUI view that displays all the information about a monster in a vertical stack. It loads an illustration asynchronously from the web, and uses various SwiftUI views, such as Text, Image, Divider, List and a Markdown rendered view, to present the data in a clear and organized way. It also has a Text Editor that allows the users to keep their own personal notes about the monsters. The view is divided in subviews for each part, for better refactoring and previsualization.

The MonsterDetailViewModel holds the monster data, and keep track of the changes the user makes using Core Data.

![iPhone with Dungeon Dweller Screenshot](/screenshots/phone4.jpeg)

**Tests**

Automatic tests were implemented for the Monster List View Model, to make sure data is loaded properly, and that filtering works, including with different cases.

**UI**

Since we use SwiftUI, the should responsive and adaptive to different screen sizes and orientations of both iPhones, iPads and Mac computers. The app uses the size classes and the environment values to adjust the layout and the appearance of the views according to the device and the context. The app also supports dark mode and accessibility features, such as dynamic type, voice over, and color contrast.

![macbook with Dungeon Dweller Screenshot](/screenshots/mac02.jpeg)

**Compatiblity**

The app is written in Swift 5.5 and uses SwiftUI 3.0. The app requires iOS 17, iPadOS 17, or MacOS 15 to run. The app is compatible with Xcode 13 and Swift Package Manager. The app only uses [SwiftLint](https://github.com/realm/SwiftLint) as an external package, to help with keeping the code properly formatted. It can be refactored to support previous systems with a minimal suggested refactoring of the NavigationStack.

**License**

The app is open source and licensed under the [MIT License](https://mit-license.org/). The app is hosted on GitHub and welcomes contributions from the community. The app is not affiliated with or endorsed by Wizards of the Coast, the publisher of Dungeons & Dragons.

