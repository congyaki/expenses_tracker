import 'package:expense_repository/expense_repository.dart';

abstract class ExpenseRepository {
// Category
  Future<void> createCategory(Category category);

  Future<List<Category>> getCategory();

  Future<void> updateCategory(Category category);

  Future<void> deleteCategory(String categoryId);

  Future<void> updateCategoryTotalExpenses(Category category, int amount);

// Expense
  Future<void> createExpense(Expense expense);

  Future<List<Expense>> getExpenses();
}