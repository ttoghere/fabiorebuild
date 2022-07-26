import 'package:flutter/material.dart';

import '../constants/firebase_constants.dart';
import '../controllers/auth_controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to Home Screen"),
            
            Text("Email:${auth.currentUser!.email}"),
            IconButton(
              onPressed: () {
                AuthController.authInstance.signOut();
              },
              icon: const Icon(Icons.exit_to_app_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
