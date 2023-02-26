// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names
import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({Key? key}) : super(key: key);

  final scoreTextController = TextEditingController();
  void calculateGrade(BuildContext context) {
    if (double.parse(scoreTextController.text) >= 90) {
      ShowSnackBar(context, "A");
    } else if (double.parse(scoreTextController.text) >= 80) {
      ShowSnackBar(context, "B");
    } else if (double.parse(scoreTextController.text) >= 70) {
      ShowSnackBar(context, "C");
    } else if (double.parse(scoreTextController.text) >= 60) {
      ShowSnackBar(context, "D");
    } else {
      ShowSnackBar(context, "F");
    }
  }

  void ShowSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Grade Calculator"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: scoreTextController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Type your score",
                  prefixIcon: Icon(Icons.percent),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  calculateGrade(context);
                },
                child: Text("Calculate"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  onPrimary: Colors.white,
                )),
            Spacer(),
            Text(
              "A",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
