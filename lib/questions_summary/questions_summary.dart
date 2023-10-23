import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary/summary_item.dart';

class QuestionSummarry extends StatelessWidget {
  const QuestionSummarry({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: summaryData.map(
            (data) {
              return SummaryItem(itemData: data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
