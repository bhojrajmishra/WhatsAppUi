import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/home_view/view_model/loading_view_model.dart';
import 'package:flutter_first_ui/ui/registration_view/widgets/registration_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_first_ui/ui/login_view/view_model/login_view_model.dart';
import 'package:flutter_first_ui/components/custom_text_field.dart';
import 'package:flutter_first_ui/ui/home_view/widgets/custom_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<LoginViewModel, LoadingViewModel>(
        builder: (context, loginViewModel, loadingViewModel, child) {
          return Form(
            key: GlobalKey<FormState>(),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100, width: 100),
                  CustomTextFormField(
                    controller: loginViewModel.emailController,
                    labelText: "Email",
                    obscureText: false,
                  ),
                  const SizedBox(height: 23),
                  CustomTextFormField(
                    controller: loginViewModel.passwordController,
                    labelText: "Password",
                    obscureText: true,
                  ),
                  const SizedBox(height: 23),
                  CustomButton(
                    text: loadingViewModel.isLoading ? "Loading..." : "Login",
                    onPressed: loadingViewModel.isLoading
                        ? () {}
                        : () => loginViewModel.handleLogin(context),
                  ),
                  const SizedBox(height: 20),
                  const RegistrationButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
