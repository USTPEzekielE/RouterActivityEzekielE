import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  String formName = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("1st Page"),
        backgroundColor: Colors.green,
        leading: Icon(Icons.login),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Name"
              ),
              onSaved: (value) => formName = value!,
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(name: formName ?? "")
                    )
                  );
                }
              },
              child: Text("Go To 2nd Page")
            )
          ]
        )
      )
    );
  }
}

class SecondPage extends StatelessWidget {
  String name;
  
  SecondPage({required this.name});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("2nd Page"),
        backgroundColor: Colors.red,
        leading: Icon(Icons.login),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text("Welcome $name to Second Page",
            textAlign: TextAlign.center    
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Go Back To 1st Page")
          ),
        ]
      )
    );
  }
}
