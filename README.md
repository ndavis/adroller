Adroller
========

API Wrapper for AdRoll

General Info
============

API version: v1

API base ur: https://api.adroll.com

Setup
=====
Set your API username, password and organization eid in config/application.yml

ADROLL_USERNAME: 'username'
ADROLL_PASSWORD: 'password'
ADROLL_ORGANIZATION: 'organization eid'

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
