import 'package:flutter/material.dart';

class legal1 extends StatelessWidget {
  const legal1({super.key, required this.darkmode});
  final bool darkmode;
  @override
  Widget build(BuildContext context) {
    String a = """
homecare Platform Policy
Eligibility:

Account Security:
User Responsibility:
Users are responsible for maintaining the security of their accounts and passwords.
Prompt reporting of unauthorized access or suspicious activities to the homecare support team is mandatory.

Content Ownership:
User Content:
Users retain ownership of the content they post on homecare.
By posting content, users grant homecare a non-exclusive, royalty-free, worldwide license for platform operation and promotion.
Platform Changes and Availability:
Modification Rights:
homecare reserves the right to modify, suspend, or discontinue the platform or any features without prior notice.
Uninterrupted access is not guaranteed, and homecare is not liable for any loss or damages resulting from service interruptions.

Termination:
Account Termination:
homecare may terminate or suspend accounts for policy violations.
The platform reserves the right to terminate or suspend any account at its discretion without prior notice.
Disclaimer of Liability:
Content Accuracy:
homecare does not assume responsibility for the accuracy, reliability, or completeness of user-shared content.
Users are solely responsible for their interactions and actions based on the platform's information.

Indemnification:
User Agreement:
Users agree to indemnify and hold homecare, its affiliates, employees, and representatives harmless from any claims, damages, losses, or liabilities arising from platform use or policy violations.
Modifications to Terms and Conditions:
Policy Updates:
homecare reserves the right to modify or update these terms and conditions at any time.
Users will be notified of changes, and continued use of the platform indicates acceptance of updated terms and conditions.
Governing Law and Jurisdiction:
Legal Framework:
These terms and conditions are governed by the laws of Kenya.
Disputes are subject to the exclusive jurisdiction of the courts of Kenya.

Compliance:
User Commitment:
By using the homecare platform, users agree to comply with policies, community guidelines, and outlined terms and conditions.
Failure to adhere may result in account suspension or termination.


The homecare platform is designed to cater to the transportation needs of students from various educational institutions. To ensure a safe and secure environment, we have established eligibility criteria for users who wish to join and utilize our services.

Students from the following educational institutions are eligible to create an account and access the homecare platform:

Registered Schools:
Primary and secondary schools recognized by the relevant educational authorities.
Private and public schools operating within the specified geographic regions.
Universities and Colleges:
Accredited universities and colleges, both public and private.
Institutions offering undergraduate, graduate, and postgraduate programs.
Vocational and Technical Institutions:
Trade schools, vocational training centers, and technical colleges.
Institutions providing skills-based education and certification programs.
Online Learning Platforms:
Reputable online education providers and virtual learning platforms.
Institutions offering distance learning, e-learning, or online degree programs.
Continuing Education and Adult Learning Programs:
Institutions offering continuing education courses, professional development programs, or adult learning opportunities.
During the registration process, users must provide accurate and up-to-date information, including but not limited to:

Full name and contact details.
Proof of enrollment or affiliation with an eligible educational institution (e.g., student ID, enrollment letter, or other verifiable documentation).
Academic level or program of study.
Expected graduation or completion date.
homecare reserves the right to verify the provided information and request additional documentation if deemed necessary. Users found to have submitted false or misleading information may have their accounts suspended or terminated.

By ensuring that only eligible students from recognized educational institutions can access the platform, homecare aims to maintain a secure and dedicated environment tailored to the specific needs of the student community.

Product: Afya Homecare
Version: v1.0.0 (Viltrum 24.1)
Developed by: Kiprono Ngetich
Copyright: (c) 2024 Kiprono Ngetich
""";
    return Scaffold(
      backgroundColor: darkmode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "Policy",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Center(
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    a.toString(),
                    style: TextStyle(
                        color: darkmode ? Colors.white : Colors.black),
                  )))
        ],
      )),
    );
  }
}

class legal2 extends StatelessWidget {
  const legal2({super.key, required this.darkmode});
  final bool darkmode;
  @override
  Widget build(BuildContext context) {
    String a = """
homecare Platform Terms and Conditions
Welcome to homecare! Before using our platform, please carefully read and understand the following terms and conditions. By accessing or using homecare, you agree to comply with these terms.

Eligibility:
User Qualifications:
Users must be students from schools registered with homecare.
Accurate and up-to-date information must be provided during the registration process.
Account Security:
User Responsibilities:
Users are responsible for maintaining the security of their accounts and passwords.
Promptly report any unauthorized access or suspicious activities to the homecare support team.
Content Ownership:
User-Generated Content:
Users retain ownership of the content they post on homecare.
By posting content, users grant homecare a non-exclusive, royalty-free, worldwide license for platform operation and promotion.
Platform Changes and Availability:
Platform Modifications:
homecare reserves the right to modify, suspend, or discontinue the platform or any features without prior notice.
Uninterrupted access is not guaranteed, and homecare is not liable for any loss or damages resulting from service interruptions.
Termination:
Account Termination:
homecare may terminate or suspend a user's account for policy violations.
The platform reserves the right to terminate or suspend any account at its discretion without prior notice.
Disclaimer of Liability:
Content Accuracy:
homecare does not assume responsibility for the accuracy, reliability, or completeness of user-shared content.
Users are solely responsible for their interactions and actions based on the platform's information.
Indemnification:
User Agreement:
Users agree to indemnify and hold homecare, its affiliates, employees, and representatives harmless from any claims, damages, losses, or liabilities arising from platform use or policy violations.
Modifications to Terms and Conditions:
Policy Updates:
homecare reserves the right to modify or update these terms and conditions at any time.
Users will be notified of changes, and continued use of the platform indicates acceptance of updated terms and conditions.
Governing Law and Jurisdiction:
Legal Framework:
These terms and conditions are governed by the laws of Kenya.
Disputes are subject to the exclusive jurisdiction of the courts of Kenya.
Compliance:
User Commitment:
By using the homecare platform, users agree to comply with policies, community guidelines, and outlined terms and conditions.
Failure to adhere may result in account suspension or termination.


Product: Afya Homecare
Version: v1.0.0 (Viltrum 24.1)
Developed by: Kiprono Ngetich
Copyright: (c) 2024 Kiprono Ngetich

""";
    return Scaffold(
      backgroundColor: darkmode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "Terms and Condition",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Center(
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    a.toString(),
                    style: TextStyle(
                        color: darkmode ? Colors.white : Colors.black),
                  )))
        ],
      )),
    );
  }
}

class legal3 extends StatelessWidget {
  const legal3({super.key, required this.darkmode});
  final bool darkmode;
  @override
  Widget build(BuildContext context) {
    String a = """
homecare aims to foster a vibrant and supportive community for tech students in Kenya. We have established the following guidelines to ensure a positive experience for all users:

Be Respectful:

Treat all members of the community with respect and courtesy, regardless of their opinions or backgrounds.
Avoid personal attacks, harassment, or any form of offensive language.
Encourage Learning and Collaboration:

Share knowledge, insights, and resources to help fellow students grow and succeed in their tech education.
Collaborate with others, engage in constructive discussions, and provide helpful feedback.
Be Inclusive:

Embrace diversity and inclusivity by appreciating different perspectives and experiences.
Refrain from discriminatory behavior or language that may exclude or harm others.
Keep Discussions Relevant:

Stay on topic and ensure discussions align with the purpose of the community.
Avoid spamming, excessive self-promotion, or unrelated content.

Product: Afya Homecare
Version: v1.0.0 (Viltrum 24.1)
Developed by: Kiprono Ngetich
Copyright: (c) 2024 Kiprono Ngetich
""";
    return Scaffold(
      backgroundColor: darkmode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "Community Guidelines",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Center(
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    a.toString(),
                    style: TextStyle(
                        color: darkmode ? Colors.white : Colors.black),
                  )))
        ],
      )),
    );
  }
}
