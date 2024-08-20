import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/registration_view/registration_view.dart';

class RegistrationLink extends StatelessWidget {
  const RegistrationLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?"),
        const SizedBox(width: 5),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const RegistrationView();
            }));
          },
          child: const Text(
            "Register here!",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
