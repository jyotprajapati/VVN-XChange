import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vvn_xchange/Authentication/DataBaseMethods.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class Auth {
  signUp(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  registerUser(String email, String password, String userId) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      DataBaseMethods().addToFireStoreDocId(
          "user", userCredential.user.uid, {"email": email, "userId": userId});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> checkUniqueUserId(String userID) async {
    await FirebaseFirestore.instance
        .collection("users")
        .where("userId", isEqualTo: userID)
        .get()
        .then((value) {
      print(value.docs[0]['userId']);
      return value.docs.isNotEmpty;
    });
    return true;
  }
}
