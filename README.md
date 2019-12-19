# To Do

You're going to create a small API with the following endpoints:

* An endpoint to create a `Transaction`. When a transaction is created, a `Flurbo` with the same `owner` should be created/updated to reflect the amount on the transaction, and we want an email to be sent at "bank@example.com" with the name of the owner, the amount of the transaction and the balance of the flurbo after said transaction.

* An endpoint to retrieve an owner's `Flurbo`. It takes the `owner` as parameter and return the total of the flurbo.

* For monitoring purposes, we want to track the number of times per day, owners try uses the endpoint to retrieve their flurbo. You'll have to add some tracking on the precedent endpoint to be able to create another endpoint that returns the number of times clients accessed their flurbo in the last 7 days (you can choose the response's format as you see best). We want this to be scalable between processes, so no in-memory solution.

# Tips

* You should approach this task as if it's going to production after being reviewed by others developers
* You can use any external library/database/tool you want, as long as you can explain with you chose it
* Responses should be in JSON
