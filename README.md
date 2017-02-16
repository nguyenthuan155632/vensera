# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version<br/>
  2.3.3<br/>
  Rails: 5.0.1
  
* System dependencies<br/>
  ImageMagick:<br/>
    sudo apt-get install imagemagick libmagickwand-dev
    
* Configuration

* Database creation<br/>
  RDS:<br/>
    mysqlinstance.c0mbfmyufmzf.us-west-2.rds.amazonaws.com<br/>
    username: vensera<br/>
    password: 15**********f0<br/>
    
* Database initialization<br/>
  RAILS_ENV=production rake db:cr<br/>
  RAILS_ENV=production rake db:migrate
  
* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions<br/>
  cap production git:ch<br/>
  cap production deploy:check<br/>
  cap production deploy
  
* Amazon S3<br/>
  https://github.com/s3fs-fuse/s3fs-fuse<br/>
  Ubuntu: sudo apt-get install automake autotools-dev g++ git libcurl4-gnutls-dev libfuse-dev libssl-dev libxml2-dev make pkg-config<br/>
  CentOS: sudo yum install automake fuse fuse-devel gcc-c++ git libcurl-devel libxml2-devel make openssl-devel<br/>
  git clone https://github.com/s3fs-fuse/s3fs-fuse.git<br/>
  cd s3fs-fuse<br/>
  ./autogen.sh<br/>
  ./configure<br/>
  make<br/>
  sudo make install<br/>
  echo MYIDENTITY:MYCREDENTIAL > ~/.ssh/passwd-s3fs<br/>
  chmod 600 ~/.ssh/passwd-s3fs<br/>
  s3fs vensera /var/www/production/s3_bucket/ -o passwd_file=~/.ssh/passwd-s3fs
