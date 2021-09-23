# Tea Subscription Service
Take-home challenge. Get API endpoints for creating a customer's tea subscription, cancelling a tea subscription, and getting all subscriptions (cancelled or not) by customer ID.

## System Dependencies

* Ruby 2.7.2
* Rails 5.2.6

## Configuration

1. Fork and clone this repo
2. Bundle install
6. `rails db:{create,migrate}`

## Endpoints

* **Happy Path** - Create Subscription: `POST /api/v1/subscriptions`
```
{
	"title": "entry (test is a test)",
	"price": "15.99",
	"status": "1",
	"frequency": "1",
	"email": "bob@mcbobster.com"
}
```
```
{
	"message": "Subscription has been created"
}
```
* **Sad Path** - Create Subscription: `POST /api/v1/subscriptions`
```
{
	"errors": "Field is blank or incorrect data was given for fields"
}
```
* **Happy Path** - Cancel Subscription: `PATCH /api/v1/subscriptions/{:subscription_id}`
```
{
	"status": "1"
}
```
```
{
	"message": "Subscription has been updated"
}
```
* **Sad Path** - Cancel Subscription: `PATCH /api/v1/subscriptions/{:subscription_id}`
```
{
	"status": "roflcopter"
}
```
```
{
	"errors": "Incorrect status code given"
}
```

* **Happy Path** - Get Subscriptions: `GET /api/v1/subscriptions`
```
{
	"email": "bob@mcbobster.com"
}
```
```
{
	"data": [
		{
			"id": "1",
			"type": "subscription",
			"attributes": {
				"title": "beginner",
				"price": 15,
				"status": 1,
				"frequency": 1
			}
		},
		{
			"id": "2",
			"type": "subscription",
			"attributes": {
				"title": "beginner",
				"price": 15,
				"status": 0,
				"frequency": 2
			}
		},
		{
			"id": "8",
			"type": "subscription",
			"attributes": {
				"title": "entry (test is a test)",
				"price": 15,
				"status": 1,
				"frequency": 1
			}
		}
	]
}
```
* **Sad Path** - Get Subscriptions: `GET /api/v1/subscriptions`
```
{
	"email": "bob@mcbobster.com"
}
```
```
{
    "errors": "No subscription exists or Customer does not exist"
}
```
## Testing
Run: `bundle exec rspec`
