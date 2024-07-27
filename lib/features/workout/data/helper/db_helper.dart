import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:track_me_updated/features/workout/data/models/workout_day_model.dart';
import 'package:track_me_updated/features/workout/data/models/workout_exercise_model.dart';
import 'package:track_me_updated/features/workout/data/models/workout_plan_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('trackme.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE workout_plans (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      type TEXT NOT NULL
    )
    ''');

    await db.execute('''
    CREATE TABLE workout_days (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      plan_id INTEGER NOT NULL,
      name TEXT NOT NULL,
      FOREIGN KEY (plan_id) REFERENCES workout_plans (id) ON DELETE CASCADE
    )
    ''');

    await db.execute('''
    CREATE TABLE workout_exercises (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      day_id INTEGER NOT NULL,
      exercise_name TEXT NOT NULL,
      body_part TEXT NOT NULL,
      target TEXT NOT NULL,
      secondary_muscles TEXT NOT NULL,
      equipment_needed TEXT NOT NULL,
      gif_url TEXT NOT NULL,
      instructions TEXT NOT NULL,
      FOREIGN KEY (day_id) REFERENCES workout_days (id) ON DELETE CASCADE
    )
    ''');

    await db.execute('''
    CREATE TABLE favorite_exercises (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      day TEXT NOT NULL,
      exercise_name TEXT NOT NULL,
      body_part TEXT NOT NULL,
      target TEXT NOT NULL,
      secondary_muscles TEXT NOT NULL,
      equipment_needed TEXT NOT NULL,
      gif_url TEXT NOT NULL,
      instructions TEXT NOT NULL
    )
    ''');

    await db.execute('''
    CREATE TABLE favorite_recipes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      readyIn TEXT NOT NULL,
      recipeID TEXT NOT NULL,
      image TEXT NOT NULL,
      serving TEXT NOT NULL,
      instructions TEXT NOT NULL,
      calories TEXT NOT NULL,
      fat TEXT NOT NULL,
      carbs TEXT NOT NULL,
      fiber TEXT NOT NULL,
      satFat TEXT NOT NULL,
      protein TEXT NOT NULL
    )
    ''');
    await db.execute('''
    CREATE TABLE target_nutrition (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      calories INTEGER NOT NULL,
      protein INTEGER NOT NULL,
      carbohydrates INTEGER NOT NULL,
      fat INTEGER NOT NULL,
      fiber INTEGER NOT NULL,
      iron INTEGER NOT NULL
    )
    ''');
    await db.insert('target_nutrition', {
      'calories': 0,
      'protein': 0,
      'carbohydrates': 0,
      'fat': 0,
      'fiber': 0,
      'iron': 0
    });
    await db.execute('''
    CREATE TABLE food_log (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      description Text NOT NULL,
      date TEXT NOT NULL,
      calories INTEGER NOT NULL,
      protein INTEGER NOT NULL,
      carbohydrates INTEGER NOT NULL,
      fat INTEGER NOT NULL,
      fiber INTEGER NOT NULL,
      iron INTEGER NOT NULL
    )
    ''');
  }

  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }

  // CRUD operations for WorkoutPlan
  Future<int> insertWorkoutPlan(WorkoutPlan plan) async {
    final db = await instance.database;
    return await db.insert('workout_plans', plan.toMap());
  }

  Future<List<WorkoutPlan>> getWorkoutPlans() async {
    final db = await instance.database;
    final result = await db.query('workout_plans');

    return result.map((map) => WorkoutPlan.fromMap(map)).toList();
  }

  Future<int> updateWorkoutPlan(WorkoutPlan plan) async {
    final db = await instance.database;
    return await db.update(
      'workout_plans',
      plan.toMap(),
      where: 'id = ?',
      whereArgs: [plan.id],
    );
  }

  Future<int> deleteWorkoutPlan(int id) async {
    final db = await instance.database;
    return await db.delete(
      'workout_plans',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // CRUD operations for WorkoutDay
  Future<int> insertWorkoutDay(WorkoutDay day) async {
    final db = await instance.database;
    return await db.insert('workout_days', day.toMap());
  }

  Future<List<WorkoutDay>> getWorkoutDays(int planId) async {
    final db = await instance.database;
    final result = await db.query(
      'workout_days',
      where: 'plan_id = ?',
      whereArgs: [planId],
    );

    return result.map((map) => WorkoutDay.fromMap(map)).toList();
  }

  Future<int> updateWorkoutDay(WorkoutDay day) async {
    final db = await instance.database;
    return await db.update(
      'workout_days',
      day.toMap(),
      where: 'id = ?',
      whereArgs: [day.id],
    );
  }

  Future<int> deleteWorkoutDay(int id) async {
    final db = await instance.database;
    return await db.delete(
      'workout_days',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // CRUD operations for WorkoutExercise
  Future<int> insertWorkoutExercise(WorkoutExercise exercise) async {
    final db = await instance.database;
    return await db.insert('workout_exercises', exercise.toMap());
  }

  Future<List<WorkoutExercise>> getWorkoutExercises(int dayId) async {
    final db = await instance.database;
    final result = await db.query(
      'workout_exercises',
      where: 'day_id = ?',
      whereArgs: [dayId],
    );

    return result.map((map) => WorkoutExercise.fromMap(map)).toList();
  }

  Future<int> updateWorkoutExercise(WorkoutExercise exercise) async {
    final db = await instance.database;
    return await db.update(
      'workout_exercises',
      exercise.toMap(),
      where: 'id = ?',
      whereArgs: [exercise.id],
    );
  }

  Future<int> deleteWorkoutExercise(int id) async {
    final db = await instance.database;
    return await db.delete(
      'workout_exercises',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
