import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_flutter/components/rounded_button.dart';
import 'package:flash_chat_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginAndRegistrationScreen extends StatefulWidget {
  static const String id = 'login/registration_screen';
  const LoginAndRegistrationScreen({super.key});

  @override
  State<LoginAndRegistrationScreen> createState() =>
      _LoginAndRegistrationScreenState();
}

class _LoginAndRegistrationScreenState
    extends State<LoginAndRegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String? email;
  String? password;
  String errorMessage = "";

  // getButtonCallback: return a void callback function
  VoidCallback getButtonCallback(bool isRegister) {
    return () async {
      setState(() {
        showSpinner = true;
      });
      try {
        // check if its a register button or login button
        if (isRegister) {
          await _auth.createUserWithEmailAndPassword(
              email: email!, password: password!);
        } else {
          await _auth.signInWithEmailAndPassword(
              email: email!, password: password!);
        }
      } on FirebaseAuthException catch (e) {
        setState(() {
          switch (e.code) {
            case 'invalid-email':
              errorMessage = "Enter a valid email.";
              break;
            case 'email-already-in-use':
              errorMessage = "The account already exists for that email.";
              break;
            case 'weak-password':
              errorMessage = "The password provided is too weak.";
              break;
            case 'user-not-found':
              errorMessage = "No account exists for that email.";
              break;
            case 'wrong-password':
              errorMessage = "Wrong email/password, please try again!";
              break;
            case 'network-request-failed':
              errorMessage = "Check your internet connection.";
              break;
          }
        });
      } catch (e) {
        setState(() {
          errorMessage = "You must enter your email and password.";
        });
      } finally {
        setState(() {
          showSpinner = false;
        });
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    // Extract the argument from the current ModalRoute
    // settings and cast them as bool.
    // Note: I have used named routes that is why I am taking argument like
    // this, flutter don't recommend using named routes anymore.
    final isRegister = ModalRoute.of(context)!.settings.arguments as bool;

    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red),
              ),
              TextField(
                onChanged: (value) => email = value,
                decoration: kTextFieldDecoration.copyWith(hintText: 'Email'),
                style: kTextFieldTextStyle,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) => password = value,
                decoration: kTextFieldDecoration.copyWith(hintText: 'Password'),
                style: kTextFieldTextStyle,
                textAlign: TextAlign.center,
                obscureText: true,
              ),
              const SizedBox(
                height: 24.0,
              ),
              Hero(
                tag: isRegister ? 'register_button' : 'login_button',
                child: RoundedButton(
                  label: isRegister ? 'Register' : 'Log In',
                  color: isRegister
                      ? Colors.orangeAccent
                      : Colors.deepOrangeAccent,
                  onPresssed: getButtonCallback(isRegister),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
