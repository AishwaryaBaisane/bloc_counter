import 'package:bloc_counter/Block/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoName = TextEditingController();
    final todoTitle = TextEditingController();
    final isDone = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todo App'),
      ),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final todo = todos[index];

              return ListTile(
                title: Text(todo.name),
                subtitle: Text(todo.author),
                leading: Text(todo.isDone),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  controller: todoName,
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(),
                                    hintText: 'Title',
                                    focusedBorder: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  controller: todoTitle,
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(),
                                    hintText: 'Author',
                                    focusedBorder: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  controller: isDone,
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(),
                                    hintText: 'Compete or Incomplete',
                                    focusedBorder: OutlineInputBorder(),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.read<TodoCubit>().updateTodo(index, todoTitle.text, todoName.text, isDone.text);
                                    Navigator.pop(context);
                                    todoName.clear();
                                    todoTitle.clear();
                                    isDone.clear();
                                  },
                                  child: const Text('Save'),
                                ),
                              ],
                            ),
                          ),
                        );

                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<TodoCubit>().deleteTodo(index);

                      },
                      icon: const Icon(Icons.delete_outline),
                    ),
                  ],
                )
              );
            },
            itemCount: todos.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: todoName,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      hintText: 'Title',
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: todoTitle,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      hintText: 'Author',
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: isDone,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      hintText: 'Compete or Incomplete',
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<TodoCubit>().addTodo(todoTitle.text.trim(),
                          todoName.text.trim(), isDone.text.trim());
                      Navigator.pop(context);
                      todoName.clear();
                      todoTitle.clear();
                      isDone.clear();
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
