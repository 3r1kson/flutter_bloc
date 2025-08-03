import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget{
  const MyErrorWidget({
    super.key, 
    required this.errorText, 
    required this.retryFunction
  });

  final String errorText;
  final Function retryFunction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.red,),
          SizedBox(height: 10,),
          Text("Error $errorText", style: TextStyle(color: Colors.red),),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {retryFunction();}, 
            child: Text("Retry", style: TextStyle(color: Colors.black),)
          )
        ],
      ),
    );
  }
}