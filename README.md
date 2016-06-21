# Parcelify

> Parcelify let you create simple yet powerful shipping rates based on address fields. Whether you'd like to create a "5$ Bike delivery" shipping rates for your neighbors, a "Free hand delivery" for your coworkers or an expensive 25$ "Plane delivery" for that remote region in your country, we've got your back.

### Limits

Limits are there to limit your rate to certain conditions. Use them to make sure your rate only shows up if the order is below 25kg, or above $100, or both. When specifying limits, always use the lowest unit of your currency and weight system. Cents for US, pence for UK, etc.

### Filters

Filters allow you to limit your rate to certain conditions only, whether it's based on product's SKU or address' fields. They work by combining a Field, a Verb and a Value. Let's say you'd like to create a rate that applies solely to the city of Ottawa, you could add a filter that goes as follow;

- **Field**: City
- **Verb**: Equal
- **Value**: Ottawa

Available verbs are;

- Equal
- Start with
- End with
- Include
- Exclude
- Regex

##### Equal

This one is self explainatory. This evaluates if the field equals the value. As demoed in the example above, you need to match the exact value, with accents and everything.

##### Start with

This will check if the field starts with a specific value. Let's say you'd like to offer a rate to the entire Beverly Hills region, you could check if the Zip code starts with "902".

- **Field**: Zip code
- **Verb**: Start with
- **Value**: 902

"90210" and "90213" would both be a match valid values. You can also match multiple values, seperated by the "|" symbol. If, for example, you'd like to match no only Beverly Hills, but also the nearby La Brea district, you could go as follow;

- **Field**: Zip code
- **Verb**: Start with
- **Value**: 902|900

In addition to previous values, "90099" would now also be a valid value.

##### End with

Same thing as start with, but will evaluate the end of the string instead of the beginning. It supports multiple values as well.

##### Include

The include filter checks whether or not the specified value is included anywhere in the field. It doesn't matter if the value is at the start, the end or in the middle of the string. If it's there, it's good. Let's say you'd like to offer a rate for the entire Elgin street, no matter the civic number or the appartment number, or if people add "street", or "st.", you could go as follow;

- **Field**: Address line 1
- **Verb**: Include
- **Value**: Elgin

Values such as "123 Elgin Street" would then be perfectly valid.


##### Exclude

Same thing as include but... the opposite. This is mostly useful if you'd like to exclude specific items from getting your rate. You can use the SKU for this, as follow;

- **Field**: SKU
- **Verb**: Exclude
- **Value**: SKU1|SKU2|SKU3

The rate would then be valid for all addresses, except if one of the item has a SKU containing either "SKU1", "SKU2" or "SKU3". Be careful though, as in this example, "SKU10" would also be excluded, as it includes "SKU1".


##### Regex

A regular expression is a pattern describing a certain amount of text. That makes them ideally suited for searching, text processing and data validation. Regular expressions rely on a very strict, yet powerful syntax. While it might seems hard to grasp at first, the basics are quite easy to learn.

- ^ : Start of line
- $ : End of line
- [abc]	: A single character of: a, b, or c
- [a-z] : Any single character in the range a-z
- \d : Any digit in the range of 0-9
- . : Any single character
- (a|b) : a or b
- a? : Zero or one of a
- a* : Zero or more of a
- a+ : One or more of a
- a{3} : Exactly three of a

Let's say you'd like to match all Northern Ireland postcodes, you could go as follow;

- **Field**: Zip code
- **Verb**: Regular expression
- **Value**: ^BT\d{1,2}$

Rate would then be valid for all addresses with a zip code that starts with BT, immediately followed by one or two digits.

[You can find more information here](http://www.regular-expressions.info/lookaround.html).


### Details

- Upper and lowercase letters are considered the same
- Country codes follow the ISO 3166-1 alpha-2, 2 letters format
- State / Province codes follow the ISO 3166-2, 2 letters format

#### Resources

- [Test your skills on rubular.com](http://rubular.com/)
- [View Parcelify on the Shopify App Store](https://apps.shopify.com/parcelify)
