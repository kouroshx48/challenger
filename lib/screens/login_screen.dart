import 'package:challenger/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.onTap});
  final void Function() onTap;

  @override
  State<LoginScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signInToAccount() async {
      showDialog(
          context: context,
          builder: (context) => const Center(
                child: CircularProgressIndicator(color: Colors.grey,),
              ));
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text);
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        if(e.code == 'user-not-found'){
          showErrorDialog('user not found');
        }else if(e.code == 'wrong-password'){
          showErrorDialog('Wrong password');
        }
      }


  }
  void showErrorDialog(String message){
    showDialog(context: context, builder: (context){
      return  AlertDialog(title: Center(child: Text(message),),);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/Fist-Cleaned-Up.svg',
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  const Text(
                    'Welcome Challenger',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Login To your account to challenge your self again',
                    style: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 54,
                  ),

                  //login text fields
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Container(
                      padding: const EdgeInsets.only(left: 13),
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white, width: 3)),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400]),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Container(
                      padding: const EdgeInsets.only(left: 13),
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white, width: 3)),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'PassWord',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400]),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //Login button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: InkWell(
                      onTap: () => _signInToAccount(),
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        )),
                      ),
                    ),
                  ),
                  //Todo register text
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'dont have an account ? ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text('register now',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
