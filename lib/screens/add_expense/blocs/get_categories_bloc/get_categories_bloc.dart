import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';

part 'get_categories_event.dart';
part 'get_categories_state.dart';

class GetCategoriesBloc extends Bloc<GetCategoriesEvent, GetCategoriesState> {
  ExpenseRepository expenseRepository;

  GetCategoriesBloc(this.expenseRepository) : super(GetCategoriesInitial()) {
    on<GetCategories>((event, emit) async {
      emit(GetCategoriesLoading());
      try {
        List<Category> categories = await expenseRepository.getCategory();
        // Tạo bản sao của danh sách categories
        List<Category> categoriesCopy = List.from(categories);
        emit(GetCategoriesSuccess(categoriesCopy));
      } catch (e) {
        emit(GetCategoriesFailure());
      }
    });
  }
}
