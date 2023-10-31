
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/home-pages/home.dart';
import 'package:flutter_application_1/screens/reset_password.dart';
import 'package:flutter_application_1/screens/reusable_widget.dart';
import 'package:flutter_application_1/screens/signup_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../UserChatBox/utils/constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await supabase.auth.signInWithPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Myhome()));
      //   Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => HomeScreen()));
    } on AuthException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (_) {
      context.showErrorSnackBar(message: unexpectedErrorMessage);
    }
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Color(0xFF0c222f),
              ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(
                children: <Widget>[
                  logoWidget("assets/logo1.png"),
                  const SizedBox(
                    height: 30,
                  ),
                  reusableTextField("Enter UserName", Icons.person_outline, false,
                      _emailController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outline, true,
                      _passwordController),
                  const SizedBox(
                    height: 5,
                  ),
                  forgetPassword(context),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _signIn,
                    child: Text(
                      "SIGN IN",
                      style: const TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.black26;
                          }
                          return Colors.white;
                        }),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
                  ),
                ),
                  // firebaseUIButton(context, "Sign In", () {
                  //   _isLoading ? null : _signIn;
                  //   // FirebaseAuth.instance
                  //   //     .signInWithEmailAndPassword(
                  //   //         email: _emailTextController.text,
                  //   //         password: _passwordTextController.text)
                  //   //     .then((value) {
                  //   //   Navigator.push(context,
                  //   //       MaterialPageRoute(builder: (context) => HomeScreen()));
                  //   // }).onError((error, stackTrace) {
                  //   //   print("Error ${error.toString()}");
                  //   // });
                  // }),
                  signUpOption()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen(isRegistering: false)));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
