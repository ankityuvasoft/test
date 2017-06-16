Rails.configuration.stripe = {
  :publishable_key => 'pk_test_IRsXQo1hisg49pdLHC2BWeNr',
  :secret_key      => 'sk_test_FxjyEynJlTqovqum8MxO49DZ'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]