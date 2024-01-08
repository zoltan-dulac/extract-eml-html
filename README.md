# extract-eml-html


## Dependencies

*   *emlExtractor.pl.* Make sure you have downloaded it from https://github.com/sg3des/emlExtractor
    You should also ensure you have included it in PERL's @INC by putting this
    in your .profile or .zprofile:

    ```
    export PERL5LIB="/opt/local/lib/perl5/:$PERL5LIB"
    ```
    You should also ensure you use cpanm to install the MIME support perl needs to
    run emlExtractor.pl 
    
    ```
    sudo cpan App::cpanminus
    cpanm MIME/QuotedPrint/Perl.pm
    ```