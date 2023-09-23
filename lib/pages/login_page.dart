import 'package:herb_nook/components/my_button.dart';
import 'package:herb_nook/components/my_textfiled.dart';
import 'package:herb_nook/components/square_tile.dart';
import 'package:herb_nook/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
   const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController  = TextEditingController();

  void signUserIn() async{
    showDialog(context: context, builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);

    } on FirebaseAuthException catch (e){
      Navigator.pop(context);
     showErrorMessage(e.message.toString());
    }
  }
  void showErrorMessage(String message){
    showDialog(context: context, builder: (context){
       return  AlertDialog(
         backgroundColor: Colors.grey[600],
        title: Text(message,
        style: TextStyle(
          color: Colors.white
        ),),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      backgroundColor: Colors.green.shade200,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 45,),
                Image.asset('assets/images/mint.png',height: 120,),
                const SizedBox(height: 50,),
                Text('Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),),
                const SizedBox(height: 25,),
                MyTextFiled(controller: emailController,
                obscureText: false, hintText: 'Email',),
                const SizedBox(height: 10,),
                MyTextFiled(
                  controller: passwordController, obscureText: true,
                  hintText: 'Password',
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot Password?',
                      style: TextStyle(
                        color: Colors.grey[600]
                      ),),
                    ],
                  ),
                ),
                const SizedBox(height: 25,),
                MyButton(onTap: signUserIn,text: 'Sign In'),
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.green[600],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Or continue with'
                        ,style: TextStyle(
                            color: Colors.grey[700]
                          ),),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.green[600],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: 'assets/images/search.png',
                    onTap: ()=>AuthService().signInWithGoogle(
                    ),),
                    SizedBox(width: 25,),
                    SquareTile(imagePath: 'assets/images/apple.png',
                    onTap: (){},),
                  ],
                ),
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?',
                    style: TextStyle(
                      color: Colors.grey[700]
                    ),),
                    const SizedBox(width: 4,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
