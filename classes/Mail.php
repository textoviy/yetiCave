<?php

require 'vendor/autoload.php';

class Mail
{
    private $smtp = 'smtp.mail.ru';
    private $smtpPort = 465;
    private $userName = 'sender505@mail.ru';
    private $password = 'djg64kgfg';

        function __construct() {

        }

        public static function sendMailForWinner($toMail, $db, $winners_lot_id, $winners_user_id, $lot_name) {
            try {
    // Create the SMTP Transport
    $transport = (new Swift_SmtpTransport('smtp.mail.ru', 465, 'ssl'))
        ->setUsername('sender505@mail.ru')
        ->setPassword('djg64kgfg');

    // Create the Mailer using your created Transport
    $mailer = new Swift_Mailer($transport);

    // Create a message
    $message = new Swift_Message();

    // Set a "subject"
    $message->setSubject('Вы выиграли!');

    // Set the "From address"
    $message->setFrom(['sender505@mail.ru' => 'YetiCave']);

    // Set the "To address" [Use setTo method for multiple recipients, argument should be array]
    $message->addTo($toMail,$toMail);

    // Add "CC" address [Use setCc method for multiple recipients, argument should be array]
//    $message->addCc('recipient@gmail.com', 'recipient name');

    // Add "BCC" address [Use setBcc method for multiple recipients, argument should be array]
//    $message->addBcc('recipient@gmail.com', 'recipient name');

    // Add an "Attachment" (Also, the dynamic data can be attached)
//    $attachment = Swift_Attachment::fromPath('example.xls');
//    $attachment->setFilename('report.xls');
//    $message->attach($attachment);

    // Add inline "Image"
//    $inline_attachment = Swift_Image::fromPath('nature.jpg');
//    $cid = $message->embed($inline_attachment);

    // Set the plain-text "Body"
    $message->setBody("Ваша ставка на лоте '$lot_name' выиграла!");

    // Set a "Body"
//    $message->addPart('This is the HTML version of the message.<br>Example of inline image:<br><img src="'.$cid.'" width="200" height="200"><br>Thanks,<br>Admin', 'text/html');

    // Send the message
    $result = $mailer->send($message);



                $sql = "UPDATE `yeti_cave`.`lots` SET `lot_winner`=? WHERE  `lot_id`= ?";
                $stmt = mysqli_prepare($db, $sql);
                mysqli_stmt_bind_param($stmt,
                    'ii',
                    $winners_user_id,
                    $winners_lot_id);




                $res = mysqli_stmt_execute($stmt);


} catch (Exception $e) {
    echo $e->getMessage();
}
        }
}