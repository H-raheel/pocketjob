import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pocketjob/repo/userRepo.dart';

import '../models/users.dart';

class AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  userRepo dbService = userRepo();
  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String?> signInwithGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication? googleSignInAuthentication =
          await googleUser?.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      print(userCredential.user?.uid);
      print(userCredential.user?.displayName);

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
      print(e.message);
      throw e;
    }
    return null;
  }

  Future<void> signOut() async {
    if (await _googleSignIn.isSignedIn()) {
      await _googleSignIn.signOut();
    }
    await _firebaseAuth.signOut();
  }

  Future<UserModel?> LogIn(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;
      if (user != null) {
        await dbService.getUser(user.uid.toString());
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      print("ERRORROOROR");
    }
    return null;
  } //create User

  Future<UserModel?> signUp(
      String email, String password, String userName) async {
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
        return user;
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      print("ERRORROOROR");
    }
    return null;
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
