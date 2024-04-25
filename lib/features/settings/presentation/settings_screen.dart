import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:calorie_counter/core/presentation/theme.dart';
import 'package:calorie_counter/core/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 12),
        child: Column(
          children: [
            _SettingsTile(title: 'Политика конфиденциальности', onTap: () {}),
            _SettingsTile(title: 'Пользовательское соглашение', onTap: () {}),
            _SettingsTile(title: 'Оставить обращение', onTap: () => AutoRouter.of(context).push(const AppealRoute())),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  //TODO
                },
                child: const Text('Оценить приложение')),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: AutoSizeText(title, maxLines: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tileColor: Colors.white,
        trailing: const Icon(Icons.arrow_forward_ios, color: AppColors.primary, size: 20),
        titleTextStyle: AppTextStyle.s16w600.copyWith(color: AppColors.black),
        onTap: onTap,
      ),
    );
  }
}
