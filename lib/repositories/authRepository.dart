import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  AuthRepository(this._auth);
  final FirebaseAuth _auth;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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

      await _firebaseAuth.signInWithCredential(credential);
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
    } on FirebaseAuthException catch (e) {
      print("errrr");
      print(e.message);
      throw Exception("Either your Email or Password is incorrect!");
    }
  } //create User

  Future<User?> signUp(String email, String password, String userName) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? firebaseUser = userCredential.user;
      return firebaseUser;
      // if (firebaseUser != null) {
      //   UserModel user = UserModel(
      //       userId: firebaseUser.uid,
      //       email: firebaseUser.email ?? "",
      //       name: userName,
      //       savedJobs: [],
      //       appliedJobs: []);
      //   await dbRepository.createUser(user);
      // }
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
    // print(_firebaseAuth.currentUser?.email);
    return _firebaseAuth.currentUser;
  }
  //Sign In
}
