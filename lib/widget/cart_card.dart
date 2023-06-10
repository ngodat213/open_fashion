import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_fashion/model/cart.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/txt_styles.dart';

class CartCard extends StatefulWidget {
  const CartCard({super.key, required this.cart});
  final Cart cart;
  @override
  State<CartCard> createState() => _CartCardState();
}

int count = 0;

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 314,
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 11),
            child: Image.asset(
              widget.cart.product?.thumbUrl ?? "",
              width: 100,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.cart.product?.name.toString().toUpperCase() ?? "",
                style: TxtStyle.font14(AppColors.titleActive),
              ),
              SizedBox(height: 6),
              Text(
                widget.cart.product?.title.toString() ?? "",
                style: TxtStyle.font12(AppColors.titleActive),
              ),
              SizedBox(height: 12),
              Container(
                width: 78,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (count != 1) {
                            count--;
                            widget.cart.quantity = count;
                          }
                        });
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.footer.withOpacity(0.2),
                        ),
                        child: SvgPicture.asset(
                          'res/icons/minus.svg',
                          color: AppColors.titleActive,
                        ),
                      ),
                    ),
                    Text(
                      '${widget.cart.quantity}',
                      style: TxtStyle.font14(AppColors.titleActive),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          count++;
                          widget.cart.quantity = count;
                        });
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.footer.withOpacity(0.2),
                        ),
                        child: SvgPicture.asset(
                          'res/icons/plus.svg',
                          color: AppColors.titleActive,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 6),
              Text(
                '\$${widget.cart.product?.price ?? 0}',
                style: TxtStyle.font14(AppColors.primary),
              )
            ],
          )
        ],
      ),
    );
  }
}
