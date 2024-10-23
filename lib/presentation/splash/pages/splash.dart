import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';

import '../../intro/pages/get_started.dart';


class SplashPage extends StatefulWidget{
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

      @override
      void initState(){
        super.initState();
        redirect(context);
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AppVectors.logo),
      ),
    );
  }
}
Future<void> redirect(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 2));
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => const GetStartedPage()
      )
  );
}