import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  String title;
  String keyword;
  String poster;
  bool like;
  DocumentReference reference; // 실제 firebase firestore에 있는 데이터 컬럼을 잠조할 수 있는 링크

  Movie.fromMap(Map<String, dynamic> map, {required this.reference})
  : title = map['title'],
    keyword = map['keyword'],
    poster = map['poster'],
    like = map['like'];

  // 자동 import하고 this.fromMap을 호출한다.
  // Movie.fromSnapshot(DocumentSnapshot snapshot)
  // : this.fromMap(snapshot.data as Map<String, dynamic>, reference: snapshot.reference);

  Movie.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>, reference: snapshot.reference);

  @override
  String toString() => "Movie<$title:$keyword>";
}

// class Movie {
//   String title;
//   String keyword;
//   String poster;
//   bool like;
//
//   Movie({required this.title, required this.keyword, required this.poster, required this.like});
//
//   factory Movie.fromSnapshot(QueryDocumentSnapshot snapshot) {
//     Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
//     return Movie(
//       title: data['title'],
//       keyword: data['keyword'],
//       poster: data['poster'],
//       like: data['like'],
//     );
//   }
// }
