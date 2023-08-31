import "package:flutter/material.dart";
import "package:sqflite/sqflite.dart";
import "package:path/path.dart";

class Inputs extends StatefulWidget {
  const Inputs({Key? key}) : super(key: key);

  @override
  _Inputs createState() => _Inputs();
}

class _Inputs extends State<Inputs> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Name'),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: ageController,
          decoration: const InputDecoration(labelText: 'Age'),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            final name = nameController.text;
            final age = int.tryParse(ageController.text) ?? 0;
            print(name);
            print(age);
            // database.then((db) => _insertUser(db, name, age));
            setState(() {
              nameController.clear();
              ageController.clear();
            });
          },
          child: const Text('Add User'),
        ),
      ],
    );
  }
}
