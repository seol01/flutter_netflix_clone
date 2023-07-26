import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/widget/box_slider.dart';
import 'package:netflix_clone/widget/carousel_slider.dart';
import 'package:netflix_clone/widget/circle_slider.dart';

import '../model/model_movie.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> streamData;

  @override
  void initState() {
    super.initState();
    streamData = firebaseFirestore.collection('movie').snapshots();
  }

  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('movie').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        // return _buildBody(context, snapshot.data?.docs ?? []);
        return _buildBody(context, snapshot.data!.docs);
      },
    );
  }

  // List<Movie> movies = [
  //   Movie.fromMap(
  //       {
  //         'title': '사랑의 불시착',
  //         'keyword': '사랑/로맨스/판타지',
  //         'poster': 'test_movie_1.png',
  //         'like': false
  //       }
  //   ),
  //   Movie.fromMap(
  //       {
  //         'title': '사랑의 불시착',
  //         'keyword': '사랑/로맨스/판타지',
  //         'poster': 'test_movie_1.png',
  //         'like': false
  //       }
  //   ),
  //   Movie.fromMap(
  //       {
  //         'title': '사랑의 불시착',
  //         'keyword': '사랑/로맨스/판타지',
  //         'poster': 'test_movie_1.png',
  //         'like': false
  //       }
  //   ),
  //   Movie.fromMap(
  //       {
  //         'title': '사랑의 불시착',
  //         'keyword': '사랑/로맨스/판타지',
  //         'poster': 'test_movie_1.png',
  //         'like': false
  //       }
  //   ),
  // ];

  Widget _buildBody(BuildContext context, List<QueryDocumentSnapshot> snapshot) {
    List<Movie> movies = snapshot.map((d) => Movie.fromSnapshot(d)).toList();
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            CarouselImage(movies: movies),
            TopBar(),
          ],
        ),
        CircleSlider(movies: movies),
        BoxSlider(movies: movies),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'images/bbongflix_logo.png',
            fit: BoxFit.contain,
            height: 25,
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              'TV 프로그램',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '영화',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
