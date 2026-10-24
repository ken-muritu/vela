enum ActionType {
  createEvent,
  setReminder,
  setAlarm,
  draftEmail,
  saveNote,
  saveLink,
  createTask,
  expenseLog,
  unknown,
}

enum ActionStatus {
  pending,
  processing,
  completed,
  failed,
}

enum ActionSource {
  manual,
  shared,
  voiceNote,
  screenshot,
}

class CapturedAction {
  final String id;
  final String rawInput;
  final ActionType type;
  final ActionStatus status;
  final ActionSource source;
  final String? destination;
  final String? summary;
  final DateTime createdAt;
  final Map<String, dynamic>? metadata;

  const CapturedAction({
    required this.id,
    required this.rawInput,
    required this.type,
    required this.status,
    required this.source,
    this.destination,
    this.summary,
    required this.createdAt,
    this.metadata,
  });

  CapturedAction copyWith({
    ActionStatus? status,
    String? summary,
    String? destination,
    ActionType? type,
  }) {
    return CapturedAction(
      id: id,
      rawInput: rawInput,
      type: type ?? this.type,
      status: status ?? this.status,
      source: source,
      destination: destination ?? this.destination,
      summary: summary ?? this.summary,
      createdAt: createdAt,
      metadata: metadata,
    );
  }

  String get typeLabel {
    switch (type) {
      case ActionType.createEvent:
        return 'Calendar Event';
      case ActionType.setReminder:
        return 'Reminder';
      case ActionType.setAlarm:
        return 'Alarm';
      case ActionType.draftEmail:
        return 'Email Draft';
      case ActionType.saveNote:
        return 'Note';
      case ActionType.saveLink:
        return 'Link';
      case ActionType.createTask:
        return 'Task';
      case ActionType.expenseLog:
        return 'Expense';
      case ActionType.unknown:
        return 'Processing';
    }
  }

  String get statusLabel {
    switch (status) {
      case ActionStatus.pending:
        return 'Pending';
      case ActionStatus.processing:
        return 'Processing...';
      case ActionStatus.completed:
        return 'Done';
      case ActionStatus.failed:
        return 'Failed';
    }
  }
}
