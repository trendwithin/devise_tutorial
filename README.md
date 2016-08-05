#Devise 4.2 Tutorial for Rails 5.0

There are noticeable changes in the behavior of Devise from previous projects I've worked on.  
This guide is intended to document differences I've come across for future reference.

###User.new###

There is a subtle difference in console output of attributes.  This was noticable due to the convenience of listed attributes when running byebug or console. I'm unclear why this modifcation was decided upon and am investigating.  For now, User.new.attributes can substitute.

*Rails 4.2.x/Devise 3.5.x*

```
irb(main):004:0> User
=> User(id: integer, email: string, encrypted_password: string, reset_password_token: string, reset_password_sent_at: datetime, remember_created_at: datetime, sign_in_count: integer, current_sign_in_at: datetime, last_sign_in_at: datetime, current_sign_in_ip: inet, last_sign_in_ip: inet, created_at: datetime, updated_at: datetime)
irb(main):005:0> User.new
=> #<User id: nil, email: "", encrypted_password: "", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, created_at: nil, updated_at: nil>
```

*Rails 5.0/Devise 4.2.0*

```
irb(main):001:0> User
=> User(id: integer, email: string, encrypted_password: string, reset_password_token: string, reset_password_sent_at: datetime, remember_created_at: datetime, sign_in_count: integer, current_sign_in_at: datetime, last_sign_in_at: datetime, current_sign_in_ip: inet, last_sign_in_ip: inet, confirmation_token: string, confirmed_at: datetime, confirmation_sent_at: datetime, unconfirmed_email: string, failed_attempts: integer, unlock_token: string, locked_at: datetime, created_at: datetime, updated_at: datetime)
irb(main):002:0> User.new
=> #<User id: nil, email: "", created_at: nil, updated_at: nil>
irb(main):003:0>
```

###test_helper###

*Rails 4.2.x/Devise 3.5.x*

Deprecated:
```
class ActionController::TestCase
  include Devise::TestHelpers
end
```

*Rails 5.0/Devise 4.2.0*

New Usage:

```
class ActionController::TestCase
  include Devise::Test::ControllerHelpers
end
```

###Controller Test Syntax###

Not specific to Devise, but still useful to be aware of.

*Rails 4.2/Devise 3.5.x*
```
post :create, user: { email: 'test@example.com, password: 'password' }
```
*Rails 5.0/Devise 4.2.0*
```
post :create, params: { member: { email: 'test@example.com', password: 'password'} }
```

### configure_permitted_parameters ###

*Rails 4.2/Devise 3.5.x*

There's been a change in the usage of configure_permitted_parameters. Previous syntax:

```
devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }
```

*Rails 5.0/Devise 4.2.0*

Newer syntax:

```
devise_parameter_sanitizer.permit(:sign_up, keys: [:user])
```
