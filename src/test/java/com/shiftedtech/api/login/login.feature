Feature: Video.Shiftvision Login Functionality

Background:
* url 'https://stage.video.shiftvision.com/api/'	

Scenario: Login with valid user and valid password
  * def loginInfo = 
  """
  {
    "email":"shiftqa01@gmail.com",
    "password":"Shift6786!"
  }
  """
  
  Given path 'auth/login'
  And request loginInfo
  When method post
  Then status 200
  * def token = response.token
  * print 'Login token created: ' + token
 
 Scenario: Login with invalid user and valid password
  * def loginInfo = 
  """
  {
    "email":"invalidshiftqa01@gmail.com",
    "password":"Shift6786!"
  }
  """
  
  Given path 'auth/login'
  And request loginInfo
  When method post
  Then status 403
  And match response == {"error":{"message":"403 Forbidden","status_code":403}}

  Scenario: Login with invalid user and valid password 2
  * def loginInfo = 
  """
  {
    "email":"invalidshiftqa01@gmail.com",
    "password":"Shift6786!"
  }
  """
  
  Given path 'auth/login'
  And request loginInfo
  When method post
  Then status 403
  And match response == {"error":{"message":'#notnull',"status_code":#number}}
  