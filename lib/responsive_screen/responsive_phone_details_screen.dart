import 'package:flutter/material.dart';
import 'package:hapticfone/features/store/screens/buy_screen/pages/phone_details.dart';
import 'package:hapticfone/web_screens/web_phonedetails_screen.dart';

class ResponsivePhoneDetailsScreen extends StatelessWidget {
  const ResponsivePhoneDetailsScreen({
    super.key,
    required this.phonetile,
    required this.phoneimage,
    required this.phonebrand,
    required this.phonecolor,
    required this.phoneram,
    required this.phonestock,
    required this.phonestorage,
    required this.phonecondtion,
    required this.phoneprice,
    required this.images,
    required this.id,
  });

  final String phonetile;
  final String phoneimage;
  final String phonebrand;
  final String phonecolor;
  final String phoneram;
  final int phonestock;
  final String phonestorage;
  final String phonecondtion;
  final double phoneprice;
  final List<dynamic> images;
  final String id;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return Phonedetails(
            phonetile: phonetile,
            phoneimage: phoneimage,
            phonebrand: phonebrand,
            phonecolor: phonecolor,
            phoneram: phoneram,
            phonestock: phonestock,
            phonestorage: phonestorage,
            phonecondtion: phonecondtion,
            phoneprice: phoneprice,
            images: images,
            id: id,
          );
        } else {
          return WebphonedetailsScreen(
            phonetile: phonetile,
            phoneimage: phoneimage,
            phonebrand: phonebrand,
            phonecolor: phonecolor,
            phoneram: phoneram,
            phonestock: phonestock,
            phonestorage: phonestorage,
            phonecondtion: phonecondtion,
            phoneprice: phoneprice,
            images: images,
            id: id,
          );
        }
      },
    );
  }
}
