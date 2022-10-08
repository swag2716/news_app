import '../models/category_model.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel> category = [];

  CategoryModel categoryModel = CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1600880292203-757bb62b4baf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1603190287605-e6ade32fa852?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZW50ZXJ0YWlubWVudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1000&q=60";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1434030216411-0b793f4b4173?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Z2VuZXJhbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1000&q=60";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c3BvcnRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1000&q=60";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1477332552946-cfb384aeaf1c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGVhbHRofGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1000&q=60";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dGVjaG5vbG9neXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1000&q=60";
  category.add(categoryModel);

  return category;
}