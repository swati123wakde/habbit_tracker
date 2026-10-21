import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/gradient_background.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../../domain/usecases/add_habit.dart';
import '../bloc/add_habit/add_habit_cubit.dart';

class AddHabitPage extends StatefulWidget {
  const AddHabitPage({super.key});

  @override
  State<AddHabitPage> createState() => _AddHabitPageState();
}

class _AddHabitPageState extends State<AddHabitPage> {
  static const _presets = [5, 10, 15, 20, 25, 50];

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _pointsController = TextEditingController(text: '10');

  @override
  void initState() {
    super.initState();
    _pointsController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _pointsController.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    if (!(_formKey.currentState?.validate() ?? false)) return;
    context.read<AddHabitCubit>().submit(
      name: _nameController.text,
      description: _descriptionController.text,
      points: int.parse(_pointsController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selected = int.tryParse(_pointsController.text);

    return BlocListener<AddHabitCubit, AddHabitState>(
      listener: (context, state) {
        final messenger = ScaffoldMessenger.of(context);
        if (state.status == AddHabitStatus.success) {
          messenger.showSnackBar(
            const SnackBar(content: Text('Habit created ✨')),
          );
          context.pop();
        } else if (state.status == AddHabitStatus.failure) {
          messenger
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Failed to save.')),
            );
        }
      },
      child: GradientBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(
              'New habit',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                children: [
                  const _SectionLabel('Name'),
                  TextFormField(
                    controller: _nameController,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.next,
                    maxLength: AddHabit.maxNameLength,
                    decoration: const InputDecoration(
                      hintText: 'e.g. Drink 2L water',
                      prefixIcon: Icon(Icons.edit_rounded,
                          color: AppColors.textMuted),
                      counterText: '',
                    ),
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Give your habit a name'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  const _SectionLabel('Description'),
                  TextFormField(
                    controller: _descriptionController,
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: 3,
                    minLines: 2,
                    maxLength: AddHabit.maxDescriptionLength,
                    decoration: const InputDecoration(
                      hintText: 'Why does this habit matter? (optional)',
                    ),
                  ),
                  const SizedBox(height: 12),
                  const _SectionLabel('Points'),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (final p in _presets)
                        _PointChip(
                          points: p,
                          selected: selected == p,
                          onTap: () => _pointsController.text = '$p',
                        ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _pointsController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Custom points',
                      helperText:
                      'Between ${AddHabit.minPoints} and ${AddHabit.maxPoints}',
                      prefixIcon: Icon(Icons.stars_rounded,
                          color: AppColors.textMuted),
                    ),
                    validator: (v) {
                      final value = int.tryParse(v ?? '');
                      if (value == null ||
                          value < AddHabit.minPoints ||
                          value > AddHabit.maxPoints) {
                        return 'Enter ${AddHabit.minPoints}–${AddHabit.maxPoints} points';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 36),
                  BlocBuilder<AddHabitCubit, AddHabitState>(
                    builder: (context, state) => GradientButton(
                      label: 'Create habit',
                      icon: Icons.check_rounded,
                      isLoading: state.status == AddHabitStatus.submitting,
                      onPressed: _submit,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 10, left: 4),
    child: Text(
      text.toUpperCase(),
      style: const TextStyle(
        color: AppColors.textMuted,
        fontSize: 12,
        letterSpacing: 1.2,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

class _PointChip extends StatelessWidget {
  const _PointChip({
    required this.points,
    required this.selected,
    required this.onTap,
  });

  final int points;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(14);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: radius,
        gradient: selected ? AppColors.primaryGradient : null,
        color: selected ? null : AppColors.surfaceRaised,
        border: Border.all(
          color: selected ? Colors.transparent : AppColors.outline,
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: radius,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: Text(
              '$points',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: selected ? Colors.white : AppColors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
