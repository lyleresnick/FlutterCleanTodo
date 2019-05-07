import '../View/TodoItemEditScene.dart';
import '../Presenter/TodoItemEditPresenter.dart';
import '../UseCase/TodoItemEditUseCase.dart';
import '../Router/TodoItemEditRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEditMode.dart';



class TodoItemEditAssembly {

    final TodoItemEditScene scene;
    final TodoItemEditPresenter presenter;
    final TodoItemEditUseCase useCase;

    TodoItemEditAssembly._({this.scene, this.useCase, this.presenter});

    factory TodoItemEditAssembly(TodoItemEditRouter router, TodoItemEditMode editMode) {
        final useCase = TodoItemEditUseCase(editMode: editMode);
        final presenter = TodoItemEditPresenter(useCase: useCase, router: router);
        final scene = TodoItemEditScene(presenter: presenter);
        useCase.output = presenter;

        return TodoItemEditAssembly._(scene: scene, useCase: useCase, presenter: presenter);
    }
}
