class JobListing {
  final String title;
  final String company;
  final double? salary;
  final String? city;
  final String country;
  final List<String> type;
  final String image_url;
  final String description;
  final String qualification;
  final String companyInfo;

  JobListing({
    required this.title,
    required this.company,
    required this.salary,
    required this.city,
    required this.country,
    required this.type,
    required this.image_url,
    required this.description,
    required this.qualification,
    required this.companyInfo,
  });
}

List<JobListing> jobsList = [
  JobListing(
      title: "Summer Intern- Data Analyst",
      company: "APL Logistics",
      city: " Chicago",
      country: "US",
      salary: null,
      image_url:
          'https://supplychainasia.org/wp-content/uploads/2016/08/apl-logistics11.jpg',
      type: ["Remote"],
      companyInfo: '',
      description:
          '''This position is responsible for, but not limited to, the following:
Respond to analytics service requests, change requests and enhancement requests. 
Efficiently support analytical projects for top customers and handle the communication with customers and operations analyst. 
Identify root causes for some reoccurring issues in SQL models, Excel models, Data models and document standard operating procedures to resolve these issues on-time.
Deliver visualizations via dashboards and outputting reports for end user consumption. 
Develop and implement efficient Data Analytics projects, including data collection, storing and analyzing data through data mining, process analysis, performance benchmarking and descriptive analytics.
Apply advanced data analytics and data modeling techniques. Tools usually include Tableau, Dataiku, Python, and R''',
      qualification:
          "Bachelor’s Degree in Engineering or Data Analytics, Computer Science, or related field. Experience working in IT or analytics team.Experience with analytical tools – MS Excel, Dataiku, Tableau, SQL, Azure, and Database Framework.Experience supporting multiple customer accounts, handling customer issues and communicating the root causes and resolution.Inquisitiveness and determination to learn new tools and concepts of data science and data modeling.Analytical mindset with focus on providing quantitative models and analysis.Prefer candidate with some educational specialization or work experience in analytics space. Able to travel up to 10%."),
  JobListing(
    title: 'Equity Research Intern',
    company: 'Bridge Placements',
    salary: 80000,
    city: null,
    country: 'Pakistan',
    type: ['Remote', 'Fulltime'],
    companyInfo:
        'Bridge Placements is renowned for connecting emerging talents with premiere firms. We are proud to partner with Shah Equity, a distinguished family-owned investment firm specializing in small business acquisitions and commercial real estate. Operating with a robust 16 Million AUM from Dallas, Texas, Shah Equity is on the lookout for an Equity Research Intern who is eager to delve into the intricacies of investment analysis.',
    image_url:
        'https://static.vecteezy.com/system/resources/thumbnails/006/416/587/small_2x/modern-bridge-logo-design-vector.jpg',
    description:
        ''' Analyze businesses and investment opportunities using financial formulas to identify promising deals.
Engage with business owners and brokers to gather comprehensive market insights.
Assist in underwriting deals and crafting detailed business documents.
Support administrative tasks and the investment team with various responsibilities, enhancing the firm's operational efficiency.
Contribute to creating lists, data scraping, and other essential tasks aligned with investment analysis.
Additional Responsibilities:Gain hands-on experience in running financial models and investment valuation.
Participate in investment strategy sessions and learn directly from seasoned professionals in the field.''',
    qualification:
        '''Pursuing or recently completed a degree in Finance, Economics, or a related field with a keen interest in investment analysis and private equity.
Previous experience or internship in investment analysis or a related field is highly advantageous.
Exceptional proficiency in English, both written and spoken, with an emphasis on clarity and professionalism in communication.
Demonstrated ability to swiftly and accurately create and manage business documents and reports.
A proactive approach to learning, with the capacity to manage a variety of tasks effectively in a remote work environment.''',
  ),
  JobListing(
      title: 'Sales Intern',
      company: 'LONGi Solar ',
      salary: 20000,
      city: 'Peshawar',
      country: 'Pakistan',
      type: ['Contract', 'Remote', 'Internship'],
      image_url:
          'https://media-exp1.licdn.com/dms/image/C4E0BAQHsSQxHIzHzQQ/company-logo_200_200/0/1611888713007?e=2159024400&v=beta&t=AskzTnE321sf4XXe6xg8DUezFmyoeO-s41dybqHDYBg',
      description:
          '''Research and identify all the solar businesses in the city and nearby cities - including new markets, growth areas, PV panels trends, End- Customers, B2B partnerships, Solar Panels requirements.
Develop and maintain strong relationships with prospective and existing clients.
Understand the needs of EPC companies/ End- Users and intorduce LONGi Products that meet their objectives.
Collaborate with the marketing team to develop strategies for lead generation and conversion.
Prepare and deliver presentations and quote to prospective clients.
Negotiate and close deals to achieve sales.
Monitor and analyze sales and market trends to identify opportunities for growth.
Stay up-to-date with industry trends and market competition.''',
      qualification:
          '''Marketing and related majors. good communication skills, sales skills, teamwork spirit, customer relationship management capabilities, and the ability to complete sales targets and prepare sales reports, etc.
Those who can speak Chinese will be given priority''',
      companyInfo:
          'LONGi Group is a vertically integrated solar market leader. It is one of the world’s largest monocrystalline solar materials manufacturers. The company’s technology position and financial health are highly regarded in the industry. We are currently expanding our teams and we are looking for cornerstone talent to join our company'),
  JobListing(
    title: 'Equity Research Intern',
    company: 'Bridge Placements',
    salary: 80000,
    city: null,
    country: 'Pakistan',
    type: ['Remote', 'Fulltime'],
    companyInfo:
        'Bridge Placements is renowned for connecting emerging talents with premiere firms. We are proud to partner with Shah Equity, a distinguished family-owned investment firm specializing in small business acquisitions and commercial real estate. Operating with a robust 16 Million AUM from Dallas, Texas, Shah Equity is on the lookout for an Equity Research Intern who is eager to delve into the intricacies of investment analysis.',
    image_url:
        'https://static.vecteezy.com/system/resources/thumbnails/006/416/587/small_2x/modern-bridge-logo-design-vector.jpg',
    description:
        ''' Analyze businesses and investment opportunities using financial formulas to identify promising deals.
Engage with business owners and brokers to gather comprehensive market insights.
Assist in underwriting deals and crafting detailed business documents.
Support administrative tasks and the investment team with various responsibilities, enhancing the firm's operational efficiency.
Contribute to creating lists, data scraping, and other essential tasks aligned with investment analysis.
Additional Responsibilities:Gain hands-on experience in running financial models and investment valuation.
Participate in investment strategy sessions and learn directly from seasoned professionals in the field.''',
    qualification:
        '''Pursuing or recently completed a degree in Finance, Economics, or a related field with a keen interest in investment analysis and private equity.
Previous experience or internship in investment analysis or a related field is highly advantageous.
Exceptional proficiency in English, both written and spoken, with an emphasis on clarity and professionalism in communication.
Demonstrated ability to swiftly and accurately create and manage business documents and reports.
A proactive approach to learning, with the capacity to manage a variety of tasks effectively in a remote work environment.''',
  ),
];
