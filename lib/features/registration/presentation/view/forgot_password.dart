import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sihaty_app/core/constants/assets_images.dart';
import 'package:sihaty_app/core/functions/routing.dart';
import 'package:sihaty_app/core/utils/colors.dart';
import 'package:sihaty_app/core/utils/txt_styal.dart';
import 'package:sihaty_app/core/widgets/custom_button.dart';
import 'package:sihaty_app/features/registration/presentation/view/login_view.dart';
import 'package:sihaty_app/features/registration/presentation/widget/custom_text_form_field.dart';


// ignore: must_be_immutable
class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key, required this.index});
  final int index;

  @override
  GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: key,
            child: Column(
              children: [
                const Gap(90),
                Image.asset(height: 200, width: 200, AssetImages.appIcon),

                Text(
                  'استرجاع الحساب',
                  style: getBodyStyle(context,
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),

                //email
                const Gap(25),
                CustomTextFormField(
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'ادخل البريد الالكتروني';
                    }
                    return null;
                  },
                  hintText: 'البريد الالكتروني',
                  suffixIcon: const SizedBox(),
                  prefixIcon: Icon(
                    Icons.email,
                    color: AppColors.primaryColor,
                  ),
                ),

                //Button Register an account'
                const Gap(25),
                CustomButton(
                  height: 45,
                  text: 'تسجيل حساب',
                  onPressed: () {
                    if (key.currentState!.validate()) {
                    } else {}
                  },
                  color: AppColors.primaryColor,
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'لدي حساب؟',
                      style: getBodyStyle(context),
                    ),
                    TextButton(
                        onPressed: () {
                          navigatorTo(
                              context,
                              LoginView(
                                index: index,
                              ));
                        },
                        child: Text(
                          'سجل دخول',
                          style: getBodyStyle(context,
                              color: AppColors.primaryColor),
                        ))
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