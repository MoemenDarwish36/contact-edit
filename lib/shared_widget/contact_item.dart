import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  void Function(int) onTap;

  String name;

  String phone;

  int index;

  ContactItem(
      {super.key,
      required this.index,
      required this.onTap,
      required this.name,
      required this.phone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text("Name : $name "),
              const SizedBox(
                height: 20,
              ),
              Text("Phone : $phone ")
            ],
          ),
          IconButton(
              onPressed: () {
                onTap(index);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
