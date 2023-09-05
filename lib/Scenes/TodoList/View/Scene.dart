//  Copyright © 2019 Lyle Resnick. All rights reserved.

part of '../TodoList.dart';

@visibleForTesting
class Scene extends StatefulWidget {
  final Presenter _presenter;
  Scene(this._presenter);

  @override
  State<Scene> createState() => _SceneState();
}

class _SceneState extends State<Scene> {
  late final Presenter _presenter;

  @override
  void initState() {
    super.initState();
    this._presenter = widget._presenter;
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    return Scaffold(
        appBar: AppBar(
          title: Text(localizedString("todoList")),
          backgroundColor: Colors.lightGreen,
          elevation: platform == TargetPlatform.iOS ? 0.0 : 4.0,
          actions: _actions(platform),
        ),
        body: SafeArea(
          child: BlocBuilderData<Presenter, _PresenterOutput>(
            bloc: _presenter,
            builder: (context, data) {
              return switch (data) {
                showLoading() => FullScreenLoadingIndicator(),
                showModel(:final model) => ListView.builder(
                    itemCount: model.rows.length,
                    itemBuilder: (context, index) =>
                        _Cell(row: model.rows[index], index: index))
              };
            },
          ),
        ));
  }

  List<Widget> _actions(TargetPlatform platform) {
    return [
      (platform == TargetPlatform.iOS)
          ? IconButton(
              iconSize: 34,
              icon: Icon(CupertinoIcons.add),
              onPressed: _presenter.eventCreate,
            )
          : IconButton(
              icon: Icon(Icons.add),
              onPressed: _presenter.eventCreate,
            )
    ];
  }
}
