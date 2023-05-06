// import '../app.dart';
// import '../models/api_msg.dart';
// import '../models/api_resp.dart';
// import '../presets/api_paths.dart';
// import '../utils/err_m.dart';
// import '../utils/mydio.dart';
//
// abstract class PrivilegeServices {
//   static Future<ApiResp> fetchCurrentUserPrivileges() async {
//     dynamic resp;
//     await errMAsync(() async {
//       resp = await MyDio().get(ApiPaths.userPrivileges);
//     }, title: 'Login Failed');
//     respNew = resp != null
//         ? ApiResp(
//             ok: true,
//             rdata: resp,
//             msgs: [
//               ApiMsg(
//                 msg: "",
//                 msgType: "",
//                 title: "Success",
//               )
//             ],
//           )
//         : ApiResp(
//             ok: false,
//             rdata: "",
//             msgs: [
//               ApiMsg(
//                 msg: "Server response failed",
//                 msgType: "0",
//                 title: "Failed",
//               )
//             ],
//           );
//
//     return respNew;
//   }
//
//   static fetchSelectedResourcesPermissionsfromLocalStore([String? resources]) {
//     final index = App.resourcePrivilege
//         .indexWhere((element) => element.resourcename == resources);
//     if (index >= 0) {
//       var permissions = App.resourcePrivilege[index].privileges;
//       return permissions;
//     } else {
//       return [];
//     }
//   }
//
//   static bool checkPermission(
//       {required String resource, required List<String> permission}) {
//     if (App.isAdmin) {
//       return true;
//     }
//     //global return true
//     List<dynamic> currentResourcePrivileges =
//         fetchSelectedResourcesPermissionsfromLocalStore(resource);
//     for (var element in permission) {
//       currentResourcePrivileges.contains(element);
//       return true;
//     }
//     return false;
//   }
// }
//
//
// //============== Resources ===============
//
// //     INV_MODULE = "INVENTORY_MODULE",
// //     INV_ITEMS = "INVENTORY_ITEMS",
// //     INV_ITEMS_PRICE = "INVENTORY_ITEMS_PRICE",
// //     INV_ITEMS_SUPPLIERS = "INVENTORY_ITEMS_SUPPLIERS",
// //     INV_ITEMS_SUPPLIERS_PN = "INVENTORY_ITEMS_SUPPLIERS_PARTNUMBER",
// //     INV_ITEMS_SUPPLIERS_COST = "INVENTORY_ITEMS_SUPPLIERS_COST",
// //     INV_ITEMS_STOCK = "INVENTORY_ITEMS_STOCK",
//
// //     INV_CATEGORIES = "INVENTORY_CATEGORIES",
// //     INV_ITEMTYPES = "INVENTORY_ITEMTYPES",
// //     INV_UNITS = "INVENTORY_UNITS",
// //     INV_SUPPLIERS = "INVENTORY_SUPPLIERS",
// //     INV_MANUFACTURERS = "INVENTORY_MANUFACTURERS",
// //     INV_STATE_TAX = "INVENTORY_TAX",
// //     INV_SALES_ACCOUNTS = "INVENTORY_SALES_ACCOUNTS",
// //     INV_WAREHOUSE = "INVENTORY_WAREHOUSE",
//
// //     INV_KITS = "INVENTORY_ASSEMBLIES",
// //     INV_KITS_SELL_PRICE = "INVENTORY_ASSEMBLY_SELL_PRICE",
// //     INV_KITS_COST_PRICE = "INVENTORY_ASSEMBLY_COST_PRICE",
// //     INV_KITS_ITEMS = "INVENTORY_ASSEMBLY_ITEMS",
// //     INV_KITS_STOCK = "INVENTORY_ASSEMBLY_STOCK",
//
// //     INV_KITS_ASSEMBLE = "INVENTORY_BUILT_ASSEMBLIES",
// //     INV_KITS_ASSEMBLE_ITEMS = "INVENTORY_BUILT_ASSEMBLY_ITEMS",
// //     INV_KITS_ASSEMBLE_WAREHOUSE = "INVENTORY_BUILT_ASSEMBLY_WAREHOUSE",
//
// //     CUSTOMER_MODULE = "CUSTOMER_MODULE",
// //     CUSTOMERS = "CUSTOMERS",
// //     CUSTOMER_TYPES = "CUSTOMER_TYPES",
// //     CUSTOMER_CURRENCY = "CUSTOMER_CURRENCY",
// //     CUSTOMER_PAYMENT_TERMS = "CUSTOMER_PAYMENT_TERMS",
// //     CUSTOMER_INDUSTRY = "CUSTOMER_INDUSTRY",
// //     CUSTOMER_LOCATIONS = "CUSTOMER_LOCATIONS",
// //     CUSTOMER_LOCATION_TYPES = "CUSTOMER_LOCATION_TYPES",
// //     CUSTOMER_LOCATION_SYSTEM_TYPES = "CUSTOMER_LOCATION_SYSTEM_TYPES",
// //     CUSTOMER_CONTACTS = "CUSTOMER_CONTACTS",
// //     CUSTOMER_LICENSE_NUMBERS = "CUSTOMER_LICENSE_NUMBERS",
// //     CUSTOMER_SYSTEM_TYPES = "CUSTOMER_SYSTEM_TYPES",
// //     CUSTOMERS_IMPORTANT_MESSAGES="CUSTOMERS_IMPORTANT_MESSAGES",
// //     CUSTOMER_SHIPPING_METHODS="CUSTOMER_SHIPPING_METHODS",
//
// //     DISTRIBUTORS = "DISTRIBUTORS",
// //     DISTRIBUTOR_CONTACTS = "DISTRIBUTOR_CONTACTS",
// //     DISTRIBUTOR_LOCATIONS = "DISTRIBUTOR_LOCATIONS",
//
// //     SERVICE_TICKET_MODULE = "SERVICE_TICKET_MODULE",
// //     SERVICE_TICKETS = "SERVICE_TICKETS",
// //     ST_PRODUCT_TYPES = "SERVICE_TICKET_PRODUCT_TYPES",
// //     ST_REASONS_FOR_SERVICE = "SERVICE_TICKET_REASONS_FOR_SERVICE",
// //     ST_PRIORITIES = "SERVICE_TICKET_PRIORITIES",
// //     ST_ACTIONS = "SERVICE_TICKET_ACTIONS",
// //     ST_ESCALATION_PERIODS = "SERVICE_TICKET_ESCALATION_PERIODS",
// //     ST_TIMSHEET = "SERVICE_TICKET_TIMESHEETS",
// //     ST_TIMSHEET_DATE = "SERVICE_TICKET_TIMESHEET_DATE",
//
// //     SALES_MODULE="SALES_MODULE",
// //     SALES="SALES",
// //     SALES_INVOICES="SALES_INVOICES",
// //     SALES_WARRANTY="SALES_WARRANTY",
// //     SALES_SETTINGS="SALES_SETTINGS",
// //     SALES_TERMS="SALES_TERMS",
// //     SALES_SERVICE_CONTRACTS="SALES_SERVICE_CONTRACTS",
// //     SALES_SALES_ORDERS="SALES_SALES_ORDERS",
//
// //     R2V_MODULE = "RING2VOICE_MODULE",
// //     R2V_PHONE_NUMBERS = "RING2VOICE_PHONE_NUMBERS",
// //     R2V_PHONE_NUMBER_PURCHASE = "RING2VOICE_PHONE_NUMBER_PURCHASE",
// //     R2V_FORWARD_NUMBERS = "RING2VOICE_FORWARD_NUMBERS",
// //     R2V_REPORTS = "RING2VOICE_REPORTS",
// //     R2V_CHAT = "RING2VOICE_CHAT"
//
// //============== Permissions ===============
//
// //     CREATE = "CREATE",
// //     VIEW = "VIEW",
// //     DELETE = "DELETE",
// //     MODIFY = "MODIFY",
// //     GLOBAL = "GLOBAL",
// //     ACTIVE = "ACTIVE",
// //     INACTIVE = "INACTIVE",
// //     HIDE = "HIDE",
// //     VIEW_INFO = "VIEW_INFO",
// //     IMPORT = "IMPORT",
// //     EXPORT = "EXPORT"