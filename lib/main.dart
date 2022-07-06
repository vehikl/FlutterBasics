import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Store',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Store'),
        ),
        body: const MyCustomForm(),
      )
    );
  }
}

class MyCustomForm extends StatefulWidget {
    const MyCustomForm({super.key});

    @override
    MyCustomFormState createState() {
        return MyCustomFormState();
    }
}

class MyCustomFormState extends State<MyCustomForm> {
    final _formKey = GlobalKey<FormState>();

    @override
  Widget build(BuildContext context){
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter a product name'
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter a product price'
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid price';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              )
            )
          ],
        ),
      );
    }
}
