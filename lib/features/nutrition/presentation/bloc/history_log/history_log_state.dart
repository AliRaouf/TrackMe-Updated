part of 'history_log_cubit.dart';

sealed class HistoryLogState extends Equatable {
  const HistoryLogState();

  @override
  List<Object> get props => [];
}

final class HistoryLogInitial extends HistoryLogState {}

final class HistoryLogLoading extends HistoryLogState {}

final class HistoryLogSuccess extends HistoryLogState {
  final List<FoodLogModel> historyLogs;
  const HistoryLogSuccess(this.historyLogs);
}

final class HistoryLogError extends HistoryLogState {
  final String errMessage;
  const HistoryLogError(this.errMessage);
}
