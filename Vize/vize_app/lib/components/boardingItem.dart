import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/localization.dart';

class BoardingItem extends StatelessWidget {
  final String image;
  final String title;

  const BoardingItem({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                image,
                height: 240,
              )),
          const SizedBox(height: 40),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          InkWell(
            onTap: () => GoRouter.of(context).push("/home"),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 31, 31, 31),
              ),
              padding: const EdgeInsets.all(25),
              child: Center(
                child: Text(
                  AppLocalizations.of(context).getTranslate("boarding_button"),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
