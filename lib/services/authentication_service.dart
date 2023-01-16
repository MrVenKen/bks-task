import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {

  FirebaseAuth auth = FirebaseAuth.instance;
  User? get currentUser => auth.currentUser;

  Stream<User?> onAuthStateChanged(){
    return FirebaseAuth.instance.authStateChanges();
  }


Future<UserCredential> registrationWithEmail(String email, String password) async {
  late UserCredential userCredential;
  try{
    userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }on FirebaseAuthException catch(e) {
    if(e.code == 'weak-password'){
      print('The password provided is too weak.');
    }else if (e.code == 'e-mail already in use');
    print('The account already exist for that email.');
  }catch(e){
    print(e);

  }
  return userCredential;
}

Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
  late UserCredential userCredential;
  try{
    userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }on FirebaseAuthException catch(e){
    if (e.code == 'user-not-found'){
      print('No user found for that mail');
    }else if (e.code == 'wrong-password'){
      print('Wrong password provided for that user.');
    }
  }
  return userCredential;
}

User? myCurrentUser(){
  final user = auth.currentUser;
  return user;
}

Future<void> signOut() async {
  await auth.signOut();
}

}