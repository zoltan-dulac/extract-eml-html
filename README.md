# extract-eml-html

This shell script will take a .eml file extracted from Microsoft Outlook and create a directory with the HTML (index.html) and image files extracted from it.   This can be quite useful if you want to edit the HTML by hand if you, say, want to ensure the HTML follows WCAG guidelines by having correct alt text in their images and ensure ARIA in the HTML is used correctly, among other things.  Also handy if you want to run WAVE, aXe of Lighhouse on the output.

Usage: 

```
/path/to/extract-eml-html.pl $0 <eml-file>
```

Note that the eml-file is created by opening the email in Outlook and using *File &gt; Save As ..* inside the global menu.

If the file is email.eml, then the script will create a directory (in this case email_eml) that contains all the files extracted in it.  The file `index.html` will contain the file you will want to open in a web browser.  Note that there is another file, `html.html`, that contains the HTML with the origin `cid:` URLs that Outlook uses internally.

## Dependencies

*   A Unix like environment that can run a shell script in bash (Linux, Mac OSX with XCode, Cygwin for Windows, etc)
*   Perl
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