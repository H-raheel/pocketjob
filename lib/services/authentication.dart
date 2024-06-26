import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pocketjob/services/userServices.dart';

import '../models/users.dart';

class AuthServ {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  userServ dbService = userServ();
  //Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInwithGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      print("success");
      GoogleSignInAuthentication? googleSignInAuthentication =
          await googleUser?.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      if (userCredential.user != null) {
        UserModel? exits = await dbService.getUser(userCredential.user!.uid);
        if (exits == null) {
          dbService.createUser(UserModel(
              userId: userCredential.user!.uid,
              email: userCredential.user!.email!,
              name: userCredential.user!.displayName!,
              appliedJobs: [],
              savedJobs: []));
        }
      }
    } on FirebaseAuthException catch (e) {
      print("errrr");
      print(e.message);
      throw Exception(e.message);
    }
  }

  Future<void> signOut() async {
    if (await _googleSignIn.isSignedIn()) {
      await _googleSignIn.signOut();
    }
    await _firebaseAuth.signOut();
  }

  Future<void> logIn(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;
      if (user != null) {
        await dbService.getUser(user.uid.toString());
      }
    } on FirebaseAuthException catch (e) {
      print("errrr");
      print(e.message);
      throw Exception("Either your Email or Password is incorrect!");
    }
  } //create User

  Future<void> signUp(String email, String password, String userName) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        UserModel user = UserModel(
            userId: firebaseUser.uid,
            email: firebaseUser.email ?? "",
            name: userName,
            savedJobs: [],
            appliedJobs: []);
        await dbService.createUser(user);
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  //sign out

  String? getUserId() {
    print(_firebaseAuth.currentUser?.email);
    return _firebaseAuth.currentUser!.uid;
  }

  User? getUser() {
    print(_firebaseAuth.currentUser?.email);
    return _firebaseAuth.currentUser;
  }
  //Sign In
}
