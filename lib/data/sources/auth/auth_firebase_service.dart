import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/auth/create_user_req.dart';
import '../../models/auth/signin_user_req.dart';

abstract class AuthFirebaseService{

  Future<Either> signup(CreateUserReq createUseReq);

  Future<Either> signin(SigninUserReq signinUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUserReq.email,
          password: signinUserReq.password);
      return Right('SignIn was Successful');
    } on FirebaseAuthException catch(e){
      String message ='';
      if(e.code == 'invalid-email'){
        message = 'Not user found';
      }
      else if(e.code =='invalid-credential'){
        message = 'Incorrect password';
      }
      return left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUseReq) async {
   try{
       var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: createUseReq.email,
            password: createUseReq.password);
       FirebaseFirestore.instance.collection('Users').add(
         {
           'name' : createUseReq.fullName,
           'email' : data.user?.email,
           'password' : createUseReq.password

         }
       );
        return Right('SignUp was Successful');
   } on FirebaseAuthException catch(e){
        String message ='';
        if(e.code == 'weak-password'){
          message = 'The password provided is too weak';
        }
        else if(e.code =='email-already-in-use'){
          message = 'An account already exist with that email';
        }
        return left(message);
   }
  }

}