import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.sart.dart';

import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/configs/themes/app_colors.dart';
import '../../auth/pages/signup_or_signin.dart';


class ChooseModePage extends StatelessWidget{
  const ChooseModePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AppImages.chooseModeBG))
            ),
            child: Container(
              color: Colors.black.withOpacity(0.15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
            child: Column(
              children: [
                Align(alignment: Alignment.topCenter,
                    child: SvgPicture.asset(AppVectors.logo)),
                const Spacer(),
                const Text('Choose Mode',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18
                  ),
                ),
                const SizedBox(height: 21,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(onTap: (){
                          context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                        },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xff30393C).withOpacity(0.5),
                                ),
                                child: SvgPicture.asset(AppVectors.moon,fit: BoxFit.none,),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        const Text('Dark Mode',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.grey,
                              fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 40,),
                    Column(
                      children: [
                        GestureDetector(onTap: (){
                          context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                        },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xff30393C).withOpacity(0.5),
                                ),
                                child: SvgPicture.asset(AppVectors.sun,fit: BoxFit.none,),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        const Text('Light Mode',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.grey,
                              fontSize: 13
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
                const SizedBox(height: 50,),
                BasicAppButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupOrSigninPage(),));
                }, title: 'Continue')
              ],
            ),
          ),
        ],
      ),
    );
  }
}