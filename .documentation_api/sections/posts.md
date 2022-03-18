# Posts

Endpoints:

- [Get posts](#get-posts)
- [Get post](#get-post)
- [Create post](#create-post)
- [Update post](#update-post)
- [Delete post](#delete-post)

## Get posts

- `GET /posts.json` will return a [paginated list](../README.md#pagination) of posts.

<!--
_Optional query parameters_:

* `attribute1` - when set to true, will only return resources that are completed.
* `attribute2` - when set to true, will only return resources that are completed.
-->

See the [post](#model) model for more info on the response payload.

## Get post

- `GET /posts/1.json` will return the post with an ID of `1`.

See the [post](#model) model for more info on the response payload.

## Create post

- `POST /posts.json` creates post.

<!--
**Required parameters**: `attribute1` and `attribute2`.
-->

_Optional parameters_:

* `title` - attribute from post.
* `content` - attribute from post.
* `published` - attribute from post.

This endpoint will return `201 Created` with the current JSON representation of the post if the creation was a success. See the [post](#model) model for more info on the payload.

## Update post

- `PUT /posts/1.json` allows changing the post with an ID of `1`.

This endpoint will return `200 OK` with the current JSON representation of the post if the update was a success. See the [post](#model) model for more info on the payload.

<!--
**Required parameters**: `attribute1` and `attribute2`.
-->

_Optional parameters_:

* `title` - attribute from post.
* `content` - attribute from post.
* `published` - attribute from post.

## Delete post

- `DELETE /posts/1.json` will delete the post with an ID of `1`.

This endpoint will return `204 No Content` if successful. No parameters are required.

---

## Model
```json
{
  "title": "string",
  "content": "string",
  "published": "boolean",
}
```
