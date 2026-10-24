import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

enum IntegrationType {
  googleCalendar,
  googleTasks,
  gmail,
  notion,
  appleCalendar,
  appleReminders,
}

class Integration {
  final IntegrationType type;
  final String name;
  final String description;
  final IconData icon;
  final Color color;
  final bool isPro;
  final bool isConnected;

  const Integration({
    required this.type,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    this.isPro = false,
    this.isConnected = false,
  });

  Integration copyWith({bool? isConnected}) {
    return Integration(
      type: type,
      name: name,
      description: description,
      icon: icon,
      color: color,
      isPro: isPro,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  static List<Integration> get all => [
        const Integration(
          type: IntegrationType.googleCalendar,
          name: 'Google Calendar',
          description: 'Create events with full details',
          icon: Icons.calendar_today_rounded,
          color: AppColors.accent,
        ),
        const Integration(
          type: IntegrationType.googleTasks,
          name: 'Google Tasks',
          description: 'Create tasks with due dates',
          icon: Icons.task_alt_rounded,
          color: AppColors.success,
        ),
        const Integration(
          type: IntegrationType.gmail,
          name: 'Gmail',
          description: 'Create email drafts',
          icon: Icons.email_rounded,
          color: Color(0xFFEA4335),
          isPro: true,
        ),
        const Integration(
          type: IntegrationType.notion,
          name: 'Notion',
          description: 'Save notes and pages',
          icon: Icons.description_rounded,
          color: Color(0xFFFFFFFF),
          isPro: true,
        ),
        const Integration(
          type: IntegrationType.appleCalendar,
          name: 'Apple Calendar',
          description: 'Sync events to iCloud',
          icon: Icons.event_rounded,
          color: Color(0xFFFF3B30),
          isPro: true,
        ),
        const Integration(
          type: IntegrationType.appleReminders,
          name: 'Apple Reminders',
          description: 'Create reminders and alarms',
          icon: Icons.notifications_active_rounded,
          color: Color(0xFFFF9500),
          isPro: true,
        ),
      ];
}
