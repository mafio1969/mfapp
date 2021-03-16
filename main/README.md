# ccFound

## Start project

### clone repository
1. git clone https://gitlab.com/lukasz.grynasz1/cryptoresearch.git

### Connect to database
#### If you want local database all steps
#### If you want remote database only 3 and 4 steps
1. create database
2. build database structure - necessary data is in the file `./sql/ikweb.sql`
3. copy file `./config/app.default.php` to `./config/app.php`
4. in the file `./config/app.php` change the data to the database - in Datasources fill (host, username, password, database)

### Run local/server ssh project
1. run the project using the command: `bin/cake serve`
2. go to yuor browser project run in `http://localhost:8765` 

### Run FTP
1. Send to ftp file

## Compile translates

1. Install poedit https://poedit.net/
2. run command: `bin/cake i18n extract --paths` 
   after `paths` you must definition files you must define the files from which you want to download the translation keys
   example:  `bin/cake i18n extract --paths /var/www/html/ikweb.test/plugins/,/var/www/html/ikweb.test/vendor/croogo/croogo/Users,/var/www/html/ikweb.test/vendor/admad/cakephp-social-auth/src/Middleware/`
   
   First step `Would you like to extract the messages from the CakePHP core?` answer `no`
   Second step `What is the path you would like to output?` destination folder
   Third step `Would you like to merge all domain strings into the default.pot file?` answer `no`

   Should created default.pot file in destination folder

   Translation keys are used by us in the code on the basis of `__('Read more')` where the content is English translation which will be translated using poedit

3. Run poedit and click `Edit a translation` open `./src/Locale/pl_PL/default.po`
4. Click `Catalogue→Update from POT` and select the generated file
5. Correct translations and save

## Necessary information
### Technical
1. Test environment: http://ik.blockx.pl
2. Production environment: https://ccfound.com/
3. Documentation: https://docs.google.com/document/d/1v3xHlSnljAYaXRy7cQdwmn4K_RbXP--GGekN_ZKs2GU/

### Different
1. Vision DAO https://docs.google.com/document/d/1LtDQpM7-kWzizMBJbP2HgDd8-XkYQAaNV6NhbT058TE/
2. Competition analysis https://docs.google.com/document/d/1lOoy14PNWFn-e068B6jps49J0QrEF0HlGdXICKDUy6M/
3. Initial token specification: https://docs.google.com/document/d/1Lo_kAMDRahJHladnI0dCtRoJWaicKe38GUdXNYNRMak/
4. MVP manufacturing process: https://docs.google.com/document/d/1nouERrzsj_dNiTBnzLL1Q02wQSrA26E8pmHpUJYghoc/
5. Presentation https://docs.google.com/presentation/d/1GccFCad9dg8uOk6TdBN4bAqSOzZTX71A_I5LWwHr4OE/
6. First specification: https://docs.google.com/document/d/1mycW2osXP2V-lPnLgowqdfm_bS_ajTEINPsiFgGNiZA