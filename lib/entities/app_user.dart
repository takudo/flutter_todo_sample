import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String id;
  final String name;
  final String googleAccountId;
  final String facebookAccountId;
  AppUser({
    this.id,
    this.name,
    this.googleAccountId = null,
    this.facebookAccountId = null,
  });

  static AppUser fromFirestore(DocumentSnapshot snapshot) {
    final map = snapshot.data();
    return AppUser(
        id: snapshot.id,
        name: map['name'],
        googleAccountId: map['googleAccountId'],
        facebookAccountId: map['facebookAccountId']);
  }

  toFirestore() {
    return {'name': name, 'googleAccountId': googleAccountId, 'facebookAccountId': facebookAccountId};
  }
}