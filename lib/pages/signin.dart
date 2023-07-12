import 'package:flutter/material.dart';
import 'package:my_app/authentication.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key : key);

  @override
  State<SignIn> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 300),
            child: Text(
              "MAGIC MIXER 🪄",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
              )
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 15),
              child: GestureDetector(
                onTap: () {
                  signInWithGoogle();
                },
                child: Container(
                  width: 180,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffba53de)
                  ),
                  child: const Center(
                    child: Text(
                    "Sign in",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      )
                    )
                  )
                ),
              )
            ),
        ]
      )
    );
  }
}