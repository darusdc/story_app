// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllStories _$AllStoriesFromJson(Map<String, dynamic> json) {
  return _AllStories.fromJson(json);
}

/// @nodoc
mixin _$AllStories {
  bool get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<ListStory> get listStory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllStoriesCopyWith<AllStories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllStoriesCopyWith<$Res> {
  factory $AllStoriesCopyWith(
          AllStories value, $Res Function(AllStories) then) =
      _$AllStoriesCopyWithImpl<$Res, AllStories>;
  @useResult
  $Res call({bool error, String message, List<ListStory> listStory});
}

/// @nodoc
class _$AllStoriesCopyWithImpl<$Res, $Val extends AllStories>
    implements $AllStoriesCopyWith<$Res> {
  _$AllStoriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? listStory = null,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      listStory: null == listStory
          ? _value.listStory
          : listStory // ignore: cast_nullable_to_non_nullable
              as List<ListStory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllStoriesImplCopyWith<$Res>
    implements $AllStoriesCopyWith<$Res> {
  factory _$$AllStoriesImplCopyWith(
          _$AllStoriesImpl value, $Res Function(_$AllStoriesImpl) then) =
      __$$AllStoriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool error, String message, List<ListStory> listStory});
}

/// @nodoc
class __$$AllStoriesImplCopyWithImpl<$Res>
    extends _$AllStoriesCopyWithImpl<$Res, _$AllStoriesImpl>
    implements _$$AllStoriesImplCopyWith<$Res> {
  __$$AllStoriesImplCopyWithImpl(
      _$AllStoriesImpl _value, $Res Function(_$AllStoriesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? listStory = null,
  }) {
    return _then(_$AllStoriesImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      listStory: null == listStory
          ? _value._listStory
          : listStory // ignore: cast_nullable_to_non_nullable
              as List<ListStory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllStoriesImpl implements _AllStories {
  const _$AllStoriesImpl(
      {required this.error,
      required this.message,
      required final List<ListStory> listStory})
      : _listStory = listStory;

  factory _$AllStoriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllStoriesImplFromJson(json);

  @override
  final bool error;
  @override
  final String message;
  final List<ListStory> _listStory;
  @override
  List<ListStory> get listStory {
    if (_listStory is EqualUnmodifiableListView) return _listStory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listStory);
  }

  @override
  String toString() {
    return 'AllStories(error: $error, message: $message, listStory: $listStory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllStoriesImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._listStory, _listStory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message,
      const DeepCollectionEquality().hash(_listStory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllStoriesImplCopyWith<_$AllStoriesImpl> get copyWith =>
      __$$AllStoriesImplCopyWithImpl<_$AllStoriesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllStoriesImplToJson(
      this,
    );
  }
}

abstract class _AllStories implements AllStories {
  const factory _AllStories(
      {required final bool error,
      required final String message,
      required final List<ListStory> listStory}) = _$AllStoriesImpl;

  factory _AllStories.fromJson(Map<String, dynamic> json) =
      _$AllStoriesImpl.fromJson;

  @override
  bool get error;
  @override
  String get message;
  @override
  List<ListStory> get listStory;
  @override
  @JsonKey(ignore: true)
  _$$AllStoriesImplCopyWith<_$AllStoriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ListStory _$ListStoryFromJson(Map<String, dynamic> json) {
  return _ListStory.fromJson(json);
}

/// @nodoc
mixin _$ListStory {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  dynamic get lat => throw _privateConstructorUsedError;
  dynamic get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListStoryCopyWith<ListStory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListStoryCopyWith<$Res> {
  factory $ListStoryCopyWith(ListStory value, $Res Function(ListStory) then) =
      _$ListStoryCopyWithImpl<$Res, ListStory>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String photoUrl,
      DateTime createdAt,
      dynamic lat,
      dynamic lon});
}

/// @nodoc
class _$ListStoryCopyWithImpl<$Res, $Val extends ListStory>
    implements $ListStoryCopyWith<$Res> {
  _$ListStoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? photoUrl = null,
    Object? createdAt = null,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListStoryImplCopyWith<$Res>
    implements $ListStoryCopyWith<$Res> {
  factory _$$ListStoryImplCopyWith(
          _$ListStoryImpl value, $Res Function(_$ListStoryImpl) then) =
      __$$ListStoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String photoUrl,
      DateTime createdAt,
      dynamic lat,
      dynamic lon});
}

/// @nodoc
class __$$ListStoryImplCopyWithImpl<$Res>
    extends _$ListStoryCopyWithImpl<$Res, _$ListStoryImpl>
    implements _$$ListStoryImplCopyWith<$Res> {
  __$$ListStoryImplCopyWithImpl(
      _$ListStoryImpl _value, $Res Function(_$ListStoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? photoUrl = null,
    Object? createdAt = null,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_$ListStoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListStoryImpl implements _ListStory {
  const _$ListStoryImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.photoUrl,
      required this.createdAt,
      required this.lat,
      required this.lon});

  factory _$ListStoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListStoryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String photoUrl;
  @override
  final DateTime createdAt;
  @override
  final dynamic lat;
  @override
  final dynamic lon;

  @override
  String toString() {
    return 'ListStory(id: $id, name: $name, description: $description, photoUrl: $photoUrl, createdAt: $createdAt, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListStoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.lon, lon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      photoUrl,
      createdAt,
      const DeepCollectionEquality().hash(lat),
      const DeepCollectionEquality().hash(lon));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListStoryImplCopyWith<_$ListStoryImpl> get copyWith =>
      __$$ListStoryImplCopyWithImpl<_$ListStoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListStoryImplToJson(
      this,
    );
  }
}

abstract class _ListStory implements ListStory {
  const factory _ListStory(
      {required final String id,
      required final String name,
      required final String description,
      required final String photoUrl,
      required final DateTime createdAt,
      required final dynamic lat,
      required final dynamic lon}) = _$ListStoryImpl;

  factory _ListStory.fromJson(Map<String, dynamic> json) =
      _$ListStoryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get photoUrl;
  @override
  DateTime get createdAt;
  @override
  dynamic get lat;
  @override
  dynamic get lon;
  @override
  @JsonKey(ignore: true)
  _$$ListStoryImplCopyWith<_$ListStoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailStory _$DetailStoryFromJson(Map<String, dynamic> json) {
  return _DetailStory.fromJson(json);
}

/// @nodoc
mixin _$DetailStory {
  bool get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Story get story => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailStoryCopyWith<DetailStory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStoryCopyWith<$Res> {
  factory $DetailStoryCopyWith(
          DetailStory value, $Res Function(DetailStory) then) =
      _$DetailStoryCopyWithImpl<$Res, DetailStory>;
  @useResult
  $Res call({bool error, String message, Story story});

  $StoryCopyWith<$Res> get story;
}

/// @nodoc
class _$DetailStoryCopyWithImpl<$Res, $Val extends DetailStory>
    implements $DetailStoryCopyWith<$Res> {
  _$DetailStoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? story = null,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      story: null == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as Story,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoryCopyWith<$Res> get story {
    return $StoryCopyWith<$Res>(_value.story, (value) {
      return _then(_value.copyWith(story: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailStoryImplCopyWith<$Res>
    implements $DetailStoryCopyWith<$Res> {
  factory _$$DetailStoryImplCopyWith(
          _$DetailStoryImpl value, $Res Function(_$DetailStoryImpl) then) =
      __$$DetailStoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool error, String message, Story story});

  @override
  $StoryCopyWith<$Res> get story;
}

/// @nodoc
class __$$DetailStoryImplCopyWithImpl<$Res>
    extends _$DetailStoryCopyWithImpl<$Res, _$DetailStoryImpl>
    implements _$$DetailStoryImplCopyWith<$Res> {
  __$$DetailStoryImplCopyWithImpl(
      _$DetailStoryImpl _value, $Res Function(_$DetailStoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? story = null,
  }) {
    return _then(_$DetailStoryImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      story: null == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as Story,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailStoryImpl implements _DetailStory {
  const _$DetailStoryImpl(
      {required this.error, required this.message, required this.story});

  factory _$DetailStoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailStoryImplFromJson(json);

  @override
  final bool error;
  @override
  final String message;
  @override
  final Story story;

  @override
  String toString() {
    return 'DetailStory(error: $error, message: $message, story: $story)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailStoryImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.story, story) || other.story == story));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message, story);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailStoryImplCopyWith<_$DetailStoryImpl> get copyWith =>
      __$$DetailStoryImplCopyWithImpl<_$DetailStoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailStoryImplToJson(
      this,
    );
  }
}

abstract class _DetailStory implements DetailStory {
  const factory _DetailStory(
      {required final bool error,
      required final String message,
      required final Story story}) = _$DetailStoryImpl;

  factory _DetailStory.fromJson(Map<String, dynamic> json) =
      _$DetailStoryImpl.fromJson;

  @override
  bool get error;
  @override
  String get message;
  @override
  Story get story;
  @override
  @JsonKey(ignore: true)
  _$$DetailStoryImplCopyWith<_$DetailStoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SendStory _$SendStoryFromJson(Map<String, dynamic> json) {
  return _SendStory.fromJson(json);
}

/// @nodoc
mixin _$SendStory {
  bool get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendStoryCopyWith<SendStory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendStoryCopyWith<$Res> {
  factory $SendStoryCopyWith(SendStory value, $Res Function(SendStory) then) =
      _$SendStoryCopyWithImpl<$Res, SendStory>;
  @useResult
  $Res call({bool error, String message});
}

/// @nodoc
class _$SendStoryCopyWithImpl<$Res, $Val extends SendStory>
    implements $SendStoryCopyWith<$Res> {
  _$SendStoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendStoryImplCopyWith<$Res>
    implements $SendStoryCopyWith<$Res> {
  factory _$$SendStoryImplCopyWith(
          _$SendStoryImpl value, $Res Function(_$SendStoryImpl) then) =
      __$$SendStoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool error, String message});
}

/// @nodoc
class __$$SendStoryImplCopyWithImpl<$Res>
    extends _$SendStoryCopyWithImpl<$Res, _$SendStoryImpl>
    implements _$$SendStoryImplCopyWith<$Res> {
  __$$SendStoryImplCopyWithImpl(
      _$SendStoryImpl _value, $Res Function(_$SendStoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
  }) {
    return _then(_$SendStoryImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendStoryImpl implements _SendStory {
  const _$SendStoryImpl({required this.error, required this.message});

  factory _$SendStoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendStoryImplFromJson(json);

  @override
  final bool error;
  @override
  final String message;

  @override
  String toString() {
    return 'SendStory(error: $error, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendStoryImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendStoryImplCopyWith<_$SendStoryImpl> get copyWith =>
      __$$SendStoryImplCopyWithImpl<_$SendStoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendStoryImplToJson(
      this,
    );
  }
}

abstract class _SendStory implements SendStory {
  const factory _SendStory(
      {required final bool error,
      required final String message}) = _$SendStoryImpl;

  factory _SendStory.fromJson(Map<String, dynamic> json) =
      _$SendStoryImpl.fromJson;

  @override
  bool get error;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$SendStoryImplCopyWith<_$SendStoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Story _$StoryFromJson(Map<String, dynamic> json) {
  return _Story.fromJson(json);
}

/// @nodoc
mixin _$Story {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  dynamic get lat => throw _privateConstructorUsedError;
  dynamic get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryCopyWith<Story> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryCopyWith<$Res> {
  factory $StoryCopyWith(Story value, $Res Function(Story) then) =
      _$StoryCopyWithImpl<$Res, Story>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String photoUrl,
      DateTime createdAt,
      dynamic lat,
      dynamic lon});
}

/// @nodoc
class _$StoryCopyWithImpl<$Res, $Val extends Story>
    implements $StoryCopyWith<$Res> {
  _$StoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? photoUrl = null,
    Object? createdAt = null,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryImplCopyWith<$Res> implements $StoryCopyWith<$Res> {
  factory _$$StoryImplCopyWith(
          _$StoryImpl value, $Res Function(_$StoryImpl) then) =
      __$$StoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String photoUrl,
      DateTime createdAt,
      dynamic lat,
      dynamic lon});
}

/// @nodoc
class __$$StoryImplCopyWithImpl<$Res>
    extends _$StoryCopyWithImpl<$Res, _$StoryImpl>
    implements _$$StoryImplCopyWith<$Res> {
  __$$StoryImplCopyWithImpl(
      _$StoryImpl _value, $Res Function(_$StoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? photoUrl = null,
    Object? createdAt = null,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_$StoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryImpl implements _Story {
  const _$StoryImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.photoUrl,
      required this.createdAt,
      required this.lat,
      required this.lon});

  factory _$StoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String photoUrl;
  @override
  final DateTime createdAt;
  @override
  final dynamic lat;
  @override
  final dynamic lon;

  @override
  String toString() {
    return 'Story(id: $id, name: $name, description: $description, photoUrl: $photoUrl, createdAt: $createdAt, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.lon, lon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      photoUrl,
      createdAt,
      const DeepCollectionEquality().hash(lat),
      const DeepCollectionEquality().hash(lon));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryImplCopyWith<_$StoryImpl> get copyWith =>
      __$$StoryImplCopyWithImpl<_$StoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryImplToJson(
      this,
    );
  }
}

abstract class _Story implements Story {
  const factory _Story(
      {required final String id,
      required final String name,
      required final String description,
      required final String photoUrl,
      required final DateTime createdAt,
      required final dynamic lat,
      required final dynamic lon}) = _$StoryImpl;

  factory _Story.fromJson(Map<String, dynamic> json) = _$StoryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get photoUrl;
  @override
  DateTime get createdAt;
  @override
  dynamic get lat;
  @override
  dynamic get lon;
  @override
  @JsonKey(ignore: true)
  _$$StoryImplCopyWith<_$StoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
