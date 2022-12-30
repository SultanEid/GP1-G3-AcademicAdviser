import 'package:academic_adviser/Models/Certificate.dart';
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

  //=============================
  List<Certificate> _ProfileCertificatesFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Certificate(
        certificateTitle: doc.get('certificateTitle'),
        certificaIssuer: doc.get('certificaIssuer'),
        date: doc.get('date'),
      );
    }).toList();
  }

  Stream<List<Certificate>> get CertificateData {
    return FirebaseFirestore.instance.collection("Profile").doc(uid).collection("ProfileInfo").doc("Certificate").collection("Certificates").snapshots().map(_ProfileCertificatesFromSnapshot);
  }

  //==============================
  //Stream to keep refreshing the app with the database collcetion(=> docments) / get Profile stream

  Stream< List<DatabaseVariable>> get ProfileSnapshot {
    return ProfileCollection.snapshots().map(_ProfileFromSnapshot);
  }

  Future updateUserData(String Name) async{
    return await ProfileCollection.doc(uid).set({
      'Name' : Name,
    });
  }
}