<?php
/* vim: set expandtab sw=4 ts=4 sts=4: */
/**
 * phpMyAdmin sample configuration, you can use it as base for
 * manual configuration. For easier setup you can use setup/
 *
 * All directives are explained in documentation in the doc/ folder
 * or at <https://docs.phpmyadmin.net/>.
 *
 * @package PhpMyAdmin
 */
/*declare(strict_types=1);*/
$cfg['blowfish_secret'] = 'JS;MUGwL,Mbd<bFD:!u-72:3$6dt9f28';
#$cfg['PmaAbsoluteUri'] = 'http://192.168.99.110:5000/phpmyadmin/';
$i = 0;
$i++;
$cfg['Servers'][$i]['auth_type'] = 'cookie';
$cfg['Servers'][$i]['host'] = 'mysql:3306';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;
$cfg['Servers'][$i]['user'] = 'sedric';
$cfg['Servers'][$i]['password'] = 'sedric';
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';