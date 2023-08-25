//* Libraries imports
import 'package:flutter/material.dart';

//* Local imports
import "package:app_crud_sqlite/db.dart";
import "package:app_crud_sqlite/addproduct.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppCrudSQLITE"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddProduct()));
            },
            child: const Text("Adicionar"),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Listar"),
          ),
          const AddProduct()
        ]),
      ),
    );
  }
}
