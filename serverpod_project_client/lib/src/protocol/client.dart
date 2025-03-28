/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'protocol.dart' as _i3;

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointXM1haix extends _i1.EndpointRef {
  EndpointXM1haix(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'xM1haix';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'xM1haix',
        'hello',
        {'name': name},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i3.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    example = EndpointExample(this);
    xM1haix = EndpointXM1haix(this);
  }

  late final EndpointExample example;

  late final EndpointXM1haix xM1haix;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'example': example,
        'xM1haix': xM1haix,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
