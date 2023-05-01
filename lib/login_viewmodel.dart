import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  get validatePassword => null;

  String getEmail() {
    return _email;
  }

  setEmail(String email) {
    _email = email;
  }

  setPassword(String password) {
    _password = password;
  }

  String getPassword() {
    return _password;
  }

  late String _password;
  late String _email;
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ce champ ne peut pas être vide';
    } else if (!EmailValidator.validate(value)) {
      return 'Veuillez entrer une adresse email valide';
    } else {
      return null;
    }
  }

  String? ValidatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Ce champ ne peut pas être vide";
    } else if (value.length < 6) {
      return 'Le mot de passe doit contenir au moins 6 caractères';
    } else {
      return null;
    }
  }

  Future<bool> loginUser(String email, String password) async {
    setBusy(true);
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      setBusy(false);
      return true;
    } catch (error) {
      setBusy(false);
      if (error is FirebaseAuthException) {
        print('FirebaseAuthException: ${error.message}');
      } else {
        print('Error: $error');
      }
      return false;
    }
  }
}
