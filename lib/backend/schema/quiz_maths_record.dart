import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizMathsRecord extends FirestoreRecord {
  QuizMathsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "quiz_set" field.
  DocumentReference? _quizSet;
  DocumentReference? get quizSet => _quizSet;
  bool hasQuizSet() => _quizSet != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _question = snapshotData['question'] as String?;
    _quizSet = snapshotData['quiz_set'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quiz_Maths');

  static Stream<QuizMathsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizMathsRecord.fromSnapshot(s));

  static Future<QuizMathsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizMathsRecord.fromSnapshot(s));

  static QuizMathsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizMathsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizMathsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizMathsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizMathsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizMathsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizMathsRecordData({
  int? id,
  String? question,
  DocumentReference? quizSet,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'question': question,
      'quiz_set': quizSet,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizMathsRecordDocumentEquality implements Equality<QuizMathsRecord> {
  const QuizMathsRecordDocumentEquality();

  @override
  bool equals(QuizMathsRecord? e1, QuizMathsRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.question == e2?.question &&
        e1?.quizSet == e2?.quizSet;
  }

  @override
  int hash(QuizMathsRecord? e) =>
      const ListEquality().hash([e?.id, e?.question, e?.quizSet]);

  @override
  bool isValidKey(Object? o) => o is QuizMathsRecord;
}
