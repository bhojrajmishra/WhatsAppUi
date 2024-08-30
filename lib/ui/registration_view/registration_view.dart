import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/registration_view/view_model/registration_view_model.dart';
import 'package:flutter_first_ui/utils/validator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_first_ui/ui/login_view/login_view.dart';
import 'package:flutter_first_ui/components/custom_text_field.dart';
import 'package:flutter_first_ui/ui/home_view/widgets/custom_button.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Page"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginView()),
            );
          },
        ),
      ),
      body: Consumer<RegistrationViewModel>(
        builder: (context, viewModel, child) {
          final formKey = GlobalKey<FormState>();
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 100, width: 100),
                          CustomTextFormField(
                            controller: viewModel.nameController,
                            labelText: "Full Name",
                            obscureText: false,
                            validator: (value) =>
                                Validator.userNameValidator()(value),
                          ),
                          const SizedBox(height: 23),
                          CustomTextFormField(
                            controller: viewModel.emailController,
                            labelText: "Email",
                            obscureText: false,
                            validator: (value) =>
                                Validator.emailValidator()(value),
                          ),
                          const SizedBox(height: 23),
                          CustomTextFormField(
                            controller: viewModel.passwordController,
                            labelText: "Password",
                            obscureText: true,
                            validator: (value) =>
                                Validator.passwordValidator()(value),
                          ),
                          const SizedBox(height: 23),
                          CustomButton(
                            text: "Register",
                            onPressed: () {
                              viewModel.requestRegisterApi(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
