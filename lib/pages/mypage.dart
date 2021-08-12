import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase/pages/sign_in.dart';
import 'package:firebase/random_choice/dinner.dart';
import 'package:firebase/random_choice/lunch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

//MyPage_Home 부분

//carousel slider 부분 이미지 (음식사진)
final List<String> imageList = [
  'https://lh3.googleusercontent.com/proxy/ehTgE2_xhY8L8zLKOKvh1O3av5fGXBvWz0ZqED3j_t5T9gp3bq_9HfvQcMfJxhGcTyZnlrPsi0pmDCkq5DAhckNyffnDtOr81e2f8A'
      'https://www.newiki.net/w/images/thumb/d/d9/Jjajangmyeon.jpg/450px-Jjajangmyeon.jpg'
];

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _selectedIndex = 1; //현재 선택된 페이지
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[300],
          title: SizedBox(width: 300,
              child: Text("오늘 뭐먹지?")),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('imgs/profile.jpg'),
                ),
                accountName: Text("맛집 탐방러"),
                accountEmail: Text("${FirebaseAuth.instance.currentUser!.email}"),
                onDetailsPressed: (){
                  print("arrow is clicked");
                },
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0)
                  )
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.grey[850],
                ),
                title: Text('Home'),
                onTap: () {
                  print('Home is clicked');
                },
                trailing: Icon(Icons.add),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.grey[850],
                ),
                title: Text('Setting'),
                onTap: () {
                  print('Setting is clicked');
                },
                trailing: Icon(Icons.add),
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.grey[850],
                ),
                title: Text('Logout'),
                onTap: () {
                  FirebaseAuth.instance.signOut;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                },
                trailing: Icon(Icons.add),
              ),
            ],
          ),
        ),


        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey,
          selectedItemColor: Colors.lightGreenAccent,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          currentIndex: _selectedIndex,
          //현재 선택된 Index
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;

              if (_selectedIndex == 2) {
                //맛집 랭킹
              } else if (_selectedIndex == 0) {
                //지역별
              }
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.map_outlined), title: Text("지역별")),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), title: Text("맛집랭킹")),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Stack(
                fit: StackFit.passthrough,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0x665ac18e),
                            Color(0x995ac18e),
                            Color(0xcc5ac18e),
                            Color(0xff5ac18e),
                          ]),
                    ),
                  ),
                ],
              ),

              //상단 배너 부분 이미지
              ImageSlideshow(
                height: 200,
                initialPage: 0,
                indicatorColor: Colors.blue,
                indicatorBackgroundColor: Colors.green,
                children: [
                  Image.network(
                      'https://lh3.googleusercontent.com/proxy/ehTgE2_xhY8L8zLKOKvh1O3av5fGXBvWz0ZqED3j_t5T9gp3bq_9HfvQcMfJxhGcTyZnlrPsi0pmDCkq5DAhckNyffnDtOr81e2f8A',
                      fit: BoxFit.cover),
                  Image.network(
                    'https://www.newiki.net/w/images/thumb/d/d9/Jjajangmyeon.jpg/450px-Jjajangmyeon.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://recipe1.ezmember.co.kr/cache/recipe/2015/05/27/38013d1dfd8fa46a871b9cda074b26341.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://lh3.googleusercontent.com/proxy/dzTfp6d9-cJJum9I0GWFrngk1huaXHXrAz-g_K9y5sFSHLSQ8e3nmpDQeBX-38bOz7D-ozSKNCC_AV-q8KRw3hTaWh81tCQ2jNHocFk7fEf5-nJFGbnjYmNIlGAnXe0BataSSlfPulwn6ro82BMt9NnVaRk67e8Zd0EmPuZ1y3aeP4tDATXe1A',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://ai.esmplus.com/foodjang01/images/221500368_b_1.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                      'https://lh3.googleusercontent.com/proxy/ehTgE2_xhY8L8zLKOKvh1O3av5fGXBvWz0ZqED3j_t5T9gp3bq_9HfvQcMfJxhGcTyZnlrPsi0pmDCkq5DAhckNyffnDtOr81e2f8A',
                      fit: BoxFit.cover),
                  Image.network(
                    'https://www.newiki.net/w/images/thumb/d/d9/Jjajangmyeon.jpg/450px-Jjajangmyeon.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://recipe1.ezmember.co.kr/cache/recipe/2015/05/27/38013d1dfd8fa46a871b9cda074b26341.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://lh3.googleusercontent.com/proxy/dzTfp6d9-cJJum9I0GWFrngk1huaXHXrAz-g_K9y5sFSHLSQ8e3nmpDQeBX-38bOz7D-ozSKNCC_AV-q8KRw3hTaWh81tCQ2jNHocFk7fEf5-nJFGbnjYmNIlGAnXe0BataSSlfPulwn6ro82BMt9NnVaRk67e8Zd0EmPuZ1y3aeP4tDATXe1A',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://ai.esmplus.com/foodjang01/images/221500368_b_1.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                      'https://lh3.googleusercontent.com/proxy/ehTgE2_xhY8L8zLKOKvh1O3av5fGXBvWz0ZqED3j_t5T9gp3bq_9HfvQcMfJxhGcTyZnlrPsi0pmDCkq5DAhckNyffnDtOr81e2f8A',
                      fit: BoxFit.cover),
                  Image.network(
                    'https://www.newiki.net/w/images/thumb/d/d9/Jjajangmyeon.jpg/450px-Jjajangmyeon.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://recipe1.ezmember.co.kr/cache/recipe/2015/05/27/38013d1dfd8fa46a871b9cda074b26341.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://lh3.googleusercontent.com/proxy/dzTfp6d9-cJJum9I0GWFrngk1huaXHXrAz-g_K9y5sFSHLSQ8e3nmpDQeBX-38bOz7D-ozSKNCC_AV-q8KRw3hTaWh81tCQ2jNHocFk7fEf5-nJFGbnjYmNIlGAnXe0BataSSlfPulwn6ro82BMt9NnVaRk67e8Zd0EmPuZ1y3aeP4tDATXe1A',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://ai.esmplus.com/foodjang01/images/221500368_b_1.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                      'https://lh3.googleusercontent.com/proxy/ehTgE2_xhY8L8zLKOKvh1O3av5fGXBvWz0ZqED3j_t5T9gp3bq_9HfvQcMfJxhGcTyZnlrPsi0pmDCkq5DAhckNyffnDtOr81e2f8A',
                      fit: BoxFit.cover),
                  Image.network(
                    'https://www.newiki.net/w/images/thumb/d/d9/Jjajangmyeon.jpg/450px-Jjajangmyeon.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://recipe1.ezmember.co.kr/cache/recipe/2015/05/27/38013d1dfd8fa46a871b9cda074b26341.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://lh3.googleusercontent.com/proxy/dzTfp6d9-cJJum9I0GWFrngk1huaXHXrAz-g_K9y5sFSHLSQ8e3nmpDQeBX-38bOz7D-ozSKNCC_AV-q8KRw3hTaWh81tCQ2jNHocFk7fEf5-nJFGbnjYmNIlGAnXe0BataSSlfPulwn6ro82BMt9NnVaRk67e8Zd0EmPuZ1y3aeP4tDATXe1A',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://ai.esmplus.com/foodjang01/images/221500368_b_1.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
                onPageChanged: (value) {
                  print("Page changed :  $value");
                },
                autoPlayInterval: 2000,
              ),

              SizedBox(
                height: 30,
              ),
              //점심 부분
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Lunch()));
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 80.0,
                          backgroundImage: AssetImage('imgs/lunch.PNG'),
                        ),
                        Text(
                          "점심",
                          style: TextStyle(
                              fontSize: 25, color: Colors.orange[300]),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: 20,
                  ),

                  //저녁 부분
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dinner()),
                      );
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 80.0,
                          backgroundImage: AssetImage('imgs/dinner.PNG'),
                        ),
                        Text(
                          "저녁",
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
