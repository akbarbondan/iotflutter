part of'pages.dart';

class SplashScren extends StatefulWidget {

  @override
  _SplashScrenState createState() => _SplashScrenState();
}

class _SplashScrenState extends State<SplashScren> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      photoSize: 100,
      navigateAfterSeconds: HomePage(),
      image: Image.asset('assets/img/Logo.png',width: 214, height: 214,),
      backgroundColor: backgroundColor,
      useLoader: true,
      loaderColor: Colors.white,
      loadingText: Text("Loading . . . .", style: TextStyle(color: Colors.white),),
    );
  }
}