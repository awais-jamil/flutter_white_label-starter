import 'package:drive_share/app.dart';
import 'package:flutter/material.dart';
import 'package:locale/locale.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  //form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(
        context: context,
        title: LocaleStrings.signUp,
        headline: LocaleStrings.createAccount,
        description: LocaleStrings.signInSubHeading(),
        showBackButton: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: context.spacing.l,
          right: context.spacing.l,
          top: context.spacing.xxl,
        ),
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              children: [
                CustomTextField.textField(
                  label: LocaleStrings.email,
                  hint: LocaleStrings.enterEmail,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return LocaleStrings.enterEmail;
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.spacing.m),
                CustomTextField.textField(
                  label: LocaleStrings.password,
                  hint: LocaleStrings.enterPassword,
                  controller: passwordController,
                  isPasswordField: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return LocaleStrings.enterPassword;
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.spacing.m),
                CustomTextField.textField(
                  label: LocaleStrings.confirmPassword,
                  hint: LocaleStrings.enterPassword,
                  controller: confirmPasswordController,
                  isPasswordField: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return LocaleStrings.enterPassword;
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.spacing.xl),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton.primary(
                    title: LocaleStrings.createAnAccount,
                    onTap: () {
                      // formKey.currentState!.validate();
                      context.pushAndRemoveUntil(AppRouterPage.signupData.name);
                    },
                  ),
                ),
                SizedBox(height: context.spacing.l),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.spacing.xxxl),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Divider(
                              color: context.secondary.withOpacity(0.1),
                              thickness: 1.0,
                            ),
                          ),
                          SizedBox(width: context.spacing.m),
                          Text(
                            LocaleStrings.orSignUpWith,
                            style: context.bodyMedium!.copyWith(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: context.hint,
                            ),
                          ),
                          SizedBox(width: context.spacing.m),
                          Expanded(
                            child: Divider(
                              color: context.secondary.withOpacity(0.1),
                              thickness: 1.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: context.spacing.l),
                      SocialLogins(
                        onGoogleTap: () {},
                        onAppleTap: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.spacing.xxl),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleStrings.bySigningUp,
                      style: context.bodyMedium!.copyWith(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: context.hint,
                      ),
                    ),
                    CustomButton.text(
                      title: LocaleStrings.termsAndConditions,
                      textStyle: context.bodyMedium!.copyWith(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: context.primary,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
