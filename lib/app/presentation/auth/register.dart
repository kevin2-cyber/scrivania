import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth_provider.dart';
import '../home.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _nameController =  TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  bool validate() {
    if(_key.currentState!.validate()) {
      _key.currentState!.save();
      return true;
    } else {
      return false;
    }
  }

  Future<void> register() async {
    try {
      if(validate()) {
        await Provider.of<AuthProvider>(context, listen: false).register(
          _nameController.text,
          _emailController.text,
          _passwordController.text,
        );
        if(mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Home()
            ),
          );
        }
      }
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(err.toString()),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: SvgPicture.asset("assets/Logo.svg"),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Join us",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Enter your credentials to continue",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: _key,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      validator: (value) =>
                      value!.isEmpty ? "Full name cannot be empty" : null,
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) =>
                      value!.isEmpty ? "Email cannot be empty" : null,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) =>
                      value!.isEmpty ? "Password cannot be empty" : null,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: register,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87,
                          minimumSize: const Size(double.infinity, 45)),
                      child: const Text("Register"),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) => const Login(),
                            ),
                          );
                        },
                        child: const Text(
                          "Already having an account? Login",
                          style: TextStyle(color: Color(0XFFA75151)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
