<?php

declare(strict_types=1);

$cfg['blowfish_secret'] = '44p|jK_nmWJe!t+jiZ#*Wi6';

$i = 0;

$i++;

$cfg['Servers'][$i]['auth_type'] = 'cookie';
$cfg['Servers'][$i]['host'] = 'mysql-svc:3306';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;
//$cfg['Servers'][$i]['AllowRoot'] = false;

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';

$cfg ['TempDir'] = '/var/www/phpmyadmin/tmp';