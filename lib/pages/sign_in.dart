import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//회원가입 페이지
//자동 로그인 되는거다.

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  void _signUp() async{
    //회원가입 메소드
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: "barry.allern@example.com",
          password: "SuperSecretPassword!");
    }
    on FirebaseAuthException catch(e){
      if(e.code == "weak-apssword"){
        print("The password provided is too weak");
      }
      else if(e.code == "email-already-in-use"){
        print("The account already exists for that email.");
      }
    }
    catch(e){
      print(e);
    }
  }

  void _signIn() async{
    //로그인 메소드
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "barry.allern@example.com",
          password: "SuperSecretPassword!");
    }
    on FirebaseAuthException catch(e){
      if(e.code == "user-not-found"){
        print("No user found for that email.");
      }
      else if(e.code == "wrong-password"){
        print("Wrong password provided for that user.");
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("회원 로그인"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: _signUp,
                child: Text("회원가입"),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: _signIn,
                child: Text("로그인"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
