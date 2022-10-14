import 'package:flutter/material.dart';
import 'package:odc_app/presentation/screens/settings/terms_conditions/terms_conditions.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/settings_list_tile.dart';
import '../auth/login/login.dart';
import '../faq/faq_screen.dart';
import '../our_partenrs/our_partenrs_screen.dart';
import '../support/support_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Settings',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  color: Colors.black)),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            DefaultListTile(
              title: 'FAQ',
              screen: const FaqScreen(),
            ),
            DefaultListTile(
              title: 'Terms & Conditions',
              screen: TermsScreen(),
            ),
            DefaultListTile(
              title: 'Our Partenrs',
              screen: const OurPartenrsScreen(),
            ),
            DefaultListTile(
              title: 'Support',
              screen: const SupportScreen(),
            ),
            DefaultListTile(
              title: 'Log Out',
              screen: LoginScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
