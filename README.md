# To Do

You're going to create a small API with the following endpoints:

* An endpoint to create a `Transaction`, given an `owner` and an `amount`. When a transaction is created, a `Flurbo` with the same `owner` should be created/updated to reflect the change in balance, and we want an email to be sent at "bank@example.com" with the name of the owner, the amount of the transaction and the balance of the flurbo after said transaction. A Flurbo's balance
cannot be less than 0, so if a transaction would make it pass below 0, the transaction should be refused and the endpoint should return an error and according HTTP code. No email is sent in that case.

* An endpoint to retrieve an owner's `Flurbo`. It takes the `owner` as parameter and return the balance of the flurbo.

* For monitoring purposes, we want to track the number of times per day, owners try uses the endpoint to retrieve their flurbo. You'll have to add some tracking on the precedent endpoint to be able to create another endpoint that returns the number of times clients accessed their flurbo in the last 7 days (you can choose the response's format as you see best). We want this to be scalable between processes (think multiple unicorn processes), so no in-memory solution, ie. no global variable/state stored uniquely in process' memory.

# Tips

* You should approach this task as if it's going to production after being reviewed by others developers
* You can use any external gem/database/tool you want, as long as you can explain with you chose it
* Responses should be in JSON
* The solution must work with mySQL and ruby >= 2.5
