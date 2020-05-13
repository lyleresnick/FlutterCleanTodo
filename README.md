# Todo in Flutter - VIPER Style

This Todo app is a full reference implementation for VIPER written with Flutter. It demonstrates many of the tasks you would do on a daily basis in a VIPER based project such as:

- routing, 
- data validation and capture, 
- saving of captured data, 
- localization, 
- the use of view and presentation models
- parameter passing between Scenes, 
- data cache injection, 
- output sub-protocols organized by event,
- returning results from sibling Presenters,
- separation of Entity Domain Objects from Data Transfer Objects

The are two Routers:
* A Navigator acts as a root router managing a list and a detail scene. 
* A custom router manages the Editing and Display modes of the detail scene.

No attempt has been made to make the scenes aesthetically pleasing - its all about the code. 

The app UI displays iOS native controls on an iOS Device and Android native controls on an Android Device.
This was done to explore the possibility of having native controls with one code set.
It is more likely that you or your designer will choose a brand specific UI that will look the same on both devices. This is commonly done in commercial apps.

TODO: introduce output transform from Presenter to PresenterProvider so StreamBuilder can be used to build partial Scenes (this is an optimization for views)


## Demo Modes

The demo has two modes: *test* and *db*. `test` mode uses an in-memory datastore. `db` mode uses a database! You can flip between the two modes by changing the value of the `gatewayImplementation`  in the `EntityGatewayFactory` .



