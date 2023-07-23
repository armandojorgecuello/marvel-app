import 'package:equatable/equatable.dart';

abstract class Result<T,E>{

  Result();

  bool get isFail;

  E? get failRes;

  bool get isSuccess;

  T? get succesRed;

  factory Result.fail(E e) = Fail;

  factory Result.success(T t) = Success;

  R when<R>({
    required R Function(E) fail,
    required R Function(T) success,
  });

}

class Success<T,E> extends Result<T,E>{

  final T _success;

  Success(T v ) : _success = v;

  @override
  E? get failRes => null;

  @override
  bool get isFail => false;

  @override
  bool get isSuccess => true;

  @override
  T? get succesRed => _success;

  @override
  R when<R>({
    required R Function(E p1) fail, 
    required R Function(T p1) success
  })  => success(_success);
}

class Fail<T,E> extends Result<T,E>{
  
  final E _fail;

  Fail(E e) : _fail = e ;
  
  @override
  E? get failRes => _fail;

  @override
  bool get isFail => true;

  @override
  bool get isSuccess => false;

  @override
  T? get succesRed => null;

  @override
  R when<R>({
    required R Function(E p1) fail, 
    required R Function(T p1) success
  }) 
    => fail(_fail); 

}


abstract class Error extends Equatable{
  final String? description;
  final String? error;
  final Map? data;

  const Error({
    this.description,
    this.error,
    this.data
  });
}


class BackendError extends Error{

  final int statusCode;

  const BackendError({
    required this.statusCode,
    Map? data, 
    String? description,
    String? error,
  }) : super(data: data, description: description, error: error);
  
  BackendError copyWith({
    Map? data, 
    String? description,
    String? error,
    int? statusCode
  }){
    return BackendError(
      statusCode: statusCode ?? this.statusCode,
      data: data ?? this.data,
      error:  error ?? this.error,
      description: description ?? description,
    );
  }


  @override
  List<Object?> get props => [
    data, 
    description,
    error,
    statusCode,
  ];

}