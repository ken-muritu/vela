import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../models/captured_action.dart';
import '../../theme/app_colors.dart';
import '../../widgets/vela_logo.dart';
import 'widgets/action_card.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onCapture;

  const HomeScreen({super.key, required this.onCapture});

  List<CapturedAction> get _mockActions => [
        CapturedAction(
          id: '1',
          rawInput: 'Meeting with Sarah tomorrow at 2pm at Java House Westlands',
          type: ActionType.createEvent,
          status: ActionStatus.completed,
          source: ActionSource.manual,
          destination: 'Google Calendar',
          summary: 'Meeting with Sarah — Tomorrow, 2:00 PM at Java House Westlands',
          createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
        ),
        CapturedAction(
          id: '2',
          rawInput: 'Draft email to Kamau about the overdue invoice',
          type: ActionType.draftEmail,
          status: ActionStatus.completed,
          source: ActionSource.shared,
          destination: 'Gmail',
          summary: 'Email draft: Invoice follow-up to Kamau',
          createdAt: DateTime.now().subtract(const Duration(hours: 1)),
        ),
        CapturedAction(
          id: '3',
          rawInput: 'Remind me to call mum at 6pm',
          type: ActionType.setReminder,
          status: ActionStatus.completed,
          source: ActionSource.voiceNote,
          destination: 'Reminders',
          summary: 'Call mum — Today at 6:00 PM',
          createdAt: DateTime.now().subtract(const Duration(hours: 3)),
        ),
        CapturedAction(
          id: '4',
          rawInput: 'https://notion.so/interesting-article',
          type: ActionType.saveLink,
          status: ActionStatus.completed,
          source: ActionSource.shared,
          destination: 'Notion',
          summary: 'Link saved to Reading List',
          createdAt: DateTime.now().subtract(const Duration(hours: 5)),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final actions = _mockActions;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const VelaLogo(size: 32),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.bolt_rounded, size: 14, color: AppColors.success),
                        SizedBox(width: 4),
                        Text(
                          '4 actions today',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.success,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Greeting
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _greeting(),
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Here\'s what VELA handled for you.',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.muted,
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.1, end: 0),

            const SizedBox(height: 24),

            // Action feed
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                itemCount: actions.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return ActionCard(action: actions[index])
                      .animate()
                      .fadeIn(delay: (100 * index).ms, duration: 300.ms)
                      .slideY(begin: 0.05, end: 0);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: onCapture,
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Capture', style: TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }

  String _greeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning';
    if (hour < 17) return 'Good afternoon';
    return 'Good evening';
  }
}
