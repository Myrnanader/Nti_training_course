import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ex/core/widgets/alert_type.dart';

import '../../../core/constants/app_strings.dart';

class AlertBottomSheet extends StatelessWidget {
  final AlertType type;
  final VoidCallback? onConfirm;

  const AlertBottomSheet({super.key, required this.type, this.onConfirm});

  @override
  Widget build(BuildContext context) {
    final _config = _AlertConfig.fromType(type);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Wrap(
        children: [
          /// ───── Header ─────
          Row(
            children: [
              Icon(_config.icon, color: _config.iconColor, size: 26.sp),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  _config.message,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.grey.shade400,
                  size: 22.sp,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          /// ───── Actions ─────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /// Cancel
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  _config.cancelText,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),

              /// Confirm
              if (_config.showConfirm)
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    onConfirm?.call();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _config.confirmColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  icon: Icon(
                    _config.confirmIcon,
                    size: 18.sp,
                    color: Colors.white,
                  ),
                  label: Text(
                    _config.confirmText,
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AlertConfig {
  final String message;
  final IconData icon;
  final Color iconColor;

  final bool showConfirm;
  final String confirmText;
  final IconData confirmIcon;
  final Color confirmColor;

  final String cancelText;

  _AlertConfig({
    required this.message,
    required this.icon,
    required this.iconColor,
    required this.showConfirm,
    required this.confirmText,
    required this.confirmIcon,
    required this.confirmColor,
    required this.cancelText,
  });

  factory _AlertConfig.fromType(AlertType type) {
    switch (type) {
      case AlertType.validation:
        return _AlertConfig(
          message: AppStrings.alertMessage, // "Should add title and desc"
          icon: Icons.error_outline,
          iconColor: Colors.orange,
          showConfirm: false,
          confirmText: "",
          confirmIcon: Icons.check,
          confirmColor: Colors.transparent,
          cancelText: "Ok",
        );

      case AlertType.confirmEdit:
        return _AlertConfig(
          message: "Are you sure you want to edit this note?",
          icon: Icons.edit,
          iconColor: Colors.blue,
          showConfirm: true,
          confirmText: "Edit",
          confirmIcon: Icons.check_circle,
          confirmColor: Colors.blue,
          cancelText: "Cancel",
        );

      case AlertType.confirmDelete:
        return _AlertConfig(
          message: "Are you sure you want to delete this note?",
          icon: Icons.delete_outline,
          iconColor: Colors.red,
          showConfirm: true,
          confirmText: "Delete",
          confirmIcon: Icons.delete,
          confirmColor: Colors.red,
          cancelText: "Cancel",
        );
    }
  }
}
