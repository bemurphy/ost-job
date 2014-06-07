Ost::Job
========

Job base classes for [Ost](https://github.com/soveran/ost) and
[ost-bin](https://github.com/djanowski/ost-bin).

Description
-----------

Ost provides simple, lightweight background job functionality.  By
default, it assumes you are passing very primative ids like a numeric
user id to the queue.

`Ost::Job` and `Ost::JsonJob` provide a super thin interface to a job
class that plays nice with `ost-bin`.

Installation
------------

    $ gem install ost-job

Usage
-----

Setup your `Ostfile` as specified by ost-bin.

Declare a job class with a `#perform` instance method.

For a regular job that is passed a single id or string:

```ruby
class Plain < Ost::Job
  def perform(user_id)
    user = User.find(id)
    # do something with user
  end
end
```

If you want to pass richer data to your job, inherit `Ost::JsonJob`

```ruby
# Enqueue the job
Ost[:Mailer] << {user_id: 42, subject: 'Hello', body: 'World'}.to_json

# Declare your Job Class
class Mailer < Ost::JsonJob
  def perform(data)
    user = User.find(data['id'])
    Mail.deliver(user: user, subject: data['subject'], body: data['body'])
  end
end
```
