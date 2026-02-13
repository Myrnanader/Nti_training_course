import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_notes/core/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// login
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(_mapError(e)));
    } catch (_) {
      emit(AuthError('Something went wrong'));
    }
  }

  ///sign up
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      // Create user
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create user model
      final user = UserModel(
        uid: credential.user!.uid,
        name: name,
        email: email,
        image: '',
      );

      //  Save user in  collection
      await _firestore.collection('users').doc(user.uid).set(user.toMap());

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(_mapError(e)));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  //  GET USER DATA
  Future<UserModel?> getCurrentUser() async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid == null) return null;

      final doc = await _firestore.collection('users').doc(uid).get();

      if (!doc.exists) return null;

      return UserModel.fromMap(doc.data()!);
    } catch (_) {
      return null;
    }
  }

  ///  LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
    emit(AuthInitial());
  }

  ///  Error Mapper
  String _mapError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No user found for this email';
      case 'wrong-password':
        return 'Wrong password';
      case 'email-already-in-use':
        return 'Email already exists';
      case 'weak-password':
        return 'Password is too weak';
      default:
        return e.message ?? 'Something went wrong';
    }
  }
}
