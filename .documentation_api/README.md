# The Rails tabler API

Welcome to the Rails tabler API! If you're looking to integrate your application with Rails tabler or create your own application in concert with data inside of Rails tabler, you're in the right place. We're happy to have you!

## Making a request

All URLs start with **`https://example.com/api/`**. URLs are HTTPS only. The path is prefixed with the `/api` prefix.

To make a request for all the resources on your account, append the `resources` index path to the base URL to form something like `https://example.com/api/resources.json`. In cURL, it looks like this:

``` shell
curl -H "Authorization: Bearer $ACCESS_TOKEN" -H 'User-Agent: MyApp (yourname@example.com)' https://example.com/api/resources.json
```

## Authentication

Describe your authentication here.

## Identifying your application

You must include a `User-Agent` header with **both**:

* The name of your application
* A link to your application or your email address

We use this information to get in touch if you're doing something wrong (so we can warn you before you're blacklisted) or something awesome (so we can congratulate you). Here are examples of acceptable `User-Agent` headers:

* `User-Agent: Freshbooks (http://freshbooks.com/contact.php)`
* `User-Agent: Fabian's Ingenious Integration (fabian@example.com)`

If you don't include a `User-Agent` header, you'll get a `400 Bad Request` response.

## JSON only

We use JSON for all API data. The style is no root element and snake\_case for object keys. This means that you have to send the `Content-Type` header `Content-Type: application/json; charset=utf-8` when you're POSTing or PUTing data into Rails tabler. All API URLs end in `.json` to indicate that they return JSON. Alternatively you can send `Accept: application/json`.

You'll receive a `415 Unsupported Media Type` response code if you don't include the `Content-Type` header.

## Pagination

Most collection APIs paginate their results. The number of requests that'll appear on each page is variable. In most cases, we use a [geared pagination ratio](https://github.com/basecamp/geared_pagination) with 15 results on page 1, 30 on page 2, 50 on 3, and then 100 on 4 and above. The Rails tabler API follows the [RFC5988 convention](https://tools.ietf.org/html/rfc5988) of using the `Link` header to provide URLs for the `next` page. Follow this convention to retrieve the next page of data—please don't build the pagination URLs yourself!

Here's an example response header from requesting the third page of some resource:

```
Link: <https://example.com/api/resources.json?page=4>; rel="next"
```

If the `Link` header is blank, that's the last page. The Rails tabler API also provides the `X-Total-Count` header, which displays the total number of resources in the collection you are fetching.

## Using HTTP caching

You must use HTTP freshness headers to speed up your application and lighten the load on our servers. Most API responses will include an `ETag` or `Last-Modified` header. When you first request a resource, store these values. On subsequent requests, submit them back to us as `If-None-Match` and `If-Modified-Since`, respectively. If the resource hasn't changed since your last request, you'll get a `304 Not Modified` response with no body, saving you the time and bandwidth of sending something you already have.

## Handling errors

API clients must expect and gracefully handle transient errors, such as rate limiting or server errors. We recommend baking 5xx and 429 response handling into your low-level HTTP client so your integration can handle most errors automatically.

### Rate limiting (429 Too Many Requests)

You can perform up to 50 requests per 10-second period from the same IP address. If you exceed this limit, you'll get a [429 Too Many Requests](http://tools.ietf.org/html/draft-nottingham-http-new-status-02#section-4) response for subsequent requests. Check the `Retry-After` header to see how many seconds to wait before retrying the request.

### [5xx server errors](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#5xx_Server_errors)

If Rails tabler is having trouble, you will get a response with a 5xx status code indicating a server error. 500 (Internal Server Error), 502 (Bad Gateway), 503 (Service Unavailable), and 504 (Gateway Timeout) may be retried with [exponential backoff](https://en.wikipedia.org/wiki/Exponential_backoff).

### 404 Not Found

API requests may 404 due to deleted content, an inactive account, missing user permissions, etc. Detect these conditions to give your users a clear explanation about why they can't connect to Rails tabler. Do not automatically retry these requests.

* Inactive account. 404 Not Found response with a `Reason: Account Inactive` header. Due to an expired trial or account suspension. All API requests to an inactive account will fail, so we recommend detecting and disabling the account in your integration as well.
* Inaccessible items. 404 Not Found response. Due to a deleted item or insufficient permissions.

## API endpoints

<!-- START API ENDPOINTS -->

- [Posts](sections/posts.md)

<!-- END API ENDPOINTS -->

---

If you have a specific feature request or find a bug, please open a GitHub issue. We encourage you to fork these docs for local reference and happily accept pull requests with improvements.

To talk with us and other developers about the API, [post a question on StackOverflow](http://stackoverflow.com/questions/ask) tagged `rails-tabler`. If you need help from us directly, please open a support ticket.
