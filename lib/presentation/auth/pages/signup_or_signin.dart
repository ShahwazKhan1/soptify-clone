import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/auth/pages/sign_in.dart';
import 'package:spotify/presentation/auth/pages/sign_up.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../core/configs/themes/app_colors.dart';

class SignupOrSigninPage extends StatelessWidget{
  const SignupOrSigninPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          const Align(
            alignment: Alignment.bottomLeft,
            child: Image(image: AssetImage(AppImages.authBG)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                const SizedBox(height: 25,),
                Text('Enjoy Listening Music ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: context.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 20
                  ),
                ),
                const SizedBox(height: 21,),
                const Text('Spotify is a proprietary Swedish audio streaming and media services provider  ',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                      fontSize: 13
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                        child: BasicAppButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  SignUpPage(),));
                        },
                            title: 'Register')
                    ),
                    const SizedBox(width: 2,),
                    Expanded(
                      flex: 1,
                      child: TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage(),));
                      },
                          child:  Text('Sign In',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: context.isDarkMode ? Colors.white : Colors.black
                          ),)),
                    )
                  ],
                )

              ],
            ),
          ),

        ],
      ),
    );
  }
}