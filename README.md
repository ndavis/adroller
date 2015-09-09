Adroller: An API Wrapper for AdRoll
========

![alt tag](https://upload.wikimedia.org/wikipedia/commons/8/86/AdRoll.png)

General Info
============

API version: v1

API base url: https://api.adroll.com/v1/

API documentation: https://app.adroll.com/api/v1/docs

Setup
=====

Set your API username, password and organization eid in your environment

ENV['ADROLL_USERNAME'] = 'Your User Name'

ENV['ADROLL_PASSWORD'] = 'Your Password'

ENV['ADROLL_ORGANIZATION'] = 'Your Organization eid'

Usage
=======

This gem uses basic abstraction for the AdRoll services

A method call will return a JSON response directly from the api 

AdRoll::Api::{Endpoint Name}.{Endpoint Method}({Endpoint Parameters})

Example
=========

params = { 

name: 'My Advertisable',

organization: 'FDS32DFA3DK341B4KAL4RK',

set_as_default: true,

url: 'http://www.thisisaurl.com',

product_name: 'My Product'

}

advertisable = AdRoll::Api::Advertisable.create(params)

advertisable['eid'] => 'FAEBEKALEIB324R'

advertisable['name'] => 'My Advertisable'

advertisable['is_active'] => true

...
