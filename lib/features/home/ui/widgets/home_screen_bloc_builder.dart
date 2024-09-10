import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_app/Core/helpers/utils_functions.dart';
import 'package:tasky_app/Core/theming/colors.dart';
import 'package:tasky_app/Core/theming/styles.dart';
import 'package:tasky_app/features/home/logic/home_cubit.dart';
import 'package:tasky_app/features/home/logic/home_states.dart';
import 'package:tasky_app/features/home/ui/widgets/task_list_tile_widget.dart';

class HomeScreenBlocBuilder extends StatelessWidget {
  const HomeScreenBlocBuilder({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = context.read<HomeCubit>();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetTasksError) {
          setupErrorState(context, state.error);
        }
      },
      builder: (context, state) {
        if (state is GetTasksLoading && !homeCubit.isLoadMoreLoading) {
          return const Center(child: CircularProgressIndicator());
        }
       else if (homeCubit.filteredItems != null) {
          return homeCubit.filteredItems!.isNotEmpty
              ? ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: homeCubit.filteredItems!.length +
                      (homeCubit.isLoadMoreLoading ? 1 : 0),
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    if (index >= homeCubit.filteredItems!.length) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.mainColor,
                        ),
                      );
                    } else {
                      final task = homeCubit.filteredItems![index];
                      return TaskListTile(task: task);
                    }
                  },
                )
              : SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height - 250.h,
                          child: Text(
                            'No Tasks',
                            style: TextStyles.font18DarkGreyBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        } else {
          return Center(child: const CircularProgressIndicator());
        }
      },
    );
  }
}
