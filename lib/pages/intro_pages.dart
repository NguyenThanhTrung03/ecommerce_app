import 'package:ecommerce_app/controllers/login_register_controller.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/components/my_button.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _login(context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      loginRegisterController.signInWithEmailAndPassword(
          context, emailController.text, passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.phone_iphone,
                size: 72,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(height: 25),
              const Text(
                "TrungApple",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Connecting You to the Future",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onSaved: (value) {},
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onSaved: (value) {},
                    ),
                    const SizedBox(height: 20),
                    MyButton(
                      onTap: () {
                        _login(context);
                      },
                      color: Colors.blue,
                      height: 50,
                      width: 50,
                      child: const Text('Login',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    "You don't have an account yet, register now",
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
