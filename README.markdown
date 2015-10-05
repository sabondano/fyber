# Fyber Mobile Offer API

## Description

The goal of this challenge is to create a web application which consumes the Fyber Offer
API and renders its responses.
To solve this challenge you should use Ruby and you could use any framework of your
choice. Make sure your code is covered by tests.

Details can be found in this document: RubyFirstDeveloperChallenge-OfferAPI1.pdf

## Thoughts

My solution to this challenge was built using the Rails framework and RSpec for testing. I decided to build an Offer model (class) with a #find method since the goal of the challenge was to find the available offers given a set of parameters. Hurley was used to make the http request to Fyber's API while following the correct format as it is described in the API's documentation. The validity of the response was checked as well and processed according to the steps highlighted in the challenge.
