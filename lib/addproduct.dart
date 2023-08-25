import 'package:flutter/material.dart';

import './db.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddBooks();
  }
}

class _AddBooks extends State<AddProduct> {
  TextEditingController name = TextEditingController();
  TextEditingController rollno = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController quantity = TextEditingController();

  //test editing controllers for form

  var mydb = MyDb(); //mydb new object from db.dart

  @override
  void initState() {
    mydb.open(); //initilization database

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Product"),
        ),
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  hintText: "Product Name",
                ),
              ),
              TextField(
                controller: rollno,
                decoration: const InputDecoration(
                  hintText: "Roll No.",
                ),
              ),
              TextField(
                controller: price,
                decoration: const InputDecoration(
                  hintText: "Price:",
                ),
              ),
              TextField(
                controller: quantity,
                decoration: const InputDecoration(
                  hintText: "Quantity:",
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    mydb.db.rawInsert(
                        "INSERT INTO products (name, roll_no, price, quantity) VALUES (?, ?, ?);",
                        [
                          name.text,
                          rollno.text,
                          int.parse(price.text),
                          int.parse(quantity.text)
                        ]); //add student from form to database
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("New Student Added")));
                    //show snackbar message after adding student
                    name.text = "";
                    rollno.text = "";
                    price.text = "";
                    quantity.text = "";
                    //clear form to empty after adding data
                  },
                  child: const Text("Save Student Data")),
            ],
          ),
        ));
  }
}
