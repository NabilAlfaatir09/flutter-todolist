// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../models/list_model.dart';

class ListItem extends StatelessWidget {
  final ListModel list;
  final onListChange;
  final onDeleteList;
  const ListItem(
      {super.key,
      required this.list,
      required this.onListChange,
      required this.onDeleteList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        onTap: () {
          onListChange(list);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: (list.isDone)
            ? const Icon(
                Icons.check_box,
                color: Color.fromRGBO(64, 224, 208, 1),
              )
            : const Icon(Icons.check_box_outline_blank,
                color: Color.fromRGBO(64, 224, 208, 1)),
        title: Text(
          list.text,
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: (list.isDone) ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            onPressed: () {
              onDeleteList(list.id);
            },
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
