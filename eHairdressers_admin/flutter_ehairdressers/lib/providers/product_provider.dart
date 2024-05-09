import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_ehairdressers/models/product.dart';
import 'package:flutter_ehairdressers/models/search_result.dart';

import 'package:flutter_ehairdressers/utils/util.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'base_provider.dart';

class ProductProvider extends BaseProvider<Product> {
  ProductProvider() : super("Products");

  @override
  Product fromJson(data) {
    // TODO: implement fromJson
    return Product.fromJson(data);
  }
}
