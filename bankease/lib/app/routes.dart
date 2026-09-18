/// Every path in the app should be defined here.
/// This will help us to avoid typos and make it easier to change paths in the future.
/// Screens call these helpers instead of typing string by hand or hardcoding them in the code.

abstract final class AppRoutes {
  static const login = '/login';
  static const dashboard = '/dashboard';

  static String accounts(String id) => '/dashboard/accounts/$id';
  static String statement(String accountId) =>
      '/dashboard/statement/$accountId';

  static String transfer({String? fromAccountId}) => fromAccountId == null
      ? '/dashboard/transfer'
      : '/dashboard/transfer?fromAccountId=$fromAccountId';

  static const transferReview = '/dashboard/transfer/review';
  static const transferSuccess = '/dashboard/transfer/success';
  static const addBeneficiary = '/dashboard/beneficiaries/add';
}
