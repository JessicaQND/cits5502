### Therac-25: Will history repeat itself?

* Introduction
  * Why is it important
    * Human life important
    * Economic costs; zhivich2009real
  * Aims
    * To outline what happened in the case of Therac-25, and how partly a failure in good software processes caused the incident
    * To outline what changes in medical device software processes were made post Therac-25 to prevent recurrences 
    * To determine if those processes have actually reduced deaths and injuries from medical device software defects
  * Definitions, Terminology, Scope
    * Medical device software: Embedded software used to run medical devices
    * Scope: Medical software processes
  * Constraints on study
    * Restricting discussion to linear accelerators from Therac-25 to the present day
  * Assumptions made
    * Software processes have improved medical device software quality
    
  
* Literature review
  * saferworld and safeware; overall sources
  * Safe software design: What does it involve?
    * Sources of failure
      * johnson2003failure (section 3)
    * Failure models
      * Swiss cheese; besnard2003human
    * Strategies for the design of safe systems of care
      * nolan2000system
    * Better design results in fewer errors
      * lin2001patient
    * How users cope with design error
      * obradovich1996users
    * dunn2003designing
      * Acceptable mishap risk
  * Flaws and failures: How and why?
    * leveson1993investigation
      * Understanding the disaster itself
    * safeware
      * human as monitor
  * Regulatory response: New standards
    * rakitin2006coping / brown2000overview / jordan2006standard
      * Processes that exist
  * Data analysis: Are we safer?
    * maude
    * wallace2001failure / wallace1999lessons
    * Bias in reporting; johnson2003failure 
  * Regulatory gaps: What's next?
    * derreumaux2008lessons

    
* Safe software design: What does it involve?
  * Sources of failure
    * johnson2003failure (section 3)
    * "latent and catalytic failures"
    * "proximal and distant causes"
  * Failure models
    * Swiss cheese; besnard2003human
  * Strategies for the design of safe systems of care
    * nolan2000system
  * dunn2003designing
    * Acceptable mishap risk
  * Better design results in fewer errors
    * lin2001patient
  * How users cope with design error
    * obradovich1996users
  * safeware
    * substution
    * simplification
    * Decoupling; therac very tightly coupled
    * elimination of specific human errors; written in assembler, hard to debug
    * reduction of hazardous materials or conditions
    
 

* Flaws and failures: How and why? -- What went wrong from a software process level?
  * Software of Unknown Pedigree
    * Assumption that software had been tested, but it hadn't in a software only safeguards machine
    * Same bugs found in the Therac-20, but they were non-fatal due to software safeguards
  * Failure to involve users in design process
    * Importance of HCI in a safety-critical software process
    * Error messages were ambiguous and didn't differentiate between dangerous and minor errors
    * Errors were habitualised; should have been noticed in testing with users
  * safeware; Human as monitor
    * "The operator is dependent on the information provided; it is easy to provide too much or too little information or to display it poorly."
    * "The information is more indirect with automated systems, which may make it harder for the operator to obtain a clear picture of the state of the system."
    * "Failures may be silent or masked."
    * They didn't receive enough information from the machine to determine that there was a real problem
    * p85
  * saferworld
    * "Studies have shown that management commitment to the safety goals is the most important factor distinguishing safe from unsafe systems and companies." p.415
    * "One simple solution for engineers is to simply use human factors checklists. While many such checklists exist, they often do not distinguish among the qualities they enhance, which may not be related to safety and may even conflict with safety." p.273
    * "As another example, a design that involves displaying data or instructions on a screen for an operator to check and verify by pressing the enter button minimizes the typing an o perator must do. Over time, however, and after few errors are detected, operators will get in the habit of pressing the enter key multiple times in rapid succession. This design feature has been implicated in many losses. For example, the Therac-25 was a linear accelerator that overdosed multiple patients during radiation therapy. In the original Therac-25 design, operators were required to enter the treatment parameters at the treatment site as well as on the computer console. After the operators complained about the duplication, the parameters entered at the treatment site were instead displayed on the console and the operator needed only to press the return key if they were correct. Operators soon became accustomed to pushing the return key quickly the required number of times without checking the parameters carefully." p.274
    * "The system design may need to ensure that the operator cannot clear a safety-critical alert without taking corrective action or without performing subsequent actions required to complete an interrupted operation. The Therac-25, a linear accelerator that massively overdosed multiple patients, allowed operators to proceed with treatment five times after an error message appeared simply by pressing one key [115]. No distinction was made between errors that could be safety-critical and those that were not." p.301
  * Poor software quality practices
    * Race condition bug from x-ray to electron
    * Timer overflow bug when pressing button
    * How much testing did they actually do?
      * Not completely clear, but it wasn't much
    * Did they have any processes to ensure safety?
    * Estimation of software error
      * They gave it very low odds
      * Subsequent standards say give it 100% odds
  * Difficult to tell what went wrong in the postmortem
    * Coverups
    * Culture problem in company?


* Regulatory response: New standards -- What processes did standards organisations introduce post-Therac?
  * "However, with so many different standards, regulatory guidance papers and industry guides on RM, the task of collating this information into a usable model is itself daunting." -- burdon2006risk
  * Reporting requirements
    * "The reporting regulations for medical device incidents at that time applied only to equipment manufacturers and importers, not users. The regulations required that manufacturers and importers report deaths, serious injuries, or malfunctions that could result in those consequences. Health-care professionals and institutions were not required to report incidents to manufacturers. (The law was amended in 1990 to require health-care facilities to report incidents to the manufacturer and the FDA.) The comptroller general of the US Government Accounting Office, in testimony before Congress on November 6, 1989, expressed great concern about the viability of the incident-reporting regulations in preventing or spotting medical-device problems." -- safeware
  * FDA Quality Systems Regulation
    * "The new Quality Systems Regulation for medical devices, 2 which became effective June 1, 1997, will have significant effects on this area. The design controls provisions of that regulation 3 provide for new regulatory approaches that are more properly suited to medical software devices than traditional FDA premarket review." TODO --crumpler1997fda
  * IEC 61508 - brown2000overview
    * First version: 1998-2000
    * "Many software safety experts think that the medical device sector should recognise IEC 61508, Functional safety of electrical/electronic/programmable electronic safety-related systems. This claims to be a 'standard for standards". Any industry sector writing a standard for software safety should in principle adopt its principles. However, application of IEC 61508 is difficult in the medical device sector because it tends to assume holistic risk management and it is best at addressing very low levels of risk." -- jordan2006standard
  * ISO 14971
    * First version: 1998
    * Safety / Risk Management
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
    * Quality Management System (domain specific)
    * "Medical Devices—Quality Management Systems—Requirements for Regulatory Purposes, Int’l Standards Org., 2003. Provides the framework for a quality system for medical device manufacturers and requires establishing a risk management process based on ISO 14971 and using it throughout the product realization process" -- rakitin2006coping
  * AAMI TIR32
    * First version: 2004
    * "AAMI TIR32, Medical Device Software Risk Management, Assoc. for the Advancement of Medical Instrumentation, 2004. Provides guidance on ways to interpret and apply the ISO 14971 requirements for software-based medical devices." -- rakitin2006coping
    * "Reliability is the ability of a system to perform its required functions under stated conditions for a specified period of time. Safety is the probability that conditions (hazards) that can lead to a mishap do not occur, whether or not the intended function is performed. Reliability is interested in all possible software errors, while safety is concerned only with those errors that cause actual system hazards."
  * IEC 62304
    * First version: 2006
    * Life Cycle Management
 
 
* Data analysis: Are we safer?
  * How have those processes affected medical software quality?
    * "Among the fault types, logic appears very high at 43%; with further details, some of these faults might fit into other classes. This class includes possible errors such as incorrect logic in the requirement specification, unexpected behavior of two or more conditions occurring simultaneously, and improper limits." -- wallace2001failure
    * Allow the prediction of some problems; catal2011software
    
  * Have there been Therac-type incidences since?
    * There have been medical recalls since, although it is unclear how many deaths; wallace2001failure
    * Data analysis
      * MAUDE data
      * Potential biases;
	* johnson2003failure (section 5)
    
  * Has the industry made sufficient changes to software processes to prevent these accidents?
    * TODO: Need data
    

* Regulatory gaps: What's next?
  * The new frontier of medicine is actual standalone medical software, which lacks concrete regulation(? verify)
    * "The first accident throws light on the problem of in-house software: many radiotherapy centres use such handcrafted software, which are not standardised and may not be thoroughly checked before clinical use. This was a case in which the local software had not been tested for beams filtered by internal wedge." -- derreumaux2008lessons
    * ~1987 -- 2000, approx 4000 people; "the MU calculation in-house software had not been updated to take into account the Dr increase due to beam divergence (inverse square law). Therefore, all isocentric patients were over-irradiated by a factor equal to [(100 þ dmax)/100]2, where dmax is a function of beam energy. The overexposure is estimated to be 3, 5.5 and 7%, respectively, for 6, 12 and 25 MV beams."  -- derreumaux2008lessons
  * crumpler1997fda
    * "The 1989 draft policy was never published as final, thus it has no legal status."
    * "Software components of devices and software accessories to devices are themselves also devices. FDA's policy is that, unless separately classified, components and accessories are regulated in the same way as their "parent" devices."
    * "One definition, adapted from FDA's written guidance, provides that "[a software] accessory is a [software] unit which is intended to be attached to or used in conjunction with another finished device, although an accessory may be sold or promoted as an independent unit." A second definition of "accessory" is the working definition that FDA has used over the past two years in the discussions about the agency's software policy. According to this definition, a software accessory to a medical device either accepts data from the user and modifies it for input to a medical device, or takes data from a medical device and modifies it for presentation to the user"
    * "For unclassified computer products that are not components or accessories to anotherdevice, the 1989 draft policy proposed several exemptions from FDA regulations. For example, computer products that are either general purpose, developed for personal or local institutional use, intended for teaching, or intended for nonclinical research are all exempted from active regulation."
    * "Some specific examples of software accessories include alpha fetoprotein (AFP) calculator, radiation therapy treatment planning software, intraocular lens power calculator, digital imaging and image conversion software, picture archiving and communication system, pacemaker rate response factor calculator, EEG and ECG waveform analysis software, hemodialysis calculator, and corrective shoe orthosis software (exempted).

    
* Conclusion; will history repeat?
  * Regulators move too slowly to actually prevent "pioneering deaths"
  * Can software be controlled at all?
    * Discuss the user as controller / monitor / etc models in Safeware
    * Propose a "user has no control" model