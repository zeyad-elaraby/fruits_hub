import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/utils/backend_endpoints.dart';
import 'package:fruits_hub/features/checkout/data/models/order_model.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/domain/repository/base_orders_repository.dart';

class OrdersRepository implements BaseOrdersRepository {
  DatabaseService databaseService;
  OrdersRepository(this.databaseService);
  @override
  Future<Either<Failure, void>> addOrder(OrderEntity orderEntity) async {
    try {
      await databaseService.addData(
        path: BackendEndpoints.addOrder,
        docId: orderEntity.orderId,
        data: OrderModel.fromEntity(orderEntity).toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
