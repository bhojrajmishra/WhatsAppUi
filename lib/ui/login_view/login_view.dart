import 'package:flutter/material.dart';
import 'package:flutter_first_ui/components/custom_text_field.dart';
import 'package:flutter_first_ui/ui/home_view/widgets/custom_button.dart';
import 'package:flutter_first_ui/ui/login_view/view_model/login_view_model.dart';
import 'package:flutter_first_ui/ui/registration_view/widgets/registration_link.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(
        context: context,
        emailController: emailController,
        passwordController: passwordController,
      ),
      child: Scaffold(
        body: Consumer<LoginViewModel>(
          builder: (context, viewModel, child) {
            return Form(
              key: GlobalKey<FormState>(),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100, width: 100),
                    CustomTextFormField(
                      controller: emailController,
                      labelText: "Email",
                      obscureText: false,
                    ),
                    const SizedBox(height: 23),
                    CustomTextFormField(
                      controller: passwordController,
                      labelText: "Password",
                      obscureText: true,
                    ),
                    const SizedBox(height: 23),
                    CustomButton(
                      text: "Login",
                      onPressed: () => viewModel.handleLogin(),
                    ),
                    const SizedBox(height: 20),
                    const RegistrationLink(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
