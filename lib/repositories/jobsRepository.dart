import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pocketjob/models/jobListing.dart';

class JobsRepository {
  final CollectionReference jobs =
      FirebaseFirestore.instance.collection('Jobs');

  Stream<List<JobListing>> getJobsStream() {
    print("loading");
    print(jobs.snapshots().map((querySnapshot) => querySnapshot.docs.map((doc) {
          Map<String, dynamic>? jobData = doc.data() as Map<String, dynamic>;
          return JobListing.fromJson({
            ...jobData,
          });
        }).toList()));
    return jobs
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs.map((doc) {
              Map<String, dynamic>? jobData =
                  doc.data() as Map<String, dynamic>;
              return JobListing.fromJson({...jobData, 'id': doc.id});
            }).toList());
  }
}
