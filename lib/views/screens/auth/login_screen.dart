import 'package:flutter/material.dart';
import 'package:tiktokclone/constants.dart';


import '../../widgets/text_input_field.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tiktok',
              style: TextStyle(
                color: kbuttonColor,
                fontSize: 35,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: 25,),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _emailController,
                labelText: 'Email',
                icon: Icons.email,
              )
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _passController,
                labelText: 'Password',
                icon: Icons.email,
                isObsecure: true,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: (){
                authController.loginUser(
                    email: _emailController.text.trim().toString(),
                    password: _passController.text.trim().toString()
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width-40,
                height: 50,
                decoration: BoxDecoration(
                  color: kbuttonColor,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(
                  child: const Text(
                      'Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                  },
                  child: Text(
                    'Create account',
                    style: TextStyle(
                      color: kbuttonColor,
                      fontSize: 18

                    ),

                  ),
                )

              ],
            )
          ],
        ),
      )
    );
  }
}
