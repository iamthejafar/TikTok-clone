import 'package:flutter/material.dart';
import 'package:tiktokclone/constants.dart';
import 'package:tiktokclone/views/screens/auth/login_screen.dart';


import '../../widgets/text_input_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
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
                'Register',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700
                ),
              ),
              const SizedBox(height: 25,),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundColor: Colors.white,
                    backgroundImage: Image.asset('assets/images/user_default.png',color: Colors.white,).image
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: (){
                        authController.pickImage();

                      },
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15,),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                    controller: _usernameController,
                    labelText: 'Username',
                    icon: Icons.person,
                  )
              ),
              const SizedBox(
                height: 15,
              ),
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
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _passController,
                  labelText: 'Password',
                  icon: Icons.lock,
                  isObsecure: true,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (){
                  authController.registerUser(
                      username: _usernameController.text.trim().toString(),
                      password: _passController.text.trim().toString(),
                      email: _emailController.text.trim().toString(),
                      image: authController.profilephoto
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width-40,
                  height: 50,
                  decoration: BoxDecoration(
                    color: kbuttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: const Center(
                    child: Text(
                      'Register',
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
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: kbuttonColor,
                          fontSize: 18,
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
