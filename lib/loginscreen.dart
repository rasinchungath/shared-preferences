import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController textcontroller1 = TextEditingController();
  TextEditingController textcontroller2 = TextEditingController();
  late String name1;
  late String name2;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'value is empty';
                  }
                  return null;
                },
                controller: textcontroller1,
                decoration: InputDecoration(
                  hintText: 'Enter username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'value is empty';
                  }
                  return null;
                },
                obscureText: true,
                controller: textcontroller2,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  formkey.currentState?.validate();
                  checkLoggedIn(context);
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkLoggedIn(context) async {
    name1 = textcontroller1.text;
    name2 = textcontroller2.text;
    if (name1.length > 4 && name1 != '') {
      if (name1 == name2) {
        final sharedPrefs = await SharedPreferences.getInstance();
        sharedPrefs.setBool(saveKey, true);

        Navigator.pushReplacementNamed(context, 'homeScreen');
      } else {
        showalert('Password mismatch', context);
      }
    } else if (name1 == '' || name2 == '') {
      showalert('Password can\'t be blank', context);
    } else if (name1.length <= 4 || name2.length <= 4) {
      showalert('Password length must be greater than 4', context);
    }
  }

  showalert(String alert, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(alert),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
