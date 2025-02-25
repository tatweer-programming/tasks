import 'package:flutter/material.dart';
import 'package:tasks/core/utils/color_manager.dart';
import 'package:tasks/generated/l10n.dart';
import 'package:tasks/modules/task/data/model/task.dart';

class DefaultButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color color;
  final String text;
  final Color textColor;
  final Widget? icon;
  final VoidCallback? onPressed;
  final bool? isLoading;

  const DefaultButton({
    super.key,
    this.height,
    this.width,
    this.color = ColorManager.orange,
    required this.text,
    this.textColor = ColorManager.black,
    this.icon,
    required this.onPressed,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: isLoading == true
              ? [
                  Center(
                    child: CircularProgressIndicator(
                      color: textColor,
                    ),
                  ),
                ]
              : [
                  if (icon != null) icon!,
                  Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
        ),
      ),
    );
  }
}

Color getStatusColor(TaskStatus status) {
  switch (status) {
    case TaskStatus.pending:
      return ColorManager.yellow;
    case TaskStatus.approved:
      return ColorManager.green;
    case TaskStatus.inProgress:
      return ColorManager.blue;
    case TaskStatus.cancelled:
      return ColorManager.red;
    case TaskStatus.completed:
      return ColorManager.grey;
  }
}

String getTaskStatusLanguage(TaskStatus status, BuildContext context) {
  switch (status) {
    case TaskStatus.pending:
      return S.of(context).pending;
    case TaskStatus.approved:
      return S.of(context).approved;
    case TaskStatus.inProgress:
      return S.of(context).in_progress;
    case TaskStatus.cancelled:
      return S.of(context).cancelled;
    case TaskStatus.completed:
      return S.of(context).completed;
  }
}
