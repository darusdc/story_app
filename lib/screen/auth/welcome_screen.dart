import 'package:dstory_app/widgets/flag_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:dstory_app/common/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(
      {super.key, required this.onClickLogin, required this.onClickRegister});

  final Function() onClickLogin;
  final Function() onClickRegister;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: [
            Image.asset(
              "assets/images/imagination-6940837_1280.webp",
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(AppLocalizations.of(context)!.titleWelcome,
                  overflow: TextOverflow.clip,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                  textAlign: TextAlign.center),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: circleButton,
                  onPressed: () => onClickLogin(),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.login,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        AppLocalizations.of(context)!.loginLogin,
                        style: const TextStyle(color: Colors.white),
                        overflow: TextOverflow.clip,
                      )
                    ],
                  ),
                )
              ],
            ),
            const FlagIconWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.newUserWelcome,
                  style: Theme.of(context).textTheme.labelLarge,
                  overflow: TextOverflow.clip,
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: TextButton(
                    onPressed: () => onClickRegister(),
                    child: Text(
                      AppLocalizations.of(context)!.registerWelcome,
                      style: const TextStyle(color: Colors.blueAccent),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
