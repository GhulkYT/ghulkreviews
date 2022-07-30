import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import '../models/comments.dart';
import 'auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Database {
  final connection = FirebaseDatabase.instance.ref();
  Database({uid});

  String uid = '';

  Future<void> updateFlutterArticlesUser(user) async {
    final usersReference = connection.child('comments').child(user.uid);
    usersReference.set(
      {
        'uid': user.uid,
        'email': user.email,
        // 'password': user.password,

        // 'username': username,
        //add as many attributes as you want
      },
    );
  }

  Future postCommentToMovie(
      String? text, String? title, String? movieId) async {
    String uid = Uuid().v4();
    String? owner = AuthenticationController().currentUser!.displayName;
    DatabaseReference commentsRef = connection.child('comments').child(owner!);
    await commentsRef.set(
      {
        'uid': uid,
        'owner': owner,
        'movieId': movieId,
        'title': title,
        'text': text
      },
    );
  }

  Future<List<Comment>?> getCommentsToMovie(
    String movieId,
  ) async {
    Query commentsRef = connection
        .child('comments')
        .orderByChild('/movieId')
        .equalTo(
            movieId); //Going to child nodes and order them all by the movieId just used    final event = await commentsRef.once(DatabaseEventType        .value); //Get event = query search once values found set valuse to be event data    List<Comment> comments = [];    Map data = event.snapshot.value as Map; //Going to map through comments    if (event.snapshot.value == null) {      return null;    }    data.forEach(      (key, value) {        comments.add(          Comment.fromJson(value),        );      },    );    return comments;  }
    final event = await commentsRef.once(DatabaseEventType
        .value); //Get event = query search once values found set valuse to be event data
    List<Comment> comments = [];
    Map data = event.snapshot.value as Map; //Going to map through comments
    if (event.snapshot.value == null) {
      return null;
    }
    data.forEach(
      (key, value) {
        comments.add(
          Comment.fromJson(value),
        );
      },
    );
    return comments;
  }
}
