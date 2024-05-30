// 1. import the riverpod_annotation package
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:http/http.dart' as http;

part 'http_provider.g.dart';


@riverpod
http.Client client(ClientRef ref) => http.Client();
