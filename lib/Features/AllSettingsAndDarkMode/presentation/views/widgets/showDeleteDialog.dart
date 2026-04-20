
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/delete_account/delete_cubit.dart';

void showDeleteDialog(BuildContext context, DeleteAccountCubit cubit) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: Text("Delete Account"),
        content: Text("Are you sure?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              cubit.deleteAccount(); // 👈 هنا الحل
            },
            child: Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}