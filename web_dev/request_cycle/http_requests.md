common http status codes:

404 = not found. the thing you requested wasn't where we thought it was

403 = forbidden. you don't have access to the data. whether you've not been whitelisted, been blacklisted or something else.

504 = gateway timeout. too slow Internet, one of the associated machines is just too busy... 

200 = OK (aaaaall good!)

300 = multiple choices


GET vs POST
a get request simply asks for data. a post request sends data in the request to be stored by the server but also asks for stuff. 