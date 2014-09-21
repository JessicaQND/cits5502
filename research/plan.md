### Therac-25: Will history repeat itself?

* What went wrong from a software process level?
  * Software of Unknown Pedigree
    * Assumption that software had been tested, but it hadn't in a software only safeguards machine
    * Same bugs found in the Therac-20, but they were non-fatal due to software safeguards
  * Failure to involve users in design process
    * Importance of HCI in a safety-critical software process
    * Error messages were ambiguous and didn't differentiate between dangerous and minor errors
    * Errors were habitualised; should have been noticed in testing with users
  * Leveson; User as controller
    * They didn't receive enough information from the machine to determine that there was a real problem
  * Poor software quality practices
    * Race condition bug from x-ray to electron
    * Timer overflow bug when pressing button
    * How much testing did they actually do?
      * Not completely clear, but it wasn't much
    * Did they have any processes to ensure safety?
    * Estimation of software error
      * They gave it very low odds
      * Subsequent standards say give it 100% odds
      
* What processes did standards organisations introduce post-Therac?
  * "However, with so many different standards, regulatory guidance papers and industry guides on RM, the task of collating this information into a usable model is itself daunting." -- burdon2006risk
  * Reporting requirements
    * "The reporting regulations for medical device incidents at that time applied only to equipment manufacturers and importers, not users. The regulations required that manufacturers and importers report deaths, serious injuries, or malfunctions that could result in those consequences. Health-care professionals and institutions were not required to report incidents to manufacturers. (The law was amended in 1990 to require health-care facilities to report incidents to the manufacturer and the FDA.) The comptroller general of the US Government Accounting Office, in testimony before Congress on November 6, 1989, expressed great concern about the viability of the incident-reporting regulations in preventing or spotting medical-device problems." -- safeware
  * IEC 61508 - brown2000overview
    * First version: 1998-2000
    * "Many software safety experts think that the medical device sector should recognise IEC 61508, Functional safety of electrical/electronic/programmable electronic safety-related systems. This claims to be a 'standard for standards". Any industry sector writing a standard for software safety should in principle adopt its principles. However, application of IEC 61508 is difficult in the medical device sector because it tends to assume holistic risk management and it is best at addressing very low levels of risk." -- jordan2006standard
  * ISO 14971
    * First version: 1998
    * "Risk Management—Application of Risk Management to Medical Devices, Int’l Standards Org., 2000. Defines several risk management terms and provides a framework for an effective risk management process." -- rakitin2006coping
    * "requires documented evidence that software mitigations are effective" -- rakitin2006coping
  * AAMI SW68
    * First version 2001
    * "ANSI/AAMI SW68, Medical Device Software, Software Life-Cycle Processes, Assoc. for the Advancement of Medical Instrumentation, 2001. Defines requirements for a software development life cycle and requires that manufacturers implement risk management throughout the life cycle on the basis of ISO 14971." -- rakitin2006coping
  * IEC 60601
    * First version: 2000
    * "IEC 60601-1-4, Medical Electrical Equipment, Part 1: General Requirements for Safety and Essential Performance, Collateral Standard: Programmable Electrical Medical Systems; ed. 1.1, Int’l Electrotechnical Commission, 2000. IEC 60601-1-4. Defines many basic principles of risk management, including the definition of risk as the combination of probability and severity." -- rakitin2006coping
  * ISO 13485 
    * First version: 2003
    * "Medical Devices—Quality Management Systems—Requirements for Regulatory Purposes, Int’l Standards Org., 2003. Provides the framework for a quality system for medical device manufacturers and requires establishing a risk management process based on ISO 14971 and using it throughout the product realization process" -- rakitin2006coping
  * AAMI TIR32
    * First version: 2004
    * "AAMI TIR32, Medical Device Software Risk Management, Assoc. for the Advancement of Medical Instrumentation, 2004. Provides guidance on ways to interpret and apply the ISO 14971 requirements for software-based medical devices." -- rakitin2006coping
    * "Reliability is the ability of a system to perform its required functions under stated conditions for a specified period of time. Safety is the probability that conditions (hazards) that can lead to a mishap do not occur, whether or not the intended function is performed. Reliability is interested in all possible software errors, while safety is concerned only with those errors that cause actual system hazards."
  * IEC 62304
    * First version: 2006
  
* How have those processes affected medical software quality?
* Have there been Therac-type incidences since?
* Has the industry made sufficient changes to software processes to prevent these accidents?
* Can software be controlled?

* Insights
  * Regulators move too slowly to actually prevent "pioneering deaths"