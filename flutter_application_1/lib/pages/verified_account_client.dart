import 'package:flutter/material.dart';

class VerifiedAccountClient extends StatelessWidget {
  final String username;
  
  const VerifiedAccountClient({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/client icon.png',  // Changed to client icon
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 30),
            Text(
              'Welcome $username to DevLance!',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/home',
                  arguments: username,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4AC5DE),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Image.asset(
              'assets/images/Logo.png',
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}