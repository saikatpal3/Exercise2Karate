@RegressionTest
Feature: Excercise - 2 : API automation using Karate API Test

Background:
	* url 'http://dummy.restapiexample.com/'

########## Get & Delete - Status code to be Successful. ##########
Scenario: Verify GET Employees should respond with correct HTTP Status Code
Given path 'api/v1/employees'
When method GET
Then status 200

########## Delete - Status code to be Successful. ##########
Scenario Outline: Verify DELETE Employees should respond with correct HTTP Status Code
Given path 'api/v1/delete/<Id>'
When method DELETE
Then status 200
Examples:
| Id |
| 24 |

########## Get - Return specific Employee details(Any). ##########
Scenario Outline: Verify GET Employee with specific Id <Id> should respond properly with <statusCode>, "<status>" and other details
Given path 'api/v1/employee/<Id>'
When method GET
Then status <statusCode>
And match response.status == "<status>"
And match response.data.employee_name == "<employee_name>"
And match response.data.employee_salary == <employee_salary>
And match response.data.employee_age == <employee_age>
And match response.message == "<message>"
Examples:
| Id |  status | statusCode |  employee_name  | employee_salary | employee_age |                 message                |
|  7 | success |    200     | Herrod Chandler |     137500      |     59       | Successfully! Record has been fetched. |               
|  4 | success |    200     |   Cedric Kelly  |     433060      |     22       | Successfully! Record has been fetched. | 


########## Delete - "message": "successfully! deleted Records". ##########
Scenario Outline: Verify DELETE Employee with specific Id <Id> should respond properly with <statusCode> and "<status>" and other details
Given path 'api/v1/delete/<Id>'
When method DELETE
Then status <statusCode>
And match response.status == "<status>"
And match response.message == "<message>"
Examples:
| Id | statusCode |  status  |                             message                             |
| 24 |    200     | success  |              Successfully! Record has been deleted              | #### As per Actual Behavior in API Endpoint
#| 24 |    200     | success  | Error Occured! Page Not found, contact rstapi2example@gmail.com | #### Sometime Page Not found is coming
#| 24 |    200     | success  |              successfully! deleted Records                     | #### As per Instructions stated in the Requirement/Excercise

