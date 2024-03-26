# Rails.configuration.stripe = {
#   publishable_key: "pk_test_51ORUrUSIVXA0jOhGvmnewAzuGnosbRhtEGghNPcKAIUVITDodbYqYd9yjybqm6LtgQbO6ctzDIrSF79zQzLa3BcI00uSfeYBFz",
#   secret_key: "sk_test_51ORUrUSIVXA0jOhG6s0Xm3zD5R0ijb6HM3uWts5WkWVRR1nNXlpV5kxtcjilkUwQpX5T1O9T79o6xgJ2KMh4KOkA00Bj4W2Crp"
# }
# Stripe.api_key = Rails.configuration.stripe[:secret_key]

# config/initializers/stripe.rb
Rails.configuration.stripe = {
  publishable_key: "pk_test_51ORUrUSIVXA0jOhGvmnewAzuGnosbRhtEGghNPcKAIUVITDodbYqYd9yjybqm6LtgQbO6ctzDIrSF79zQzLa3BcI00uSfeYBFz",
  secret_key: "sk_test_51ORUrUSIVXA0jOhG6s0Xm3zD5R0ijb6HM3uWts5WkWVRR1nNXlpV5kxtcjilkUwQpX5T1O9T79o6xgJ2KMh4KOkA00Bj4W2Crp"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
