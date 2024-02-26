import 'package:challenger/controllers/user.dart';
import 'package:challenger/data/user_data_base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.onTap});

  final void Function() onTap;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //text field controllers
  final TextEditingController _challengerName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void registerUserToDb(Challenger newChallenger){
    context.read<ChallengerDB>().createChallenger(newChallenger);
  }
  void signUpNewUser() async {
    if (_challengerName.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passWordController.text.isNotEmpty) {
      if (_passWordController.text == _confirmPasswordController.text) {
        //create new user on firebase and save the created user on firestore
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passWordController.text);

        //save user to local data base
        //create new user in local db here
        Challenger newUser = Challenger(fullName: _challengerName.text)
          ..email = _emailController.text;
        registerUserToDb(newUser);
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _challengerName.dispose();
    _emailController.dispose();
    _passWordController.dispose();
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
                    'Become a Challenger',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Sign Up to challenge yourself and overcome your limits',
                    style: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 54,
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
                        controller: _challengerName,
                        decoration: InputDecoration(
                          hintText: 'challenger name',
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
                        controller: _passWordController,
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
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Confirm PassWord',
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
                      onTap: signUpNewUser,
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          'Sign Up',
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
                        'are you a member ? ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text('SignIn',
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
