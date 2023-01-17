

import 'package:bks_case/models/user_profile_model.dart';
import 'package:bks_case/services/authentication_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthenticationService _authenticationService = AuthenticationService();

  void createUserProfile(UserProfileModel profile){
    final user = _authenticationService.myCurrentUser();
    _firestore.collection('userProfile').doc(user?.uid).set({
      'userName': profile.userName,
      'uid': user?.uid,
      'email': profile.email,
    });
  }
}