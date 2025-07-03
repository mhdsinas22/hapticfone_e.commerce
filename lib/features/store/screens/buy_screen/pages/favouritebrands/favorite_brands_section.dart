import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/common/styles/texts/brand_text.dart';
import 'package:hapticfone/common/widgets/container/brand_container.dart';
import 'package:hapticfone/utils/constants/functions.dart';

class FavoriteBrandsSection extends StatelessWidget {
  const FavoriteBrandsSection({super.key, this.isweb = false});
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 10.w),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      filtredbrands("APPLE", isweb);
                    },
                    child: BrandContainer(
                      boxDecoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      brandimage: Image.asset("assets/7.png"),
                    ),
                  ),
                  BrandText(
                    startingfrom: "Starting From",
                    price: "₹4999",
                    isweb: isweb,
                  ),
                ],
              ),
              SizedBox(width: 10.w),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      filtredbrands("SAMSUNG", isweb);
                    },
                    child: BrandContainer(
                      brandimage: Image.asset("assets/8.png"),
                    ),
                  ),
                  BrandText(
                    startingfrom: "Starting From",
                    price: "₹1499",
                    isweb: isweb,
                  ),
                ],
              ),
              SizedBox(width: 10.w),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      filtredbrands("ONEPLUS", isweb);
                    },
                    child: BrandContainer(
                      brandimage: Image.asset("assets/9.png"),
                    ),
                  ),
                  BrandText(
                    startingfrom: "Starting From",
                    price: "₹2499",
                    isweb: isweb,
                  ),
                ],
              ),
              SizedBox(width: 10.w),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      filtredbrands("MI", isweb);
                    },
                    child: BrandContainer(
                      brandimage: Image.asset("assets/10.png"),
                    ),
                  ),
                  BrandText(
                    startingfrom: "Starting From",
                    price: "₹1999",
                    isweb: isweb,
                  ),
                ],
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      filtredbrands("REALME", isweb);
                    },
                    child: BrandContainer(
                      brandimage: Image.asset("assets/11.png"),
                    ),
                  ),
                  BrandText(
                    startingfrom: "Starting From",
                    price: "₹2999",
                    isweb: isweb,
                  ),
                ],
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      filtredbrands("POCO", isweb);
                    },
                    child: BrandContainer(
                      brandimage: Image.asset("assets/12.png"),
                    ),
                  ),
                  BrandText(
                    startingfrom: "Starting From",
                    price: "₹1499",
                    isweb: isweb,
                  ),
                ],
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      filtredbrands("VIVO", isweb);
                    },
                    child: BrandContainer(
                      brandimage: Image.asset("assets/13.png"),
                    ),
                  ),
                  BrandText(
                    startingfrom: "Starting From",
                    price: "₹1499",
                    isweb: isweb,
                  ),
                ],
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      filtredbrands("OPPO", isweb);
                    },
                    child: BrandContainer(
                      brandimage: Image.asset("assets/14.png"),
                    ),
                  ),
                  BrandText(
                    startingfrom: "Starting From",
                    price: "₹1499",
                    isweb: isweb,
                  ),
                ],
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      filtredbrands("GOOGLE", isweb);
                    },
                    child: BrandContainer(
                      brandimage: Image.asset("assets/15.png"),
                    ),
                  ),
                  BrandText(
                    startingfrom: "Starting From",
                    price: "₹4499",
                    isweb: isweb,
                  ),
                ],
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      filtredbrands("MOTOROLA", isweb);
                    },
                    child: BrandContainer(
                      brandimage: Image.asset("assets/16.png"),
                    ),
                  ),
                  BrandText(
                    startingfrom: "Starting From",
                    price: "₹1499",
                    isweb: isweb,
                  ),
                ],
              ),
              SizedBox(width: 50.w),
            ],
          ),
        ],
      ),
    );
  }
}
