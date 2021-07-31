import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uberapp/src/models/driver.dart';

class DriverProvider{
  // CollectionRe _ref;
  CollectionReference _ref;

  DriverProvider(){
    _ref = FirebaseFirestore.instance.collection('Drivers');
  }

  Future<void> create(Driver driver){
    String errorMessage;

    try {
      return _ref.doc(driver.id).set(driver.toJson());
    } catch (error) {
      errorMessage = error.code;
    }

    if (errorMessage != null) {
      return Future.error(errorMessage);
    }
  }

  Future<Driver> getById(String id) async{
    DocumentSnapshot documentSnapshot = await _ref.doc(id).get();
    if(documentSnapshot.exists){
      Driver driver = Driver.fromJson(documentSnapshot.data());
      return driver;
    }
    return null;
  }
}