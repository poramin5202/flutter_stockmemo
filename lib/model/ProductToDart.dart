// To parse this JSON data, do
//
//     final productDart = productDartFromJson(jsonString);

import 'dart:convert';

ProductDart productDartFromJson(String str) => ProductDart.fromJson(json.decode(utf8.decode(str.runes.toList())));

String productDartToJson(ProductDart data) => json.encode(data.toJson());

class ProductDart {
    List<Product>? product;

    ProductDart({
        this.product,
    });

    factory ProductDart.fromJson(Map<String, dynamic> json) => ProductDart(
        product: json["Product"] == null ? [] : List<Product>.from(json["Product"]!.map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Product": product == null ? [] : List<dynamic>.from(product!.map((x) => x.toJson())),
    };
}

class Product {
    String? prdtCode;
    int? prdtRunningId;
    String? prdtModel;
    String? prdtName;
    DateTime? prdtUpdateDate;
    String? prdtUpdateBy;

    Product({
        this.prdtCode,
        this.prdtRunningId,
        this.prdtModel,
        this.prdtName,
        this.prdtUpdateDate,
        this.prdtUpdateBy,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        prdtCode: json["PrdtCode"],
        prdtRunningId: json["PrdtRunningId"],
        prdtModel: json["PrdtModel"],
        prdtName: json["PrdtName"],
        prdtUpdateDate: json["PrdtUpdateDate"] == null ? null : DateTime.parse(json["PrdtUpdateDate"]),
        prdtUpdateBy: json["PrdtUpdateBy"],
    );

    Map<String, dynamic> toJson() => {
        "PrdtCode": prdtCode,
        "PrdtRunningId": prdtRunningId,
        "PrdtModel": prdtModel,
        "PrdtName": prdtName,
        "PrdtUpdateDate": prdtUpdateDate?.toIso8601String(),
        "PrdtUpdateBy": prdtUpdateBy,
    };
}
