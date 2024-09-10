import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/features/home/data/models/todo_response.dart';
import 'package:tasky_app/features/home/data/repos/home_repo.dart';
import 'package:tasky_app/features/home/logic/home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  ScrollController scrollController = ScrollController();

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  int pageNum = 1;
  String category = 'all';
  bool isLoadMoreLoading = false;
  List<TodoResponse>? items;
  List<TodoResponse>? filteredItems;
  bool hasMoreItems = true;
  List<String> categoriesList = ['All', 'InProgress', 'Waiting', 'Finished'];
  Map<String, dynamic> categoriesTextToApiValue = {
    'All':'all',
    'InProgress':'inProgress',
    'Waiting':'waiting',
    'Finished':'finished'
  };

  int selectedIndex = 0;

  //get tasks for first time or refresh---------------

  Future getTasksForFirstTime() async {
    selectedIndex = 0;
    pageNum = 1;
    items = [];
    filteredItems = [];
    hasMoreItems = true;
    emit(const HomeState.getTasksLoading());
    final response = await _homeRepo.getTodoList(1);
    response.when(success: (todoResponse) async {
      items!.addAll(todoResponse);
      changeTaskStatusCategory(category);
      emit(HomeState.getTasksSuccess(items));
    }, failure: (error) {
      emit(HomeState.getTasksError(error: error.apiErrorModel.message ?? ''));
    });
  }

//load more tasks----

  void loadMoreItems() async {
    if (hasMoreItems == false || isLoadMoreLoading || selectedIndex != 0)
      return;

    pageNum++;
    isLoadMoreLoading = true;
    emit(const HomeState.getTasksLoading());

    final response = await _homeRepo.getTodoList(pageNum);
    response.when(success: (todoResponse) {
      isLoadMoreLoading = false;
      if (todoResponse.isEmpty) {
        hasMoreItems = false;
      }
      items!.addAll(todoResponse);
      filteredItems = items;
      emit(HomeState.getTasksSuccess(items));
    }, failure: (error) {
      isLoadMoreLoading = false;
      emit(HomeState.getTasksError(error: error.apiErrorModel.message ?? ''));
    });
  }

  //change tasks category-----------

  void changeTaskStatusCategory(String category) async {
    if (category.toLowerCase() == 'all') {
      selectedIndex = 0;
      filteredItems = items!;
    } else {
      selectedIndex = categoriesList
          .indexWhere((item) => item.toLowerCase() == category.toLowerCase());
      filteredItems = items!
          .where((item) => item.status == categoriesTextToApiValue[category])
          .toList();
    }
    emit(HomeState.changeStatusCategory(
        category: category, filteredItems: filteredItems!));
  }

  //delete task-------------

  void deleteTaskById(String taskId) async {
    final response = await _homeRepo.deleteTaskById(taskId);
    response.when(success: (_) async {
      getTasksForFirstTime();
    }, failure: (error) {
      emit(HomeState.getTasksError(error: error.apiErrorModel.message ?? ''));
    });
  }
}
