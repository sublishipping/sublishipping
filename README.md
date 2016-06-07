# Parcelify

> Parcelify let you create simple yet powerful shipping rates based on address fields. Whether you'd like to create a "5$ Bike delivery" shipping rates for your neighbors, a "Free hand delivery" for your coworkers or an expensive 25$ "Plane delivery" for that remote region in your country, we've got your back.


### How does it work?

Parcelify relies on regular expressions to detect if the address correspond to your criteria. A regular expression is a pattern describing a certain amount of text. That makes them ideally suited for searching, text processing and data validation. Regular expressions rely on a very strict, yet powerful syntax. While it might seems hard to grasp at first, the basics are quite easy to learn.

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

### Examples

Let's walk through some examples.

#### UK Regions

Let's say you want to have different shipping rates for Northern Ireland and Channel Islands. We can achieve that using two different rates and regular expressions.

Northern Ireland has 79 postcodes in 6 different counties. Postcodes go from BT1 to BT82. In regular expression, we can deconstruct that with the following statements;

- Code starts with BT
- Codes ends with exactly 1 or 2 digits

So that rate would look like the following;

- Country: UK
- Zip code: ^BT\d{1,2}$

Channel Islands include postcodes from GY1 to GY10, as well as all the JE codes. While a bit more complex, it still can be deconstructed quite easily;

- Code starts with GY and ends with exactly 1 digit
- OR code is exactly GY10
- OR code starts with JE and ends with exactly 1 or 2 digits

We can create a new rate with the following attributes:

- Country: UK
- Zip code: ^(GY\d)|(GY10)|(JE\d{1,2})$

#### Free shipping to all Shopify employees

That one can be accomplished in multiple ways. The easiest, simplest one would be to simply add a filter on the company name;

- Company: ^Shopify$

While that would work, everyone figuring out the trick might end up adding Shopify in the company field, while shipping goods to a completely unrelated address. To increase security, it might be good to add another filter, such as the street, the city or the zip code. For Shopify headquarters in Ottawa, Canada, we could at least make sure that the zip code starts with K1P.

- Company: ^Shopify$
- City: Ottawa
- Zip code: ^K1P

#### Bike delivery Miami Beach, Florida

Let's say you want to offer free bike delivery to everyone in Miami Beach. That one is quite easy, since the area is delimited by three distinct zip codes; 33139, 33140 and 33141. The rate would simply need to look like this;

- Country: US
- State: FL
- Zip code: ^331(39|40|41)$

#### Bike delivery, but for specific items

How would we restrict the bike delivery to a set of specific items? Luckily, Parcelify also supports filtering by SKUs. So let's say we want to limit the bike delivery to SKU123 and SKU234, we could add another filter;

- Country: US
- State: FL
- Zip code: ^331(39|40|41)$
- SKU: (SKU123|SKU234)

#### Bike delivery, except for specific items

That becomes interesting. Withing diving too much into details, you can work on exclusion using negative look ahead and it's special character, ?!. Let's say we want to exclude SKU345 and SKU456 from having access to the bike delivery, we could tweak the filters to looke like the following;

- Country: US
- State: FL
- Zip code: ^331(39|40|41)$
- SKU: (?!SKU345|SKU456)

[You can find more information here](http://www.regular-expressions.info/lookaround.html).


### Details

- Upper and lowercase letters are considered the same
- Country codes follow the ISO 3166-1 alpha-2, 2 letters format
- State / Province codes follow the ISO 3166-2, 2 letters format

#### Resources

- [Test your skills on rubular.com](http://rubular.com/)
- [View Parcelify on the Shopify App Store](https://apps.shopify.com/parcelify)
