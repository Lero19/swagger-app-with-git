import 'package:flutter/material.dart';
import 'package:swagger_app/Models/products_models.dart';

class ProductsProvider with ChangeNotifier {
  List<ProductModel> get getProducts {
    return _productsList;
  }

  static final List<ProductModel> _productsList = [
    ProductModel(
      id: '012345678',
      title: 'Winter Hoodie',
      imageUrl:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fbluewatergear.co.za%2F323-winter-hoodies&psig=AOvVaw1ClIjbpJEtHBhPlddyQOUn&ust=1698103310215000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCODsxPflioIDFQAAAAAdAAAAABAN',
      productCategoryName: 'Hoodie',
      price: 170,
      salePrice: 120,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: '012345678',
      title: 'Basic T-shirts',
      imageUrl:
          'https://unboundmerino.com/cdn/shop/files/mega-menu-our-promise-page_1440x.jpg?v=1667743361',
      productCategoryName: 'Hoodie',
      price: 170,
      salePrice: 120,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: '012345678',
      title: 'Winter Hoodie',
      imageUrl:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fbluewatergear.co.za%2F323-winter-hoodies&psig=AOvVaw1ClIjbpJEtHBhPlddyQOUn&ust=1698103310215000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCODsxPflioIDFQAAAAAdAAAAABAN',
      productCategoryName: 'Hoodie',
      price: 170,
      salePrice: 120,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: '012345678',
      title: 'Winter Hoodie',
      imageUrl:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fbluewatergear.co.za%2F323-winter-hoodies&psig=AOvVaw1ClIjbpJEtHBhPlddyQOUn&ust=1698103310215000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCODsxPflioIDFQAAAAAdAAAAABAN',
      productCategoryName: 'Hoodie',
      price: 170,
      salePrice: 120,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: '012345678',
      title: 'Winter Hoodie',
      imageUrl:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fbluewatergear.co.za%2F323-winter-hoodies&psig=AOvVaw1ClIjbpJEtHBhPlddyQOUn&ust=1698103310215000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCODsxPflioIDFQAAAAAdAAAAABAN',
      productCategoryName: 'Hoodie',
      price: 170,
      salePrice: 120,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: '012345678',
      title: 'Winter Hoodie',
      imageUrl:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fbluewatergear.co.za%2F323-winter-hoodies&psig=AOvVaw1ClIjbpJEtHBhPlddyQOUn&ust=1698103310215000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCODsxPflioIDFQAAAAAdAAAAABAN',
      productCategoryName: 'Hoodie',
      price: 170,
      salePrice: 120,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: '012345678',
      title: 'Winter Hoodie',
      imageUrl:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fbluewatergear.co.za%2F323-winter-hoodies&psig=AOvVaw1ClIjbpJEtHBhPlddyQOUn&ust=1698103310215000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCODsxPflioIDFQAAAAAdAAAAABAN',
      productCategoryName: 'Hoodie',
      price: 170,
      salePrice: 120,
      isOnSale: false,
      isPiece: false,
    ),
  ];
}
