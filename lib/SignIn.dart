import 'package:flutter/material.dart';
import 'package:helloworld/SignUp.dart';
import 'package:helloworld/color_schemes.g.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Connexion'.toUpperCase(),
            style: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Icon(Icons.lock,
                  size: 80, color: lightColorScheme.inversePrimary),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email est requis';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mot de pass est requis';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _signIn,
                child: const Text('Connexion'),
              ),
              const SizedBox(height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('Pas de compte?'),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  ),
                  child: Text('Cree Le.',
                      style: TextStyle(color: lightColorScheme.primary)),
                ),
              ]),
              // TextButton(
              // onPressed: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const SignUp()),
              //   );
              // },
              // child: const Text('Pas de compte? Cree Le.'),
              // ),
              const SizedBox(height: 20),
              const Text('or Connect with:'),
              const SizedBox(height: 8),
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
        ),
      ),
    );
  }

  void _signIn() {
    if (_formKey.currentState?.validate() ?? false) {
      String email = _emailController.text;
      String password = _passwordController.text;
    }
  }

  void _signInWithGoogle() {
    print('Signing in with Google');
  }

  void _signInWithFacebook() {
    print('Signing in with Facebook');
  }
}
