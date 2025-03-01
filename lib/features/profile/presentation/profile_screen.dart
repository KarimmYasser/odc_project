import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_project/core/constants/colors.dart';
import 'package:odc_project/features/auth/presentation/login_screen.dart';
import 'package:odc_project/features/profile/presentation/privacy_policy_screen.dart';

import '../../../core/db/cache/cache_helper.dart';
import '../../home/data/model/user_model.dart';

class ProfileScreen extends StatelessWidget {
  UserModel userData = UserModel(
    id: 1,
    address: Address(
      city: '6th of October',
      street: 'Mohandes Samir',
      zipcode: '12555',
    ),
    email: 'karimmyasserr@gmail.com',
    name: Name(firstname: 'Karim', lastname: 'Yasser'),
    iV: 10,
    password: 'test',
    phone: '01144432284',
    username: 'karimmyasserr',
  );

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
              ),
              Text(
                'Profile',
                style: GoogleFonts.plusJakartaSans(
                  color: TColors.textPrimary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.44.h,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: TColors.textPrimary,
                  size: 22.sp,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          height: 220.h,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFE7F5F8),
                Colors.white,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100.w,
                height: 100.h,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg'),
                    fit: BoxFit.cover,
                  ),
                  shape: OvalBorder(),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                '${userData.name!.firstname} ${userData.name!.lastname}',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18.sp,
                  color: TColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  height: 1.44.h,
                ),
              ),
              Text(
                userData.email!,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14.sp,
                  color: TColors.textSecondary,
                  fontWeight: FontWeight.w400,
                  height: 1.43.h,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 76.h,
                      width: double.infinity,
                    ),
                    Text(
                      'Account Settings',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14.sp,
                        color: TColors.textSecondary,
                        fontWeight: FontWeight.w600,
                        height: 1.43.h,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    _settingTile(
                      context,
                      icon: Icons.location_on_outlined,
                      title: 'Address',
                    ),
                    _settingTile(
                      context,
                      icon: Icons.payment,
                      title: 'Payment Method',
                    ),
                    _settingTile(
                      context,
                      icon: Icons.notifications,
                      title: 'Notification',
                    ),
                    _settingTile(
                      context,
                      icon: Icons.security,
                      title: 'Account Security',
                    ),
                    SizedBox(height: 52.h),
                    Text(
                      'General',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14.sp,
                        color: TColors.textSecondary,
                        fontWeight: FontWeight.w600,
                        height: 1.43.h,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    _settingTile(
                      context,
                      icon: Icons.people_outline_rounded,
                      title: 'Invite Friends',
                    ),
                    _settingTile(context,
                        icon: Icons.lock_outline,
                        title: 'Privacy Policy', onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrivacyPolicyScreen()));
                    }),
                    _settingTile(
                      context,
                      icon: Icons.info_outline,
                      title: 'Help Center',
                    ),
                    SizedBox(height: 52.h),
                    _settingTile(context,
                        icon: Icons.logout_outlined,
                        title: 'Logout',
                        isLogout: true, onTap: () {
                      CacheHelper.removeData(key: 'token');
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                          (predicate) => false);
                    }),
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

Widget _settingTile(
  BuildContext context, {
  required IconData icon,
  required String title,
  isLogout = false,
  VoidCallback? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8.h),
      leading: Container(
        width: 48.w,
        height: 48.h,
        decoration: const ShapeDecoration(
          color: Color(0xFFF3F6FB),
          shape: OvalBorder(),
        ),
        child: Icon(
          icon,
          color: isLogout ? Colors.red : TColors.textPrimary,
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 16.sp,
          color: isLogout ? Colors.red : TColors.textPrimary,
          fontWeight: FontWeight.w600,
          height: 1.50.h,
        ),
      ),
      trailing: isLogout
          ? null
          : const Icon(
              Icons.arrow_forward_ios_rounded,
              color: TColors.textPrimary,
            ),
    ),
  );
}
