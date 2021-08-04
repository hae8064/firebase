import 'package:firebase/pages/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'mypage.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
    builder: (BuildContext context, AsyncSnapshot<User?> user){
          if(user.hasData){
            //데이터가 있을 때는
            return MyPage();
          }

          else{
            //데이터 없으면
            return SignIn();
          }
      return Container();
    });
  }
}
