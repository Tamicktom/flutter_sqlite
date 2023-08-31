// edit_screen.dart
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  final String name;
  final int age;
  final String gender;

  const EditScreen(
      {required this.name, required this.age, required this.gender});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String selectedGender = '';

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    ageController.text = widget.age.toString();
    selectedGender =
        widget.gender ?? ''; // Use an empty string if gender is null
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            DropdownButton<String>(
              value: selectedGender,
              onChanged: (String? newValue) {
                setState(() {
                  selectedGender = newValue!;
                });
              },
              items: <String>['Male', 'Female', 'Other']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add logic to update the user in the database here
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
