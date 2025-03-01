import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_project/core/constants/colors.dart';
import 'package:odc_project/features/auth/presentation/OTP_screen.dart';
import 'package:odc_project/features/auth/presentation/register_screen.dart';
import 'package:odc_project/features/home/presentation/tabs_screen.dart';

import '../../../core/constants/text_strings.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_input.dart';
import '../../../generated/assets.dart';
import '../logic/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoginLoading) {
              showDialog(
                  context: context,
                  builder: (context) => Center(
                      child: CircularProgressIndicator(color: TColors.black)));
            }

            if (state is AuthLoginSuccess) {
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => TabsScreen()));
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Success Login"),
              ));
            }

            if (state is AuthLoginFailure) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
              ));
            }
          },
          builder: (context, state) {
            return SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 24.h),
                  Text(
                    TTexts.loginTitle,
                    style: TextStyle(
                      color: TColors.textPrimary,
                      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                      fontWeight: FontWeight.w600,
                      fontSize: 32.sp,
                      letterSpacing: 0,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CustomTextInput(
                    hintText: TTexts.username,
                    labelText: TTexts.username,
                    controller: userNameController,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextInput(
                    hintText: TTexts.password,
                    labelText: TTexts.password,
                    controller: passwordController,
                    isPassword: true,
                  ),
                  SizedBox(height: 24.h),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTPScreen()));
                    },
                    child: Text(
                      TTexts.forgetPassword,
                      style: TextStyle(
                        color: TColors.textPrimary,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  CustomButton(
                      label: TTexts.login,
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => TabsScreen()),
                          (route) => false,
                        );
                        // context.read<AuthCubit>().login(
                        //     userNameController.text, passwordController.text);
                      }),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          color: TColors.lightGrey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          TTexts.orContinueWith,
                          style: TextStyle(
                            color: TColors.textSecondary,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: TColors.lightGrey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  InkWell(
                    child: Container(
                      width: 335.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 16.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(34.r),
                        border: Border.all(color: TColors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            Assets.logosGoogleIcon,
                            width: 24.w,
                            height: 24.h,
                          ),
                          Text(
                            TTexts.continueWithGoogle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              letterSpacing: 0,
                              color: TColors.textPrimary,
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                            width: 24.w,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  InkWell(
                    child: Container(
                      width: 335.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 16.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(34.r),
                        border: Border.all(color: TColors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            Assets.logosFacebookIcon,
                            width: 24.w,
                            height: 24.h,
                          ),
                          Text(
                            TTexts.continueWithFacebook,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              letterSpacing: 0,
                              color: TColors.textPrimary,
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                            width: 24.w,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        TTexts.createAccount,
                        style: TextStyle(
                          color: TColors.textSecondary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                        child: Text(
                          TTexts.register,
                          style: TextStyle(
                            color: TColors.hyperText,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    ],
                  )

                  // CustomButton(
                  //   label: TTexts.register,
                  //   onPressed: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => RegisterScreen()));
                  //   },
                  // ),
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}
