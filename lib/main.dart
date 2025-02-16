import 'package:bloc_counter/Block/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Block/todo_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoPage(),
      ),
    );
  }
}

//
// class CounterCubit extends Cubit<int> {
//   CounterCubit() : super(0);
//
//   void increment() => emit(state + 1);
//
//   void decrement() => emit(state - 1);
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => CounterCubit(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const CounterScreen(),
//       ),
//     );
//   }
// }
//
// class CounterScreen extends StatelessWidget {
//   const CounterScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text(
//           'Counter App',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 30,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.blue[700],
//       ),
//       body: Center(
//         child: BlocBuilder<CounterCubit, int>(
//           builder: (context, state) => Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//             elevation: 8,
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
//               child: Text(
//                 '$state',
//                 style: TextStyle(
//                   fontSize: 50,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue[800],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(left: 30),
//             child: FloatingActionButton(
//               backgroundColor: Colors.blue[700],
//               child: const Icon(Icons.add, color: Colors.white),
//               onPressed: () => context.read<CounterCubit>().increment(),
//             ),
//           ),
//           FloatingActionButton(
//             backgroundColor: Colors.blue[700],
//             child: const Icon(Icons.remove, color: Colors.white),
//             onPressed: () => context.read<CounterCubit>().decrement(),
//           ),
//         ],
//       ),
//     );
//   }
// }
