<?php
error_reporting(0);
//setup the mail
include 'Mail.php';
include 'Mail/mime.php';
$from = "Sample.com <email@sample.com>";
$host = "provider.com";
$hostport = "provider port";
$hostuser = "provider login";
$hostpass = "provider pass";
$to = "your notification email or text email address";

$var = date('i');

$text = "FLEX BLOCK"; $subject = "FLEX BLOCK"; $crlf = "\n";
$hdrs = array ('From' => $from, 'To' => $to, 'Subject' => $subject);
$mime = new Mail_mime(array('eol' => $crlf));
$mime->setTXTBody($text); $body = $mime->get(); $hdrs = $mime->headers($hdrs);

 $smtp = Mail::factory('smtp',
   array ('host' => $host, 'auth' => true, 'username' => $hostuser, 'password' => $hostpass, 'port' => $hostport));
 $mail = $smtp->send($to, $hdrs, $body);
 if (PEAR::isError($mail)) { echo( $mail->getMessage() . "\n"); } 

?>
