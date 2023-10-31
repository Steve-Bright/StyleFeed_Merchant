
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/color_utils.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/reusable_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../UserChatBox/utils/constants.dart';
import '../home-pages/home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key, required this.isRegistering}) : super(key: key);

  static Route<void> route({bool isRegistering = false}) {
    return MaterialPageRoute(
      builder: (context) => SignUpScreen(isRegistering: isRegistering),
    );
  }

  final bool isRegistering;
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  // TextEditingController _passwordTextController = TextEditingController();
  // TextEditingController _emailTextController = TextEditingController();
  // TextEditingController _userNameTextController = TextEditingController();

  Future<void> _signUp() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    final email = _emailController.text;
    final password = _passwordController.text;
    final username = _usernameController.text;
    try {
      await supabase.auth.signUp(
          email: email, password: password, data: {'username': username});
      // Navigator.pushReplacementNamed(context, '/userHome');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Myhome()));
    } on AuthException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      context.showErrorSnackBar(message: unexpectedErrorMessage);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){Navigator.pop(context);}
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.grey.shade800,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold , color: Colors.white),
          
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                 color: Color(0xFF0c222f)),
            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Column(
                children: <Widget>[

                  reusableTextField("Enter UserName", Icons.person_outline, false,
                      _usernameController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Email Address", Icons.person_outline, false,
                      _emailController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outlined, true, null),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Confirm Your Password", Icons.lock_outlined, true,
                      _passwordController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Phone Number", Icons.phone, false, null),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Shop Name", Icons.shop, false, null),
                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _signUp,
                      child: Text(
                        "Sign Up",
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
                  )
                  // firebaseUIButton(context, "Sign Up", () {
                  //   // FirebaseAuth.instance
                  //   //     .createUserWithEmailAndPassword(
                  //   //         email: _emailTextController.text,
                  //   //         password: _passwordTextController.text)
                  //   //     .then((value) {
                  //   //   print("Created New Account");
                  //   //   Navigator.push(context,
                  //   //       MaterialPageRoute(builder: (context) => HomeScreen()));
                  //   // }).onError((error, stackTrace) {
                  //   //   print("Error ${error.toString()}");
                  //   // });
                  // })
                ],
              ),
            ))),
      ),
    );
  }
}
