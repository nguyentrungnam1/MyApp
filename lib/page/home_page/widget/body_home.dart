import 'package:flutter/material.dart';
import 'package:my_app/common/colors.dart';
import 'package:my_app/page/home_page/widget/best_sell.dart';
import 'package:my_app/page/home_page/widget/category.dart';

class BodyHomePage extends StatelessWidget {
  const BodyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        color: Color(0xFFEEEDF3),
      ),
      child: Column(
        children: [
          Container(
            // height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            // padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 300,
                  margin: const EdgeInsets.only(left: 5),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "Search here..."),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.camera_alt,
                  size: 25,
                  color: AppColors.primaryColor,
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: const Text(
              "Categories",
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Montserrat"),
            ),
          ),
          const CategoryWidget(),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: const Text(
              "Best selling",
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Montserrat"),
            ),
          ),
          const BestSellWidget(),
        ],
      ),
    );
  }
}
