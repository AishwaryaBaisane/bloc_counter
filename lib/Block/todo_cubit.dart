import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title, String author, String isDone) {
    final todo = Todo(
      name: title,
      author: author,
      isDone: isDone,
    );
    // state.add(todo);
    emit([...state, todo]);
  }

  void deleteTodo(int index) {
    if (index < 0 || index >= state.length) {
      addError('Invalid index for deletion!');
      return;
    }
    final updatedTodos = List<Todo>.from(state)..removeAt(index);
    emit(updatedTodos);
  }

  void updateTodo(int index, String title, String author, String isDone) {
    if (index < 0 || index >= state.length) {
      addError('Invalid index for update!');
      return;
    }

    final updatedTodo = Todo(
      name: title,
      author: author,
      isDone: isDone,
    );
    final updatedTodos = List<Todo>.from(state)..[index] = updatedTodo;
    emit(updatedTodos);
  }
}

class Todo {
  final String name;
  final String author;
  final String isDone;

  Todo({required this.name, required this.isDone, required this.author});

  @override
  String toString() => 'Todo(name: $name, isDone: $isDone,author: $author)';
}
