import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:netflix_clone/screen/home_screen.dart';
import 'package:netflix_clone/screen/like_screen.dart';
import 'package:netflix_clone/screen/more_screen.dart';
import 'package:netflix_clone/screen/search_screen.dart';
import 'package:netflix_clone/widget/bottom_bar.dart';



// void main() => runApp(MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      appId: '1:182780258327:web:1c230c43b306246d385452',
      apiKey: 'AIzaSyDLQ8sHU4F-wgeyvMn-GEnjMbfA-4rDNZg',
      projectId: 'netflix-clone-ebe21',
      storageBucket: "netflix-clone-ebe21.appspot.com",
      messagingSenderId: '182780258327',
      measurementId: 'G-Q2PC7B3F2N',
      authDomain: 'netflix-clone-ebe21.firebaseapp.com',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController controller;

  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    return MaterialApp(
      title: 'BbongFlix',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        // accentColor: Colors.white,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              SearchScreen(),
              LikeScreen(),
              MoreScreen(),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
