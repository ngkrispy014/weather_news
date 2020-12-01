import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weather_news_app/models/ApplicationUser.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addUser(ApplicationUser user) {
    return _db.collection('users').doc(user.userId).set(user.toMap());
  }

  Future<ApplicationUser> fetchUser(String userId) {
    return _db
        .collection('users')
        .doc(userId)
        .get()
        .then((snapshot) => ApplicationUser.fromFirestore(snapshot.data()));
  }
}