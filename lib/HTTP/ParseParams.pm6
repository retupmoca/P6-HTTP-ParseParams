use URI::Encode;

module HTTP::ParseParams;

our sub parse($data, :$cookie, :$urlencoded is copy, :$formdata is copy, :$content-type) {
    if $content-type {
        if $content-type eq 'application/x-www-form-urlencoded' {
            $urlencoded = True;
        }
        elsif $content-type eq 'multipart/form-data' {
            $formdata = True;
        }
        else {
            die "Unable to understand content type $content-type";
        }
    }

    if $cookie {
        my @cookies = $data.split(/\;\s/);
        my %cookiedata;
        for @cookies {
            my @parts = .split(/\=/, 2);
            %cookiedata{@parts[0]} = @parts[1];
        }

        return %cookiedata;
    }
    elsif $formdata {
        die "NYI";
    }
    elsif $urlencoded {
        my @params = $data.split(/\&|\;/);
        my %paramdata;
        for @params {
            my @parts = .split(/\=/, 2);
            @parts[1] = uri_decode(@parts[1]);
            %paramdata{@parts[0]} = @parts[1];
        }
        return %paramdata;
    }
    else {
        die "Nothing to do!";
    }
}
