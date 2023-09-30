import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../utils/custom_theme.dart';

// ignore: must_be_immutable
class GridCard extends StatelessWidget {
  final void Function() onPress;
  final int index;
  GridCard({
    Key? key,
    required this.onPress,
    required this.product,
    required this.index,
  }) : super(key: key);
  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: index % 2 == 0
          ? const EdgeInsets.only(left: 22)
          : const EdgeInsets.only(right: 22),
      decoration: CustomTheme.getCardDecoration(),
      child: GestureDetector(
        onTap: onPress,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 40,
                      color: Colors.transparent,
                      spreadRadius: 0,
                      offset: Offset(10, 10)),
                ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title.substring(
                            0, 6), // كده بختار يوريني حروف من اول فين

                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$'
                            ' ${product.price.toString()}',
                            // عشان يظهرلي ديه $
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 10,
              child: Image.network(
                product.image,
                height: 150,
                width: 150,
              ), //ده لو من النت
            ),
          ],
        ),
      ),
    );
  }
}
