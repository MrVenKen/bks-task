import 'package:firebase_auth/firebase_auth.dart';

class UserProfileModel{
  UserProfileModel([
    this.userName,
    this.uid,
    this.email
  ]);
  User? loggedInUser;
  String? userName;
  String? uid;
  String? email;
}