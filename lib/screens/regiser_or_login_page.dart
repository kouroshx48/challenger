import 'package:challenger/screens/login_screen.dart';
import 'package:challenger/screens/register_screen.dart';
import 'package:flutter/material.dart';

class RegisterOrLogin extends StatefulWidget {
  const RegisterOrLogin({super.key});

  @override
  State<RegisterOrLogin> createState() => _RegisterOrLoginState();
}

class _RegisterOrLoginState extends State<RegisterOrLogin> {
  bool login = true;

  void onPageChange(){
    setState(() {
      login = !login;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(login){
      return  LoginScreen(onTap: () => onPageChange(),);
    }else{
      return  RegisterScreen(onTap: () => onPageChange(),);
    }
  }
}
