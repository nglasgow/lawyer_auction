# Lawyer Auction
By [Nicole Glasgow](http://blog.nicoleglasgow.org/)

## A Reverse Auction Application
**Lawyer Auction** provides access to quality legal professionals at an affordable price that you decide! Our network of local lawyers allows you to find the best services at the best prices. If you don't have the money to cover something, or you don't have it at all, we're here to help!

## Installation

GitHub fork or clone our repo.

Run the following command to install and run:

```console
bundle install
rake db:setup
rake db:seed
rake
```

## Usage

The site allows you to login either as a Lawyer or a Clien. Since this is still in development, we currently have seed data that you can use to test the functionality. You can log in through a client, make a Service Request which will only be viewable by the requester and doctors. If you test it and log in as another client, you will not see anyone else's requests. Likewise, if you login as a lawyer, you will see all available service requests. As a lawyer, you have the capability to bid on requests, and view competitor's requests.

```erb
lawyer1 = Lawyer.create(email: "lawyer1@ra.com", password: "password")
lawyer1.confirm!
lawyer2 = Lawyer.create(email: "lawyer2@ra.com", password: "password")
lawyer2.confirm!

client1 = Client.create(email: "client1@ra.com", password: "password")
client1.confirm!
client2 = Client.create(email: "client2@ra.com", password: "password")
client2.confirm!
```

### Known Issues

**This is still in development mode**

If you discover any bugs, feel free to create an issue on GitHub fork and
send us a pull request.

## Authors

* [Nicole Glasgow](http://blog.nicoleglasgow.org/)

