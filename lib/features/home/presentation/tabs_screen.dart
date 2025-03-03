import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:odc_project/features/cart/presentation/cart_screen.dart';
import 'package:odc_project/features/home/logic/home_cubit.dart';
import 'package:odc_project/features/home/presentation/browse_page.dart';
import 'package:odc_project/features/home/presentation/home_page.dart';
import 'package:odc_project/features/home/presentation/wishlist_page.dart';
import 'package:odc_project/features/profile/presentation/profile_screen.dart';

import '../../../core/constants/colors.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    BrowsePage(),
    WishlistPage(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        backgroundColor: TColors.white,
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: TColors.primary,
          unselectedItemColor: TColors.grey,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 11.sp,
            letterSpacing: 0,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 11.sp,
            letterSpacing: 0,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: 'Home',
              activeIcon: Icon(Iconsax.home1),
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.search_normal),
              label: 'Browse',
              activeIcon: Icon(Iconsax.search_normal),
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.heart),
              label: 'Wishlist',
              activeIcon: Icon(Iconsax.heart),
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.shopping_cart),
              label: 'Cart',
              activeIcon: Icon(Iconsax.shopping_cart),
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.user),
              label: 'Profile',
              activeIcon: Icon(Iconsax.user),
            ),
          ],
        ),
      ),
    );
  }
}
