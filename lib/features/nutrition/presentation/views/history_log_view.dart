import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:track_me_updated/core/styles.dart';
import 'package:track_me_updated/features/nutrition/presentation/bloc/history_log/history_log_cubit.dart';
import 'package:track_me_updated/features/nutrition/presentation/views/widgets/history_log_list.dart';

class HistoryLogView extends StatelessWidget {
  const HistoryLogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton.outlined(
              onPressed: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2024),
                  lastDate: DateTime(2025),
                );

                if (pickedDate != null) {
                  final formattedDate =
                      DateFormat('d/M/yyyy').format(pickedDate);
                  context
                      .read<HistoryLogCubit>()
                      .getFoodLogbyDate(formattedDate);
                }
              },
              icon: const Icon(
                Icons.date_range,
                color: Colors.white,
              ),
              style: ButtonStyle(
                  side: WidgetStateProperty.all(
                      const BorderSide(color: Colors.white))))
        ],
        title: Text(
          "History Log",
          style: TextStyles.title22Dark,
        ),
      ),
      body: BlocBuilder<HistoryLogCubit, HistoryLogState>(
          builder: (context, state) {
        if (state is HistoryLogLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HistoryLogError) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is HistoryLogSuccess) {
          if (state.historyLogs.isEmpty) {
            return const Center(
              child: Text("No food log found for the selected date"),
            );
          } else {
            return const HistoryLogList();
          }
        } else {
          return const Center(
            child: Text("Please Select a Date by Clicking the Date Icon"),
          );
        }
      }),
    );
  }
}
