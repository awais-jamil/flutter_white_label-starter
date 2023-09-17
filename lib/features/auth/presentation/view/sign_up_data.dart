import 'package:drive_share/app.dart';
import 'package:flutter/material.dart';
import 'package:locale/locale.dart';

class SignupDataScreen extends StatelessWidget {
  SignupDataScreen({super.key});

  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  //form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(
        context: context,
        title: LocaleStrings.dataScreen,
        headline: LocaleStrings.signUp,
        description: LocaleStrings.signInSubHeading(),
        showBackButton: false,
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
                  label: LocaleStrings.fname,
                  hint: LocaleStrings.enterfname,
                  controller: fnameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return LocaleStrings.enterfname;
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.spacing.m),
                CustomTextField.textField(
                  label: LocaleStrings.lname,
                  hint: LocaleStrings.enterlname,
                  controller: lnameController,
                  isPasswordField: true,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return LocaleStrings.enterlname;
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.spacing.m),
                CustomTextField.dropdown(
                  label: LocaleStrings.country,
                  hint: LocaleStrings.selectCountry,
                  controller: countryController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return LocaleStrings.selectCountry;
                    }
                    return null;
                  },
                  items: countries.values.toList(),
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
