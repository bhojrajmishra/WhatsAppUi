import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/home_view/view_model/loading_view_model.dart';
import 'package:flutter_first_ui/ui/registration_view/view_model/registration_view_model.dart';
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
          onPressed: () {},
        ),
      ),
      body: Consumer2<RegistrationViewModel, LoadingViewModel>(
        builder: (context, registrationViewModel, loadingViewModel, child) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: GlobalKey<FormState>(),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 100, width: 100),
                          CustomTextFormField(
                            controller: registrationViewModel.nameController,
                            labelText: "Full Name",
                            obscureText: false,
                          ),
                          const SizedBox(height: 23),
                          CustomTextFormField(
                            controller: registrationViewModel.emailController,
                            labelText: "Email",
                            obscureText: false,
                          ),
                          const SizedBox(height: 23),
                          CustomTextFormField(
                            controller:
                                registrationViewModel.passwordController,
                            labelText: "Password",
                            obscureText: true,
                          ),
                          const SizedBox(height: 23),
                          if (loadingViewModel.isLoading)
                            const CircularProgressIndicator()
                          else
                            CustomButton(
                              text: "Register",
                              onPressed: () => registrationViewModel
                                  .handleRegistration(context),
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
