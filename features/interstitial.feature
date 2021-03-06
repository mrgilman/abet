Feature: Interstital Page
When a course has no outcomes associated with it
When a user goes to view the outcomes
Then they are taken to a page to set up default or custom outcomes

Background:
	Given a Touchstone authenticated user
	And a user with access to multiple departments
	And a department has the following courses:
	|Course Number|Course Name              |
	|2            |Mechanical Engineering        |
	|2A           |MechE Flexible|
	And I view the department's landing page
	
Scenario: User sees interstitial page
	  Given a course has no outcomes associated with it
	  When a user goes to view the outcomes
	  Then user is taken to an interstitial page

Scenario: User chooses default oucomes
	Given a user is on the interstitial page
	When a user chooses to adopt the default outcomes
	Then user sees the list of default outcomes