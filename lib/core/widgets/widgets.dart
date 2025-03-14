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
      return S.of(context).approveTask;
    case TaskStatus.approved:
      return S.of(context).startTask;
    case TaskStatus.inProgress:
      return S.of(context).completeTask;
    case TaskStatus.cancelled:
      return S.of(context).cancelTask;
    case TaskStatus.completed:
      return S.of(context).completeTask;
  }
}

class SemiTransparentContainer extends StatelessWidget {
  final double opacity;
  final Widget child;
  final double height;
  final double width;
  final double borderRadius;

  const SemiTransparentContainer(
      {super.key,
      this.opacity = 0.4,
      this.borderRadius = 20,
      required this.child,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: ColorManager.white.withOpacity(opacity),
      ),
      child: child,
    );
  }
}
