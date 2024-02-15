import 'package:dstory_app/common/styles.dart';
import 'package:dstory_app/providers/auth_provider.dart';
import 'package:dstory_app/widgets/platform_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen(
      {super.key, required this.onRegister, required this.onClickBack});
  final Function() onRegister;
  final Function() onClickBack;
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: androidBuilder,
      iosBuilder: iosBuilder,
      webBuilder: webBuilder,
    );
  }

  Widget androidBuilder(BuildContext context) {
    bool isLoadingRegister = context.watch<AuthProvider>().isLoadingRegister;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        leading: IconButton(
            onPressed: () {
              isLoadingRegister ? null : widget.onClickBack();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset('assets/lotties/register.json',
                  fit: BoxFit.fill, width: 400),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration:
                                const InputDecoration(labelText: 'Your name'),
                            validator: ValidationBuilder()
                                .minLength(5)
                                .required("Please insert your name")
                                .build(),
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration:
                                const InputDecoration(labelText: 'Email'),
                            validator: ValidationBuilder()
                                .email("Email is not valid")
                                .required("Please insert your email")
                                .build(),
                          ),
                          TextFormField(
                            controller: passwordController,
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                            validator: ValidationBuilder()
                                .required("Please insert your password")
                                .minLength(8, "Password is too short")
                                .build(),
                            obscureText: true,
                          ),
                          const SizedBox(height: 16),
                          isLoadingRegister
                              ? const Center(child: CircularProgressIndicator())
                              : ElevatedButton(
                                  style: circleButton,
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      final name = nameController.text;
                                      final email = emailController.text;
                                      final password = passwordController.text;
                                      final authStatus =
                                          context.read<AuthProvider>();
                                      final result = await authStatus.register(
                                          name, email, password);
                                      if (result.keys.first) {
                                        widget.onRegister();
                                        // ignore: use_build_context_synchronously
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                              "Registration success, you can login know"),
                                          duration: Duration(seconds: 5),
                                        ));
                                      } else {
                                        // ignore: use_build_context_synchronously
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(result.values.first),
                                          duration: const Duration(seconds: 5),
                                        ));
                                      }
                                    }
                                  },
                                  child: const Text('Register')),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iosBuilder(BuildContext context) {
    return const Placeholder();
  }

  Widget webBuilder(BuildContext context) {
    return const Placeholder();
  }
}
