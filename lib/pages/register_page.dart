import 'package:chat_app_v/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:chat_app_v/components/myTextField.dart';
import 'package:chat_app_v/components/my_button.dart';
import 'package:flutter/widgets.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _confimed_pwdController = TextEditingController();
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(
              height: 50,
            ),

            //welcome message
            Text(
              "Create account",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            //email
            MyTextField(
              hintText: "email",
              obscureText: false,
              controller: _emailController,
            ), //pwd

            const SizedBox(
              height: 10,
            ),

            //psw
            MyTextField(
              hintText: "Passxord",
              obscureText: true,
              controller: _pwdController,
            ),

            const SizedBox(
              height: 10,
            ),

            //psw
            MyTextField(
              hintText: " Confirme Passxord",
              obscureText: true,
              controller: _confimed_pwdController,
            ),
            const SizedBox(
              height: 10,
            ),
            //pwd

            //login
            MyButton(
              text: "Register",
              onTap: () => register(context),
            ),
            const SizedBox(
              height: 10,
            ),

            //register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Have an account? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login Now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void register(BuildContext context) {
    final _auth = AuthService();
    if (_pwdController.text == _confimed_pwdController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _pwdController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Passxord not math"),
              ));
    }
  }
}
