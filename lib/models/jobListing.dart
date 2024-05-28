class JobListing {
  final String title;
  final String company;
  final double? salary;
  final String? city;
  final String country;
  final List<String> type;
  final String imageUrl;
  final String description;
  final String qualification;
  final String companyInfo;

  JobListing({
    required this.title,
    required this.company,
    this.salary,
    this.city,
    required this.country,
    required this.type,
    required this.imageUrl,
    required this.description,
    required this.qualification,
    required this.companyInfo,
  });

  // Method to convert a JobListing to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'company': company,
      'salary': salary,
      'city': city,
      'country': country,
      'type': type,
      'imageUrl': imageUrl,
      'description': description,
      'qualification': qualification,
      'companyInfo': companyInfo,
    };
  }

  // Method to create a JobListing from JSON
  factory JobListing.fromJson(Map<String, dynamic> json) {
    return JobListing(
      title: json['title'],
      company: json['company'],
      salary: json['salary'],
      city: json['city'],
      country: json['country'],
      type: List<String>.from(json['type']),
      imageUrl: json['imageUrl'],
      description: json['description'],
      qualification: json['qualification'],
      companyInfo: json['companyInfo'],
    );
  }
}

List<JobListing> jobsList = [
  JobListing(
    title: 'Equity Research Intern',
    company: 'Bridge Placements',
    salary: 80000,
    city: null,
    country: 'Pakistan',
    type: ['On-Site', 'Junior', 'Fulltime'],
    companyInfo: '''
      Bridge Placements is renowned for connecting emerging talents with premiere firms. We are proud to partner with Shah Equity, a distinguished family-owned investment firm specializing in small business acquisitions and commercial real estate. Operating with a robust 16 Million AUM from Dallas, Texas, Shah Equity is on the lookout for an Equity Research Intern who is eager to delve into the intricacies of investment analysis.
    ''',
    imageUrl:
        'https://static.vecteezy.com/system/resources/thumbnails/006/416/587/small_2x/modern-bridge-logo-design-vector.jpg',
    description: '''
      Analyze businesses and investment opportunities using financial formulas to identify promising deals.
      Engage with business owners and brokers to gather comprehensive market insights.
      Assist in underwriting deals and crafting detailed business documents.
      Support administrative tasks and the investment team with various responsibilities, enhancing the firm's operational efficiency.
      Contribute to creating lists, data scraping, and other essential tasks aligned with investment analysis.
      Additional Responsibilities:Gain hands-on experience in running financial models and investment valuation.
      Participate in investment strategy sessions and learn directly from seasoned professionals in the field.
    ''',
    qualification: '''
      Pursuing or recently completed a degree in Finance, Economics, or a related field with a keen interest in investment analysis and private equity.
      Previous experience or internship in investment analysis or a related field is highly advantageous.
      Exceptional proficiency in English, both written and spoken, with an emphasis on clarity and professionalism in communication.
      Demonstrated ability to swiftly and accurately create and manage business documents and reports.
      A proactive approach to learning, with the capacity to manage a variety of tasks effectively in a remote work environment.
    ''',
  ),
  JobListing(
    title: 'Sales Intern',
    company: 'LONGi Solar',
    salary: 20000,
    city: 'Peshawar',
    country: 'Pakistan',
    type: ['Internship', 'Remote', '2 months'],
    imageUrl:
        'https://media-exp1.licdn.com/dms/image/C4E0BAQHsSQxHIzHzQQ/company-logo_200_200/0/1611888713007?e=2159024400&v=beta&t=AskzTnE321sf4XXe6xg8DUezFmyoeO-s41dybqHDYBg',
    description: '''
      Research and identify all the solar businesses in the city and nearby cities - including new markets, growth areas, PV panels trends, End- Customers, B2B partnerships, Solar Panels requirements.
      Develop and maintain strong relationships with prospective and existing clients.
      Understand the needs of EPC companies/ End- Users and introduce LONGi Products that meet their objectives.
      Collaborate with the marketing team to develop strategies for lead generation and conversion.
      Prepare and deliver presentations and quotes to prospective clients.
      Negotiate and close deals to achieve sales.
      Monitor and analyze sales and market trends to identify opportunities for growth.
      Stay up-to-date with industry trends and market competition.
    ''',
    qualification: '''
      Marketing and related majors. good communication skills, sales skills, teamwork spirit, customer relationship management capabilities, and the ability to complete sales targets and prepare sales reports, etc.
      Those who can speak Chinese will be given priority.
    ''',
    companyInfo: '''
      LONGi Group is a vertically integrated solar market leader. It is one of the world’s largest monocrystalline solar materials manufacturers. The company’s technology position and financial health are highly regarded in the industry. We are currently expanding our teams and we are looking for cornerstone talent to join our company.
    ''',
  ),
  JobListing(
    title: 'UI Designer',
    company: 'Creative Minds',
    salary: 15000,
    city: 'Karachi',
    country: 'Pakistan',
    type: ['Junior Level', 'On-Site', 'Full-Day'],
    imageUrl: 'https://logopond.com/logos/8c8ae172cf0b9181768c5c0c5499277c.png',
    description: '''
      Collaborate with the design team to create user-friendly interfaces.
      Design wireframes, prototypes, and high-fidelity visuals.
      Ensure consistency and alignment with brand guidelines.
      Participate in user testing and iterate on designs based on feedback.
      Communicate design ideas effectively to developers and stakeholders.
    ''',
    qualification: '''
      Bachelor's degree in Design, Fine Arts, or related field.
      Proficiency in design tools like Figma, Sketch, and Adobe XD.
      Strong portfolio showcasing UI design skills.
      Basic understanding of HTML/CSS is a plus.
    ''',
    companyInfo: '''
      Creative Minds is a leading design agency that specializes in crafting unique digital experiences. Our team is composed of creative professionals dedicated to pushing the boundaries of design. We believe in fostering a collaborative and inclusive environment where ideas can flourish and creativity knows no bounds. Our projects span various industries, and we take pride in delivering innovative solutions that resonate with audiences globally. With a commitment to excellence, we continuously strive to exceed our clients' expectations and set new standards in the design industry.
    ''',
  ),
  JobListing(
    title: 'React Developer',
    company: 'Tech Innovators',
    salary: 20000,
    city: 'Lahore',
    country: 'Pakistan',
    type: ['Beginner', 'Remote', '4/5 hours daily'],
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkK3q-joQ1QF39s9KeajFNNV6QVQy8tPu_oiiNBLBJSA&s',
    description: '''
      Develop and maintain web applications using React.
      Collaborate with the development team to design and implement new features.
      Optimize components for maximum performance across a vast array of web-capable devices and browsers.
      Debug and troubleshoot issues in a timely manner.
      Participate in code reviews to maintain code quality.
    ''',
    qualification: '''
      Bachelor's degree in Computer Science or related field.
      Knowledge of JavaScript, React, and related technologies.
      Familiarity with RESTful APIs and modern front-end build pipelines and tools.
      Strong problem-solving skills and attention to detail.
    ''',
    companyInfo: '''
      Tech Innovators is a forward-thinking technology firm dedicated to developing cutting-edge software solutions. We value innovation, collaboration, and a passion for technology. Our team is comprised of skilled professionals who are experts in their fields, and we prioritize continuous learning and development. We provide a dynamic work environment where creativity and technical expertise thrive. Our mission is to leverage technology to create solutions that drive business success and transform industries. We are committed to making a positive impact through our work and contributing to the advancement of the tech community.
    ''',
  ),
  JobListing(
    title: 'Researcher',
    company: 'Knowledge Hub',
    salary: 18000,
    city: 'Hyderabad',
    country: 'Pakistan',
    type: ['Entry Level', 'On-Site', 'Part-Time'],
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0D0QPy_qt2A6szvz1VNWVMbo56tGv_iDNjBVCtGqyxw&s',
    description: '''
      Conduct thorough research on various topics as per project requirements.
      Analyze data and compile findings into comprehensive reports.
      Stay updated with the latest trends and developments in the research field.
      Present findings in a clear and concise manner to team members and stakeholders.
      Assist in the development of research methodologies and tools.
    ''',
    qualification: '''
      Bachelor's degree in any discipline with strong research skills.
      Proficient in using online research tools and databases.
      Excellent written and verbal communication skills.
      Ability to work independently and manage time effectively.
    ''',
    companyInfo: '''
      Knowledge Hub is a research-oriented organization that provides in-depth insights and analysis on a variety of subjects. Our mission is to empower businesses with the information they need to succeed. We pride ourselves on our rigorous research methodologies and our ability to deliver actionable intelligence. Our team of experienced researchers is dedicated to uncovering the truth and providing accurate, unbiased information. We serve a diverse clientele, ranging from small businesses to large corporations, and our insights help them navigate complex market landscapes and make informed decisions.
    ''',
  ),
  JobListing(
    title: 'Content Writer',
    company: 'Wordsmiths',
    salary: 16000,
    city: 'Lahore',
    country: 'Pakistan',
    type: ['Entry Level', 'On-Site', 'Part-Time'],
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCdJC_OfNrLdwFXCeR3-Aq-PRDG6HJVE0iLF2OiUuY9A&s',
    description: '''
      Create compelling and engaging content for blogs, articles, social media, and websites.
      Conduct research to ensure accuracy and depth of content.
      Collaborate with the marketing team to align content with company goals.
      Edit and proofread content to ensure it meets high-quality standards.
      Stay up-to-date with industry trends to generate fresh ideas.
    ''',
    qualification: '''
      Bachelor's degree in English, Journalism, Communications, or related field.
      Proven experience as a content writer or similar role.
      Excellent writing, editing, and proofreading skills.
      Familiarity with SEO best practices.
      Strong research skills and attention to detail.
    ''',
    companyInfo: '''
      Wordsmiths Co. is a content creation agency specializing in high-quality written content for various platforms. Our team is passionate about storytelling and delivering impactful messages. We believe in the power of words to inspire, inform, and engage audiences. Our writers are skilled in crafting content that not only meets but exceeds client expectations. We work with a wide range of clients, from startups to established brands, helping them convey their message effectively. At Wordsmiths Co., we are committed to maintaining the highest standards of quality and creativity in everything we do.
    ''',
  ),
  JobListing(
    title: 'Graphic Designer',
    company: 'Design Hub',
    salary: 17000,
    city: 'Lahore',
    country: 'Pakistan',
    type: ['Entry Level', 'Remote', 'Part-Time'],
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqSbWacNA7VxDKaQU3Yy5yuSKCPBcyk1YjFOiWD_QyUw&s',
    description: '''
      Create visually appealing graphics for digital and print media.
      Develop design concepts, graphics, and layouts in line with branding guidelines.
      Work closely with the marketing team to produce content for social media and advertising campaigns.
      Edit and enhance images to meet project requirements.
      Stay updated with the latest design trends and tools.
    ''',
    qualification: '''
      Bachelor's degree in Graphic Design or related field.
      Proficiency in design software such as Adobe Photoshop, Illustrator, and InDesign.
      Strong portfolio showcasing design skills and creativity.
      Good communication and time-management skills.
      Attention to detail and ability to work on multiple projects simultaneously.
    ''',
    companyInfo: '''
      Design Hub is a creative agency offering comprehensive design solutions. We strive to bring ideas to life through innovative and impactful visual content. Our team consists of talented designers who are passionate about art and design. We work closely with our clients to understand their vision and bring it to reality through visually stunning and effective designs. From branding to digital marketing, we cover all aspects of design to help businesses stand out in the competitive market. Our commitment to excellence and creativity sets us apart as a leading design agency.
    ''',
  ),
  JobListing(
    title: 'Online Tutor',
    company: 'EduConnect',
    salary: 10000,
    city: 'Lahore',
    country: 'Pakistan',
    type: ['Beginner', 'Remote', 'Part-Time'],
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpKxE6Dxa9Bk-zw6onkV4-9SZ7t4M6UdbFaWnrEFqKrg&s',
    description: '''
      Provide tutoring services to students in your area of expertise.
      Create lesson plans and learning materials tailored to individual student needs.
      Conduct online sessions using video conferencing tools.
      Assess student progress and provide feedback to improve learning outcomes.
      Flexible hours to accommodate your schedule.
    ''',
    qualification: '''
      Strong knowledge in a specific subject area (e.g., Math, English, Science).
      Good communication and interpersonal skills.
      Ability to explain concepts clearly and effectively.
      Prior tutoring experience is a plus but not required.
      Reliable internet connection and computer/laptop.
    ''',
    companyInfo: '''
      EduConnect is an online learning platform that connects students with qualified tutors for personalized learning experiences. We believe in the power of education to transform lives and are dedicated to providing accessible and affordable learning solutions. Our platform offers a range of subjects and topics to cater to diverse learning needs. Whether you're a student looking for extra help or a tutor seeking opportunities to share your expertise, EduConnect is here to support you every step of the way.
    ''',
  ),
  JobListing(
    title: 'Freelance Writer',
    company: 'WordSmiths',
    salary: 8000,
    city: 'Karachi',
    country: 'Pakistan',
    type: ['Beginner', 'Remote', 'Part-Time'],
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCdJC_OfNrLdwFXCeR3-Aq-PRDG6HJVE0iLF2OiUuY9A&s',
    description: '''
      Write articles, blog posts, and website content on a variety of topics.
      Research and gather information to create engaging and informative content.
      Follow editorial guidelines and client specifications.
      Submit completed work within specified deadlines.
      Flexible hours to work around your schedule.
    ''',
    qualification: '''
      Strong writing skills with attention to grammar and punctuation.
      Ability to conduct research and write original content.
      Basic knowledge of SEO principles is a plus but not required.
      Reliable internet connection and computer/laptop.
      Prior writing experience is not necessary; beginners are welcome.
    ''',
    companyInfo: '''
      WordSmiths is a content creation agency specializing in providing high-quality written content for businesses and individuals. We work with a network of freelance writers to produce compelling and engaging content across various platforms. Whether you're a seasoned writer or just starting out, WordSmiths offers opportunities to hone your craft and build your portfolio. Join our team and become part of a community dedicated to creating impactful content that resonates with audiences worldwide.
    ''',
  ),
  JobListing(
    title: 'Social Media Manager',
    company: 'SocialSavvy',
    salary: 12000,
    city: 'Islamabad',
    country: 'Pakistan',
    type: ['Beginner', 'Remote', 'Part-Time'],
    imageUrl:
        'https://th.bing.com/th/id/OIP.J3Z7FV3_2Q2B_1zgmntOEQHaHa?rs=1&pid=ImgDetMain',
    description: '''
      Manage social media accounts for small businesses and individuals.
      Create and schedule posts across various platforms (e.g., Facebook, Instagram, Twitter).
      Engage with followers and respond to comments/messages.
      Monitor analytics to track performance and optimize strategies.
      Flexible hours to fit your schedule.
    ''',
    qualification: '''
      Familiarity with social media platforms and trends.
      Good communication and customer service skills.
      Ability to create engaging content and captions.
      Basic knowledge of social media analytics is a plus but not required.
      Reliable internet connection and computer/laptop.
    ''',
    companyInfo: '''
      SocialSavvy is a social media management agency that helps businesses and individuals establish and grow their online presence. We understand the importance of social media in today's digital landscape and are dedicated to helping our clients succeed. Our team of social media managers works closely with clients to develop tailored strategies and content that resonate with their target audiences. Whether you're a social media enthusiast looking to turn your passion into a side hustle or someone with basic skills seeking opportunities to learn and grow, SocialSavvy welcomes you to join our team.
    ''',
  ),
  JobListing(
    title: 'Frontend Developer Intern',
    company: 'CodeCrafters',
    salary: 10000,
    city: 'Islamabad',
    country: 'Pakistan',
    type: ['Internship', 'Remote', 'Part-Time'],
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQp-HbD7SMynjxZzoqFEVpLGuPnLZwvNkJ0Mhz8XfNK_Q&s',
    description: '''
      Assist in the development and maintenance of web applications.
      Work with the design team to implement user interfaces and features.
      Write clean, efficient, and maintainable code using HTML, CSS, and JavaScript.
      Collaborate with backend developers to integrate frontend components.
      Gain hands-on experience in frontend development best practices.
    ''',
    qualification: '''
      Basic knowledge of HTML, CSS, and JavaScript.
      Familiarity with frontend frameworks such as React or Vue.js is a plus but not required.
      Eagerness to learn and grow as a frontend developer.
      Good communication and teamwork skills.
      Pursuing or recently completed a degree in Computer Science or related field.
    ''',
    companyInfo: '''
      CodeCrafters is a software development company that specializes in creating innovative solutions for clients worldwide. We believe in nurturing talent and providing opportunities for growth. Our internship program offers students the chance to gain practical experience in a real-world development environment. Whether you're a beginner looking to kickstart your career or a student eager to expand your skills, CodeCrafters welcomes you to join our team and embark on an exciting journey in tech.
    ''',
  ),
  JobListing(
    title: 'IT Support Technician',
    company: 'TechAssist',
    salary: 8000,
    city: 'Lahore',
    country: 'Pakistan',
    type: ['Entry Level', 'On-Site', 'Part-Time'],
    imageUrl:
        'https://lh3.googleusercontent.com/v1exHpjQWwM-KHVUoy85qa-PnzJBd0RyJAC2onudG13gBj_d8G8eMgDkrjBzVRCuDC9WTFIVzXvtfkutssP4GUgD1w=w640-h400-e365-rj-sc0x00ffffff',
    description: '''
      Provide technical assistance and support to end-users.
      Troubleshoot hardware and software issues on desktops, laptops, and mobile devices.
      Install, configure, and maintain computer systems and peripherals.
      Assist in network troubleshooting and maintenance tasks.
      Document and track support tickets to ensure timely resolution.
    ''',
    qualification: '''
      Basic understanding of computer hardware and software.
      Strong problem-solving and troubleshooting skills.
      Good communication and customer service skills.
      Ability to work independently and as part of a team.
      Pursuing or recently completed a degree in IT or related field.
    ''',
    companyInfo: '''
      TechAssist is an IT services company that provides comprehensive support solutions to businesses and individuals. We pride ourselves on delivering reliable and efficient technical assistance to our clients. As an IT Support Technician, you'll have the opportunity to gain hands-on experience in troubleshooting and problem-solving while working alongside experienced professionals. Whether you're a student looking to gain practical skills or an entry-level professional seeking opportunities to grow, TechAssist welcomes you to join our team and become part of our mission to provide top-notch IT support.
    ''',
  ),
  JobListing(
    title: 'Junior Data Analyst',
    company: 'DataWorks',
    salary: 9000,
    city: 'Karachi',
    country: 'Pakistan',
    type: ['Beginner', 'Remote', 'Part-Time'],
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfEFJxirt2-ojNs138EJb0ZNDhrbe8Qj4Rd_R9o1Hbog&s',
    description: '''
      Assist in collecting, analyzing, and interpreting data sets.
      Create visualizations and reports to communicate insights.
      Clean and preprocess data to ensure accuracy and consistency.
      Collaborate with senior analysts to perform ad hoc analysis and research.
      Gain exposure to data analysis tools and techniques.
    ''',
    qualification: '''
      Basic knowledge of data analysis concepts and techniques.
      Proficiency in Excel or Google Sheets.
      Familiarity with data visualization tools such as Tableau or Power BI is a plus but not required.
      Analytical mindset with attention to detail.
      Pursuing or recently completed a degree in Statistics, Mathematics, Computer Science, or related field.
    ''',
    companyInfo: '''
      DataWorks is a data analytics firm that helps businesses make informed decisions through data-driven insights. We're passionate about empowering our clients with the information they need to succeed. As a Junior Data Analyst, you'll have the opportunity to learn from experienced professionals and gain practical skills in data analysis. Whether you're a student eager to explore the world of data or a beginner looking to kickstart your career, DataWorks welcomes you to join our team and embark on a rewarding journey in data analytics.
    ''',
  ),
];
