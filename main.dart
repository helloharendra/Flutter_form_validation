import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            leading: const Icon(Icons.menu),
            title: const Text('form Validation'),
            actions: const [
              Icon(Icons.search),
            ]),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Enter Full Name',
                labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your name';
              }
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                icon: Icon(Icons.call),
                hintText: 'Enter Contact',
                labelText: 'Enter Mob. No.'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter contact';
              }
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter email';
              }
              return null;
            },
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Enter your Email',
              labelText: 'E-mail',
            ),
          ),
          const TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              icon: Icon(Icons.details),
              hintText: 'Enter Address',
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.datetime,
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_month),
              hintText: 'Date of Birth',
              labelText: 'DOB',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Data Submitted'),
                    ),
                  );
                }
              },
              child: const Text('Submit'))
        ],
      ),
    );
  }
}
