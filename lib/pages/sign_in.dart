import 'package:firebase/pages/mypage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//처음 메인화면
//로그인 조건(id는 비어있으면 안되고, 비밀번호는 6글자 이상 써야한다.)
//회원가입 페이지

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late final Function toggleScreen;
  final _init = Firebase.initializeApp();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MyPage()));
    } on FirebaseAuthException catch (e) {
      var message = "";

      switch (e.code) {
        case 'invalid-email':
          message = "입력한 이메일이 잘못되었습니다.";
          break;

        case 'user-disabled':
          message = "로그인을 시도한 사용자는 비활성화 되어 있습니다.";
          break;

        case 'user-not':
          message = "로그인을 시도한 사용자를 찾을 수 없습니다.";
          break;

        case 'wrong-password':
          message = "비밀번호가 틀립니다.";
          break;
      }

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("로그인을 실패했습니다."),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("확인"),
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 80),
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
                            height: 80,
                          ),
                          TextFormField(
                            controller: _emailController,
                            validator: (val) => val!.isNotEmpty
                                ? null
                                : "이메일 계정을 입력해주세요",
                            decoration: InputDecoration(
                                hintText: "Email",
                                prefixIcon: Icon(Icons.mail),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            validator: (val) => val!.length < 6
                                ? "비밀번호 6자리 이상"
                                : null,
                            decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: Icon(Icons.vpn_key),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
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
                                print("Password: ${_passwordController.text}");
                              }
                              _logIn();
                              //null체크 에러나옴
                              // _formKey.currentState!.validate() ? Navigator.push(context, MaterialPageRoute(builder: (context) => MyPage())) : null;
                            },
                            // onPressed: _signIn,
                            child: Text("로그인"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("계정이 없으신가요 ?"),
                              SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "회원가입",
                                  style: TextStyle(color: Colors.red[400]),
                                ),
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
