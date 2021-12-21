# Server Setup with Apache Modules
Now that you have experience enabling/adding Apache modules we will take another step with Apache configuration. For this lab we will use some of the modules covered during the 10/18/21 [lecture](https://github.com/CIT384/class-material/tree/main/LectureNotes). 

## What are Apache modules?
Modules are service programs that can be dynamically linked and loaded to extend the nature of the HTTP Server.

In this way, the Apache modules provide a way to extend the function of a Web server. Functions commonly added by optional modules include:
- Rewrite Rules
- Authentication
- Encryption
- Application support
- Logging
- Support for different content types
- Diagnostic support

## Some Common Modules/Rules
- UserDir
- Alias
- AliasMatch
- Redirect - Permanent, Temp
- [List of Apache Modules](https://httpd.apache.org/docs/2.4/mod/)

# Background
You were hired by a startup company and management has recently changed. You have been tasked with creating a company website. 

# Assignment Steps
1. Build a splash page for your company
   - Come up with a company name and a simple product
   - Build a simple web page for this compnay
   - Install/place this web page at the [DocumentRoot](https://httpd.apache.org/docs/2.4/mod/core.html#documentroot) location of your web server
Curious about where your DocumentRoot is look at your apache virtual host files.
2. Build a simple company directory
   - Come up with 5 fictitious sales individuals for you company
   - Create 5 user accounts associated for each contact
   - Create a simple splash page for each contact
   ```
   # Your directory structure will look something like:
   /home/
   - user1/public_html/index.html 
   - user2/public_html/index.html
   - user3/public_html/index.html
   - user4/public_html/index.html
   - user5/public_html/index.html
   ```
   - Create Alias directives for each of these contacts
   Each user page should be visible by going to:
   ` localhost:8080/~$USER`
   - Create Alias directives for each of these contacts
3. Delegate a portion of the web space to the marketing team
   - Marketing takes control of `"/"` and `"/promotions"`
   - Create an Alias to reposition DocumentRoot
4. The most common errors to create pages for, are Page Not Found (404) Forbidden and Access Denied (403)
   - Create custom error page for 404 requests `forbidden.html`
   - Create custom error page for 403 requests `not-found.html`
   - Update vHost (virtual Host) to use your custom Error Documents
Hint: [Custom Error Response](https://httpd.apache.org/docs/2.4/en/custom-error.html)

![Example Custom 404](assets/404.png)

5. The company has been sold and you need to come up with a new company name
   - Force a redirect to the new company name
# Submission
You will commit the following files:  
- Main splash page (index.html)
- The splash pages for each user
- Updated vhost (virtual host) file containing all the required Alias, RewriteRule and etc...
- forbidden.html 
- not-found.html 

# Extra Steps
Optional: Create a custom image using Docker which does all the steps listed above. 
It would contain the following:
1. Copy main splash page (index.html) file into DocumentRoot
2. Add 5 users
3. Copy each users splash page into the appropriate user space
4. Copy updated Vhost file into the appropriate location
5. Copy custom error pages into the appropriate location
6. Start apache

If you choose to use the docker version make sure to submit your Dockerfile along with all the necessary files used in your COPY commands. 
