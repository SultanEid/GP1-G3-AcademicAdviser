import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:academic_adviser/Models/DatabaseVariable.dart';

class DatabaseService {
  final String? uid;
  final CollectionReference ProfileCollection = FirebaseFirestore.instance.collection('Profile');
  DatabaseService({ this.uid});


  //Profile List retrived from the snapshot
  List<DatabaseVariable> _ProfileFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc) {
      return DatabaseVariable(
        Name: doc.get('Name'),
      );
    }).toList();
  }
  //Stream to keep refreshing the app with the database collcetion(=> docments) / get Profile stream

  Stream< List<DatabaseVariable>> get ProfileSnapshot {
    return ProfileCollection.snapshots().map(_ProfileFromSnapshot);
  }

  Stream <QuerySnapshot> get ProfileQSnapshot {
    return ProfileCollection.snapshots();
  }

  Future updateUserData(String Name) async{
    return await ProfileCollection.doc(uid).set({
      'Name' : Name,
    });
  }
}