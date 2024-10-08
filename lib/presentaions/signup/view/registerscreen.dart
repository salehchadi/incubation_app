import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospitalapp/core/cusombutton.dart';
import 'package:hospitalapp/core/cutomtext.dart';
import 'package:hospitalapp/core/routes.dart';
import 'package:hospitalapp/core/showsnackbar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Registerscreen extends StatefulWidget {
  Registerscreen({super.key});
  static String id = 'Registerscreen';

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  String? email;

  String? password;

  GlobalKey<FormState> formkey = GlobalKey();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 9, 61, 104),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: Image.asset(
                    'assets/baby.png',
                    height: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'baby incubater',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                customtextfield(
                  onchanged: (data) {
                    email = data;
                  },
                  hinttext: 'madbd123@gmaill.com',
                  labeltext: 'Email',
                  perfixicon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                ),
                customtextfield(
                  obsecure: true,
                  onchanged: (data) {
                    password = data;
                  },
                  suffixicon: Icon(
                    Icons.visibility_off_outlined,
                    color: Colors.white,
                  ),
                  perfixicon: Icon(
                    Icons.password,
                    color: Colors.white,
                  ),
                  hinttext: '......',
                  labeltext: 'password',
                ),
                Custombutton(
                  text: 'register',
                  ontap: () async {
                    if (formkey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      try {
                        await regester();
                        showsnackbar(context, 'success');
                        Navigator.pushNamed(
                          context,
                          StringsRoute.home,
                          arguments: email,
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showsnackbar(context, 'user-not-found');
                        } else if (e.code == 'wrong-password') {
                          showsnackbar(context, 'wrong-password');
                        }
                      } catch (e) {
                        showsnackbar(
                          context,
                          e.toString(),
                        );
                      }
                      isloading = false;
                      setState(() {});
                    } else {}
                  },
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'already have an account?',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> regester() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}