import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 186, 226, 219),
      appBar: AppBar(
        title: Center(child: Text('Login')),
        backgroundColor: const Color.fromARGB(255, 68, 102, 238),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/login.png',
              height: 100,
            ), // Add your logo here
            SizedBox(height: 20),
            Text(
              'Welcome back!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Please login to continue',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 30),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email, color: Colors.blueAccent),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.blue[50],
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock, color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.blue[50],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Ensure login credentials are correct before navigating
                // For now, we are directly navigating after pressing login
                if (emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => HomeScreen()),
                  );
                } else {
                  // Show an error message if email/password is empty or invalid
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter valid credentials')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.green, // Replaced primary with backgroundColor
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            TextButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SignupScreen()),
                  ),
              child: Text(
                "Don't have an account? Sign Up",
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}