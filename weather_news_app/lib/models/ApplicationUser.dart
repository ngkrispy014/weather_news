class ApplicationUser {
  final String userId;
  final String email;

  ApplicationUser({this.email, this.userId});

  Map<String, dynamic> toMap() {
    return {'userId': userId, 'email': email};
  }

  factory ApplicationUser.fromFirestore(Map<String, dynamic> firestore) {
    if (firestore == null) return null;
    return ApplicationUser(
        userId: firestore['userId'], email: firestore['email']);
  }
}
