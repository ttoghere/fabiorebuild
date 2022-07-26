
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../constants/firebase_constants.dart';
import '../screens/home.dart';
import '../screens/login.dart';

class AuthController extends GetxController {
  static AuthController authInstance = Get.find();
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      Get.offAll(Home());
    } else {
      Get.offAll(Login());
    }
  }

  void register(String email, String password) async{
    try {
     await auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      print(error);
    } catch (error) {
      print(error);
    }
  }

  void login(String email, String password) async {
    try {
    await  auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      print(error);
    } catch (error) {
      print(error);
    }
  }

  void signOut() {
    try {
      auth.signOut();
    } catch (error) {
      print(error);
    }
  }
}
