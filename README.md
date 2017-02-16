# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  2.3.3
  Rails: 5.0.1
  
* System dependencies
  ImageMagick:
    sudo apt-get install imagemagick libmagickwand-dev
    
* Configuration

* Database creation<br/>
  RDS:<br/>
    mysqlinstance.c0mbfmyufmzf.us-west-2.rds.amazonaws.com<br/>
    username: vensera<br/>
    password: 15**********f0<br/>
    
* Database initialization
  RAILS_ENV=production rake db:cr
  RAILS_ENV=production rake db:migrate
  
* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
  cap production git:ch
  cap production deploy:check
  cap production deploy
  
* Amazon S3
  https://github.com/s3fs-fuse/s3fs-fuse
  Ubuntu: sudo apt-get install automake autotools-dev g++ git libcurl4-gnutls-dev libfuse-dev libssl-dev libxml2-dev make pkg-config
  CentOS: sudo yum install automake fuse fuse-devel gcc-c++ git libcurl-devel libxml2-devel make openssl-devel
  git clone https://github.com/s3fs-fuse/s3fs-fuse.git
  cd s3fs-fuse
  ./autogen.sh
  ./configure
  make
  sudo make install
  echo MYIDENTITY:MYCREDENTIAL > ~/.ssh/passwd-s3fs
  chmod 600 ~/.ssh/passwd-s3fs
  s3fs vensera /var/www/production/s3_bucket/ -o passwd_file=~/.ssh/passwd-s3fs
