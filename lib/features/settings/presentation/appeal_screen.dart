import 'package:auto_route/auto_route.dart';
import 'package:calorie_counter/core/presentation/widgets/base_app_container.dart';
import 'package:calorie_counter/core/presentation/widgets/base_app_input_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AppealScreen extends StatelessWidget {
  const AppealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Обращение'),
      ),
      body: const AppealBody(),
    );
  }
}

class AppealBody extends StatefulWidget {
  const AppealBody({
    super.key,
  });

  @override
  State<AppealBody> createState() => _AppealBodyState();
}

class _AppealBodyState extends State<AppealBody> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 12),
        child: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: BaseAppContainer(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BaseAppInputWidget(label: 'Имя', isEditMode: true),
                      BaseAppInputWidget(label: 'Обращение', hint: 'Введите пожелание или проблему', isEditMode: true),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Отправить'),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
