import 'package:flutter/material.dart';
import 'package:tast_manager/constant/app_strings.dart';
import 'package:tast_manager/constant/filter_options.dart';
import 'package:tast_manager/ui/shared/app_colors.dart';
import 'package:tast_manager/ui/shared/text_styles.dart';

class FilterModel {
  final String title;
  final FilterOption value;

  FilterModel(this.title, this.value);
}

class FilterDialogWidget extends StatefulWidget {
  FilterOption selectedFilter;
  final Function(FilterOption) onTap;

  FilterDialogWidget({super.key, required this.selectedFilter, required this.onTap});

  @override
  State<FilterDialogWidget> createState() => _FilterDialogWidgetState();
}

class _FilterDialogWidgetState extends State<FilterDialogWidget> {
  final List<FilterModel> _filters = [
    FilterModel(all, FilterOption.allTasks),
    FilterModel(upcoming, FilterOption.upcomingTasks),
    FilterModel(completed, FilterOption.completedTasks)
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 10.0,
      backgroundColor: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _filters.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              setState(() {
                widget.selectedFilter = _filters[index].value;
              });
              widget.onTap(_filters[index].value);
            },
            title: Text(
              _filters[index].title,
              style: textStylePoppins(fontWeight: FontWeight.w500),
            ),
            leading: widget.selectedFilter == _filters[index].value
                ? const Icon(
                    Icons.radio_button_checked,
                    color: kcAccentColor,
                    size: 24.0,
                  )
                : const Icon(
                    Icons.radio_button_off,
                    color: Colors.grey,
                    size: 24.0,
                  ),
          );
        },
      ),
    );
  }
}
