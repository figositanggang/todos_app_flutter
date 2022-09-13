import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/add_todos_provider.dart';
import 'package:todo_app/provider/todos_provider.dart';
import 'package:todo_app/views/add_todos_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TodosProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddTodosProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/add_todos": (context) => AddTodosScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final todosProvider = Provider.of<TodosProvider>(context);
    final addTodosProvider = Provider.of<AddTodosProvider>(context);

    resetTextField() {
      addTodosProvider.getTitle.text = "";
      addTodosProvider.getTrailing.text = "";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: todosProvider.getTodos
              .map(
                (e) => Column(
                  children: [
                    _ListTile(
                      title: e["title"],
                      trailing: e["trailing"],
                    ),
                    Divider(height: 1, color: Colors.white),
                  ],
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add_todos");
          resetTextField();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  final String title;
  final String trailing;

  _ListTile({
    Key? key,
    required this.title,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        title: Text(title),
        trailing: Text(trailing),
        tileColor: Colors.green.shade300,
      ),
      onTap: () {},
      focusColor: Colors.black.withOpacity(.1),
      hoverColor: Colors.black.withOpacity(.1),
      splashColor: Colors.transparent,
      highlightColor: Colors.black.withOpacity(.1),
    );
  }
}
