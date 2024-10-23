import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appbar/appbar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/presentation/auth/pages/sign_up.dart';

import '../../../core/configs/assets/app_vectors.dart';
import '../../../service_locator.dart';
import '../../home/pages/home.dart';


class SignInPage extends StatelessWidget{
  SignInPage({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: _registerNowText(context),
      appBar:  BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 30
          ),
          child: Column(
            children: [
              _registerText(context),
              const SizedBox(height: 80,),
              _emailField(context),
              const SizedBox(height: 30,),
              _passwordField(context),
              const SizedBox(height: 65,),
              BasicAppButton(
                  onPressed: () async {
                    var result = await sl<SigninUseCase>().call(
                        params: SigninUserReq(
                            email: _email.text.toString(),
                            password: _password.text.toString())
                    );
                    result.fold(
                            (l){
                          var snackbar = SnackBar(content: Text(l));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        },
                            (r){
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (BuildContext context) => const Home()),

                                  (route) => false);
                        }
                    );
                  },
                  title: 'Sign In')

            ],
          ),
        ),
      ),
    );
  }
Widget _registerText(BuildContext context) {
  return const Text('Sign In',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
    ),
  );
}
Widget _emailField(BuildContext context) {
  return TextField(
    controller: _email,
    decoration: const InputDecoration(
        hintText: 'Enter Username Or Email'
    ).applyDefaults(
        Theme.of(context).inputDecorationTheme
    ),
  );

}
Widget _passwordField(BuildContext context) {
  return TextField(
    controller: _password,
    decoration: const InputDecoration(
        hintText: 'Password'
    ).applyDefaults(
        Theme.of(context).inputDecorationTheme
    ),
  );

}
Widget _registerNowText(BuildContext context){
  return Padding(
    padding: const EdgeInsets.symmetric(
        vertical: 20
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Not A Member?',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14
          ),
        ),
        TextButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  SignUpPage(),));
        },
            child: const Text('Register Now'))
      ],
    ),
  );
  }
}