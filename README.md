# Fullstory and Git Integration
This is a background application that can receive webhook notification whenever an issue is created.
Upon creating an issue, the application emails the "support person" notifying them an issue was created and also providing the latest Fullstory data export for the associated website.

## Running Locally
1. Rename config/application-example.yml and update configuration values
2. `bundle install`
3. `rails s`
4. Hit the notification endpoint with a valid body of an issue
```curl -X POST \
  http://localhost:3000/notify \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -d '{"issue":
	{ "url": "test.com", "id": 12345678, "number": 1}}'
  ```
5. Confirm in the logs that an email was sent with populated data

## With Heroku
Refer to [Heroku's Getting Started with Rails documentation](https://devcenter.heroku.com/articles/getting-started-with-rails5#add-the-pg-gem). Use the link (for example, https://hidden-garden-91091.herokuapp.com/notify) provided to send a notification. 
