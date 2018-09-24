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
5. Confirm in the logs that an email was sent with populated data OR set up your local machine to send emails

## With Heroku
1. Refer to [Heroku's Getting Started with Rails documentation](https://devcenter.heroku.com/articles/getting-started-with-rails5#add-the-pg-gem) to push the application to Heroku instance.
2. Use `figaro heroku:set` to set environment variables on deployed app. See [Figaro documentation](https://github.com/laserlemon/figaro) for more details.
3.  Use the link provided by Heroku (for example, https://hidden-garden-91091.herokuapp.com/notify) to send a notification to the deployed instance.
4. Check on deployed logs that an issue was created and an email was attempted OR setup Heroku for sending emails
