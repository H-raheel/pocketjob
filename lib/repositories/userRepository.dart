import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/models/users.dart';

class userRepository {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('Users');
  final CollectionReference jobs =
      FirebaseFirestore.instance.collection('Jobs');

  Future<void> createUser(UserModel user) async {
    try {
      final DocumentSnapshot userSnapshot = await users.doc(user.userId).get();
      if (!userSnapshot.exists)
        await users.doc(user.userId).set(user.toJson());
      else {
        print("user alreDY exists");
      }
    } catch (e) {
      print("data wasnt entered");
      print(e.toString());
    }
  }

  Future<UserModel?> getUser(String userId) async {
    try {
      final DocumentSnapshot userSnapshot = await users.doc(userId).get();
      if (userSnapshot.exists) {
        return UserModel.fromJson(userSnapshot.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> saveJobToUser(String userId, String jobId) async {
    final userRef = users.doc(userId);

    try {
      final userDoc = await userRef.get();
      if (!userDoc.exists) {
        throw Exception('User not found');
      }

      final userData = userDoc.data() as Map<String, dynamic>;
      final savedJobs = List<String>.from(userData['savedJobs'] ?? []);

      if (savedJobs.contains(jobId)) {
        // Job already saved, remove it
        await userRef.update({
          'savedJobs': FieldValue.arrayRemove([jobId])
        });
        print("remm");
      } else {
        // Job not saved, add it
        await userRef.update({
          'savedJobs': FieldValue.arrayUnion([jobId])
        });
      }
    } catch (e) {
      throw Exception('Failed to update saved jobs: $e');
    }
  }

  Future<List<String>> getSavedJobs(String userId) async {
    try {
      DocumentSnapshot userDoc = await users.doc(userId).get();

      if (userDoc.exists && userDoc.data() != null) {
        List<dynamic> dynamicList = userDoc.get('savedJobs');

        List<String> savedJobs = dynamicList.cast<String>();

        print("heree");
        print(savedJobs);
        return savedJobs;
      } else {
        return <String>[];
      }
    } catch (e) {
      print('Error getting saved jobs: $e');
      return [];
    }
  }

  Stream<List<JobListing>> getAppliedJobsStream(String userId) async* {
    final userRef = users.doc(userId);
    final userDoc = await userRef.get();
    if (!userDoc.exists) {
      yield [];
      return;
    }

    final userData = userDoc.data() as Map<String, dynamic>;
    final appliedJobsIds = List<String>.from(userData['appliedJobs'] ?? []);

    if (appliedJobsIds.isEmpty) {
      yield [];
    } else {
      yield* jobs
          .where(FieldPath.documentId, whereIn: appliedJobsIds)
          .snapshots()
          .map((querySnapshot) {
        return querySnapshot.docs.map((doc) {
          final jobData = doc.data() as Map<String, dynamic>;
          return JobListing.fromJson({...jobData, 'id': doc.id});
        }).toList();
      });
    }
  }

  Future<List<String>> getAppliedJobs(String userId) async {
    try {
      DocumentSnapshot userDoc = await users.doc(userId).get();

      if (userDoc.exists && userDoc.data() != null) {
        List<dynamic> dynamicList = userDoc.get('appliedJobs');

        List<String> appliedJobs = dynamicList.cast<String>();

        return appliedJobs;
      } else {
        return <String>[];
      }
    } catch (e) {
      print('Error getting applied jobs: $e');
      return [];
    }
  }

  Future<void> saveAppliedJobToUser(String userId, String jobId) async {
    final userRef = users.doc(userId);

    try {
      final userDoc = await userRef.get();
      if (!userDoc.exists) {
        throw Exception('User not found');
      }

      final userData = userDoc.data() as Map<String, dynamic>;
      final appliedJobs = List<String>.from(userData['appliedJobs'] ?? []);

      if (!appliedJobs.contains(jobId)) {
        await userRef.update({
          'appliedJobs': FieldValue.arrayUnion([jobId])
        });
      }
    } catch (e) {
      throw Exception('Failed to update applied jobs: $e');
    }
  }

  Future<void> sendSavedJobsToUser(String userId, List<String> jobIds) async {
    final userRef = users.doc(userId);

    try {
      final userDoc = await userRef.get();
      if (!userDoc.exists) {
        throw Exception('User not found');
      }

      final userData = userDoc.data() as Map<String, dynamic>;
      final savedJobs = List<String>.from(userData['savedJobs'] ?? []);

      // Add new job IDs to the list of saved jobs
      for (final jobId in jobIds) {
        if (!savedJobs.contains(jobId)) {
          savedJobs.add(jobId);
        }
      }

      // Update the user document with the updated list of saved jobs
      await userRef.update({
        'savedJobs': savedJobs,
      });
    } catch (e) {
      throw Exception('Failed to update saved jobs: $e');
    }
  }

  Future<void> UpdateUser(UserModel user) async {
    try {
      await users.doc(user.userId).update(user.toJson());
      print("User updated successfully");
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }
}
