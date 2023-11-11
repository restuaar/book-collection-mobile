import 'package:flutter/material.dart';

class MenuItem {
  final String name;
  final IconData icon;
  final Color? color;

  MenuItem(this.name, this.icon, {this.color});
}

class MenuItemCard extends StatelessWidget {
  final MenuItem item;

  const MenuItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: item.color ?? Colors.blueGrey[700],
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentMaterialBanner()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}")));
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 3),
                  child: Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}