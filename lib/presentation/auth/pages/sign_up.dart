import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appbar/appbar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/presentation/auth/pages/sign_in.dart';

import '../../../core/configs/assets/app_vectors.dart';
import '../../../service_locator.dart.';
import '../../home/pages/home.dart';


class SignUpPage extends StatelessWidget{
  SignUpPage({super.key});


  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: _signInText(context),
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
              _registerText(),
              const SizedBox(height: 50,),
              _fullNameField(context),
              const SizedBox(height: 30,),
              _emailField(context),
              const SizedBox(height: 30,),
              _passwordField(context),
              const SizedBox(height: 30,),
              BasicAppButton(
                  onPressed: () async {
                    var result = await sl<SignupUseCase>().call(
                      params: CreateUserReq(
                          fullName: _fullName.text.toString(),
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
                              MaterialPageRoute(builder: (BuildContext) => const Home()),

                              (route) => false);
                        }
                    );
                  },
                  title: 'Create Account')

            ],
          ),
        ),
      ),
    );
  }

Widget _registerText() {
  return const Text('Register',
  textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold
    ),
  );
}
Widget _fullNameField(BuildContext context) {
  return TextField(
    controller: _fullName,
    decoration: const InputDecoration(
      hintText: 'Full Name'
    ).applyDefaults(
      Theme.of(context).inputDecorationTheme
    ),
  );

}
Widget _emailField(BuildContext context) {
  return TextField(
    controller: _email,
    decoration: const InputDecoration(
      hintText: 'Enter Email'
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
Widget _signInText(BuildContext context){
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 20
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Do You Have An Account?',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14
        ),
        ),
        TextButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage(),));
        },
            child: const Text('Sign In'))
      ],
    ),
  );
}
}