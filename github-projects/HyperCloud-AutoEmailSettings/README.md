# HyperCloud Portal Automated Email Settings Tool

This tool will read from a file, emailSettings.txt, and apply those to a running HyperCloud instance for reliable and programmatic configuration. 

Populate the values in emailSettings.txt and execute the script with the username, password, and instance IP. 

`./emailSystemSettings.sh admin@hypercloud.io admin123 10.0.8.47`

Currently supported configuratino fields:

* Mail Host
* Mail Port
* Username
* Password
* From Email
* Failure Email
* BCC Email

### Demo

![demo video](https://github.com/mascij/HyperCloud-AutoEmailSettings/blob/master/demo.gif)
