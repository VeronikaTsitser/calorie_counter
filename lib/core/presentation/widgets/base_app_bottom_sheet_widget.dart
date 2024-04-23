import 'package:auto_size_text/auto_size_text.dart';
import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseAppBottomSheetWidget extends StatelessWidget {
  const BaseAppBottomSheetWidget({
    super.key,
    required this.title,
    this.onTap,
    required this.child,
    required this.formKey,
  });
  final String title;
  final VoidCallback? onTap;
  final Widget child;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Row(
                      children: [
                        const Icon(CupertinoIcons.chevron_left, color: AppColors.primary),
                        Text('Назад', style: AppTextStyle.s16w600.copyWith(color: AppColors.primary)),
                      ],
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  SizedBox(
                    width: 0.45.sw,
                    child: AutoSizeText(
                      title,
                      style: AppTextStyle.s16w600,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'Готово',
                      style: AppTextStyle.s16w600.copyWith(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
