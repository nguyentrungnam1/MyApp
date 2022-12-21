import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:my_app/common/colors.dart';

class AppBarHome extends StatefulWidget {
  const AppBarHome({Key? key}) : super(key: key);

  @override
  State<AppBarHome> createState() => _AppBarHomeState();
}

class _AppBarHomeState extends State<AppBarHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          const Icon(
            Icons.sort,
            color: AppColors.primaryColor,
            size: 36,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "TN Shop",
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Montserrat"),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              print("navigation to cart screen");
              Navigator.pushNamed(context, "cartPage");
            },
            child: Badge(
              badgeContent: const Text("3"),
              badgeColor: Colors.red.withOpacity(0.8),
              child: const Icon(
                Icons.shopping_bag,
                color: AppColors.primaryColor,
                size: 32,
              ),
            ),
          )
        ],
      ),
    );
  }
}
