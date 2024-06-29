<h1>PocketJob</h1>
<p><strong>PocketJob</strong> is a Flutter application designed to make job searching, viewing, applying, and uploading resumes effortless. With state management handled by <strong>Riverpod</strong> and <strong>Firebase</strong> as the backend database, PocketJob provides a smooth and user-friendly experience for job seekers.</p>
<hr>
<h2>Table of Contents</h2>
<ul>
  <li><a href="#features">Features</a></li>
  <li><a href="#technologies-used">Technologies Used</a></li>
  <li><a href="#getting-started">Getting Started</a>
    <ul>
      <li><a href="#prerequisites">Prerequisites</a></li>
      <li><a href="#installation">Installation</a></li>
    </ul>
  </li>
  <li><a href="#usage">Usage</a></li>

</ul>
<hr>
<h2 id="features">Features</h2>
<ul>
  <li><strong>Search for Jobs</strong>: Easily search for jobs based on various criteria such as job title, location, and more.</li>
  <li><strong>View Job Details</strong>: Get detailed information about job listings, including company information, job requirements, and application deadlines.</li>
  <li><strong>Apply for Jobs</strong>: Apply for jobs directly within the app, simplifying the job application process.</li>
  <li><strong>Upload Resume</strong>: Upload your resume to streamline job applications and save time during the application process.</li>
</ul>
<hr>
<h2 id="technologies-used">Technologies Used</h2>
<ul>
  <li><strong>Flutter</strong>: For building the mobile application.</li>
  <li><strong>Riverpod</strong>: For state management.</li>
  <li><strong>Firebase</strong>: As the backend database for storing and retrieving job data.</li>
</ul>
<hr>
<h2 id="getting-started">Getting Started</h2>
<h3 id="prerequisites">Prerequisites</h3>
<p>Before you begin, ensure you have the following installed:</p>
<ul>
  <li><strong>Flutter SDK</strong>: <a href="https://flutter.dev/docs/get-started/install" target="_blank">Install Flutter</a></li>
  <li><strong>Firebase account</strong>: <a href="https://firebase.google.com/" target="_blank">Create Firebase Account</a></li>
</ul>
<h3 id="installation">Installation</h3>
<h4>Clone the repository</h4>
<pre>
<code>
git clone https://github.com/your-username/pocketjob.git
cd pocketjob
</code>
</pre>
<h4>Install dependencies</h4>
<pre>
<code>
flutter pub get
</code>
</pre>
<h4>Set up Firebase</h4>
<ol>
  <li>Create a new Firebase project.</li>
  <li>Add an Android app to your Firebase project.</li>
  <li>Download the <code>google-services.json</code> file and place it in the <code>android/app</code> directory.</li>
  <li>If you are targeting iOS, add an iOS app to your Firebase project.</li>
  <li>Follow the instructions provided by Firebase to configure your app.</li>
</ol>
<h4>Run the app</h4>
<pre>
<code>
flutter run
</code>
</pre>
<hr>
<h2 id="usage">Usage</h2>
<ul>
  <li><strong>Search for Jobs</strong>: Enter your job search criteria and browse through the available job listings.</li>
  <li><strong>View Job Details</strong>: Click on a job listing to see detailed information.</li>
  <li><strong>Apply for Jobs</strong>: Click on the apply button and follow the prompts to submit your application.</li>
  <li><strong>Upload Resume</strong>: Click on the upload button and follow the instructions to upload your resume, making it available for quick application to multiple job listings.</li>
</ul>
