module HTTP::ParseParams
------------------------

Parses cookies, query parameters, and post data from HTTP requests.

### sub parse

```
sub parse(
    Str $data, 
    Bool :cookie($cookie), 
    Bool :urlencoded($urlencoded) is copy, 
    Bool :formdata($formdata) is copy, 
    Str :content-type($content-type)
) returns Hash
```

Pass in some data and a type, and get back a hash containing the passed parameters

Pass :cookie for cookie data, :urlencoded for query parameters or x-www-form-urlencoded postdata, or :formdata for multipart/form-data postdata.

Alternatively, pass :content-type(...) to have the function pick the correct postdata encoding for you. Will die if we don't recognize the content type.

Note that multipart/form-data parsing is NYI
