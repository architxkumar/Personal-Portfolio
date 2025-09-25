import 'package:personal_portfolio/model/review.dart';
import 'package:personal_portfolio/model/work.dart';

const String appBarTitle = 'Archit Kumar';
const String heroTitle = 'Flutter Developer';
const String projectBlockTitle = 'Projects';
const String qualificationBlockTitle = 'Education';
const String reviewBlockTitle = 'Reviews from my teacher';
const List<String> projectTitles = [
  'HTML Only Portfolio',
  'Calculator App',
  'Quiz App',
  'Countdown Timer',
  'Product Upcoming Page',
];
const String workExperienceBlockTitle = 'Work Experience';
final List<WorkModel> workExperienceList = [
  WorkModel(
    'roadmap.sh',
    'Solved all the frontend projects',
    'https://roadmap.sh/u/architxkumar',
  ),
  WorkModel(
    'Open Source Work',
    'Update resource link for golang on roadmap.sh',
    'https://github.com/architxkumar',
  ),
];
const String profileButtonLabel = 'Vist my Profile';
const String snackBarErrorMessage = 'Could not launch URL';
const String qualificationDetail = 'Pursuing B.E from Panjab University';
const String coursesITookLabel = 'Courses I took';
const List<String> courseITookList = [
  'Data Structures and Algorithms',
  'Operating Systems',
  'Database Management Systems',
  'Computer Networks',
  'Object Oriented Programming using C++',
];

final List<Review> reviewList = [
      Review(
        reviewerName: 'Dr. Anita Sharma',
        reviewerDesignation: 'Professor, Computer Science, Panjab University',
        reviewText: 'Archit consistently demonstrates a strong grasp of complex concepts and applies them creatively in projects. His dedication and curiosity set him apart from his peers.',
      ),
      Review(
        reviewerName: 'Mr. Rajeev Mehta',
        reviewerDesignation: 'Lead Software Engineer, TechNova Solutions',
        reviewText: 'Archit\'s ability to quickly learn new technologies and contribute meaningfully to team discussions is impressive. He is proactive, reliable, and always eager to take on new challenges.',
      ),
      Review(
        reviewerName: 'Ms. Priya Verma',
        reviewerDesignation: 'Senior Developer, ABC Corp',
        reviewText: 'Archit is a team player with excellent problem-solving skills. His positive attitude and willingness to help others make him a valuable asset to any team.',
      ),
    ];
