import 'dart:convert';

import 'package:ecommerceshope/model/my_order_model/my_order_details_model.dart';

class MyOrderModel {
  final int id;
  final int customerId;
  final String invoiceNo;
  final String customerName;
  final String customerMobile;
  final String customerEmail;
  final String billingAddress;
  final String shippingName;
  final String shippingPhone;
  final String shippingEmail;
  final String shippingAddress;
  final String vatAmount;
  final String membershipDiscount;
  final String shippingCost;
  final String discountAmount;
  final String serviceCharge;
  final String totalAmount;
  final String paymentStatus;
  final String note;
  final String updatedBy;
  final String status;
  final dynamic deletedAt;
  final String createdAt;
  final String updatedAt;
  final String ipAddress;
  final List<OrderDetailsModel> orderDetails;

  MyOrderModel({
    required this.id,
    required this.customerId,
    required this.invoiceNo,
    required this.customerName,
    required this.customerMobile,
    required this.customerEmail,
    required this.billingAddress,
    required this.shippingName,
    required this.shippingPhone,
    required this.shippingEmail,
    required this.shippingAddress,
    required this.vatAmount,
    required this.membershipDiscount,
    required this.shippingCost,
    required this.discountAmount,
    required this.serviceCharge,
    required this.totalAmount,
    required this.paymentStatus,
    required this.note,
    required this.updatedBy,
    required this.status,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.ipAddress,
    required this.orderDetails,
  });

  factory MyOrderModel.fromRJson(String str) => MyOrderModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MyOrderModel.fromMap(Map<String, dynamic> json) => MyOrderModel(
    id: json["id"]??0,
    customerId: json["customer_id"]??0,
    invoiceNo: json["invoice_no"]??'',
    customerName: json["customer_name"]??'',
    customerMobile: json["customer_mobile"]??'',
    customerEmail: json["customer_email"]??'',
    billingAddress: json["billing_address"]??'',
    shippingName: json["shipping_name"]??'',
    shippingPhone: json["shipping_phone"]??'',
    shippingEmail: json["shipping_email"]??'',
    shippingAddress: json["shipping_address"]??'',
    vatAmount: json["vat_amount"]??'',
    membershipDiscount: json["membership_discount"]??'',
    shippingCost: json["shipping_cost"]??'',
    discountAmount: json["discount_amount"]??'',
    serviceCharge: json["service_charge"]??'',
    totalAmount: json["total_amount"]??'',
    paymentStatus: json["payment_status"]??'',
    note: json["note"]??'',
    updatedBy: json["updated_by"]??'',
    status: json["status"]??'',
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"]??'',
    updatedAt: json["updated_at"]??'',
    ipAddress: json["ip_address"]??'',
    orderDetails: json["order_details"] == [] ? [] : List<OrderDetailsModel>.from(json["order_details"].map((x) => OrderDetailsModel.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "customer_id": customerId,
    "invoice_no": invoiceNo,
    "customer_name": customerName,
    "customer_mobile": customerMobile,
    "customer_email": customerEmail,
    "billing_address": billingAddress,
    "shipping_name": shippingName,
    "shipping_phone": shippingPhone,
    "shipping_email": shippingEmail,
    "shipping_address": shippingAddress,
    "vat_amount": vatAmount,
    "membership_discount": membershipDiscount,
    "shipping_cost": shippingCost,
    "discount_amount": discountAmount,
    "service_charge": serviceCharge,
    "total_amount": totalAmount,
    "payment_status": paymentStatus,
    "note": note,
    "updated_by": updatedBy,
    "status": status,
    "deleted_at": deletedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "ip_address": ipAddress,
    "order_details": List<dynamic>.from(orderDetails.map((x) => x.toMap())),
  };
}