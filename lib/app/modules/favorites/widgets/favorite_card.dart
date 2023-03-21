import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  final String stockNameFavorite;

  const FavoriteCard({super.key, required this.stockNameFavorite});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                  color: Colors.white,
                  spreadRadius: 1,
                  blurRadius: 0.5,
                  offset: Offset(0, -1)),
              BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 0.8,
                  blurRadius: 0.5,
                  offset: Offset(0, 1.5))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    stockNameFavorite,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey.shade600,
                    size: 12,
                  )
                ],
              )),
        ));
  }
}
