Feature: Video.Shiftvision User Functionality

Background:
* url 'https://stage.video.shiftvision.com/api/'	
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
  And def token = response.token
  * print 'Login token created: ' + token
  
Scenario: get user by id
  * header Authorization = 'Bearer ' + token
  * header Accept = 'application/json'
  * header Content-Type = 'application/json'
  
  Given path 'user/read'
  And params {user_id:3}
  When method get
  Then status 200
 
 Scenario: get user by id and detail
  * header Authorization = 'Bearer ' + token
  * header Accept = 'application/json'
  * header Content-Type = 'application/json'
  
  Given path 'user/read'
  And params {user_id:3}
  When method get
  Then status 200
  And match response == {"user":{"id":3,"username":"shiftvision","first_name":"updateFirst1","last_name":"updateLast1","email":"admin@shiftvision.com","status":0,"reminder":null,"created_at":null,"updated_at":'#notnull',"role":1,"update_date":'#notnull',"ago":"just now"}}
  
  Scenario: get user by id and username
  * header Authorization = 'Bearer ' + token
  * header Accept = 'application/json'
  * header Content-Type = 'application/json'
  
  Given path 'user/read'
  And params {user_id:3}
  When method get
  Then status 200
  And match response.user.username == "shiftvision"