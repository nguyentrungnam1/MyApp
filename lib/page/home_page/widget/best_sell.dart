import 'package:flutter/material.dart';
import 'package:my_app/common/colors.dart';

class BestSellWidget extends StatefulWidget {
  const BestSellWidget({Key? key}) : super(key: key);

  @override
  State<BestSellWidget> createState() => _BestSellWidgetState();
}

class _BestSellWidgetState extends State<BestSellWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.68,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (int i = 1; i < 8; i++)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.primaryColor),
                      child: const Text(
                        "-50%",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Icon(
                      Icons.favorite_border,
                      size: 20,
                      color: Colors.orange,
                    )
                  ],
                ),
                Image.asset(
                  "assets/images/$i.png",
                  height: 150,
                  width: 150,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Product Title",
                    style: TextStyle(
                      fontSize: 19,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Write description of product",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "\$50",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.shopping_cart_checkout,
                      size: 25,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),
              ],
            ),
          )
      ],
    );
  }
}
