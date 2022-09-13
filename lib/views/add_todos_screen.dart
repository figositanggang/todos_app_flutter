import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/add_todos_provider.dart';
import 'package:todo_app/provider/todos_provider.dart';

class AddTodosScreen extends StatefulWidget {
  const AddTodosScreen({Key? key}) : super(key: key);

  @override
  _AddTodosScreenState createState() => _AddTodosScreenState();
}

class _AddTodosScreenState extends State<AddTodosScreen> {
  @override
  Widget build(BuildContext context) {
    final addTodosProvider = Provider.of<AddTodosProvider>(context);
    final todosProvider = Provider.of<TodosProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todos"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.cyan.shade100,
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width / 1.25,
                child: Column(
                  children: [
                    _title(context),
                    _trailing(context),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          try {
                            todosProvider.addTodos = {
                              "title": addTodosProvider.getTitle.text,
                              "trailing": addTodosProvider.getTrailing.text,
                            };
                          } catch (e) {}
                        },
                        child: Text("Add"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _title(BuildContext context) {
    final addTodosProvider = Provider.of<AddTodosProvider>(context);

    return TextFormField(
      controller: addTodosProvider.getTitle,
      decoration: InputDecoration(labelText: "Title"),
      onChanged: (val) {
        addTodosProvider.setTitle = val;
      },
    );
  }

  TextFormField _trailing(BuildContext context) {
    final addTodosProvider = Provider.of<AddTodosProvider>(context);

    return TextFormField(
      controller: addTodosProvider.getTrailing,
      decoration: InputDecoration(labelText: "Title"),
      onChanged: (val) {
        addTodosProvider.settrailing = val;
      },
    );
  }
}
