import 'package:flutter/material.dart';
import 'package:womensafetyapp/Registrationpage.dart';
//import 'package:loginpage/registration.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _keepMeLoggedIn = false;
  @override
  void dispose() {
    _userController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _validateFields() {
    if (_userController.text.isEmpty) {
      _showSnackbar("Please enter the user Name.");
      return false;
    }
    if (_emailController.text.isEmpty) {
      _showSnackbar("Please enter a valid Email Address.");
      return false;
    }
    if (_passwordController.text.isEmpty) {
      _showSnackbar("Please select a password.");
      return false;
    }
    return true;
  }

  void _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _userController,
              decoration: const InputDecoration(
                labelText: 'User Name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email address',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                suffixIcon: Icon(Icons.visibility),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: _keepMeLoggedIn,
                  onChanged: (value) {
                    setState(() {
                      _keepMeLoggedIn = value!;
                    });
                  },
                ),
                const Text('Keep me logged in'),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                ),
                onPressed: () {
                  // Implement login logic here
                  print('Email: ${_emailController.text}');
                  print('Password: ${_passwordController.text}');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationForm()));
                },
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have a ID? "),
                TextButton(
                  onPressed: () {
                    // Implement create account logic here
                  },
                  child: const Text('Create account'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Implement forgot password logic here
              },
              child: const Text('Forgot your password?'),
            ),
            const Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement login with Google logic here
                  },
                  icon: Image.asset(
                    'lib/assets/google.png', // Replace with your Google logo path
                    height: 30,
                    width: 30,
                  ),
                  label: const Text('Continue with Google'),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement login with Apple logic here
                  },
                  icon: Image.asset(
                    'lib/assets/facebook.png', // Replace with your Apple logo path
                    height: 30,
                    width: 30,
                  ),
                  label: const Text('Continue with facebook'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
