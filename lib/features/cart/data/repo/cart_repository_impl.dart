// data/repositories/cart_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:grocery3/core/connection/network_info.dart';
import 'package:grocery3/core/error/exception.dart';
import 'package:grocery3/features/cart/data/data_source/cart_local_data_source.dart';
import 'package:grocery3/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:grocery3/features/cart/data/model/cart_item_model.dart';
import 'package:grocery3/features/cart/domain/entitis/cart_item_entity.dart';
import 'package:grocery3/features/cart/domain/repo/cart_repo.dart';


class CartRepositoryImpl extends CartRepository {
  final CartRemoteDataSource remoteDataSource;
  final CartLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CartRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<String, Cart>> getCart() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteCart = await remoteDataSource.getCart();
        await localDataSource.cacheCart(
          remoteCart.items.cast<CartItemModel>(),
        );
        return Right(remoteCart);
      } on ServerException catch (e) {
        return Left(e.errModel.message.toString());
      }
    } else {
      try {
        final localItems = await localDataSource.getCachedCart();
        final total = localItems.fold<double>(
          0,
          (sum, item) => sum + (item.price * item.quantity),
        );
        return Right(Cart(items: localItems, total: total));
      } catch (e) {
        return Left('No internet connection and no cached data');
      }
    }
  }

  @override
  Future<Either<String, Cart>> addToCart({
    required int productId,
    required int quantity,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final cart = await remoteDataSource.addToCart(
          productId: productId,
          quantity: quantity,
        );
        await localDataSource.cacheCart(cart.items.cast<CartItemModel>());
        return Right(cart);
      } on ServerException catch (e) {
        return Left(e.errModel.message.toString());
      }
    } else {
      return Left('No internet connection');
    }
  }

  @override
  Future<Either<String, Cart>> updateCartItem({
    required int cartItemId,
    required int quantity,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final cart = await remoteDataSource.updateCartItem(
          cartItemId: cartItemId,
          quantity: quantity,
        );
        await localDataSource.cacheCart(cart.items.cast<CartItemModel>());
        return Right(cart);
      } on ServerException catch (e) {
        return Left(e.errModel.message.toString());
      }
    } else {
      return Left('No internet connection');
    }
  }

  @override
  Future<Either<String, void>> removeFromCart({required int cartItemId}) async {
    if (await networkInfo.isConnected!) {
      try {
        await remoteDataSource.removeFromCart(cartItemId: cartItemId);
        return Right(null);
      } on ServerException catch (e) {
        return Left(e.errModel.message.toString());
      }
    } else {
      return Left('No internet connection');
    }
  }

  @override
  Future<Either<String, void>> clearCart() async {
    if (await networkInfo.isConnected!) {
      try {
        await remoteDataSource.clearCart();
        await localDataSource.clearCart();
        return Right(null);
      } on ServerException catch (e) {
        return Left(e.errModel.message.toString());
      }
    } else {
      return Left('No internet connection');
    }
  }
}
