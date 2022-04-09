# Posts

Endpoints:

- [Get posts](#get-posts)
- [Get post](#get-post)
- [Create post](#create-post)
- [Update post](#update-post)
- [Delete post](#delete-post)

Models:

- [Post model](#post-model)

## Get posts

- `GET /posts.json` will return a [paginated list](../README.md#pagination) of posts.

<!--
_Optional query parameters_:

* `attribute1` - when set to true, will only return resources that...
* `attribute2` - when set to true, will only return resources that...
-->

See the [Post model](#post-model) for more info on the response payload.

## Get post

- `GET /posts/1.json` will return the post with an ID of `1`.

See the [Post model](#post-model) for more info on the response payload.

## Create post

- `POST /posts.json` creates post.

<!--
**Required parameters**:

* `title` - title of the post.
* `content` - content of the post.
* `published` - published of the post.
* `user_id` - user of the post.
-->

_Optional parameters_:

* `title` - title of the post.
* `content` - content of the post.
* `published` - published of the post.
* `user_id` - user of the post.

This endpoint will return `201 Created` with the current JSON representation of the post if the creation was a success. See the [Post model](#post-model) for more info on the payload.

## Update post

- `PUT /posts/1.json` allows changing the post with an ID of `1`.

You may change any of the required or optional parameters as listed in the [create post](#create-post) endpoint.

This endpoint will return `200 OK` with the current JSON representation of the post if the update was a success. See the [Post model](#post-model) for more info on the payload.

## Delete post

- `DELETE /posts/1.json` will delete the post with an ID of `1`.

This endpoint will return `204 No Content` if successful. No parameters are required.

---

## Models

###### Post model

```json
{
  "title": "string",
  "content": "string",
  "published": "boolean",
  "user_id": "integer",
  "created_at": "datetime",
  "updated_at": "datetime"
}
```
