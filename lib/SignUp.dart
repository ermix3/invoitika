import 'dart:io';
import 'package:helloworld/color_schemes.g.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _companyNameController = TextEditingController();

  void _signInWithGoogle() {
    // code
  }

  void _signInWithFacebook() {
    // code
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('S\'inscrire',
            style: TextStyle(fontSize: 20, color: lightColorScheme.secondary)),
      ),
      body: Stack(children: [
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            color: lightColorScheme.onSecondaryContainer.withOpacity(0.8),
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(
                        Icons.email_outlined,
                        color: lightColorScheme.inversePrimary,
                      ),
                      hintText: 'Doe.john@mail.com',
                      helperText: 'Doe.john@mail.com',
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email est requis';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Mot de Pass',
                      icon: Icon(Icons.password,
                          color: lightColorScheme.inversePrimary),
                      hintText: '*******',
                      helperText:
                          '8 caractère dont au moins 1 numérique, 1 caractère normal et un caractère spéciale (facultatif)',
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mot de pass est requis';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      labelText: 'Prenom',
                      icon: Icon(Icons.person_2_outlined,
                          color: lightColorScheme.inversePrimary),
                      hintText: 'john',
                      helperText: 'Prenom est requis',
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Prenom est requis';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Nom',
                      icon: Icon(Icons.person_2_outlined,
                          color: lightColorScheme.inversePrimary),
                      hintText: 'Doe',
                      helperText: 'Nom est requis',
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nom est requis';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _companyNameController,
                    decoration: InputDecoration(
                      labelText: 'Nom de Societe(Optional)',
                      icon: Icon(Icons.compare_outlined,
                          color: lightColorScheme.inversePrimary),
                      hintText: 'Microsoft.',
                      helperText: 'Nom de votre societe',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 13),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Or Connect with :'),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Google Sign-In Button
                          ElevatedButton.icon(
                            icon: Image.asset(
                              'images/google.png',
                              width: 20,
                              height: 20,
                            ),
                            onPressed: _signInWithGoogle,
                            label: const Text('Google'),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          // Facebook Sign-In Button
                          ElevatedButton.icon(
                            icon: Icon(Icons.facebook_outlined,
                                color: lightColorScheme.tertiary),
                            onPressed: _signInWithFacebook,
                            label: const Text('Facebook'),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          print('Email: ${_emailController.text}');
                          print('Password: ${_passwordController.text}');
                          print('First Name: ${_firstNameController.text}');
                          print('Last Name: ${_lastNameController.text}');
                          print('Company Name: ${_companyNameController.text}');
                        }
                      },
                      child: const Text('Sign Up'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
