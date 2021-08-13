import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uberapp/src/models/client.dart';

class ClientProvider{
  // CollectionRe _ref;
  CollectionReference _ref;

  ClientProvider(){
    _ref = FirebaseFirestore.instance.collection('Clients');
  }

  Future<void> create(Client client){
    String errorMessage;

    try {
      return _ref.doc(client.id).set(client.toJson());
    } catch (error) {
      errorMessage = error.code;
    }

    if (errorMessage != null) {
      return Future.error(errorMessage);
    }
  }

  Future<Client> getById(String id) async{
    DocumentSnapshot documentSnapshot = await _ref.doc(id).get();
    if(documentSnapshot.exists){
      Client client  = Client.fromJson(documentSnapshot.data());
      return client;
    } 
    return null;
  }

  Stream<DocumentSnapshot> getByIdStream(String id){
    return _ref.doc(id).snapshots(includeMetadataChanges: true);
  }
}