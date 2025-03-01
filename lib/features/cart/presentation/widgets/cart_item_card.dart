import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odc_project/features/cart/data/model/product_cart_model.dart';

import '../../../home/data/model/product_model.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.item,
  });

  final ProductCartModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                item.image!,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Quantity: ${1}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // if (item.rating?.rate != null && item.rating!.rate! > 0)
                  //   Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         'Rating: ${item.rating!.rate}%',
                  //         style: TextStyle(
                  //           fontSize: 14,
                  //           color: Colors.red[700],
                  //         ),
                  //       ),
                  //       const SizedBox(height: 4),
                  //       Row(
                  //         children: [
                  //           Text(
                  //             'EGP ${(item.price! * (item.rating?.count ?? 1)).toStringAsFixed(2)}',
                  //             style: const TextStyle(
                  //               fontSize: 14,
                  //               color: Colors.grey,
                  //               decoration: TextDecoration.lineThrough,
                  //             ),
                  //           ),
                  //           const SizedBox(width: 8),
                  //           Text(
                  //             'EGP ${(item.price! * (1 - (item.rating!.rate! / 100)) * (item.rating?.count ?? 1)).toStringAsFixed(2)}',
                  //             style: TextStyle(
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.green[700],
                  //             ),
                  //           ),
                  //         ],
                  //       )
                  //     ],
                  //   )
                  // else
                  //   Text(
                  //     'EGP ${(item.price! * (item.rating?.count ?? 1)).toStringAsFixed(2)}',
                  //     style: TextStyle(
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.green[700],
                  //     ),
                  //   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
