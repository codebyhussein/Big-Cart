import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  String? email, password;
  String? phone;
  String? uid;
  Future<void> CreateUser({
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      emit(RegisterLoading());
      final user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        FirebaseFirestore.instance
            .collection('Users')
            .doc(value.user!.uid)
            .set({
          'email': email,
          'password': password,
          'phone': phone,
          'uid': value.user!.uid,
        });
        emit(RegisterSuccess());
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('uid', value.user!.uid);
        pref.setString('email', value.user!.email!);
      }).catchError((error) {
        emit(RegisterFailure(errorMassege: error.toString()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errorMassege: 'weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errorMassege: 'email-already-in-use '));
      }
    } catch (e) {
      emit(RegisterFailure(
          errorMassege: 'Somthing went wrong \nPlease try again'));
    }
  }

  change({required bool value}) {
    value = !value;
    emit(RegisterChange());
  }

  vesiblePassword({required bool isvesible}) {
    isvesible = !isvesible;
    emit(RegisterChange());
  }

  UserDetails({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String birthday,
    required String instagram,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var email = pref.get('email');
    try {
      emit(RegisterLoading());

      Map<String, dynamic> Data = {
        'name': name,
        'birthday': birthday,
        'instagram': instagram,
        'email': email,
        'password': password,
        'phone': phone,
      };
      FirebaseFirestore.instance
          .collection('usersDetails')
          .doc(email as String?)
          .set(Data);
      emit(RegisterSuccess());
    } on Exception catch (e) {
      print(e.toString());
      emit(RegisterFailure(errorMassege: 'error happend'));
    }
  }
}
