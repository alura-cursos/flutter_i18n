import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../screens/components/display_text.dart';
import '../screens/home.dart';
import '../screens/components/primary_button.dart';
import '../screens/sign_up.dart';
import '../theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: AppBackgroundProperties.boxDecoration,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  SvgPicture.asset("assets/images/more_stars.svg"),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40.0),
                        child: DisplayText(
                          AppLocalizations.of(context)!.loginTitle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: Image.asset("assets/images/grimorio.png"),
                      ),
                      SizedBox(
                        width: 246,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: TextFormField(
                                  style:
                                      InputDecorationProperties.textDecoration,
                                  decoration: InputDecorationProperties
                                      .newInputDecoration(
                                    AppLocalizations.of(context)!
                                        .emailPlaceholder,
                                    AppLocalizations.of(context)!.email,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                              TextFormField(
                                style: InputDecorationProperties.textDecoration,
                                decoration: InputDecorationProperties
                                    .newInputDecoration("******",
                                        AppLocalizations.of(context)!.password),
                                obscureText: true,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 28.0),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .loginForgottenPassword,
                                    style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              PrimaryButton(
                                text: AppLocalizations.of(context)!
                                    .loginSignInButton,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Home()));
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    fixedSize: const Size.fromWidth(246),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Signup()));
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .loginCreateAccountButton,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 15,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
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
        ),
      ),
    );
  }
}
