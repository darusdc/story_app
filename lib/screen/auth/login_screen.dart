import 'package:dstory_app/providers/story_provider.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:dstory_app/common/styles.dart';
import 'package:dstory_app/providers/auth_provider.dart';
import 'package:dstory_app/widgets/platform_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen(
      {super.key,
      required this.onLogin,
      required this.onRegister,
      required this.onClickBack});

  final Function() onLogin;
  final Function() onRegister;
  final Function() onClickBack;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
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
    final bool isLoadingLogin = context.watch<AuthProvider>().isLoadingLogin;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.titleLogin),
        leading: IconButton(
            onPressed: () {
              isLoadingLogin ? null : widget.onClickBack();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset('assets/lotties/login.json',
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
                          isLoadingLogin
                              ? const Center(child: CircularProgressIndicator())
                              : ElevatedButton(
                                  style: circleButton,
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      final email = emailController.text;
                                      final password = passwordController.text;
                                      final authStatus =
                                          context.read<AuthProvider>();
                                      final result = await authStatus.login(
                                          email, password);
                                      if (result.keys.first) {
                                        // ignore: use_build_context_synchronously
                                        context
                                            .read<StoryProvider>()
                                            .getAllStories();
                                        // ignore: use_build_context_synchronously
                                        context
                                            .read<StoryProvider>()
                                            .getNearMeStories();
                                        widget.onLogin();
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
                                      .loginLogin)),
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
