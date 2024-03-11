class PageConfiguration {
  final bool unknown;
  bool? isLoggedIn;
  bool isLogin = false;
  bool isRegister = false;
  String idStory = "";
  bool isUpdateStory = false;

  PageConfiguration.splash()
      : unknown = false,
        isRegister = false,
        isLogin = false,
        isLoggedIn = null,
        idStory = '',
        isUpdateStory = false;

  PageConfiguration.welcome()
      : unknown = false,
        isLoggedIn = false,
        isRegister = false,
        isLogin = false,
        idStory = "",
        isUpdateStory = false;

  PageConfiguration.login()
      : unknown = false,
        isRegister = false,
        isLogin = true,
        isLoggedIn = false,
        isUpdateStory = false,
        idStory = '';

  PageConfiguration.register()
      : unknown = false,
        isRegister = true,
        isLogin = false,
        isLoggedIn = false,
        isUpdateStory = false,
        idStory = '';

  PageConfiguration.home()
      : unknown = false,
        isRegister = false,
        isLogin = false,
        isLoggedIn = true,
        isUpdateStory = false,
        idStory = '';

  PageConfiguration.detailStory(String id)
      : unknown = false,
        isRegister = false,
        isLogin = false,
        isLoggedIn = true,
        isUpdateStory = false,
        idStory = id;

  PageConfiguration.updateStory()
      : unknown = false,
        isRegister = false,
        isLogin = false,
        isLoggedIn = true,
        isUpdateStory = true,
        idStory = '';

  PageConfiguration.unknown()
      : unknown = true,
        isRegister = false,
        isLogin = false,
        isLoggedIn = null,
        isUpdateStory = false,
        idStory = '';

  bool get isSplashPage => unknown == false && isLoggedIn == null;
  bool get isWelcomePage => unknown == false && isLoggedIn == false;
  bool get isLoginPage =>
      unknown == false && isLoggedIn == false && isLogin == true;
  bool get isHomePage =>
      unknown == false && isLoggedIn == true && idStory == '';
  bool get isDetailPage =>
      unknown == false && isLoggedIn == true && idStory != '';
  bool get isUpdateStoryPage =>
      unknown == false && isLoggedIn == true && isUpdateStory == true;
  bool get isRegisterPage => isRegister == true;
  bool get isUnknownPage => unknown == true;
}
