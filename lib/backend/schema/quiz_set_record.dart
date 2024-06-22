import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizSetRecord extends FirestoreRecord {
  QuizSetRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "quiz_name" field.
  String? _quizName;
  String get quizName => _quizName ?? '';
  bool hasQuizName() => _quizName != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "total_questions" field.
  int? _totalQuestions;
  int get totalQuestions => _totalQuestions ?? 0;
  bool hasTotalQuestions() => _totalQuestions != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "cover_photo" field.
  String? _coverPhoto;
  String get coverPhoto => _coverPhoto ?? '';
  bool hasCoverPhoto() => _coverPhoto != null;

  // "is_show" field.
  bool? _isShow;
  bool get isShow => _isShow ?? false;
  bool hasIsShow() => _isShow != null;

  // "is_neco" field.
  bool? _isNeco;
  bool get isNeco => _isNeco ?? false;
  bool hasIsNeco() => _isNeco != null;

  // "categories" field.
  String? _categories;
  String get categories => _categories ?? '';
  bool hasCategories() => _categories != null;

  // "sub_categories" field.
  String? _subCategories;
  String get subCategories => _subCategories ?? '';
  bool hasSubCategories() => _subCategories != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  void _initializeFields() {
    _quizName = snapshotData['quiz_name'] as String?;
    _duration = castToType<int>(snapshotData['duration']);
    _totalQuestions = castToType<int>(snapshotData['total_questions']);
    _description = snapshotData['description'] as String?;
    _coverPhoto = snapshotData['cover_photo'] as String?;
    _isShow = snapshotData['is_show'] as bool?;
    _isNeco = snapshotData['is_neco'] as bool?;
    _categories = snapshotData['categories'] as String?;
    _subCategories = snapshotData['sub_categories'] as String?;
    _createdDate = snapshotData['created_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quizSet');

  static Stream<QuizSetRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizSetRecord.fromSnapshot(s));

  static Future<QuizSetRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizSetRecord.fromSnapshot(s));

  static QuizSetRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizSetRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizSetRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizSetRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizSetRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizSetRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizSetRecordData({
  String? quizName,
  int? duration,
  int? totalQuestions,
  String? description,
  String? coverPhoto,
  bool? isShow,
  bool? isNeco,
  String? categories,
  String? subCategories,
  DateTime? createdDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quiz_name': quizName,
      'duration': duration,
      'total_questions': totalQuestions,
      'description': description,
      'cover_photo': coverPhoto,
      'is_show': isShow,
      'is_neco': isNeco,
      'categories': categories,
      'sub_categories': subCategories,
      'created_date': createdDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizSetRecordDocumentEquality implements Equality<QuizSetRecord> {
  const QuizSetRecordDocumentEquality();

  @override
  bool equals(QuizSetRecord? e1, QuizSetRecord? e2) {
    return e1?.quizName == e2?.quizName &&
        e1?.duration == e2?.duration &&
        e1?.totalQuestions == e2?.totalQuestions &&
        e1?.description == e2?.description &&
        e1?.coverPhoto == e2?.coverPhoto &&
        e1?.isShow == e2?.isShow &&
        e1?.isNeco == e2?.isNeco &&
        e1?.categories == e2?.categories &&
        e1?.subCategories == e2?.subCategories &&
        e1?.createdDate == e2?.createdDate;
  }

  @override
  int hash(QuizSetRecord? e) => const ListEquality().hash([
        e?.quizName,
        e?.duration,
        e?.totalQuestions,
        e?.description,
        e?.coverPhoto,
        e?.isShow,
        e?.isNeco,
        e?.categories,
        e?.subCategories,
        e?.createdDate
      ]);

  @override
  bool isValidKey(Object? o) => o is QuizSetRecord;
}
