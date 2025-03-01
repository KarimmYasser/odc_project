import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Notification'),
        centerTitle: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            _buildSectionTitle('Today'),
            _buildNotificationItem(Icons.local_offer, '30% Special Discount!',
                'Special promotion only valid today', Colors.red),
            _buildNotificationItem(Icons.apple, 'New Apple Promotion',
                'Special promo to all apple devices', Colors.black),
            SizedBox(height: 48.h),
            _buildSectionTitle('Yesterday'),
            _buildNotificationItem(
                Icons.local_offer,
                'Special Offer! 40% Off',
                'Special offer for new account, valid until 20 Nov 2022',
                Colors.red),
            _buildNotificationItem(
                Icons.local_offer,
                'Special Offer! 50% Off',
                'Special offer for new account, valid until 20 Nov 2022',
                Colors.red),
            _buildNotificationItem(Icons.credit_card, 'Credit Card Connected',
                'Special promotion only valid today', Colors.orange),
            _buildNotificationItem(Icons.person, 'Account Setup Successful!',
                'Special promotion only valid today', Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12.sp,
          color: TColors.textSecondary,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
          fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
        ),
      ),
    );
  }

  Widget _buildNotificationItem(
      IconData icon, String title, String subtitle, Color iconColor) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: iconColor.withOpacity(0.1),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      contentPadding: EdgeInsets.symmetric(vertical: 4.0),
    );
  }
}
