import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_first_ui/ui/login_view/view_model/login_view_model.dart';
import 'package:flutter_first_ui/components/custom_text_field.dart';
import 'package:flutter_first_ui/ui/home_view/widgets/custom_button.dart';
import 'package:flutter_first_ui/ui/registration_view/widgets/registration_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginViewModel>(
        builder: (context, loginViewModel, child) {
          return Form(
            key: loginViewModel.formKey, // Use formKey from ViewModel
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
                    validator: (value) => loginViewModel.validateEmail(value),
                  ),
                  const SizedBox(height: 23),
                  CustomTextFormField(
                    controller: loginViewModel.passwordController,
                    labelText: "Password",
                    obscureText: true,
                    validator: (value) =>
                        loginViewModel.validatePassword(value),
                  ),
                  const SizedBox(height: 23),
                  CustomButton(
                    text: loginViewModel.isLoading ? "Loading..." : "Login",
                    onPressed: () {
                      if (loginViewModel.formKey.currentState!.validate()) {
                        loginViewModel.requestLoginApi(context);
                      }
                    },
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
