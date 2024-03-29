# Todo in Flutter - Clean Architecture with BLoCs

This Todo app is a full reference implementation for a Flutter App based on Mobile Clean Architecture. It demonstrates many tasks you might do on a daily basis during a project, such as:
- routing, 
- data validation and capture, 
- saving of captured data, 
- localization, 
- the use of view and presentation models
- parameter passing between Scenes, 
- output sub-protocols organized by event,
- sharing state between sibling UseCases
- separation of Entity Domain Objects from Data Transfer Objects (repository pattern)

The are two Routers:
* A Navigator acts as a root router managing a list and a detail scene. 
* A custom router manages the Editing and Display modes of the detail scene.

No attempt has been made to make the scenes aesthetically pleasing - its all about the code. 

The app UI displays iOS native controls on an iOS Device and Android native controls on an Android Device.
This was done to explore the possibility of having native controls with one code set.
It is more likely that you or your designer will choose a brand specific UI that will look the same on both devices. This is commonly done in commercial apps.

The app is based on the BLoC/BLoc Provider pattern. Each module's Presenter and UseCase is implemented as a BLoC. A BLoC uses a stream to return asynchronous events. Each Scene view uses a StreamBuilder to drive the display from events emitted by the Presenter. The Presenter processes the events emitted by the UseCase.

## Demo Modes

The demo has two modes: *test* and *db*. `test` mode uses an in-memory datastore. `db` mode uses a database! You can flip between the two modes by changing the value of the `gatewayImplementation`  in the `EntityGatewayFactory` .



