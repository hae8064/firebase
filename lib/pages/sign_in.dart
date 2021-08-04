import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//회원가입 페이지
//자동 로그인 되는거다.

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _init = Firebase.initializeApp();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green
      ),
      home: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Form(
            key: _formKey,
            child: GestureDetector(
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0x665ac18e),
                              Color(0x995ac18e),
                              Color(0xcc5ac18e),
                              Color(0xff5ac18e),
                            ])),
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                          horizontal: 25, vertical: 80),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text(
                        "오늘 뭐먹지?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Image(
                        //이미지 바탕화면에 맞춰 연하게 설정
                        image: AssetImage("imgs/question.jpg"),
                        fit: BoxFit.cover,
                        color: Color(0x995ac18e),
                        colorBlendMode: BlendMode.darken,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _emailController,
                        validator: (val) =>
                        val!.isNotEmpty
                            ? null
                            : "please enter a email address.",
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.mail),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        validator: (val) =>
                        val!.length < 6
                            ? 'Enter more than 6 char'
                            : null,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.vpn_key),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.lightGreen[400],
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print("Email: ${_emailController.text}");
                            print("Email: ${_passwordController.text}");
                          }
                        },
                        // onPressed: _signIn,
                        child: Text("로그인"),
                      ),
                      Row(
                        children: [
                          Text("계정이 없으신가요 ?"),
                          SizedBox(width: 10,),
                          TextButton(onPressed: () {},
                              child: Text("회원가입", style: TextStyle(
                                color: Colors.red[400]
                              ),),
                          )
                              ],
                          )
                          // Center(
                          //   child: ElevatedButton(
                          //     onPressed: (){},
                          //     // onPressed: _signUp,
                          //     child: Text("회원가입"),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
