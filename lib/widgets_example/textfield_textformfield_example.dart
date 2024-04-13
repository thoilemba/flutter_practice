import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class TextFieldTextFormFieldExample extends StatelessWidget {
  const TextFieldTextFormFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Text Input Example'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextFormFieldExample(),
                const SizedBox(height: 20),
                TextFieldExample(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFormFieldExample extends StatefulWidget {
  const TextFormFieldExample({super.key});

  @override
  TextFormFieldExampleState createState() => TextFormFieldExampleState();
}

class TextFormFieldExampleState extends State<TextFormFieldExample> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _textController,
        decoration: const InputDecoration(
          labelText: 'Enter your name',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your name';
          }
          return null;
        },
        onFieldSubmitted: (value) {
          if (_formKey.currentState!.validate()) {
            // Form is valid, do something with the input
            if (kDebugMode) {
              print('Name submitted: $value');
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

class TextFieldExample extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  TextFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      decoration: const InputDecoration(
        labelText: 'Enter your email',
        border: OutlineInputBorder(),
      ),
      onSubmitted: (value) {
        // Handle form submission
        if (kDebugMode) {
          print('Email submitted: $value');
        }
      },
    );
  }
}
