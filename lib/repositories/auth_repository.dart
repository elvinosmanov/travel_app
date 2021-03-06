import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class BaseAuthRepository {
  Stream<auth.User?> get user;
  auth.User? get currentUser;
  Future<auth.User?> signUp({required String email, required String password});
  Future<void> loginWithEmailAndPassword({required String email, required String password});
  Future<void> signOut();
}

class AuthRepository extends BaseAuthRepository {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  @override
  Future<void> loginWithEmailAndPassword({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch (_) {}
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<auth.User?> signUp({required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      final user = credential.user;
      return user;
    } catch (_) {}
    return null;
  }

  @override
  Stream<auth.User?> get user {
    return _firebaseAuth.userChanges();
  }
  
  @override
  // TODO: implement currentUser
  auth.User? get currentUser => _firebaseAuth.currentUser;
}
