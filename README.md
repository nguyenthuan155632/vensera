# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* <strong>Ruby version</strong><br/>
  &nbsp;&nbsp;2.3.3<br/>
  &nbsp;&nbsp;Rails: 5.0.1
  
* <strong>System dependencies</strong><br/>
  &nbsp;&nbsp;ImageMagick:<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;sudo apt-get install imagemagick libmagickwand-dev
    
* <strong>Configuration</strong>

* <strong>Database creation</strong><br/>
  &nbsp;&nbsp;RDS:<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;mysqlinstance.c0mbfmyufmzf.us-west-2.rds.amazonaws.com<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;username: vensera<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;password: 15**********f0<br/>
    
* <strong>Database initialization</strong><br/>
  &nbsp;&nbsp;RAILS_ENV=production rake db:create<br/>
  &nbsp;&nbsp;RAILS_ENV=production rake db:migrate
  
* <strong>How to run the test suite</strong>

* <strong>Services (job queues, cache servers, search engines, etc.)</strong>

* <strong>Deployment instructions</strong><br/>
  &nbsp;&nbsp;cap production git:check<br/>
  &nbsp;&nbsp;cap production deploy:check<br/>
  &nbsp;&nbsp;cap production deploy
  
* <strong>Amazon S3</strong><br/>
  &nbsp;&nbsp;https://github.com/s3fs-fuse/s3fs-fuse<br/>
  &nbsp;&nbsp;Ubuntu: sudo apt-get install automake autotools-dev g++ git libcurl4-gnutls-dev libfuse-dev libssl-dev libxml2-dev make pkg-config<br/>
  &nbsp;&nbsp;CentOS: sudo yum install automake fuse fuse-devel gcc-c++ git libcurl-devel libxml2-devel make openssl-devel<br/>
  &nbsp;&nbsp;git clone https://github.com/s3fs-fuse/s3fs-fuse.git<br/>
  &nbsp;&nbsp;cd s3fs-fuse<br/>
  &nbsp;&nbsp;./autogen.sh<br/>
  &nbsp;&nbsp;./configure<br/>
  &nbsp;&nbsp;make<br/>
  &nbsp;&nbsp;sudo make install<br/>
  &nbsp;&nbsp;echo MYIDENTITY:MYCREDENTIAL > ~/.ssh/passwd-s3fs<br/>
  &nbsp;&nbsp;chmod 600 ~/.ssh/passwd-s3fs<br/>
  &nbsp;&nbsp;s3fs vensera /var/www/production/s3_bucket/ -o passwd_file=~/.ssh/passwd-s3fs
