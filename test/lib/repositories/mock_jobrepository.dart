import 'package:pocketjob/models/jobListing.dart';

class JobsRepository {
  // Predefined list of JobListing objects
  final List<JobListing> jobsList = [
    JobListing(
      id: '1',
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
      id: '1',
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
      id: '1',
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
  ];

  Stream<List<JobListing>> getJobsStream() async* {
    
    yield jobsList;
  }
}
