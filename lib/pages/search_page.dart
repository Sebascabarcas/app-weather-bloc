import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormState>();
  String? _city;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void _submit() {
    setState(() {
      autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form != null && form.validate()) {
      form.save();
      Navigator.pop(context, _city!.trim());
    }
  }
  @override
  Widget build(BuildContext build) {
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(children: [
          const SizedBox(height: 60.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              autofocus: true,
              style: const TextStyle(fontSize: 10.0),
              decoration: const InputDecoration(
                  labelText: 'City name',
                  hintText: 'more than 2 characters',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()),
              validator: (String? input) {
                if (input == null || input.trim().length < 2) {
                  return 'City name must be at least 2 characters long';
                }
                return null;
              },
              onSaved: (String? input) {
                _city = input;
              },
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(onPressed: _submit, child: const Text("How's the weather"))
        ]),
      ),
    );
  }
}
