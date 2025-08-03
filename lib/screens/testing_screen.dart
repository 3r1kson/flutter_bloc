import 'package:flutter/material.dart';

class TestingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TEsting screen page"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          }, 
          child: Text("Press me")
        ),
      ),
    );
  }
  
}