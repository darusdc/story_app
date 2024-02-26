import 'package:dstory_app/common/styles.dart';
import 'package:dstory_app/providers/auth_provider.dart';
import 'package:dstory_app/widgets/platform_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        title: Text(AppLocalizations.of(context)!.titleRegister,
            overflow: TextOverflow.clip),
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
                            decoration: InputDecoration(
                                labelText:
                                    AppLocalizations.of(context)!.nameRegister),
                            validator: ValidationBuilder()
                                .minLength(5)
                                .required(AppLocalizations.of(context)!
                                    .nameRequiredRegister)
                                .build(),
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                labelText:
                                    AppLocalizations.of(context)!.emailLogin),
                            validator: ValidationBuilder()
                                .email(AppLocalizations.of(context)!
                                    .emailInvalidLogin)
                                .required(AppLocalizations.of(context)!
                                    .emailRequiredLogin)
                                .build(),
                          ),
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!
                                    .passwordLogin),
                            validator: ValidationBuilder()
                                .required(AppLocalizations.of(context)!
                                    .passwordRequiredLogin)
                                .minLength(
                                    8,
                                    AppLocalizations.of(context)!
                                        .passwordTooShortLogin)
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
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              // ignore: use_build_context_synchronously
                                              AppLocalizations.of(context)!
                                                  .messageSuccessRegister),
                                          duration: const Duration(seconds: 5),
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
                                  child: Text(AppLocalizations.of(context)!
                                      .registerRegister),
                                ),
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
