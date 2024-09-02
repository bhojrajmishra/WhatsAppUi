import 'package:flutter/material.dart';
import 'package:flutter_first_ui/utils/validator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_first_ui/ui/login_view/view_model/login_view_model.dart';
import 'package:flutter_first_ui/base/widgets/custom_text_form_field.dart';
import 'package:flutter_first_ui/base/widgets/custom_button.dart';
import 'package:flutter_first_ui/ui/registration_view/widgets/registration_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginViewModel>(
        builder: (context, loginViewModel, child) {
          return Form(
            key: loginViewModel.formKey,
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
                    validator: (value) => Validator.emailValidator()(value),
                  ),
                  const SizedBox(height: 23),
                  CustomTextFormField(
                    controller: loginViewModel.passwordController,
                    labelText: "Password",
                    obscureText: true,
                    validator: (value) => Validator.passwordValidator()(value),
                  ),
                  const SizedBox(height: 23),
                  CustomButton(
                    text: loginViewModel.isLoading ? "Loading..." : "Login",
                    onPressed: () {
                      loginViewModel.requestLoginApi(context);
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
