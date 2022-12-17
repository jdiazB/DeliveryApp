
import 'package:flutter/material.dart';

class searchdelegate extends SearchDelegate {


  // List<TaskModel> tasks;
  //
  // TaskSearchDelegate({required this.tasks});



  // List<String> names = [
  //   "Juan",
  //   "Luis",
  //   "Carlos",
  //   "Diana",
  //   "Susana",
  //   "Maria",
  //   "Alejandra",
  //   "Mariela",
  //   "Angela",
  // ];

  @override
  String? get searchFieldLabel => "Buscar numero de pedido...";

  @override
  // TODO: implement searchFieldStyle
  TextStyle? get searchFieldStyle => TextStyle(
    fontSize: 16.0,
  );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(
          Icons.close,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // List<TaskModel> results = tasks.where((element) => element.title.toLowerCase().contains(query.toLowerCase())).toList();

    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index){
          return Text("pedido...");
          // ItemTaskWidget(
            // taskModel: results[index],
          // );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    // List<TaskModel> results = tasks.where((element) => element.title.toLowerCase().contains(query.toLowerCase())).toList();

    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index){
          return Text("pedido...");
          //   ItemTaskWidget(
          //   taskModel: results[index],
          // );
        },
      ),
    );
  }
}