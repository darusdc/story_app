import 'package:flutter/material.dart';
import 'package:dstory_app/common/styles.dart';

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
          crossAxisAlignment: CrossAxisAlignment.end,
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
              child: Text("DStory - Place to share your dreams",
                  overflow: TextOverflow.clip,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.secondary)),
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
                      const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                        overflow: TextOverflow.clip,
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New user?",
                  style: Theme.of(context).textTheme.labelLarge,
                  overflow: TextOverflow.clip,
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: TextButton(
                    onPressed: () => onClickRegister(),
                    child: const Text(
                      "Register",
                      style: TextStyle(color: Colors.blueAccent),
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
